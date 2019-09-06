FROM zabbix/zabbix-proxy-sqlite3:ubuntu-4.0-latest

# Build and install SQLite unixODBC driver
RUN apk update && \
    apk add build-base sqlite-dev unixodbc-dev && \
    cd /tmp/ && \
    wget http://www.ch-werner.de/sqliteodbc/sqliteodbc-0.9996.tar.gz && \
    tar zxvf sqliteodbc-0.9996.tar.gz && \
    cd sqliteodbc-0.9996 && \
    ./configure && \
    make && \
    make install && \
    rm -fr /tmp/sqliteodbc-0.9996 && \
    apk del --purge build-base sqlite-dev unixodbc-dev && \
    rm -rf /var/cache/apk/*

