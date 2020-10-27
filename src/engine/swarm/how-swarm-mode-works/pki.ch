%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: How PKI works in swarm mode
keywords: swarm, security, tls, pki,
title: Manage swarm security with public key infrastructure (PKI)
---
@y
---
description: How PKI works in swarm mode
keywords: swarm, security, tls, pki,
title: 公開鍵基盤を利用した Swarm セキュリティ管理
---
@z

@x
The swarm mode public key infrastructure (PKI) system built into Docker
makes it simple to securely deploy a container orchestration system. The nodes
in a swarm use mutual Transport Layer Security (TLS) to authenticate, authorize,
and encrypt the communications with other nodes in the swarm.
@y
{% comment %}
The swarm mode public key infrastructure (PKI) system built into Docker
makes it simple to securely deploy a container orchestration system. The nodes
in a swarm use mutual Transport Layer Security (TLS) to authenticate, authorize,
and encrypt the communications with other nodes in the swarm.
{% endcomment %}
Docker に組み込まれている Swarm モードの公開鍵基盤（public key infrastructure; PKI）は、コンテナーによるオーケストレーションシステムを、簡単かつ安全にデプロイできるものです。
Swarm 内のノードは、他のノードとの認証、承認、通信暗号化のために相互 TLS を利用します。
@z

@x
When you create a swarm by running `docker swarm init`, Docker designates itself
as a manager node. By default, the manager node generates a new root Certificate
Authority (CA) along with a key pair, which are used to secure communications
with other nodes that join the swarm. If you prefer, you can specify your own
externally-generated root CA, using the `--external-ca` flag of the
[docker swarm init](../../reference/commandline/swarm_init.md) command.
@y
{% comment %}
When you create a swarm by running `docker swarm init`, Docker designates itself
as a manager node. By default, the manager node generates a new root Certificate
Authority (CA) along with a key pair, which are used to secure communications
with other nodes that join the swarm. If you prefer, you can specify your own
externally-generated root CA, using the `--external-ca` flag of the
[docker swarm init](../../reference/commandline/swarm_init.md) command.
{% endcomment %}
`docker swarm init` を実行して Swarm を生成すると、Docker 自体がマネージャーノードとなります。
マネージャーノードは、デフォルトで新たなルート認証局（CA）と鍵ペアを生成します。
これらは Swarm に参加するノードとの間でセキュアな通信を実現するために利用されます。
必要であれば [docker swarm init](../../reference/commandline/swarm_init.md) コマンドの `--external-ca` フラグを用いて、外部に生成した独自のルート CA を指定することができます。
@z

@x
The manager node also generates two tokens to use when you join additional nodes
to the swarm: one **worker token** and one **manager token**. Each token
includes the digest of the root CA's certificate and a randomly generated
secret. When a node joins the swarm, the joining node uses the digest to
validate the root CA certificate from the remote manager. The remote manager
uses the secret to ensure the joining node is an approved node.
@y
{% comment %}
The manager node also generates two tokens to use when you join additional nodes
to the swarm: one **worker token** and one **manager token**. Each token
includes the digest of the root CA's certificate and a randomly generated
secret. When a node joins the swarm, the joining node uses the digest to
validate the root CA certificate from the remote manager. The remote manager
uses the secret to ensure the joining node is an approved node.
{% endcomment %}
マネージャーノードは、Swarm へのノード追加時に利用される 2 つのトークンも生成します。
その 1 つが **ワーカートークン** であり、もう 1 つが **マネージャートークン** です。
それぞれのトークンには、ルート CA 証明書のダイジェスト値と、ランダムに生成された Secret 情報が含まれます。
Swarm へノードが参加する際には、参加するノードがそのダイジェスト値を用いて、リモートマネージャーからのルート CA 証明書を検証します。
リモートマネージャーは Secret 情報を使って、参加ノードが承認されているノードであることを確認します。
@z

@x
Each time a new node joins the swarm, the manager issues a certificate to the
node. The certificate contains a randomly generated node ID to identify the node
under the certificate common name (CN) and the role under the organizational
unit (OU). The node ID serves as the cryptographically secure node identity for
the lifetime of the node in the current swarm.
@y
{% comment %}
Each time a new node joins the swarm, the manager issues a certificate to the
node. The certificate contains a randomly generated node ID to identify the node
under the certificate common name (CN) and the role under the organizational
unit (OU). The node ID serves as the cryptographically secure node identity for
the lifetime of the node in the current swarm.
{% endcomment %}
新たなノードが Swarm に参加するたびに、マネージャーはノードに対して証明書を発行します。
その証明書には、ランダムに生成されたノード ID が含まれます。
このノード ID によって、証明書のコモンネーム（common name; CN）のもとでのノードと、組織名（organizational unit; OU）のもとでの役割が識別されます。
ノード ID は、現 Swarm 内においてこのノードが存在する間、暗号的に安全なノードとして機能します。
@z

