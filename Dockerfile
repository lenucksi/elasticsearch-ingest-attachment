# FROM elasticsearch
# this image on docker hub is deprecated (see https://hub.docker.com/_/elasticsearch/)
# I am still using is because of docker hub's auto update
# official:
#FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.2
FROM elasticsearch:7.6.2


# https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-init-containers-plugin-downloads.html --batch parameter is important or else build will fail due to expected and not present tty
RUN bin/elasticsearch-plugin install --batch ingest-attachment

# remove x-pack because of license problems spamming log file with massive amounts of errors
#RUN bin/elasticsearch-plugin remove x-pack --purge \
#    &&  sed -i 's/^xpack/#xpack/' config/elasticsearch.yml

