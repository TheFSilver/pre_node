#!/bin/ash
# start a simple server
while true; do { echo -e 'HTTP/1.1 200 OK\r\n'; } | nc -l -p ${PORT:-3000} -s '0.0.0.0'; done &
# start presearch node
/app/presearch-node