@x
The diagram below illustrates how manager nodes and worker nodes encrypt
communications using a minimum of TLS 1.2.
@y
{% comment %}
The diagram below illustrates how manager nodes and worker nodes encrypt
communications using a minimum of TLS 1.2.
{% endcomment %}
以下の図は、マネージャーノードとワーカーノードが、最低限必要となる TLS 1.2 を用いて、通信を暗号化している様子を示しています。
@z

@x
![tls diagram](/engine/swarm/images/tls.png)
@y
{% comment %}
![tls diagram](/engine/swarm/images/tls.png)
{% endcomment %}
![TLS 図](../images/tls.png)
@z

@x
The example below shows the information from a certificate from a worker node:
@y
{% comment %}
The example below shows the information from a certificate from a worker node:
{% endcomment %}
以下の例では、ワーカーノード上の証明書の情報を示しています。
@z

@x
```none
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            3b:1c:06:91:73:fb:16:ff:69:c3:f7:a2:fe:96:c1:73:e2:80:97:3b
        Signature Algorithm: ecdsa-with-SHA256
        Issuer: CN=swarm-ca
        Validity
            Not Before: Aug 30 02:39:00 2016 GMT
            Not After : Nov 28 03:39:00 2016 GMT
        Subject: O=ec2adilxf4ngv7ev8fwsi61i7, OU=swarm-worker, CN=dw02poa4vqvzxi5c10gm4pq2g
...snip...
```
@y
{% comment %}
```none
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            3b:1c:06:91:73:fb:16:ff:69:c3:f7:a2:fe:96:c1:73:e2:80:97:3b
        Signature Algorithm: ecdsa-with-SHA256
        Issuer: CN=swarm-ca
        Validity
            Not Before: Aug 30 02:39:00 2016 GMT
            Not After : Nov 28 03:39:00 2016 GMT
        Subject: O=ec2adilxf4ngv7ev8fwsi61i7, OU=swarm-worker, CN=dw02poa4vqvzxi5c10gm4pq2g
...snip...
```
{% endcomment %}
```none
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number:
            3b:1c:06:91:73:fb:16:ff:69:c3:f7:a2:fe:96:c1:73:e2:80:97:3b
        Signature Algorithm: ecdsa-with-SHA256
        Issuer: CN=swarm-ca
        Validity
            Not Before: Aug 30 02:39:00 2016 GMT
            Not After : Nov 28 03:39:00 2016 GMT
        Subject: O=ec2adilxf4ngv7ev8fwsi61i7, OU=swarm-worker, CN=dw02poa4vqvzxi5c10gm4pq2g
...省略...
```
@z

@x
By default, each node in the swarm renews its certificate every three months.
You can configure this interval by running the `docker swarm update
--cert-expiry <TIME PERIOD>` command. The minimum rotation value is 1 hour.
Refer to the
[docker swarm update](../../reference/commandline/swarm_update.md) CLI
reference for details.
@y
{% comment %}
By default, each node in the swarm renews its certificate every three months.
You can configure this interval by running the `docker swarm update
--cert-expiry <TIME PERIOD>` command. The minimum rotation value is 1 hour.
Refer to the
[docker swarm update](../../reference/commandline/swarm_update.md) CLI
reference for details.
{% endcomment %}
デフォルトにおいて Swarm 内の各ノードの証明書は、3 ヶ月ごとに更新されます。
この期間は `docker swarm update --cert-expiry <期間>` コマンドを使って設定することができます。
ローテーションの最小値は 1 時間です。
詳しくは CLI リファレンスの [docker swarm update](../../reference/commandline/swarm_update.md) を参照してください。
@z

