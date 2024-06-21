# copy postgres configs to PGDATA

echo "[21]: COPYING CONF to PGDATA DIR"
cp /tmp/pgconf/* --target-directory=$PGDATA



    psql \
    -v ON_ERROR_STOP=1 \
    -U $POSTGRES_USER \
    -d $POSTGRES_DB  <<-EOSQL 
    DO
    \$\$
    BEGIN
        GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO process;
        GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO root;

        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO process;
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO root;

        GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO process;
        GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO root;
    END
    \$\$;
	EOSQL
