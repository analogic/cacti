# Docker container with full Cacti installation (S6+Apache+Cacti+Cacti spine)

run with:

```
docker run --name cacti \
    -p 80:80 \
    -v /data/cacti/rrd:/var/lib/cacti/rra/ \
    -v /data/cacti/log:/var/log/cacti \
    -e "DB_USER=db_user>" \
    -e "DB_PASS=<db_password>" \
    -e "DB_HOST=<db_host>" \
    -e "DB_NAME=<db_name>" \
    analogic/cacti
```

You need pre-create db user and db itself. Tables are created automaticaly at first start.
