# CS2 Marketplace Backend

Микросервисный бэкенд для торговой площадки скинов CS2. 
Проект построен на Java 21, Spring Boot 4 и Spring Cloud.

### Архитектура

Проект разделен на независимые микросервисы, которые общаются друг с другом через Eureka (Service Discovery) и Feign (HTTP-клиенты).

### Микросервисы

| Сервис | Порт | Описание |
| :--- | :--- | :--- |
| [Gateway](https://github.com/Ryoq4l/marketplace-gateway) | `8080` | Единая точка входа, маршрутизация, CORS |
| [Auth Service](https://github.com/Ryoq4l/marketplace-auth) | `8081` | Вход через Steam (OAuth2), выдача JWT |
| [Wallet Service](https://github.com/Ryoq4l/marketplace-wallet) | `6767` | Кошелек, списание, холды, транзакции |
| [Catalog Service](https://github.com/Ryoq4l/marketplace-catalog) | `8083` | Каталог скинов, инвентарь, листинги |
| [Order Service](https://github.com/Ryoq4l/marketplace-order) | `8084` | Оркестратор заказов, Trade Protection |
| [Eureka Server](https://github.com/Ryoq4l/marketplace-eureka) | `8761` | Service Discovery (реестр сервисов) |
| [Common](https://github.com/Ryoq4l/marketplace-common) | `none` | Exception handler (локальный) |

### Инфраструктура
- [Marketplace Infra](https://github.com/Ryoq4l/marketplace-infra) — Docker Compose, MySQL, Kafka(TBD), Steam-proxy.

## Требования
- Docker Desktop (Windows/Mac) или Docker Engine (Linux)
- Docker Compose v2
- Git

## Запуск проекта

### Автоматический запуск

**Для Windows:**
1. Скачайте скрипт: [install-and-clone.bat](https://github.com/Ryoq4l/marketplace-infra/blob/main/scripts/install-and-clone.bat) (нажмите "Raw" и сохраните файл).
2. Нажмите на скачанный файл правой кнопкой мыши и выберите **"Запуск от имени администратора"**.
3. Дождитесь завершения установки. Скрипт сам создаст папку `Desktop\marketplace` и склонирует туда все сервисы.
4. **Перезагрузите компьютер** (чтобы применились настройки Java и Docker).

**Для Linux (Ubuntu/Debian):**
1. Скачайте скрипт:
```bash
wget https://raw.githubusercontent.com/Ryoq4l/marketplace-infra/main/scripts/install-and-clone.sh
```
2.Дайте ему права на исполнение и запустите
```bash
chmod +x install-and-clone.sh
sudo ./install-and-clone.sh
```

3.Скрипт создаст папку Desktop/marketplace (или ~/marketplace), склонирует проект и настроит Docker

4.Откройте Swagger UI:
http://localhost:8080/swagger-ui.html

### Ручной запуск
Если вы предпочитаете контролировать каждый шаг, установите Docker и Git вручную. Затем выполните:

**Для Windows:**
```bash
# 1. Переходим на Рабочий стол и создаем папку
cd $HOME\Desktop
mkdir marketplace
cd marketplace

# 2. Клонируем все репозитории
git clone https://github.com/Ryoq4l/marketplace-infra.git
git clone https://github.com/Ryoq4l/marketplace-eureka.git
git clone https://github.com/Ryoq4l/marketplace-auth.git
git clone https://github.com/Ryoq4l/marketplace-wallet.git
git clone https://github.com/Ryoq4l/marketplace-catalog.git
git clone https://github.com/Ryoq4l/marketplace-order.git
git clone https://github.com/Ryoq4l/marketplace-gateway.git
git clone https://github.com/Ryoq4l/marketplace-common.git

# 3. Запускаем проект
cd marketplace-infra
docker compose up -d --build
```
**Для Linux (Ubuntu/Debian):**
```bash
# 1. Переходим на Рабочий стол и создаем папку
cd ~/Desktop
mkdir marketplace
cd marketplace

# 2. Клонируем все репозитории
git clone https://github.com/Ryoq4l/marketplace-infra.git
git clone https://github.com/Ryoq4l/marketplace-eureka.git
git clone https://github.com/Ryoq4l/marketplace-auth.git
git clone https://github.com/Ryoq4l/marketplace-wallet.git
git clone https://github.com/Ryoq4l/marketplace-catalog.git
git clone https://github.com/Ryoq4l/marketplace-order.git
git clone https://github.com/Ryoq4l/marketplace-gateway.git
git clone https://github.com/Ryoq4l/marketplace-common.git

# 3. Запускаем проект
cd marketplace-infra
docker compose up -d --build
```
4. Откройте Swagger UI: http://localhost:8080/swagger-ui.html

### Постустановка
1.Запустите Docker Desktop (на Windows) или убедитесь, что Docker работает (на Linux)
2.Перейдите в папку с проектом:
```bash
cd Desktop/marketplace/marketplace-infra   # Windows
cd ~/Desktop/marketplace/marketplace-infra  # Linux
```
3.Запустите сборку:
```bash
docker compose up -d --build
```
## API Endpoints (через Gateway)
- `GET /api/v1/items` — каталог скинов
- `POST /api/v1/orders` — создание заказа
- `POST /api/v1/wallets` — создание кошелька
- `GET /oauth2/authorization/steam` — вход через Steam

## Стек технологий

    Java 21
    Spring Boot 4.1
    Spring Cloud (Eureka, Gateway, OpenFeign)
    Spring Data JPA / Hibernate
    MySQL 8.4
    Docker / Docker Compose
    JWT / OAuth2 (Steam)
    Swagger / OpenAPI 3


