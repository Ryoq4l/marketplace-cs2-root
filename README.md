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

### Инфраструктура
- [Marketplace Infra](https://github.com/Ryoq4l/marketplace-infra) — Docker Compose, MySQL, Kafka(TBD), Steam-proxy.

### Быстрый старт

Для запуска всего проекта потребуется **Docker** и **Docker Compose**.

## Шаг 1. Создайте папку для проекта и клонируйте все репозитории:

```bash

mkdir marketplace && cd marketplace

git clone https://github.com/Ryoq4l/marketplace-infra.git
git clone https://github.com/Ryoq4l/marketplace-eureka.git
git clone https://github.com/Ryoq4l/marketplace-auth.git
git clone https://github.com/Ryoq4l/marketplace-wallet.git
git clone https://github.com/Ryoq4l/marketplace-catalog.git
git clone https://github.com/Ryoq4l/marketplace-order.git
git clone https://github.com/Ryoq4l/marketplace-gateway.git
```
## Шаг 2. Перейдите в папку инфраструктуры и запустите сборку

```bash
cd marketplace-infra
docker compose up -d --build
```

## Шаг 3. Откройте Swagger UI для тестирования API:

http://localhost:8080/swagger-ui.html

### Стек технологий

    Java 21
    Spring Boot 4.1
    Spring Cloud (Eureka, Gateway, OpenFeign)
    Spring Data JPA / Hibernate
    MySQL 8.4
    Docker / Docker Compose
    JWT / OAuth2 (Steam)
    Swagger / OpenAPI 3


