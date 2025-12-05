#!/bin/bash

cd ${0/db_local_load.sh/}
MY_DIR=`pwd`

cd ../../../openproduct-web-svelte4/
source scripts/config.sh
cd $MY_DIR
echo "PWD=$MY_DIR"

psql -U $DATABASE_USER -h localhost $DATABASE_NAME < ../data/pg_dump.schema.sql
psql -U $DATABASE_USER -h localhost $DATABASE_NAME < ../data/pg_dump_users.sql
psql -U $DATABASE_USER -h localhost $DATABASE_NAME < ../data/pg_dump.sql
