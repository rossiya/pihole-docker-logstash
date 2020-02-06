#!/bin/bash
pihole_version="4.3.2-1"
filebeat_version="7.5.2"
node_name="pihole_beats"
docker rm -f $node_name
docker pull pihole/pihole:$pihole_version
docker run -d -p 5353:53/udp -p 18080:8080/tcp -e WEBPASSWORD="mysecret" --restart always --name $node_name -v $PWD/config/etc/pihole:/etc/pihole -v $PWD/config/etc/dnsmasq.d:/etc/dnsmasq.d -v $PWD/config/resolv.conf:/etc/resolv.conf -e WEB_PORT="8080" -e DNS1="8.8.8.8" -e DNS2="8.8.4.4" pihole/pihole:$pihole_version

docker run -d --restart always --name pihole_filebeat -ti -v $PWD/filebeat.yml:/usr/share/filebeat/filebeat.yml -v /var/log/pihole.log:/var/log/pihole.log docker.elastic.co/beats/filebeat:filebeat_version

#docker logs -f pihole
