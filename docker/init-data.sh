#!/bin/bash
set -e;


if [ -n "${POSTGRES_NON_ROOT_USER:-}" ] && [ -n "${POSTGRES_NON_ROOT_PASSWORD:-}" ]; then
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	  -- Create n8n database and the db user
		CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
		GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};
		GRANT CREATE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};

		-- Create flowise database
    CREATE DATABASE flowise;
    GRANT ALL PRIVILEGES ON DATABASE flowise TO ${POSTGRES_NON_ROOT_USER};
	EOSQL
else
	echo "SETUP INFO: No Environment variables given!"
fi