@x
## Rotating the CA certificate
@y
{% comment %}
## Rotating the CA certificate
{% endcomment %}
{: #rotating-the-ca-certificate }
## CA 証明書のローテート
@z

@x
In the event that a cluster CA key or a manager node is compromised, you can
rotate the swarm root CA so that none of the nodes trust certificates
signed by the old root CA anymore.
@y
{% comment %}
In the event that a cluster CA key or a manager node is compromised, you can
rotate the swarm root CA so that none of the nodes trust certificates
signed by the old root CA anymore.
{% endcomment %}
クラスターの CA 鍵やマネージャーノード自体においてセキュリティ侵害が発生した場合、Swarm のルート CA をローテートすることができます。
これによって古いルート CA により署名された証明書は、どのノードも信頼しないようにすることができます。
@z

@x
Run `docker swarm ca --rotate` to generate a new CA certificate and key. If you
prefer, you can pass the `--ca-cert` and `--external-ca` flags to specify the
root certificate and to use a root CA external to the swarm. Alternately,
you can pass the `--ca-cert` and `--ca-key` flags to specify the exact
certificate and key you would like the swarm to use.
@y
{% comment %}
Run `docker swarm ca --rotate` to generate a new CA certificate and key. If you
prefer, you can pass the `--ca-cert` and `--external-ca` flags to specify the
root certificate and to use a root CA external to the swarm. Alternately,
you can pass the `--ca-cert` and `--ca-key` flags to specify the exact
certificate and key you would like the swarm to use.
{% endcomment %}
`docker swarm ca --rotate` を実行すれば、新たな CA 証明書と鍵を生成することができます。
必要なら `--ca-cert` や `--external-ca` フラグを指定して、Swarm の外部にあるルート証明書やルート CA を設定することもできます。
これとは別に `--ca-cert` と `--ca-key` フラグを用いれば、Swarm で利用したい証明書と鍵を具体的に指定することもできます。
@z

@x
When you issue the `docker swarm ca --rotate` command, the following things
happen in sequence:
@y
{% comment %}
When you issue the `docker swarm ca --rotate` command, the following things
happen in sequence:
{% endcomment %}
`docker swarm ca --rotate` コマンドが実行されると、以下に示す内容が順に発生します。
@z

@x
1.  Docker generates a cross-signed certificate. This means that a version of
    the new root CA certificate is signed with the old root CA certificate.
    This cross-signed certificate is used as an intermediate certificate for all
    new node certificates. This ensures that nodes that still trust the old root
    CA can still validate a certificate signed by the new CA.
@y
{% comment %}
1.  Docker generates a cross-signed certificate. This means that a version of
    the new root CA certificate is signed with the old root CA certificate.
    This cross-signed certificate is used as an intermediate certificate for all
    new node certificates. This ensures that nodes that still trust the old root
    CA can still validate a certificate signed by the new CA.
{% endcomment %}
1.  Docker はクロス署名された証明書を生成します。
    これはつまり新たなルート CA 証明書が、古いルート CA 証明書によって署名されるということです。
    このクロス署名証明書は、新たなノードの証明書に対する中間証明書として利用されます。
    こうすることで、古いルート証明書を信頼するノードが、新たな CA によって署名された証明書も有効にできます。
@z

@x
2.  Docker also tells all nodes to immediately renew their TLS certificates.
    This process may take several minutes, depending on the number of nodes in
    the swarm.
@y
{% comment %}
2.  Docker also tells all nodes to immediately renew their TLS certificates.
    This process may take several minutes, depending on the number of nodes in
    the swarm.
{% endcomment %}
2.  Docker は全ノードに対して TLS 証明書をすぐに更新するように指示することになりました。
    この処理は Swarm 内のノード数に応じて数分程度かかります。
@z

@x
3.  After every node in the swarm has a new TLS certificate signed by the new CA,
    Docker forgets about the old CA certificate and key material, and tells
    all the nodes to trust the new CA certificate only.
@y
{% comment %}
3.  After every node in the swarm has a new TLS certificate signed by the new CA,
    Docker forgets about the old CA certificate and key material, and tells
    all the nodes to trust the new CA certificate only.
{% endcomment %}
3.  Swarm 内のノードがすべて、新たな CA によって署名された新たな TLS 証明書を受け取った後は、Docker は古い CA 証明書や鍵に関することは一切忘れます。
    そしてノードに対しては、新たな CA 証明書だけを信頼するように指示を出します。
@z

@x
    This also causes a change in the swarm's join tokens. The previous
    join tokens are no longer valid.
@y
    {% comment %}
    This also causes a change in the swarm's join tokens. The previous
    join tokens are no longer valid.
    {% endcomment %}
    その際には Swarm への参加時のトークンも変更されます。
    それまでの参加時のトークンはこれ以降は無効になります。
@z

@x
From this point on, all new node certificates issued are signed with the new
root CA, and do not contain any intermediates.
@y
{% comment %}
From this point on, all new node certificates issued are signed with the new
root CA, and do not contain any intermediates.
{% endcomment %}
これ以降、新たなノードに発行される証明書は、新たなルート CA によって署名されます。
中間証明書が含まれることはありません。
@z

@x
## Learn More
@y
{% comment %}
## Learn more
{% endcomment %}
{: #learn-more }
## さらに詳しく
@z

@x
* Read about how [nodes](nodes.md) work.
* Learn how swarm mode [services](services.md) work.
@y
{% comment %}
* Read about how [nodes](nodes.md) work.
* Learn how swarm mode [services](services.md) work.
{% endcomment %}
* [ノード](nodes.md) の動作について。
* Swarm モードの [サービス](services.md) の動作について。
@z
