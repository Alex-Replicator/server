# Docker-сборка для PHP-проектов

## Обзор
Универсальная Docker-сборка для разработки PHP-проектов с веб-сервером, базой данных и кэшированием.

## Возможности
- PHP 8.1 с полным набором расширений
- MySQL 8.0
- Memcached для кэширования
- Nginx 1.25
- Adminer для управления базой данных

## Требования
- Docker
- Docker Compose
- Git

## Установка

1. Создайте пустую директорию для проекта и инициализируйте Git:
```bash
mkdir my-project
cd my-project
git init
```

2. Добавьте сборку как Git-подмодуль:
```bash
git submodule add https://github.com/Alex-Replicator/docker-php-build.git server
```

3. Создайте директорию для кода проекта:
```bash
mkdir src
```

4. Создайте файл `.env` в корне проекта:
```env
# Настройки проекта
COMPOSE_PROJECT_NAME=my-project
DEBUG=1

# Настройки MySQL
MYSQL_VERSION=8.0
MYSQL_ROOT_PASSWORD=root_password
MYSQL_DATABASE=app_db
MYSQL_USER=app_user
MYSQL_PASSWORD=app_password
MYSQL_PORT=3306
```

## Использование

### Запуск
```bash
docker-compose up -d
```

### Остановка
```bash
docker-compose down
```

### Просмотр логов
```bash
docker-compose logs -f
```

### Очистка кэша
```bash
./scripts/clear-cache.sh
```

### Подключение к базе данных
1. Откройте Adminer: http://localhost:8081
2. Используйте данные из .env:
   - Система: MySQL
   - Сервер: mysql
   - Пользователь: app_user
   - Пароль: app_password
   - База данных: app_db

## Структура проекта
```
project/
├── server/                      # Git-подмодуль
│   ├── .env                     # Файл с переменными окружения
│   ├── docker-compose.yml       # Основной файл Docker Compose
│   ├── bin/                     # Dockerfile для каждого сервиса
│   ├── config/                  # Конфигурационные файлы
│   ├── logs/                    # Логи всех сервисов
│   └── scripts/                 # Скрипты для утилит
└── src/                         # Код проекта
```

## Лицензия
MIT 