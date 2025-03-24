FROM mysql:8.0

# Копирование конфигурации MySQL
COPY config/mysql/my.cnf /etc/mysql/conf.d/custom.cnf

# Создание директории для логов
RUN mkdir -p /var/log/mysql && \
    chown -R mysql:mysql /var/log/mysql

# Открытие порта
EXPOSE 3306

# Настройка точки монтирования для данных
VOLUME /var/lib/mysql 