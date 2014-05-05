#!/bin/sh

DB_HOST=${DB_HOST:-}
DB_PORT=${DB_PORT:-}
DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}

cd /usr/local/fnordcash && python3 manage.py runserver 0.0.0.0:80
