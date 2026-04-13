# AirSIEM for Docker

Учебный стенд для запуска AirSIEM через Docker.

## Что внутри

- MongoDB
- RabbitMQ + Management UI
- Buggy PHP app для генерации Apache access.log
- PHP console для просмотра alerts в MongoDB
- AirSIEM core
- ApacheConnector

## Запуск через Portainer

1. Залить репозиторий в GitHub
2. В Portainer:
   - Stacks
   - Add stack
   - Repository URL: URL этого репозитория
   - Compose path: `docker-compose.yml`
3. Deploy the stack

## После запуска

- RabbitMQ UI: `http://HOST:15672`
- Buggy app: `http://HOST:8080/buggy/admin.php`
- Console: `http://HOST:8081`

## Проверка

Сделать несколько запросов:

```bash
curl "http://HOST:8080/buggy/admin.php?username=1&password=1"
curl "http://HOST:8080/buggy/admin.php?username=1&password=1"
curl "http://HOST:8080/buggy/admin.php?username=1&password=1"