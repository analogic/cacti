# Docker container for cacti installation (S6+Apache+Cacti)

run with:

docker run --name cacti \
    -p 80:80 \
    -v /data/cacti/rrd:/var/lib/cacti/rra/ \
    -v /data/cacti/log:/var/log/cacti \
    -e "DB_USER=*<db_user>*" \
    -e "DB_PASS=*<db_password>*" \
    -e "DB_HOST=*<db_host>*" \
    -e "DB_NAME=*<db_name>*" \
    cacti