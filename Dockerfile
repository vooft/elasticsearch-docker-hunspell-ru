FROM elasticsearch:7.17.7

RUN mkdir -p /usr/share/elasticsearch/config/hunspell/en_US \
    && mkdir -p /usr/share/elasticsearch/config/hunspell/ru_RU/

COPY en_US.* settings.yml /usr/share/elasticsearch/config/hunspell/en_US/
COPY ru_RU.* ru_surname.dic settings.yml /usr/share/elasticsearch/config/hunspell/ru_RU/

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config/hunspell

HEALTHCHECK --interval=15s --timeout=10s --retries=15 CMD curl --silent --fail localhost:9200/_cluster/health || exit 1