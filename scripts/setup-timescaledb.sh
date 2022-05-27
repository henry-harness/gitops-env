#!/bin/sh

psql -h 127.0.0.1 -p 5432 -d harness_gitops -U postgres -f /scripts/setup-timescaledb-ext.sql
