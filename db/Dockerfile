# Postgres 16 for Skillbox: the same image upstream's compose.yml pins, with its user/db baked
# (Railway templates drop plain values) and PGDATA in a subfolder of the volume (the mount has lost+found).
FROM postgres:16.15-alpine@sha256:cf78e76683b9ca8c5733cbbdce6c9262b45b6767934dd0a95e671f9a0fc20685
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/skillbox"
ENV POSTGRES_USER=skillbox \
    POSTGRES_DB=skillbox \
    PGDATA=/var/lib/postgresql/data/pgdata
