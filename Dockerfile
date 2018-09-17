FROM elasticsearch:1.7.1
RUN /usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/1.0
RUN apt-get update && \
    apt-get install -y host && \
    apt-get clean
ADD es-run.sh /usr/bin/es-run.sh
RUN chmod +x /usr/bin/es-run.sh
ENV ES_INT eth0
ENV ES_CLUSTER cluster
CMD ["/usr/bin/es-run.sh"]
