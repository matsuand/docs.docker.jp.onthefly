%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
It is possible to re-use configuration fragments using extension fields. Those
special fields can be of any format as long as they are located at the root of
your Compose file and their name start with the `x-` character sequence.
@y
{% comment %}
It is possible to re-use configuration fragments using extension fields. Those
special fields can be of any format as long as they are located at the root of
your Compose file and their name start with the `x-` character sequence.
{% endcomment %}
拡張項目（extension fields）を利用することで、設定内容の再利用が可能になります。
この特別な項目は Compose ファイルの最上位項目として位置していれば、どのような書式であっても構いません。
このとき項目名の先頭は `x-` で書き始めます。
@z

@x
> **Note**
>
> Starting with the 3.7 format (for the 3.x series) and 2.4 format
> (for the 2.x series), extension fields are also allowed at the root
> of service, volume, network, config and secret definitions.
@y
{% comment %}
> **Note**
>
> Starting with the 3.7 format (for the 3.x series) and 2.4 format
> (for the 2.x series), extension fields are also allowed at the root
> of service, volume, network, config and secret definitions.
{% endcomment %}
> **メモ**
>
> （3.x シリーズにおいては）バージョン 3.7 から、また（2.x シリーズにおいては）バージョン 2.4 から、この拡張項目は、service、volume、network、config、secret それぞれの最上位に記述できることになりました。
@z

@x
```yaml
version: '3.4'
x-custom:
  items:
    - a
    - b
  options:
    max-size: '12m'
  name: "custom"
```
@y
```yaml
version: '3.4'
x-custom:
  items:
    - a
    - b
  options:
    max-size: '12m'
  name: "custom"
```
@z

@x
The contents of those fields are ignored by Compose, but they can be
inserted in your resource definitions using [YAML anchors](https://yaml.org/spec/1.2/spec.html#id2765878).
For example, if you want several of your services to use the same logging
configuration:
@y
{% comment %}
The contents of those fields are ignored by Compose, but they can be
inserted in your resource definitions using [YAML anchors](https://yaml.org/spec/1.2/spec.html#id2765878).
For example, if you want several of your services to use the same logging
configuration:
{% endcomment %}
この項目に記述された内容は Compose からは無視されます。
そして [YAML アンカー](https://yaml.org/spec/1.2/spec.html#id2765878) を利用して、この項目をリソース定義内に挿入します。
たとえば複数のサービスに対して、同様のロギング設定を行いたいとします。
@z

@x
```yaml
logging:
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
```
@y
```yaml
logging:
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
```
@z

@x
You may write your Compose file as follows:
@y
{% comment %}
You may write your Compose file as follows:
{% endcomment %}
その場合、以下のようにして Compose ファイルを書くことができます。
@z

@x
```yaml
version: '3.4'
x-logging:
  &default-logging
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
@y
```yaml
version: '3.4'
x-logging:
  &default-logging
  options:
    max-size: '12m'
    max-file: '5'
  driver: json-file
@z

@x
services:
  web:
    image: myapp/web:latest
    logging: *default-logging
  db:
    image: mysql:latest
    logging: *default-logging
```
@y
services:
  web:
    image: myapp/web:latest
    logging: *default-logging
  db:
    image: mysql:latest
    logging: *default-logging
```
@z

@x
It is also possible to partially override values in extension fields using
the [YAML merge type](https://yaml.org/type/merge.html). For example:
@y
{% comment %}
It is also possible to partially override values in extension fields using
the [YAML merge type](https://yaml.org/type/merge.html). For example:
{% endcomment %}
また [YAML マージタイプ](https://yaml.org/type/merge.html) を利用すれば、拡張項目内にて部分的に値を上書きすることもできます。
たとえば以下のとおりです。
@z

@x
```yaml
version: '3.4'
x-volumes:
  &default-volume
  driver: foobar-storage
@y
```yaml
version: '3.4'
x-volumes:
  &default-volume
  driver: foobar-storage
@z

@x
services:
  web:
    image: myapp/web:latest
    volumes: ["vol1", "vol2", "vol3"]
volumes:
  vol1: *default-volume
  vol2:
    << : *default-volume
    name: volume02
  vol3:
    << : *default-volume
    driver: default
    name: volume-local
```
@y
services:
  web:
    image: myapp/web:latest
    volumes: ["vol1", "vol2", "vol3"]
volumes:
  vol1: *default-volume
  vol2:
    << : *default-volume
    name: volume02
  vol3:
    << : *default-volume
    driver: default
    name: volume-local
```
@z
