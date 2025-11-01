<#
.SYNOPSIS
Script para medir desempenho de um executável (RAM, CPU, tempo) e opcionalmente contar linhas de um arquivo assembly.
.EXAMPLE
.\measure-performance.ps1 `
   -Cmd ".\growth\complexity\operations\ops_c\ops_complex1.exe" `
   -OutputCsv ".\growth\complexity\operations\data_analisys\ops_c\ops_complex1c.csv" `
   -AsmFile ".\growth\complexity\operations\ops_c\ops_complex1.s"
#>


param(
    [Parameter(Mandatory = $true)]
    [string]$Cmd,                      # Ex: "./main.exe"

    [string[]]$Args = @(),             # Argumentos opcionais
    
    [int]$IntervalMs = 50,             # Intervalo de amostragem

    [string]$OutputCsv = "results.csv", # CSV detalhado
    [string]$SummaryCsv = "summary_results.csv", # CSV de resumo

    [string]$AsmFile = ""              # Caminho opcional do .s
)

# Inicia o processo de forma robusta
if (-not $Args) { $argsArray = @() } else { $argsArray = $Args | Where-Object { $_ -ne $null -and $_ -ne "" } }

try {
    if ($argsArray.Count -gt 0) {
        $proc = Start-Process -FilePath $Cmd -ArgumentList $argsArray -PassThru -ErrorAction Stop
    } else {
        $proc = Start-Process -FilePath $Cmd -PassThru -ErrorAction Stop
    }
} catch {
    Write-Host "ERRO: nao foi possivel iniciar '$Cmd'. Verifique se é um executavel ou passe o interpretador (ex: 'python' ou 'runhaskell')."
    Write-Host "Detalhes: $($_.Exception.Message)"
    exit 1
}
Write-Host "PID: $($proc.Id) started - monitoring..."

$data = @()
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$lastTotalProcessorTime = $proc.TotalProcessorTime

# Amostra imediata (útil para processos muito curtos)
try {
    $proc.Refresh()
    $data += [PSCustomObject]@{
        TimeMs = 0.0
        WorkingSetMB = [Math]::Round($proc.WorkingSet64 / 1MB, 3)
        PrivateMemMB = [Math]::Round($proc.PrivateMemorySize64 / 1MB, 3)
        CpuUsagePct = 0.0
    }
} catch { }

# Loop de monitoramento
while ($proc -and -not $proc.HasExited) {
    Start-Sleep -Milliseconds $IntervalMs
    try {
        $proc.Refresh()
        $elapsed = $stopwatch.Elapsed.TotalMilliseconds
        $workingSet = [Math]::Round($proc.WorkingSet64 / 1MB, 3)
        $privateMem = [Math]::Round($proc.PrivateMemorySize64 / 1MB, 3)

        # CPU %
        $currentCpu = $proc.TotalProcessorTime
        $cpuDelta = ($currentCpu - $lastTotalProcessorTime).TotalMilliseconds
        $cpuUsage = [Math]::Round(($cpuDelta / $IntervalMs) * 100 / [Environment]::ProcessorCount, 2)
        $lastTotalProcessorTime = $currentCpu

        # Adiciona amostra
        $data += [PSCustomObject]@{
            TimeMs = [Math]::Round($elapsed, 2)
            WorkingSetMB = $workingSet
            PrivateMemMB = $privateMem
            CpuUsagePct = $cpuUsage
        }
    } catch {
        break
    }
}

$stopwatch.Stop()

# Se nao houve amostras ou memórias sao 0, tenta obter via Get-Process (fallback)
if ($data.Count -eq 0 -or (($data | Measure-Object WorkingSetMB -Maximum).Maximum -eq 0 -and ($data | Measure-Object PrivateMemMB -Maximum).Maximum -eq 0)) {
    try {
        $p = Get-Process -Id $proc.Id -ErrorAction SilentlyContinue
        if ($p) {
            $data += [PSCustomObject]@{
                TimeMs = [Math]::Round($stopwatch.Elapsed.TotalMilliseconds,2)
                WorkingSetMB = [Math]::Round($p.WorkingSet64 / 1MB, 3)
                PrivateMemMB = [Math]::Round($p.PrivateMemorySize64 / 1MB, 3)
                CpuUsagePct = 0
            }
        }
    } catch { }
}

# Estatísticas finais
$maxWorking = ($data | Measure-Object WorkingSetMB -Maximum).Maximum
$maxPrivate = ($data | Measure-Object PrivateMemMB -Maximum).Maximum
$avgCpu = [Math]::Round(($data | Measure-Object CpuUsagePct -Average).Average, 2)

# 🔍 Contagem de linhas do Assembly
$asmLineCount = 0
if ($AsmFile -and (Test-Path $AsmFile)) {
    $asmLines = Get-Content $AsmFile | Where-Object { $_.Trim() -ne "" }
    $asmLineCount = $asmLines.Count
    Write-Host ("Assembly lines: {0}" -f $asmLineCount)
} else {
    Write-Host "Nenhum arquivo assembly informado ou encontrado."
}

# Exporta CSV detalhado (acrescenta sem sobrescrever)
$detail = [PSCustomObject]@{
    File           = (Split-Path $Cmd -Leaf)
    ExecTime_ms    = [Math]::Round($stopwatch.Elapsed.TotalMilliseconds,2)
    MaxWorking_MB  = ($data | Measure-Object WorkingSetMB -Maximum).Maximum
    MaxPrivate_MB  = ($data | Measure-Object PrivateMemMB -Maximum).Maximum
    AvgCPU_pct     = [Math]::Round(($data | Measure-Object CpuUsagePct -Average).Average, 2)
    AsmFile       = if ($AsmFile) { Split-Path $AsmFile -Leaf } else { "" }
    AsmLines       = $asmLineCount
}

if (-Not (Test-Path $OutputCsv)) {
    $detail | Export-Csv -Path $OutputCsv -NoTypeInformation -Encoding UTF8
} else {
    $detail | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Add-Content -Path $OutputCsv -Encoding UTF8
}
Write-Host "Amostras exportadas para: $OutputCsv"

# 📊 Exibe resumo
Write-Host ""
Write-Host "===== RESULTS ====="
Write-Host ("Exec time: {0} ms" -f [Math]::Round($stopwatch.Elapsed.TotalMilliseconds, 2))
Write-Host ("Max RAM (Working Set): {0} MB" -f $maxWorking)
Write-Host ("Max Private Mem: {0} MB" -f $maxPrivate)
Write-Host ("Avg CPU usage: {0}%" -f $avgCpu)
if ($asmLineCount -gt 0) {
    Write-Host ("Assembly lines: {0}" -f $asmLineCount)
}

# 🔄 Exporta resumo acumulado
$result = [PSCustomObject]@{
    File = (Split-Path $Cmd -Leaf)
    ExecTime_ms = [Math]::Round($stopwatch.Elapsed.TotalMilliseconds,2)
    MaxWorking_MB = $maxWorking
    MaxPrivate_MB = $maxPrivate
    AvgCPU_pct = $avgCpu
    AsmFile = if ($AsmFile) { Split-Path $AsmFile -Leaf } else { "" }
    AsmLines = $asmLineCount
}

if (-Not (Test-Path $SummaryCsv)) {
    $result | Export-Csv -Path $SummaryCsv -NoTypeInformation -Encoding UTF8
} else {
    $result | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Add-Content -Path $SummaryCsv -Encoding UTF8
}

Write-Host "Resumo acumulado exportado para: $SummaryCsv"
