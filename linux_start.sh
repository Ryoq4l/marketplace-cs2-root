#!/bin/bash
set -e

echo "========================================================"
echo "Установка окружения и клонирование проекта (Linux)"
echo "========================================================"

# Проверка на root
if [ "$EUID" -ne 0 ]; then
  echo "Пожалуйста, запустите скрипт с sudo: sudo ./install-and-clone.sh"
  exit 1
fi

# --- ЭТАП 1: УСТАНОВКА ---
echo "[ЭТАП 1/2] Установка Git, Java 21, Maven и Docker..."
apt-get update -y
apt-get install -y git openjdk-21-jdk maven curl

# Установка Docker через официальный скрипт
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

# --- ЭТАП 2: КЛОНИРОВАНИЕ ---
echo "[ЭТАП 2/2] Клонирование репозиториев..."

# Определяем домашнюю директорию реального пользователя (не root)
REAL_USER=${SUDO_USER:-$USER}
REAL_HOME=$(eval echo "~$REAL_USER")

# Создаем папку на рабочем столе (Desktop) или в домашней директории
if [ -d "$REAL_HOME/Desktop" ]; then
  TARGET_DIR="$REAL_HOME/Desktop/marketplace"
else
  TARGET_DIR="$REAL_HOME/marketplace" # Если нет Desktop (сервер)
fi

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

echo "Клонирование сервисов в $TARGET_DIR..."

git clone https://github.com/Ryoq4l/marketplace-infra.git
git clone https://github.com/Ryoq4l/marketplace-eureka.git
git clone https://github.com/Ryoq4l/marketplace-auth.git
git clone https://github.com/Ryoq4l/marketplace-wallet.git
git clone https://github.com/Ryoq4l/marketplace-catalog.git
git clone https://github.com/Ryoq4l/marketplace-order.git
git clone https://github.com/Ryoq4l/marketplace-gateway.git

# Возвращаем права пользователю (так как скрипт работал от root)
chown -R "$REAL_USER:$REAL_USER" "$TARGET_DIR"

# Добавляем пользователя в группу docker
usermod -aG docker "$REAL_USER"

echo ""
echo "========================================================"
echo "ГОТОВО!"
echo ""
echo "1. Папка с проектом: $TARGET_DIR"
echo "2. Перезайдите в систему (или выполните 'newgrp docker'),"
echo "   чтобы применились права на Docker."
echo "3. Для запуска:"
echo "   cd $TARGET_DIR/marketplace-infra"
echo "   docker compose up -d --build"
echo "========================================================"