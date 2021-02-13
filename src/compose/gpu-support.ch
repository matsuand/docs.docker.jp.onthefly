%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: GPU support in Compose
keywords: documentation, docs, docker, compose, GPU access, NVIDIA, samples
title: Enabling GPU access with Compose
---
@y
---
description: Compose における GPU サポート。
keywords: documentation, docs, docker, compose, GPU access, NVIDIA, samples
title: Compose における GPU アクセスの有効化
---
@z

@x
Compose services can define GPU device reservations if the Docker host contains such devices and the Docker Daemon is set accordingly. For this, make sure to install the [prerequisites](../_data/engine-cli/docker_run.yaml) if you have not already done so.
@y
Docker ホストに GPU デバイスがあり、これに合わせて Docker デーモンを適切に設定していれば、Compose サービスにおいて GPU デバイスの予約設定を定義することができます。
その実現には [前提条件](../_data/engine-cli/docker_run.yaml) があるため、まだ実施していない場合は実施しておいてください。
@z

@x
The examples in the following sections focus specifically on providing service containers access to GPU devices with Docker Compose. You can use either `docker-compose` or `docker compose` commands.
@y
これ以降の節に示す利用例においては、Docker Compose を用いて GPU デバイスに接続するサービスコンテナーの構築方法に焦点を当てています。
コマンドは`docker-compose`と`docker compose`のどちらでも利用できます。
@z

