# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.8@sha256:2fe49bcdae9b623f1a38f979bfe51d2d7df94515dba731b1e1be9932349e1374

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
