#!/bin/sh
# Railway start wrapper for Skillbox: own the volume as "bun", wait for Postgres, run upstream's command as "bun".
set -e
mkdir -p /app/data
if [ "$(stat -c %U /app/data)" != bun ]; then chown -R bun:bun /app/data; fi
if [ -n "$DATABASE_URL" ]; then
  i=0
  until bun -e '
    const u=new URL(process.env.DATABASE_URL);
    const s=await Bun.connect({hostname:u.hostname,port:Number(u.port||5432),socket:{data(){},open(s){s.end();process.exit(0)},error(){process.exit(1)},connectError(){process.exit(1)}}}).catch(()=>process.exit(1));
    setTimeout(()=>process.exit(1),3000);
  ' 2>/dev/null; do
    i=$((i+1)); [ $i -ge 60 ] && { echo "railway: Postgres not reachable yet, starting anyway"; break; }
    echo "railway: waiting for Postgres ($i)"; sleep 2
  done
fi
exec setpriv --reuid=bun --regid=bun --init-groups "$@"
