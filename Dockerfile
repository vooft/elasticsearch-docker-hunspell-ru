FROM elasticsearch:7.9.1
RUN yum -y install hunspell-en-US hunspell-ru
RUN mkdir -p /usr/share/elasticsearch/config/hunspell/ru_RU && cp /usr/share/myspell/ru_RU.* /usr/share/elasticsearch/config/hunspell/ru_RU
RUN mkdir -p /usr/share/elasticsearch/config/hunspell/en_US && cp /usr/share/myspell/en_US.* /usr/share/elasticsearch/config/hunspell/en_US
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/config/hunspell
