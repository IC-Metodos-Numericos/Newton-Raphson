param(
    [Parameter(Mandatory = $true)]
    [string]$ExecutablesRootPath, # Onde estão os executáveis e os arquivos .s (ex: '.\growth\complexity\time\time_hs\tc2_HS')
    
    [Parameter(Mandatory = $true)]
    [string]$OutputDataDir,       # Onde os CSVs de resultados DETALHADOS serão salvos (ex: '.\growth\complexity\time\data_analisys\time_hs\')
    
    [Parameter(Mandatory = $true)]
    [string]$GlobalSummaryCsv,    # Caminho COMPLETO ou RELATIVO para o arquivo de resumo global (Ex: '..\..\..\summary_results.csv')

    [Parameter(Mandatory = $true)]
    [string]$DetailedOutputFileName, # Nome do arquivo CSV detalhado ÚNICO que receberá todos os resultados (Ex: 'tc_HS.csv')

    [string]$MeasureScriptPath = ".\measure-performance.ps1", # Caminho para o seu script original
    
    [int]$NumberOfRuns = 10,
    
    [string]$FileFilter = "*.exe"
)

# --- 1. Validação e Configuração ---

# Verifica se o script de medição existe
if (-not (Test-Path $MeasureScriptPath -PathType Leaf)) {
    Write-Error "ERRO: Script de medição '$MeasureScriptPath' não encontrado. Verifique o caminho."
    exit 1
}

# Garante que o diretório de saída exista
if (-not (Test-Path $OutputDataDir -PathType Container)) {
    Write-Host "Criando diretório de saída: $OutputDataDir"
    New-Item -Path $OutputDataDir -ItemType Directory -Force | Out-Null
}

Write-Host "Procurando arquivos '$FileFilter' em: $ExecutablesRootPath"

# --- 2. Encontra Executáveis e Define Arquivos de Saída ---

# Busca recursivamente todos os executáveis
$executables = Get-ChildItem -Path $ExecutablesRootPath -Filter $FileFilter -Recurse | Where-Object { $_.PSIsContainer -eq $false }

if (-not $executables) {
    Write-Host "Nenhum arquivo '$FileFilter' encontrado no caminho especificado."
    exit 0
}

Write-Host "Encontrados $($executables.Count) executáveis para testar."
Write-Host "Iniciando $($NumberOfRuns) execuções para cada um..."

# Arquivo de resumo global, agora definido pelo parâmetro $GlobalSummaryCsv
$globalSummaryFile = $GlobalSummaryCsv
Write-Host "Resumo Global será ANEXADO a: $($globalSummaryFile)" -ForegroundColor Yellow


# NOVO: Define o único arquivo CSV para resultados DETALHADOS (conforme o pedido)
$targetDetailedCsvFile = Join-Path -Path $OutputDataDir -ChildPath $DetailedOutputFileName
Write-Host "ATENÇÃO: Todos os resultados detalhados (10 execuções de cada EXE) serão ANEXADOS a: $($targetDetailedCsvFile)" -ForegroundColor Cyan
# Limpeza de arquivos removida para permitir o ANEXO CONTÍNUO. Você deve limpar manualmente se necessário.


# --- 3. Loop Principal de Teste ---

foreach ($exe in $executables) {
    $exePath = $exe.FullName
    $exeName = $exe.BaseName
    $exeDirectory = $exe.DirectoryName
    
    # Assume que o .s está na mesma pasta que o .exe
    $asmFile = Join-Path -Path $exeDirectory -ChildPath "o3_$($exeName).s"
    
    Write-Host "`n--- Testando: $($exe.Name) ---" -ForegroundColor Yellow
    
    # Executa o teste N vezes
    for ($i = 1; $i -le $NumberOfRuns; $i++) {
        Write-Host "  -> Execução $i de $($NumberOfRuns)..." -NoNewline
        
        # Chama o measure-performance.ps1
        # -OutputCsv agora usa o $targetDetailedCsvFile fixo para todos os executáveis
        & $MeasureScriptPath -Cmd $exePath -AsmFile $asmFile -OutputCsv $targetDetailedCsvFile -SummaryCsv $globalSummaryFile
        
        Write-Host " Concluído." -ForegroundColor Green
    }
}

Write-Host "`n=================================================" -ForegroundColor Cyan
Write-Host "Todos os testes concluídos com sucesso!" -ForegroundColor Cyan
Write-Host "Resumo de todas as execuções em: $globalSummaryFile" -ForegroundColor Cyan
Write-Host "Arquivo DETALHADO consolidado: $targetDetailedCsvFile" -ForegroundColor Cyan


