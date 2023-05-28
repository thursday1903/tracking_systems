FROM mcr.microsoft.com/mssql/server:2022-latest
USER root
ENV MSSQL_SA_PASSWORD=@123456A
ENV ACCEPT_EULA=Y
COPY db/database_tracking.sql .
# CMD [ "/opt/mssql-tools/bin/sqlcmd", "-S", "localhost", "-U", "sa", "-P", "@123456A", "-i", "database_tracking.sql" ]
EXPOSE 1433