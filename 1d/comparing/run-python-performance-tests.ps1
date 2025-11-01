param(
    [Parameter(Mandatory = $true)]
    [string]$ScriptsRootPath,       # Onde estão os scripts Python e os arquivos .s (Ex: '.\growth\complexity\time\time_py\tc2_PY')

    [Parameter(Mandatory = $true)]
    [string]$OutputDataDir,         # Onde os CSVs de resultados DETALHADOS serão salvos (Ex: '.\growth\complexity\time\data_analisys\time_py\')

    [Parameter(Mandatory = $true)]
    [string]$GlobalSummaryCsv,      # Caminho COMPLETO ou RELATIVO para o arquivo de resumo global (Ex: '..\..\..\summary_results.csv')

    [Parameter(Mandatory = $true)]
    [string]$DetailedOutputFileName, # Nome do arquivo CSV detalhado ÚNICO (Ex: 'tc_PY.csv')

    [string]$MeasureScriptPath = ".\measure-performance.ps1", # Caminho para o seu script original de medição
    
    [int]$NumberOfRuns = 10,
    
    [string]$FileFilter = "*.py", # Agora procuramos por arquivos Python

    [string]$PythonExecutablePath = "python" # NOVO: Caminho para o executável Python (o padrão é 'python', mas pode ser 'C:\Python39\python.exe')
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

Write-Host "Procurando arquivos '$FileFilter' em: $ScriptsRootPath"

# --- 2. Encontra Scripts Python e Define Arquivos de Saída ---

# Busca recursivamente todos os scripts Python
$pyScripts = Get-ChildItem -Path $ScriptsRootPath -Filter $FileFilter -Recurse | Where-Object { $_.PSIsContainer -eq $false }

if (-not $pyScripts) {
    Write-Host "Nenhum arquivo '$FileFilter' encontrado no caminho especificado."
    exit 0
}

Write-Host "Encontrados $($pyScripts.Count) scripts Python para testar."
Write-Host "Iniciando $($NumberOfRuns) execuções para cada um..."

# Arquivo de resumo global
$globalSummaryFile = $GlobalSummaryCsv
Write-Host "Resumo Global será ANEXADO a: $($globalSummaryFile)" -ForegroundColor Yellow


# Define o único arquivo CSV para resultados DETALHADOS
$targetDetailedCsvFile = Join-Path -Path $OutputDataDir -ChildPath $DetailedOutputFileName
Write-Host "ATENÇÃO: Todos os resultados detalhados serão ANEXADOS a: $($targetDetailedCsvFile)" -ForegroundColor Cyan


# --- 3. Loop Principal de Teste ---

foreach ($script in $pyScripts) {
    $scriptPath = $script.FullName
    $scriptName = $script.BaseName
    $scriptDirectory = $script.DirectoryName
    
    # Comando atualizado para usar o novo parâmetro $PythonExecutablePath
    # Define o comando a ser medido: '<caminho_python> <caminho_completo_do_script>'
    $commandToMeasure = "`"$PythonExecutablePath`" `"$scriptPath`""
    
    # Assume que o .s está na mesma pasta que o .py (para fins de metadados, se aplicável)
    $asmFile = Join-Path -Path $scriptDirectory -ChildPath "$($scriptName).s"
    
    Write-Host "`n--- Testando Script: $($script.Name) ---" -ForegroundColor Yellow
    
    # Executa o teste N vezes
    for ($i = 1; $i -le $NumberOfRuns; $i++) {
        Write-Host "  -> Execução $i de $($NumberOfRuns)..." -NoNewline
        
        # Chama o measure-performance.ps1
        # O parâmetro -Cmd agora contém o comando de execução do Python
        & $MeasureScriptPath -Cmd $commandToMeasure -AsmFile $asmFile -OutputCsv $targetDetailedCsvFile -SummaryCsv $globalSummaryFile
        
        Write-Host " Concluído." -ForegroundColor Green
    }
}

Write-Host "`n=================================================" -ForegroundColor Cyan
Write-Host "Todos os testes de Python concluídos com sucesso!" -ForegroundColor Cyan
Write-Host "Resumo de todas as execuções em: $globalSummaryFile" -ForegroundColor Cyan
Write-Host "Arquivo DETALHADO consolidado: $targetDetailedCsvFile" -ForegroundColor Cyan
