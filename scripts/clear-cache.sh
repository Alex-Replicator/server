#!/bin/bash

echo "=== Очистка кэша ===\n"

# Очистка OPcache
echo "1. Очистка OPcache:"
docker-compose exec php php -r "if (function_exists('opcache_reset')) { opcache_reset(); echo '✓ OPcache очищен\n'; } else { echo '✗ OPcache не установлен\n'; }"

# Очистка Memcached
echo "2. Очистка Memcached:"
docker-compose exec memcached memcached-tool localhost:11211 flush

# Очистка сессий
echo "3. Очистка сессий:"
docker-compose exec php rm -rf /var/lib/php/sessions/*

# Очистка временных файлов
echo "4. Очистка временных файлов:"
docker-compose exec php rm -rf /tmp/php*

echo "=== Очистка завершена ===" 