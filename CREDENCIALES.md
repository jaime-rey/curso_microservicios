# Configuración de Credenciales para Spring Cloud Config Server

## Problema
Spring Cloud Config Server necesita acceder a un repositorio privado de GitHub. Necesitas proporcionar credenciales de autenticación.

## Solución

### Paso 1: Generar un Token Personal de GitHub

1. Ve a https://github.com/settings/tokens
2. Haz clic en "Generate new token" → "Generate new token (classic)"
3. Asigna un nombre: `spring-cloud-config`
4. Selecciona los permisos:
   - ✓ `repo` (acceso completo a repositorios privados)
5. Haz clic en "Generate token"
6. **Copia el token** (no lo pierdas, no volverá a aparecer)

### Paso 2: Configurar las Variables de Entorno

#### Opción A: Usar el Script (Recomendado)

**En Windows (CMD):**
```batch
cd "C:\Users\User\spring boot\section6\v2-spring-cloud-config"
setup-credentials.bat
```

Te pedirá:
- Tu usuario de GitHub
- Tu token personal

#### Opción B: Configurar Manualmente (PowerShell como Administrador)

```powershell
[Environment]::SetEnvironmentVariable("GIT_USERNAME", "tu_usuario", "User")
[Environment]::SetEnvironmentVariable("GIT_PASSWORD", "tu_token", "User")
```

#### Opción C: Configurar Manualmente (CMD como Administrador)

```cmd
setx GIT_USERNAME "tu_usuario"
setx GIT_PASSWORD "tu_token"
```

### Paso 3: Reiniciar el IDE

**Cierra IntelliJ IDEA completamente y reabre el proyecto.**

Las variables de entorno se cargan cuando se inicia el proceso Java.

### Paso 4: Compilar y Ejecutar

```bash
cd configserver
mvn clean package
```

Luego inicia el `ConfigserverApplication`.

## ¿Cómo funciona?

1. **GitConfig.java**: Lee las variables de entorno `GIT_USERNAME` y `GIT_PASSWORD`
2. **ConfigurableJGitFactory.java**: Crea un `CredentialsProvider` y lo registra globalmente en JGit
3. **Spring Cloud Config**: Usa automáticamente estas credenciales para clonar el repositorio

## Verificación

Si todo está bien configurado, verás en los logs:

```
2026-02-25T22:23:37.xxx INFO  o.s.cloud.config.server... : Starting ConfigserverApplication
2026-02-25T22:23:38.xxx INFO  ... : Server started successfully
```

**SIN advertencias de autenticación.**

## Troubleshooting

### Error: "not authorized"
- ✓ Verifica que el token sea válido
- ✓ Asegúrate de que la variable de entorno está configurada
- ✓ Reinicia el IDE

### Error: "Could not resolve placeholder"
- ✓ Las variables de entorno no están definidas
- ✓ Ejecuta `setup-credentials.bat` o configura manualmente

### Error: "Repository not found"
- ✓ Verifica que la URL del repositorio es correcta
- ✓ Verifica que tienes acceso al repositorio en GitHub

## Seguridad

⚠️ **Nunca commits los tokens en Git**

El archivo `application.yml` está configurado para leer desde variables de entorno, no de archivos.
Las credenciales se almacenan de forma segura en las variables de entorno del sistema.

