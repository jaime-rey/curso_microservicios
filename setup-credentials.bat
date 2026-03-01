@echo off
REM Script para configurar credenciales de GitHub
REM Debe ejecutarse como Administrador

setlocal enabledelayedexpansion

echo.
echo ============================================
echo Configurador de Credenciales Git
echo ============================================
echo.
echo Este script configurará tus credenciales para acceder
echo al repositorio privado de GitHub desde Spring Cloud Config
echo.

set /p USERNAME="Ingresa tu usuario de GitHub: "
if "!USERNAME!"=="" (
    echo ERROR: El usuario no puede estar vacio
    exit /b 1
)

set /p PASSWORD="Ingresa tu token personal de GitHub: "
if "!PASSWORD!"=="" (
    echo ERROR: El token no puede estar vacio
    exit /b 1
)

setx GIT_USERNAME "!USERNAME!"
setx GIT_PASSWORD "!PASSWORD!"

echo.
echo ✓ Variables de entorno configuradas correctamente
echo.
echo GIT_USERNAME = !USERNAME!
echo GIT_PASSWORD = ****
echo.
echo IMPORTANTE: Cierra y reabre el IDE para que surtan efecto
echo.
pause

