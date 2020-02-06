from pihole/pihole
RUN apt clean && apt update && apt install gnupg2 apt-transport-https wget -y 
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list && wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
RUN apt update && apt install filebeat -y && update-rc.d filebeat defaults 95 10

COPY filebeat.yml /etc/filebeat/filebeat.yml
