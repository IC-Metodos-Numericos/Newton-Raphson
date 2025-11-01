# =================================================================
# Script PowerShell para Automação Python (Bytecode e Execução)
# Uso: .\compile_py.ps1 <CaminhoCompletoDoArquivoPython>
# Exemplo: .\compile_py.ps1 .\growth\minimal\min_Py\min5_Py\min5_Py.py
# =================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

# --- 1. Definição de Caminhos e Variáveis ---
# Torna o caminho robusto contra espaços (como discutido anteriormente)
$InputPath = Resolve-Path $InputFile | Select-Object -ExpandProperty Path
if (-not (Test-Path -Path $InputPath)) {
    Write-Host "ERRO: O arquivo '$InputFile' não foi encontrado." -ForegroundColor Red
    exit 1
}

# Obtém o DIRETÓRIO onde o arquivo .py está
$OutputDir = Split-Path -Path $InputPath -Parent

# Obtém o nome SEM a extensão (e.g., 'min5_Py')
$FileName = [System.IO.Path]::GetFileNameWithoutExtension($InputPath)

Write-Host "--- Iniciando Automação Python para $InputFile ---"
Write-Host "Nome base: $FileName"
Write-Host "Diretório de Entrada/Saída: $OutputDir"


# --- 2. Geração do Bytecode (.pyc) ---
Write-Host "`n[1] Gerando Bytecode (.pyc)..." -ForegroundColor Cyan

# Usa o módulo py_compile para gerar o Bytecode (.pyc)
# O .pyc é gerado na subpasta __pycache__
python -m py_compile "$InputPath"

Write-Host "Bytecode gerado em __pycache__ no diretório de entrada." -ForegroundColor Green


# --- 3. Visualização do Bytecode (Disassembler - PVM Code) ---
Write-Host "`n[2] Exibindo o Bytecode (Instruções da PVM):" -ForegroundColor Cyan

# Usa o módulo 'dis' (disassembler) para inspecionar o código da PVM.
# Este é o equivalente de ver o Assembly gerado.
# O output é redirecionado para um arquivo de texto para inspeção fácil.
$OutputName = "bytecode_$($FileName).txt"
$FullOutputPath = Join-Path -Path $OutputDir -ChildPath $OutputName

Write-Host "O bytecode completo foi salvo em: $FullOutputPath"
Write-Host "(Abaixo está apenas uma prévia no console):"

# Executa o Python e o módulo 'dis'
$BytecodeOutput = python -m dis "$InputPath"

# Salva o output completo no arquivo
$BytecodeOutput | Out-File -FilePath "$FullOutputPath" -Encoding UTF8

# Exibe uma prévia no console (por exemplo, as 15 primeiras linhas)
$BytecodeOutput | Select-Object -First 15


# --- 4. Execução do Código (O "Executável") ---
Write-Host "`n[3] Executando o código Python (simulando o executável)..." -ForegroundColor Cyan

# Executa o script Python, que é o que você faria com um .exe
python "$InputPath"

Write-Host "`nExecução concluída." -ForegroundColor Green
Write-Host "--- Fim do Script ---"