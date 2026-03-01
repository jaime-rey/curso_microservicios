# Script para configurar las variables de entorno de Git para Spring Cloud Config Server
# Ejecutar como Administrador

# INSTRUCCIÓN: Reemplaza estos valores con tus datos reales
$GITHUB_USERNAME = "tu_usuario_github"  # Ejemplo: jaime-rey
$GITHUB_TOKEN = "tu_token_personal"     # Generar en: https://github.com/settings/tokens

# Validación
if ($GITHUB_USERNAME -eq "tu_usuario_github" -or $GITHUB_TOKEN -eq "tu_token_personal") {
    Write-Host "ERROR: Debes reemplazar los valores de usuario y token" -ForegroundColor Red
    Write-Host "1. Ve a https://github.com/settings/tokens" -ForegroundColor Yellow
    Write-Host "2. Crea un nuevo token con permisos 'repo'" -ForegroundColor Yellow
    Write-Host "3. Copia el token y reemplaza 'tu_token_personal' en este script" -ForegroundColor Yellow
    exit 1
}

# Establecer variables de entorno de usuario (permanentes)
Write-Host "Configurando variables de entorno..." -ForegroundColor Green
[Environment]::SetEnvironmentVariable("GIT_USERNAME", $GITHUB_USERNAME, "User")
[Environment]::SetEnvironmentVariable("GIT_PASSWORD", $GITHUB_TOKEN, "User")

Write-Host "✓ GIT_USERNAME = $GITHUB_USERNAME" -ForegroundColor Green
Write-Host "✓ GIT_PASSWORD = ****" -ForegroundColor Green
Write-Host "Las variables de entorno han sido configuradas permanentemente" -ForegroundColor Green
Write-Host "Cierra y reabre el IDE para que surtan efecto los cambios" -ForegroundColor Yellow

