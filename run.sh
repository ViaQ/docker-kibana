sed -i "s/es_host/$ES_HOST/" /opt/app-root/src/config/kibana.yml
sed -i "s/es_port/$ES_PORT/" /opt/app-root/src/config/kibana.yml
if [ -z "$ES_CA" ] ; then
    # if not using SSL, change es url to http, and comment out the other SSL stuff
    sed -i '/^elasticsearch_url:/s/https:/http:/' /opt/app-root/src/config/kibana.yml
    sed -i 's/^\(kibana_elasticsearch_client_crt.*\)$/# \1/' /opt/app-root/src/config/kibana.yml
    sed -i 's/^\(kibana_elasticsearch_client_key.*\)$/# \1/' /opt/app-root/src/config/kibana.yml
    sed -i 's/^\(ca:.*\)$/# \1/' /opt/app-root/src/config/kibana.yml
fi

/opt/app-root/src/bin/kibana
