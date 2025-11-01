# =================================================================
# Script PowerShell para automatizar a compilação GCC com otimizações
# Uso: .\compile_c.ps1 <CaminhoCompletoDoArquivoC>
# Exemplo: .\compile_c.ps1 .\growth\minimal\min_C\min5_C\min5_C.c
# =================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

# --- 1. Definição de Caminhos e Variáveis ---
$InputPath = Get-Item $InputFile | Select-Object -ExpandProperty FullName
if (-not (Test-Path -Path $InputPath)) {
    Write-Host "ERRO: O arquivo '$InputFile' não foi encontrado." -ForegroundColor Red
    exit 1
}

# Obtém o DIRETÓRIO onde o arquivo .c está
$OutputDir = Split-Path -Path $InputPath -Parent

# Obtém o nome SEM a extensão (e.g., 'min5_C')
$FileName = [System.IO.Path]::GetFileNameWithoutExtension($InputPath)

Write-Host "--- Iniciando GCC para $InputFile ---"
Write-Host "Nome base: $FileName"
Write-Host "Diretório de Saída: $OutputDir"
Write-Host "Compilando para Assembly (.s) com otimizações O0, O1, O2, O3..."

# --- 2. Compilação para Assembly (O0, O1, O2, O3) ---

$OutputFiles = @()

# Funções de compilação
function Compile-GCC ($OptimizationLevel, $OutputPrefix) {
    # Define o nome do arquivo de saída (ex: o1_min5_C.s)
    $OutputName = "${OutputPrefix}${FileName}.s"
    # Cria o caminho completo de saída DENTRO do $OutputDir
    $FullOutputPath = Join-Path -Path $OutputDir -ChildPath $OutputName
    
    # Adiciona o arquivo gerado à lista para exibição
    $OutputFiles += $FullOutputPath

    # Executa o comando GCC
    # gcc -S <opt_level> ./path/filename.c -o ./path/oX_filename.s
    gcc -S $OptimizationLevel "$InputPath" -o "$FullOutputPath" 2>&1 | Out-Null
}

# Sem otimização (O0)
Compile-GCC "" ""

# Otimização Nível 1 (O1)
Compile-GCC "-O1" "o1_"

# Otimização Nível 2 (O2)
Compile-GCC "-O2" "o2_"

# Otimização Nível 3 (O3)
Compile-GCC "-O3" "o3_"

Write-Host "Geração de arquivos .s concluída." -ForegroundColor Green
Write-Host "Arquivos Assembly gerados no diretório de entrada:"
$OutputFiles | ForEach-Object { Write-Host "* $_" }


# --- 3. Compilação para Executável ---
Write-Host ""
Write-Host "Compilando para Executável (.exe)..."

# Define o caminho completo do executável
$ExeName = "$($FileName).exe"
$ExePath = Join-Path -Path $OutputDir -ChildPath $ExeName

# gcc ./path/filename.c -o ./path/filename.exe
gcc "$InputPath" -o "$ExePath"

Write-Host "Compilação do executável concluída." -ForegroundColor Green
Write-Host "Executável: $ExePath"
Write-Host "--- Fim do Script ---"