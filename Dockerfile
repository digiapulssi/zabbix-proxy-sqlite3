FROM zabbix/zabbix-proxy-sqlite3:ubuntu-4.4-latest

USER root

# Build and install SQLite unixODBC driver, Python and requests library
RUN apt-get update && \
    apt-get install -y build-essential sqlite3 libsqlite3-dev unixodbc-dev && \
    cd /tmp/ && \
    apt-get install -y wget && \
    wget http://www.ch-werner.de/sqliteodbc/sqliteodbc-0.9996.tar.gz && \
    tar zxvf sqliteodbc-0.9996.tar.gz && \
    cd sqliteodbc-0.9996 && \
    ./configure && \
    make && \
    make install && \
    rm -fr /tmp/sqliteodbc-0.9996 && \
    apt-get purge -y build-essential sqlite3 libsqlite3-dev unixodbc-dev && \

    apt-get install -y python3-pip python3  && \
    cd /usr/local/bin && \
    ln -s /usr/bin/python3 python && \
    pip3 install --upgrade --no-cache-dir requests && \
    rm -rf /var/cache/apk/*
	
USER zabbix
