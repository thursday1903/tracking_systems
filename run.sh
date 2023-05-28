# sudo docker pull mcr.microsoft.com/mssql/server:2022-latest

# sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=@123456A" -p 1433:1433 --name sql1 --hostname sql1 -d mcr.microsoft.com/mssql/server:2022-latest

# docker cp database_tracking.sql sql1:/file.sql

docker exec -it sql_server /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P @123456A -i database_tracking.sql