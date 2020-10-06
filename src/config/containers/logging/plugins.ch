%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How to use logging driver plugins
title: Use a logging driver plugin
keywords: logging, driver, plugins, monitoring
redirect_from:
- /engine/admin/logging/plugins/
---
@y
---
description: ログドライバープラグインの利用方法を示します。
title: ログドライバープラグインの利用
keywords: logging, driver, plugins, monitoring
redirect_from:
- /engine/admin/logging/plugins/
---
@z

@x
Docker logging plugins allow you to extend and customize Docker's logging
capabilities beyond those of the [built-in logging drivers](configure.md).
A logging service provider can
[implement their own plugins](../../../engine/extend/plugins_logging.md) and make them
available on Docker Hub, or a private registry. This topic shows
how a user of that logging service can configure Docker to use the plugin.
@y
{% comment %}
Docker logging plugins allow you to extend and customize Docker's logging
capabilities beyond those of the [built-in logging drivers](configure.md).
A logging service provider can
[implement their own plugins](../../../engine/extend/plugins_logging.md) and make them
available on Docker Hub, or a private registry. This topic shows
how a user of that logging service can configure Docker to use the plugin.
{% endcomment %}
Docker のログドライバープラグインは、Docker のログ機能を拡張しカスタマイズするものです。
これによって [標準のログドライバー](configure.md) 以上のことができるようになります。
ログサービスプロバイダーは、[独自のプラグイン実装](../../../engine/extend/plugins_logging.md) を行って、Docker Hub あるいはプライベートリポジトリからプラグインを提供しています。
ここでは Docker におけるログプラグインの利用方法について示します。
@z

@x
## Install the logging driver plugin
@y
{% comment %}
## Install the logging driver plugin
{% endcomment %}
{: #install-the-logging-driver-plugin }
## ログドライバープラグインのインストール
@z

@x
To install a logging driver plugin, use `docker plugin install <org/image>`,
using the information provided by the plugin developer.
@y
{% comment %}
To install a logging driver plugin, use `docker plugin install <org/image>`,
using the information provided by the plugin developer.
{% endcomment %}
ログドライバープラグインをインストールするには `docker plugin install <org/image>` を実行します。
引数には、プラグイン開発者が提供する情報を指定します。
@z

@x
You can list all installed plugins using `docker plugin ls`, and you can inspect
a specific plugin using `docker inspect`.
@y
{% comment %}
You can list all installed plugins using `docker plugin ls`, and you can inspect
a specific plugin using `docker inspect`.
{% endcomment %}
インストール済のプラグインは `docker plugin ls` により一覧表示することができます。
特定のプラグインを確認するには `docker inspect` を実行します。
@z

@x
## Configure the plugin as the default logging driver
@y
{% comment %}
## Configure the plugin as the default logging driver
{% endcomment %}
{: #configure-the-plugin-as-the-default-logging-driver }
## デフォルトログドライバーとしてのプラグイン設定
@z

@x
After the plugin is installed, you can configure the Docker daemon to use it as
the default by setting the plugin's name as the value of the `log-driver`
key in the `daemon.json`, as detailed in the
[logging overview](configure.md#configure-the-default-logging-driver). If the
logging driver supports additional options, you can set those as the values of
the `log-opts` array in the same file.
@y
{% comment %}
After the plugin is installed, you can configure the Docker daemon to use it as
the default by setting the plugin's name as the value of the `log-driver`
key in the `daemon.json`, as detailed in the
[logging overview](configure.md#configure-the-default-logging-driver). If the
logging driver supports additional options, you can set those as the values of
the `log-opts` array in the same file.
{% endcomment %}
プラグインをインストールしたら、Docker デーモンがデフォルトで利用するように設定することができます。
これは `daemon.json` 内に `log-driver` キーを記述し、その値としてプラグイン名を指定します。
詳しくは [ログ概要](configure.md#configure-the-default-logging-driver) を参照してください。
ログドライバーに追加のオプションがサポートされていている場合は、`daemon.json` ファイル内に、`log-opts` に対しての配列として設定します。
@z

@x
## Configure a container to use the plugin as the logging driver
@y
{% comment %}
## Configure a container to use the plugin as the logging driver
{% endcomment %}
{: #configure-a-container-to-use-the-plugin-as-the-logging-driver }
## コンテナーにおけるログドライバープラグイン設定
@z

@x
After the plugin is installed, you can configure a container to use the plugin
as its logging driver by specifying the `--log-driver` flag to `docker run`, as
detailed in the
[logging overview](configure.md#configure-the-logging-driver-for-a-container).
If the logging driver supports additional options, you can specify them using
one or more `--log-opt` flags with the option name as the key and the option
value as the value.
@y
{% comment %}
After the plugin is installed, you can configure a container to use the plugin
as its logging driver by specifying the `--log-driver` flag to `docker run`, as
detailed in the
[logging overview](configure.md#configure-the-logging-driver-for-a-container).
If the logging driver supports additional options, you can specify them using
one or more `--log-opt` flags with the option name as the key and the option
value as the value.
{% endcomment %}
プラグインをインストールしたら、コンテナーの起動時にそのプラグインを利用するように設定することができます。
これは `docker run` の実行時に `--log-driver` フラグを指定して行います。
詳しくは [ログ概要](configure.md#configure-the-logging-driver-for-a-container) を参照してください。
ログドライバーに追加のオプションがサポートされていている場合は、必要な分だけ `--log-opt` フラグを指定します。
そしてそのフラグにおいて、キーとしてそのオプション名、バリューとしてその値を指定します。
@z
