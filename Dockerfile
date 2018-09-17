FROM elasticsearch:1.7.1
RUN /usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/1.0
RUN apt-get update && \
    apt-get install -y host && \
    apt-get clean
ENV ES_INT eth0
ENV ES_CLUSTER cluster
CMD ["elasticsearch --network.publish_host=_$ES_INT:ipv4_ --cluster.name=$ES_CLUSTER --discovery.zen.ping.multicast.enabled=false --discovery.zen.minimum_master_nodes=$ES_MINIMUM_MASTER_NODES  --script.disable_dynamic=$ES_SCRIPT_DISABLE  --script.groovy.sandbox.enabled=$ES_GROOVY_ENABLED --node.master=$ES_NODE_MASTER --node.data=$ES_NODE_DATA"]
