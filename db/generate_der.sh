#! /bin/bash

rm -rf der/*
java -jar schemaSpy_5.0.0.jar -t pgsql -db postgres -s wirecard -u postgres -p postgres -o der -host localhost -port 5432 -dp postgresql-42.1.1.jar
