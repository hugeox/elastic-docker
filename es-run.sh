#!/bin/bash
sleep 10s
ES_PING_TARGETS=`host $ES_SERVICE_NAME | awk '/has address/ { print $4 }' | awk '{printf("%s,", $0)}' | sed s'/.$//'`
echo $ES_PING_TARGETS
elasticsearch --network.publish_host=_$ES_INT:ipv4_ --cluster.name=$ES_CLUSTER --discovery.zen.ping.multicast.enabled=false --discovery.zen.minimum_master_nodes=$ES_MINIMUM_MASTER_NODES --discovery.zen.ping.unicast.hosts=$ES_PING_TARGETS --script.disable_dynamic=$ES_SCRIPT_DISABLE --script.groovy.sandbox.enabled=$ES_GROOVY_ENABLED --node.master=$ES_NODE_MASTER --node.data=$ES_NODE_DATA