@x
### Use of service `runtime` property from Compose v2.3 format (legacy)
@y
{: #use-of-service-runtime-property-from-compose-v23-format-legacy }
### Compose v2.3 フォーマットにおけるサービス`runtime`プロパティの利用（過去の手法）
@z

@x
Docker Compose v1.27.0+ switched to using the Compose Specification schema which is a combination of all properties from 2.x and 3.x versions. This re-enabled the use of service properties as [runtime](/compose-file/compose-file-v2.md#runtime) to provide GPU access to service containers. However, this does not allow to have control over specific properties of the GPU devices.
@y
Docker Compose v1.27.0 以降では、Compose Specification スキーマを利用するものとなりました。
これは 2.x と 3.x の両バージョンにおけるプロパティをすべて組み合わせたものです。
この利用によって、サービスプロパティは [runtime]({{ site.baseurl }}/compose-file/compose-file-v2.md#runtime) として利用可能となり、サービスコンテナーにおける GPU アクセスが実現できます。
ただしこの場合、GPU デバイスのすべてのプロパティを制御可能となるわけではありません。
@z

@x
```yaml
services:
  test:
    image: nvidia/cuda:10.2-base
    command: nvidia-smi
    runtime: nvidia

```
@y
```yaml
services:
  test:
    image: nvidia/cuda:10.2-base
    command: nvidia-smi
    runtime: nvidia

```
@z

@x
### Enabling GPU access to service containers
@y
{: #enabling-gpu-access-to-service-containers }
### サービスコンテナーにおける GPU アクセスの有効化
@z

@x
Docker Compose v1.28.0+ allows to define GPU reservations using the [device](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#devices) structure defined in the Compose Specification. This provides more granular control over a GPU reservation as custom values can be set for the following device properties: 
@y
Docker Compose v1.28.0 以降においては、Compose Specification にて定義される [device](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#devices) 構造を利用して GPU デバイスの予約定義が可能となります。
これによって以下に示すようなデバイスプロパティをカスタム設定できるため、GPU デバイス予約をきめ細かく制御できます。
@z

@x
- [capabilities](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#capabilities){:target="_blank" rel="noopener" class="_"} - value specifies as a list of strings (eg. `capabilities: [gpu]`). You must set this field in the Compose file. Otherwise, it returns an error on service deployment.
- [count](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#count){:target="_blank" rel="noopener" class="_"} - value specified as an int or the value `all` representing the number of GPU devices that should be reserved ( providing the host holds that number of GPUs).
- [device_ids](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#device_ids){:target="_blank" rel="noopener" class="_"} - value specified as a list of strings representing GPU device IDs from the host. You can find the device ID in the output of `nvidia-smi` on the host.
- [driver](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#driver){:target="_blank" rel="noopener" class="_"} - value specified as a string (eg. `driver: 'nvidia'`)
- [options](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#options){:target="_blank" rel="noopener" class="_"} - key-value pairs representing driver specific options.
@y
- [capabilities](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#capabilities){:target="_blank" rel="noopener" class="_"} - 値として文字列リストを指定します。
  （たとえば`capabilities: [gpu]`）
  Compose ファイル内でこのフィールドの設定が必須です。
  これを行わないと、サービスデプロイ時にエラーが発生します。
- [count](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#count){:target="_blank" rel="noopener" class="_"} - 値として整数値か、あるいは`all`を指定します。
  予約を行う GPU デバイスの数を表します。
  （ホストにはそれだけの数の GPU が存在しているものとします。）
- [device_ids](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#device_ids){:target="_blank" rel="noopener" class="_"} - 値として文字列リストを指定します。
  ホスト上での GPU デバイス ID を表します。
  この ID 値は、ホスト上において`nvidia-smi`を実行した出力結果から確認することができます。
- [driver](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#driver){:target="_blank" rel="noopener" class="_"} - 値として文字列を指定します。
  （たとえば`driver: 'nvidia'`）
- [options](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#options){:target="_blank" rel="noopener" class="_"} - ドライバーに固有のオプションをキーバリューペアで指定します。
@z

@x
> **Note**
>
> You must set the `capabilities` field. Otherwise, it returns an error on service deployment.
>
> `count` and `device_ids` are mutually exclusive. You must only define one field at a time.
@y
> **メモ**
>
> フィールド`capabilities`は必ず設定しなければなりません。
> これを行わないと、サービスデプロイ時にエラーが発生します。
>
> フィールド`count`と`device_ids`は排他的なものです。
> 一度に定義できるのは 1 つだけです。
@z

@x
For more information on these properties, see the `deploy` section in the [Compose Specification](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#devices){:target="_blank" rel="noopener" class="_"}.
@y
上のプロパティに関する詳細については [Compose Specification](https://github.com/compose-spec/compose-spec/blob/master/deploy.md#devices){:target="_blank" rel="noopener" class="_"} の`deploy`の節を参照してください。
@z

@x
Example of a Compose file for running a service with access to 1 GPU device:
@y
以下に示す Compose ファイルは、GPU デバイスを 1 つ利用してサービスを起動する利用例です。
@z

@x
```yaml
services:
  test:
    image: nvidia/cuda:10.2-base
    command: nvidia-smi
    deploy:
      resources:
        reservations:
          devices:
          - driver: nvidia
            count: 1
            capabilities: [gpu, utility]
```
@y
```yaml
services:
  test:
    image: nvidia/cuda:10.2-base
    command: nvidia-smi
    deploy:
      resources:
        reservations:
          devices:
          - driver: nvidia
            count: 1
            capabilities: [gpu, utility]
```
@z

@x
Run with Docker Compose:
@y
Docker Compose によってこれを実行します。
@z

@x
```sh
$ docker-compose up
Creating network "gpu_default" with the default driver
Creating gpu_test_1 ... done
Attaching to gpu_test_1    
test_1  | +-----------------------------------------------------------------------------+
test_1  | | NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.1     |
test_1  | |-------------------------------+----------------------+----------------------+
test_1  | | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
test_1  | | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
test_1  | |                               |                      |               MIG M. |
test_1  | |===============================+======================+======================|
test_1  | |   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
test_1  | | N/A   23C    P8     9W /  70W |      0MiB / 15109MiB |      0%      Default |
test_1  | |                               |                      |                  N/A |
test_1  | +-------------------------------+----------------------+----------------------+
test_1  |                                                                                
test_1  | +-----------------------------------------------------------------------------+
test_1  | | Processes:                                                                  |
test_1  | |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
test_1  | |        ID   ID                                                   Usage      |
test_1  | |=============================================================================|
test_1  | |  No running processes found                                                 |
test_1  | +-----------------------------------------------------------------------------+
gpu_test_1 exited with code 0

```
@y
```sh
$ docker-compose up
Creating network "gpu_default" with the default driver
Creating gpu_test_1 ... done
Attaching to gpu_test_1    
test_1  | +-----------------------------------------------------------------------------+
test_1  | | NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.1     |
test_1  | |-------------------------------+----------------------+----------------------+
test_1  | | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
test_1  | | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
test_1  | |                               |                      |               MIG M. |
test_1  | |===============================+======================+======================|
test_1  | |   0  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
test_1  | | N/A   23C    P8     9W /  70W |      0MiB / 15109MiB |      0%      Default |
test_1  | |                               |                      |                  N/A |
test_1  | +-------------------------------+----------------------+----------------------+
test_1  |                                                                                
test_1  | +-----------------------------------------------------------------------------+
test_1  | | Processes:                                                                  |
test_1  | |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
test_1  | |        ID   ID                                                   Usage      |
test_1  | |=============================================================================|
test_1  | |  No running processes found                                                 |
test_1  | +-----------------------------------------------------------------------------+
gpu_test_1 exited with code 0

```
@z

@x
If no `count` or `device_ids` are set, all GPUs available on the host are going to be used by default.
@y
`count`または`device_ids`が設定されていない場合は、デフォルトとしてホスト上にある GPU すべてが利用されることになります。
@z

@x
```yaml
services:
  test:
    image: tensorflow/tensorflow:latest-gpu
    command: python -c "import tensorflow as tf;tf.test.gpu_device_name()"
    deploy:
      resources:
        reservations:
          devices:
          - capabilities: [gpu]
```
```sh
$ docker-compose up
Creating network "gpu_default" with the default driver
Creating gpu_test_1 ... done
Attaching to gpu_test_1
test_1  | I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcudart.so.10.1
.....
test_1  | I tensorflow/core/common_runtime/gpu/gpu_device.cc:1402]
Created TensorFlow device (/device:GPU:0 with 13970 MB memory) -> physical GPU (device: 0, name: Tesla T4, pci bus id: 0000:00:1e.0, compute capability: 7.5)
test_1  | /device:GPU:0
gpu_test_1 exited with code 0
```
@y
```yaml
services:
  test:
    image: tensorflow/tensorflow:latest-gpu
    command: python -c "import tensorflow as tf;tf.test.gpu_device_name()"
    deploy:
      resources:
        reservations:
          devices:
          - capabilities: [gpu]
```
```sh
$ docker-compose up
Creating network "gpu_default" with the default driver
Creating gpu_test_1 ... done
Attaching to gpu_test_1
test_1  | I tensorflow/stream_executor/platform/default/dso_loader.cc:48] Successfully opened dynamic library libcudart.so.10.1
.....
test_1  | I tensorflow/core/common_runtime/gpu/gpu_device.cc:1402]
Created TensorFlow device (/device:GPU:0 with 13970 MB memory) -> physical GPU (device: 0, name: Tesla T4, pci bus id: 0000:00:1e.0, compute capability: 7.5)
test_1  | /device:GPU:0
gpu_test_1 exited with code 0
```
@z

@x
On machines hosting multiple GPUs, `device_ids` field can be set to target specific GPU devices and `count` can be used to limit the number of GPU devices assigned to a service container. If `count` exceeds the number of available GPUs on the host, the deployment will error out.
@y
GPU を複数持つホストにおいては、`device_ids`フィールドを使って対象とする GPU デバイスを指定できます。
またサービスコンテナーに割り当てる GPU デバイス数を`count`により制限することができます。
`count`の設定値がホスト上の実際の GPU 数を超えている場合、デプロイ時にエラーが発生します。
@z

@x
```
$ nvidia-smi   
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1B.0 Off |                    0 |
| N/A   72C    P8    12W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  Tesla T4            On   | 00000000:00:1C.0 Off |                    0 |
| N/A   67C    P8    11W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   2  Tesla T4            On   | 00000000:00:1D.0 Off |                    0 |
| N/A   74C    P8    12W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   3  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   62C    P8    11W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
```
@y
```
$ nvidia-smi   
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 450.80.02    Driver Version: 450.80.02    CUDA Version: 11.0     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  Tesla T4            On   | 00000000:00:1B.0 Off |                    0 |
| N/A   72C    P8    12W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   1  Tesla T4            On   | 00000000:00:1C.0 Off |                    0 |
| N/A   67C    P8    11W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   2  Tesla T4            On   | 00000000:00:1D.0 Off |                    0 |
| N/A   74C    P8    12W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
|   3  Tesla T4            On   | 00000000:00:1E.0 Off |                    0 |
| N/A   62C    P8    11W /  70W |      0MiB / 15109MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
```
@z

@x
To enable access only to GPU-0 and GPU-3 devices:
@y
GPU-0 と GPU-3 の 2 つのデバイスのみアクセスするには、以下のようにします。
@z

@x
```yaml
services:
  test:
    image: tensorflow/tensorflow:latest-gpu
    command: python -c "import tensorflow as tf;tf.test.gpu_device_name()"
    deploy:
      resources:
        reservations:
          devices:
          - driver: nvidia
            device_ids: ['0', '3']
            capabilities: [gpu]

```
@y
```yaml
services:
  test:
    image: tensorflow/tensorflow:latest-gpu
    command: python -c "import tensorflow as tf;tf.test.gpu_device_name()"
    deploy:
      resources:
        reservations:
          devices:
          - driver: nvidia
            device_ids: ['0', '3']
            capabilities: [gpu]

```
@z

@x
```sh
$ docker-compose up
...
Created TensorFlow device (/device:GPU:0 with 13970 MB memory -> physical GPU (device: 0, name: Tesla T4, pci bus id: 0000:00:1b.0, compute capability: 7.5)
...
Created TensorFlow device (/device:GPU:1 with 13970 MB memory) -> physical GPU (device: 1, name: Tesla T4, pci bus id: 0000:00:1e.0, compute capability: 7.5)
...
gpu_test_1 exited with code 0
```
@y
```sh
$ docker-compose up
...
Created TensorFlow device (/device:GPU:0 with 13970 MB memory -> physical GPU (device: 0, name: Tesla T4, pci bus id: 0000:00:1b.0, compute capability: 7.5)
...
Created TensorFlow device (/device:GPU:1 with 13970 MB memory) -> physical GPU (device: 1, name: Tesla T4, pci bus id: 0000:00:1e.0, compute capability: 7.5)
...
gpu_test_1 exited with code 0
```
@z
