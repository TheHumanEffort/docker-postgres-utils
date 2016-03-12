CONNECTED_POSTGRES_INSTANCES=$( env | grep _PORT_5432_TCP_ADDR | grep -vP '_\d+_PORT_5432_TCP_ADDR' | awk 'BEGIN { FS = "_PORT_5432_TCP_ADDR=" }; { print $1 }')

for databaseName in $CONNECTED_POSTGRES_INSTANCES   #  <-- Note: Added "" quotes.
do
    echo Backing up $databaseName ...
    hostVar=$databaseName"_PORT_5432_TCP_ADDR"
    userVar=$databaseName"_ENV_POSTGRES_USER"
    passVar=$databaseName"_ENV_POSTGRES_PASSWORD"
    PGHOST=${!hostVar} PGUSER=${!userVar} PGPASSWORD=${!passVar} pg_dumpall $PGDUMP_OPTIONS | gzip > $databaseName.sqldump.gz

done
