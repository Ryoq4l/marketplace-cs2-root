@echo off
chcp 65001 >nul
echo ========================================================
echo Установка окружения для CS2 Marketplace (Windows)
echo ========================================================
echo.

echo [1/4] Установка Git...
winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements

echo.
echo [2/4] Установка JDK 21 (Microsoft OpenJDK)...
winget install --id Microsoft.OpenJDK.21 -e --accept-package-agreements --accept-source-agreements

echo.
echo [3/4] Установка Maven...
winget install --id Apache.Maven -e --accept-package-agreements --accept-source-agreements

echo.
echo [4/4] Установка Docker Desktop...
winget install --id Docker.DockerDesktop -e --accept-package-agreements --accept-source-agreements

echo.
echo ========================================================
echo Установка завершена!
echo.
echo ВАЖНО:
echo 1. Перезагрузи компьютер (или выйди и зайди в систему), чтобы
echo    переменные среды (JAVA_HOME, PATH) применились.
echo 2. Запусти Docker Desktop и дождись его полной загрузки.
echo 3. Теперь можно запускать docker compose up -d --build.
echo ========================================================
pause