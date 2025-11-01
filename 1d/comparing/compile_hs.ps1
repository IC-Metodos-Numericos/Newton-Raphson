# =================================================================
# Script PowerShell CORRIGIDO para automatizar a compilação GHC
# Uso: .\compile.ps1 <NomeDoArquivoHaskell>
# Exemplo: 
# .\compile_hs.ps1 path/filename.hs
# .\compile_hs.ps1 .\growth\minimal\min_HS\min5_HS\min5_HS.hs
# =================================================================

param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile
)

# --- 1. Definição de Caminhos e Variáveis ---
$InputPath = Get-Item $InputFile | Select-Object -ExpandProperty FullName
if (-not (Test-Path -Path $InputPath)) {
    Write-Host "ERRO: O arquivo '$InputFile' nao foi encontrado." -ForegroundColor Red
    exit 1
}

# Obtém o DIRETÓRIO onde o arquivo .hs está (e.g., 'C:\...\growth\minimal\min_HS\min5_HS')
$OutputDir = Split-Path -Path $InputPath -Parent

# Obtém o nome SEM a extensão (e.g., 'min5_HS')
$FileName = [System.IO.Path]::GetFileNameWithoutExtension($InputPath)

Write-Host "--- Iniciando GHC para $InputFile ---"
Write-Host "Nome base: $FileName"
Write-Host "Diretorio de Saida: $OutputDir"
Write-Host "Compilando para Assembly (.s) com otimizacoes O0, O1, O2, O3..."

# --- 2. Compilação para Assembly (O0, O1, O2, O3) ---

# Os caminhos de saída agora incluem o $OutputDir
# Exemplo de Saída O1: 'C:\...\min5_HS\o1_min5_HS.s'

$OutputFiles = @()

# Funções de compilação
function Compile-GHC ($OptimizationLevel, $OutputPrefix) {
    $OutputName = "${OutputPrefix}${FileName}.s"
    $FullOutputPath = Join-Path -Path $OutputDir -ChildPath $OutputName
    
    # Adiciona o arquivo gerado à lista para exibição
    $OutputFiles += $FullOutputPath

    # Executa o comando GHC
    ghc -S $OptimizationLevel -o "$FullOutputPath" "$InputPath" 2>&1 | Out-Null
}

# Sem otimização (O0)
Compile-GHC "" ""

# Otimização Nível 1 (O1)
Compile-GHC "-O1" "o1_"

# Otimização Nível 2 (O2)
Compile-GHC "-O2" "o2_"

# Otimização Nível 3 (O3)
Compile-GHC "-O3" "o3_"

Write-Host "Geração de arquivos .s concluída." -ForegroundColor Green
Write-Host "Arquivos gerados no diretório de entrada:"
$OutputFiles | ForEach-Object { Write-Host "* $_" }


# --- 3. Compilação para Executável ---
Write-Host ""
Write-Host "Compilando para Executável (.exe)..."
$ExePath = Join-Path -Path $OutputDir -ChildPath "$($FileName).exe"

ghc "$InputPath" -o "$ExePath"

Write-Host "Compilacao do executavel concluida." -ForegroundColor Green
Write-Host "Executável: $ExePath"
Write-Host "--- Fim do Script ---"