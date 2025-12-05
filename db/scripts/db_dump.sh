#!/bin/bash

cd ${0/db_dump.sh/}

timestamp=$(date)
echo "Date : $timestamp"
ssh openproduct "~/openproduct-svelte4/scripts/db_dump.sh"
rsync -avpzh openproduct:openproduct-db/db/data/ ../data/
git add ../data/pg_dump.schema.sql ../data/pg_dump.sql
git commit -m"Backup $timestamp"
git push
