FROM elasticsearch:7.9.2

RUN yum -y install hunspell-en-US

RUN mkdir -p /usr/share/elasticsearch/config/hunspell/en_US && cp /usr/share/myspell/en_US.* /usr/share/elasticsearch/config/hunspell/en_US

RUN mkdir -p /usr/share/elasticsearch/config/hunspell/ru_RU/
COPY ru_RU.* ru_surname.dic settings.yml /usr/share/elasticsearch/config/hunspell/ru_RU/

RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config/hunspell
