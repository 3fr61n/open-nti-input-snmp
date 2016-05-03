#! /bin/bash

docker stop open-nti-input-snmp_con
docker rm open-nti-input-snmp_con

docker run --rm -t \
    -e INFLUXDB_ADDR="172.17.0.3" \
    -e KAFKA_ADDR="172.17.0.2" \
    --volume $(pwd):/root/telegraf \
    --name open-nti-input-snmp_con \
    -i juniper\open-nti-input-snmp /sbin/my_init -- bash -l
