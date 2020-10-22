Elasticsearch docker image with preinstalled and preconfigured ru_RU and en_US dictionaries.
[Docker hub](https://hub.docker.com/r/vooft/elasticsearch-ru)

Original Russian dictionary by Alexander Klukvin https://code.google.com/archive/p/hunspell-ru/
Surnames dictionary by Andrey Groshev https://github.com/greenx/hunspell-ru-surnames

Locale name us *ru_RU*
Dictionaries are *ru_RU* and *ru_surname*
*ru_RU* dictionary is configured with `ignore_case: true`

How to use:
```json
PUT mytestindex
{
  "settings": {
    "analysis": {
      "analyzer": {
        "morphology_analyzer": {
          "tokenizer": "standard",
          "filter": ["lowercase", "hunspell-ru"]
        }
      },
      "filter": {
        "hunspell-ru": {
          "type": "hunspell",
          "locale": "ru_RU",
          "dictionary": ["ru_RU", "ru_surname"],
          "dedup": true
        }
      }
    }
  },
  "mappings": {
    "dynamic_templates": [
      {
        "strings": {
          "match_mapping_type": "string",
          "mapping": {
            "type": "text",
            "fields": {
              "keyword": {
                "type": "keyword",
                "ignore_above": 256
              },
              "morphology": {
                "type": "text",
                "analyzer": "morphology_analyzer"
              }
            }
          }
        }
      }
    ]
  }
}
```