PGDATA=/var/lib/pgpro/1c-15/data
PG_OOM_ADJUST_FILE=/proc/self/oom_score_adj
PG_OOM_ADJUST_VALUE=0

PATH=/opt/pgpro/1c-15/bin:/usr/sbin:/usr/bin:/bin:/sbin

/opt/pgpro/1c-15/bin/check-db-dir ${PGDATA}
/opt/pgpro/1c-15/bin/postgres -D ${PGDATA}
