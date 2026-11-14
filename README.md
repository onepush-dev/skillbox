# Skillbox on Railway

Skillbox — a self-hosted, versioned skills library for AI agents (MCP server, scoped client keys). Deploy on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/TEMPLATE_CODE)

Upstream: [kitze/skillbox](https://github.com/kitze/skillbox) (MIT) at commit `dfc974f` (Nov 13, 2026), built from upstream's own Dockerfile, app unmodified.

## Services

- `skillbox` — `ghcr.io/onepush-dev/skillbox:dfc974f`, port 8080, public HTTPS domain, healthcheck `/healthz`, volume `/app/data` (exports/imports).
- `skillbox-db` — `ghcr.io/onepush-dev/skillbox-db:16.15` (upstream's pinned `postgres:16.15-alpine`, user/db `skillbox` baked), private only, volume `/var/lib/postgresql/data`.

## Sign in

Open your Railway domain and sign in with `SKILLBOX_ADMIN_TOKEN` (generated per deploy; copy it from the `skillbox` service's Variables tab). It is the owner key and also encrypts stored integration secrets, so do not change it after setup.

## Notes

- `SKILLBOX_ORIGIN` is set to `https://${{RAILWAY_PUBLIC_DOMAIN}}`. If you add a custom domain, update it (or add the old one to `SKILLBOX_ALLOWED_ORIGINS`).
- Jev recommendations need your own OpenRouter / TypeSafe AI / Vercel AI Gateway key, entered in Settings (optional).
- Owner login is single-owner; agents use scoped client keys created in the UI.
