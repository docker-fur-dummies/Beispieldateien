# Der Microsoft SQL Server Container unter Linux ist die Basis für diesen Container:
FROM microsoft/mssql-server-linux:latest
# es gibt die Möglichkeit, Metadaten anzugeben
LABEL maintainer Benjamin Kettner <benjamin.kettner@ml-pa.com>

# Legen Sie Verzeichnisse für Daten, Logs und Backups an
RUN mkdir /var/opt/sqldatabase
RUN mkdir /var/opt/sqldatabase/data
RUN mkdir /var/opt/sqldatabase/log
RUN mkdir /var/opt/sqldatabase/bak

# Laden Sie die Adventure Works Datenbank von github herunter und fügen Sie das Backup dem Image hinzu
ADD https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak /var/opt/sqldatabase/bak

# Definieren Sie umgebungsvariablen für die Datenbank:
ENV MSSQL_PID=Developer
ENV SA_PASSWORD=!demo54321
ENV ACCEPT_EULA=Y

# Starten Sie den SQL Server und stellen Sie das heruntergeladene Backup wieder her:
RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
    && /opt/mssql-tools/bin/sqlcmd -S . -U sa -P '!demo54321' \
    -Q "RESTORE DATABASE [AdventureWorks2017] FROM DISK = N'/var/opt/sqldatabase/bak/AdventureWorks2017.bak' WITH MOVE 'AdventureWorks2017' TO '/var/opt/sqldatabase/data/AdventureWorks_Data.mdf', MOVE 'AdventureWorks2017_Log' TO '/var/log/sqldatabase/log/AdventureWorks_Log.ldf'" \
    && pkill sqlservr

    