# zabbix-proxy-sqlite3
Zabbix proxy docker container with SQLite3 database support

This container is based on the official [zabbix/zabbix-proxy-sqlite3](https://hub.docker.com/r/zabbix/zabbix-proxy-sqlite3/) docker container,
with the following modifications:

* SQLite ODBC driver pre-built and installed in the container

Only Alpine version is supported so far.
