# Skillbox on Railway: upstream kitze/skillbox (MIT) built from its own root Dockerfile at commit
# dfc974f36fcbc4d778b79cc0e16df0d312dece9f (Nov 13, 2026), app unmodified. This layer only: chowns the root-owned
# Railway volume /app/data for the image's "bun" user, waits for Postgres, then runs upstream's server as "bun" on 8080.
# Defaults are baked as ENV because Railway templates drop plain variable values.
ARG BASE=ghcr.io/onepush-dev/skillbox-base:dfc974f
FROM ${BASE}
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/skillbox"
USER root
RUN command -v setpriv
COPY railway/start.sh /opt/railway/start.sh
RUN chmod 755 /opt/railway/start.sh
ENV HOST=0.0.0.0 \
    PORT=8080 \
    NODE_ENV=production
EXPOSE 8080
HEALTHCHECK NONE
ENTRYPOINT ["/opt/railway/start.sh"]
CMD ["bun", "src/server/index.ts"]
