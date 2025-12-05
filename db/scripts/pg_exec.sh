#!/bin/bash

cd ${0/pg_exec.sh/..}
source scripts/config.sh

# for table in products product_relationships; do
# 	echo " - table:$table"
# 	pg_dump --data-only -U $DATABASE_USER -h localhost $DATABASE_NAME -t $table > ./$table.sql
# done

psql -U $DATABASE_USER -h localhost $DATABASE_NAME < ./scripts/pg_exec.sql

