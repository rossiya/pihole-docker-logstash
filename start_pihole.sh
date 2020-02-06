#!/bin/bash
version="4.3.2-1"
node_name="pihole_beats"
docker rm -f $node_name
docker pull pihole/pihole:$version
docker build -t pihole_w_filebeat:$version pihole-filebeat
docker run -d -p 5353:53/udp -p 18080:8080/tcp -e WEBPASSWORD="mysecret" --restart always --name $node_name -v $PWD/config/etc/pihole:/etc/pihole -v $PWD/config/etc/dnsmasq.d:/etc/dnsmasq.d -v $PWD/config/resolv.conf:/etc/resolv.conf -e WEB_PORT="8080" -e DNS1="8.8.8.8" -e DNS2="8.8.4.4" pihole_w_filebeat:$version

#docker logs -f pihole
