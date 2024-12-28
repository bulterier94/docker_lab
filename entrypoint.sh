#!/bin/sh

if [ ! -d "/app/migrations" ]; then
    alembic init migrations
    echo "Migrations initialized"
fi

alembic upgrade head

rm -rf /app/migrations/__pycache__

python main.py

exec "$@"
