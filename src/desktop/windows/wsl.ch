%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Docker Desktop WSL 2 backend
keywords: WSL, WSL 2 Tech Preview, Windows Subsystem for Linux, WSL 2 backend Docker
redirect_from:
- /docker-for-windows/wsl/
- /docker-for-windows/wsl-tech-preview/
title: Docker Desktop WSL 2 backend
toc_min: 2
toc_max: 3
---
@y
---
description: Docker Desktop WSL 2 backend
keywords: WSL, WSL 2 Tech Preview, Windows Subsystem for Linux, WSL 2 backend Docker
redirect_from:
- /docker-for-windows/wsl/
- /docker-for-windows/wsl-tech-preview/
title: Docker Desktop WSL 2 バックエンド
toc_min: 2
toc_max: 3
---
@z

@x
Windows Subsystem for Linux (WSL) 2 introduces a significant architectural change as it is a full Linux kernel built by Microsoft, allowing Linux containers to run natively without emulation. With Docker Desktop running on WSL 2, users can leverage Linux workspaces and avoid having to maintain both Linux and Windows build scripts. In addition, WSL 2 provides improvements to file system sharing, boot time, and allows access to some cool new features for Docker Desktop users.
@y
Windows Subsystem for Linux (WSL) 2 は、Microsoft がビルドした完全な Linux カーネルを導入する、画期的な構造変化をもたらします。
これにより Linux コンテナーはエミュレーションとしてではなく、ネイティブな実行が可能になります。
WSL 2 上において Docker Desktop を実行すれば、Linux ワークスペースの活用が可能となり、Linux と Windows の双方に対するビルドスクリプトを準備する必要はなくなります。
また WSL 2 では、ファイルシステム共有や起動時間に関する改善がなされていて、Docker Desktop ユーザーにとって、優れた機能を利用できるものになりました。
@z

@x
Docker Desktop uses the dynamic memory allocation feature in WSL 2 to greatly improve the resource consumption. This means, Docker Desktop only uses the required amount of CPU and memory resources it needs, while enabling CPU and memory-intensive tasks such as building a container to run much faster.
@y
Docker Desktop では WSL 2 内の動的メモリ割り当て機能を活用して、リソース消費を劇的に改善しています。
つまり Docker Desktop は、求められている CPU やメモリリソースだけを利用するようになったということです。
そしてコンテナーをビルドする処理のように、CPU やメモリへの負荷が高いタスクは、より速く処理実行できます。
@z

@x
Additionally, with WSL 2, the time required to start a Docker daemon after a cold start is significantly faster. It takes less than 10 seconds to start the Docker daemon when compared to almost a minute in the previous version of Docker Desktop.
@y
さらに、コールドスタート後の Docker デーモン起動にかかる時間は、かなり速くなります。
Docker デーもの起動時間は、従来の Docker Desktop ではおよそ 1 分は要していたものが、今は 10 秒以下に抑えられています。
@z

@x
## Prerequisites
@y
{: #prerequisites }
## 前提条件
@z

@x
Before you install the Docker Desktop WSL 2 backend, you must complete the following steps:
@y
Docker Desktop WSL 2 バックエンドをインストールするにあたっては、事前に以下の手順を行っておく必要があります。
@z

@x
1. Install Windows 10, version 1903 or higher or Windows 11.
2. Enable WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel).
@y
1. Windows 10、バージョン 2004 またはそれ以上、あるいは Windows 11 をインストールします。
2. Windows 上において WSL 2 機能を有効にします。
   詳しい手順については [Microsoft のドキュメント](https://docs.microsoft.com/en-us/windows/wsl/install-win10) を参照してください。
3. [Linux カーネル更新プログラムパッケージ](https://docs.microsoft.com/windows/wsl/wsl2-kernel) をダウンロードしてインストールします。
@z

@x
## Best practices
@y
{: #best-practices }
## ベストプラクティス
@z

@x
- To get the best out of the file system performance when bind-mounting files, we recommend storing source code and other data that is bind-mounted into Linux containers (i.e., with `docker run -v <host-path>:<container-path>`) in the Linux file system, rather than the Windows file system. You can also refer to the [recommendation](https://docs.microsoft.com/en-us/windows/wsl/compare-versions){:target="_blank" rel="noopener" class="_"} from Microsoft.
@y
- バインドマウント利用時のファイルシステム性能を最大化するには、以下を行います。
  なおバインドマウントされたソースコードや関連データは、Windows ファイルシステムではない Linux ファイルシステムを有する Linux コンテナーに（たとえば`docker run -v <host-path>:<container-path>`を使って）保存することをお勧めします。
  また Microsoft 社の [recommendation](https://docs.microsoft.com/en-us/windows/wsl/compare-versions){:target="_blank" rel="noopener" class="_"} も参照してください。
@z

@x
  - Linux containers only receive file change events ("inotify events") if the
      original files are stored in the Linux filesystem. For example, some web development workflows rely on inotify events for automatic reloading when files have changed.
  - Performance is much higher when files are bind-mounted from the Linux
      filesystem, rather than remoted from the Windows host. Therefore avoid
      `docker run -v /mnt/c/users:/users` (where `/mnt/c` is mounted from Windows).
  - Instead, from a Linux shell use a command like `docker run -v ~/my-project:/sources <my-image>`
      where `~` is expanded by the Linux shell to `$HOME`.
- If you have concerns about the size of the docker-desktop-data VHDX, or need to change it, take a look at the [WSL tooling built into Windows](https://docs.microsoft.com/en-us/windows/wsl/wsl2-ux-changes#understanding-wsl-2-uses-a-vhd-and-what-to-do-if-you-reach-its-max-size).
- If you have concerns about CPU or memory usage, you can configure limits on the memory, CPU, Swap size allocated to the [WSL 2 utility VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig).
- To avoid any potential conflicts with using WSL 2 on Docker Desktop, you must [uninstall any previous versions of Docker Engine](../../engine/install/ubuntu.md#uninstall-docker-engine) and CLI installed directly through Linux distributions before installing Docker Desktop.
@y
  - 元のファイルを Linux ファイルシステムに保存しているのであれば、Linux コンテナーはファイル変更のイベント（「inotify」イベント）のみを受けつけるようにしてください。
    たとえばウェブ開発のワークフローにおいては、ファイル変更が発生した際に自動リロードを行う inotify イベントを用いる場合があります。
  - Windows ホストからリモート接続する場合に比べて、Linux ファイルシステムからバインドマウントされたファイルにアクセスする方が、性能ははるかに向上します。
    したがって`docker run -v /mnt/c/users:/users`（ここで`/mnt/c`は Windows からのマウント）とすることは避けてください。
  - 上のかわりに Linux シェルから`docker run -v ~/my-project:/sources <my-image>`のようなコマンドを実行してください。
    ここで`~`は Linux シェルが`$HOME`に展開することを表わします。
- Docker Desktop のデータ VHDX の容量が気になったり、変更を必要とする場合は、[WSL tooling built into Windows](https://docs.microsoft.com/en-us/windows/wsl/wsl2-ux-changes#understanding-wsl-2-uses-a-vhd-and-what-to-do-if-you-reach-its-max-size) を確認してください。
- CPU や メモリの使用量について気にかける必要がある場合は [WSL 2 ユーティリティー VM](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig) に割り当てられているメモリ、CPU、スワップサイズの制限を設定することができます。
- Docker Desktop 上での WSL 2 利用において、衝突のリスクを避けるには、[Docker Engine の古いバージョンのアンインストール](../../engine/install/ubuntu.md#uninstall-docker-engine) を行い、Docker Desktop のインストール前に Linux ディストリビューションに対して CLI を直接インストールするようにしてください。
@z

@x
## Download
@y
{: #download }
## ダウンロード
@z

@x
Download [Docker Desktop Stable 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) or a later release.
@y
[Docker Desktop 安定版 2.3.0.2](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) またはこれよりも最新版をダウンロードします。
@z

@x
## Install
@y
{: #install }
## インストール
@z

@x
Ensure you have completed the steps described in the Prerequisites section **before** installing the Docker Desktop Stable 2.3.0.2 release.
@y
Docker Desktop 安定版 2.3.0.2 をインストールする **前に**、上の前提条件の節に示した各手順をすべて終えていることを確認してください。
@z

@x
1. Follow the usual installation instructions to install Docker Desktop. If you are running a supported system, Docker Desktop prompts you to enable WSL 2 during installation. Read the information displayed on the screen and enable WSL 2 to continue.
2. Start Docker Desktop from the Windows Start menu.
3. From the Docker menu, select **Settings** > **General**.
@y
1. Docker Desktop のインストールは、通常のインストール手順に従います。
   サポートされているシステム上では、Docker Desktop のインストールの際に WSL 2 を有効にするかどうかが尋ねられます。
   画面上に示される説明をよく読み、WSL 2 を有効化した上で操作を続けます。
2. Windows スタートメニューから Docker Desktop を起動します。
3. Docker メニューから **Settings** > **General** を実行します。
@z

@x
    ![Enable WSL 2](images/wsl2-enable.png){:width="750px"}
@y
    ![WSL 2 の有効化](images/wsl2-enable.png){:width="750px"}
@z

@x
4. Select the **Use WSL 2 based engine** check box.
@y
4. チェックボックス **Use WSL 2 based engine** を選択します。
@z

@x
    If you have installed Docker Desktop on a system that supports WSL 2, this option will be enabled by default.
@y
    WSL 2 をサポートするシステム上に Docker Desktop をインストールした場合、このオプションはデフォルトで有効になっています。
@z

@x
5. Click **Apply & Restart**.
6. Ensure the distribution runs in WSL 2 mode. WSL can run distributions in both v1 or v2 mode.
@y
5. **Apply & Restart** をクリックします。
6. ディストリビューションが WSL 2 モードで動作していることを確認します。
   WSL が実行されるモードには v1 モードと v2 モードがあります。
@z

@x
    To check the WSL mode, run:
@y
    WSL モードを確認するには以下を実行します。
@z

@x
     `wsl.exe -l -v`
@y
     `wsl.exe -l -v`
@z

@x
    To upgrade your existing Linux distro to v2, run:
@y
    現在の Linux ディストリビューションを v2 にアップグレードするには、以下を実行します。
@z

@x
    `wsl.exe --set-version (distro name) 2`
@y
    `wsl.exe --set-version (ディストリビューション名) 2`
@z

@x
    To set v2 as the default version for future installations, run:
@y
    今後のインストールを考慮して、デフォルトバージョンを v2 に設定しておくには、以下を実行します。
@z

@x
    `wsl.exe --set-default-version 2`
@y
    `wsl.exe --set-default-version 2`
@z

@x
7. When Docker Desktop restarts, go to **Settings** > **Resources** > **WSL Integration**.
@y
7. Docker Desktop が再起動したら、**Settings** > **Resources** > **WSL Integration** を実行します。
@z

@x
    The Docker-WSL integration will be enabled on your default WSL distribution. To change your default WSL distro, run `wsl --set-default <distro name>`.
@y
    Docker-WSL 統合環境が、デフォルトの WSL ディストリビューション上において有効になります。
    デフォルトの WSL ディストリビューションを変更するには`wsl --set-default <ディストリビューション名>`を実行します。
@z

@x
    For example, to set Ubuntu as your default WSL distro, run `wsl --set-default ubuntu`.
@y
    たとえばデフォルトの WSL ディストリビューションとして Ubuntu を設定する場合は`wsl --set-default ubuntu`を実行します。
@z

@x
    Optionally, select any additional distributions you would like to enable the Docker-WSL integration on.
@y
    他に Docker-WSL 統合環境を有効にしたいディストリビューションがあれば、その設定を行います。
@z

@x
    > **Note**
    >
    > The Docker-WSL integration components running in your distro depend on glibc. This can cause issues when running musl-based distros such as Alpine Linux. Alpine users can use the [alpine-pkg-glibc](https://github.com/sgerrand/alpine-pkg-glibc){:target="_blank" rel="noopener" class="_"} package to deploy glibc alongside musl to run the integration.
@y
    > **メモ**
    >
    > ディストリビューション内で稼働する Docker-WSL 統合環境は glibc に依存しています。
    > したがって Alpine Linux のような musl ベースのディストリビューションを動作させる場合には、問題が発生することがあります。
    > Alpine ユーザーが統合環境を動作させる際には [alpine-pkg-glibc(https://github.com/sgerrand/alpine-pkg-glibc){:target="_blank" rel="noopener" class="_"} パッケージを導入し、musl に合わせた glibc を用いることが必要かもしれません。
@z

@x
    ![WSL 2 Choose Linux distro](images/wsl2-choose-distro.png)
@y
    ![WSL 2 による Linux ディストリビューションの決定](images/wsl2-choose-distro.png)
@z

@x
8. Click **Apply & Restart**.
@y
8. **Apply & Restart** をクリックします。
@z

@x
## Develop with Docker and WSL 2
@y
## Docker と WSL 2 を用いた開発
@z

@x
The following section describes how to start developing your applications using Docker and WSL 2. We recommend that you have your code in your default Linux distribution for the best development experience using Docker and WSL 2. After you have enabled WSL 2 on Docker Desktop, you can start working with your code inside the Linux distro and ideally with your IDE still in Windows. This workflow can be pretty straightforward if you are using [VSCode](https://code.visualstudio.com/download).
@y
以下の節では、Docker と WSL 2 を利用したアプリケーション開発方法について説明します。
Docker と WSL 2 を利用して開発作業を進めていく際には、開発コードをデフォルトの Linux ディストリビューション内に配置して進めていくことが最適です。
Docker Desktop において WSL 2 を有効にしていれば、その Linux ディストリビューション内のソースコードでありながら、理想的に Windows 上の IDE の中で作業し続けることができます。
このような作業を進めるには [VSCode](https://code.visualstudio.com/download) を用いるのが最も自然な方法です。
@z

@x
1. Open VSCode and install the [Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) extension. This extension allows you to work with a remote server in the Linux distro and your IDE client still on Windows.
2. Now, you can start working in VSCode remotely. To do this, open your terminal and type:
@y
1. VSCode を開いて [リモート WSL 拡張機能](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) をインストールします。
   この拡張機能は、Linux ディストリビューション内のリモートサーバーで作業をしつつ IDE クライアントは Windows のままとするものです。
2. そこで VSCode 内においてリモートに対する作業を開始します。
   これを行うにはターミナル画面を開いて以下を入力します。
@z

@x
    `wsl`
@y
    `wsl`
@z

@x
    `code .`
@y
    `code .`
@z

@x
    This opens a new VSCode connected remotely to your default Linux distro which you can check in the bottom corner of the screen.
@y
    この操作によって、デフォルト Linux ディストリビューションに対してリモート接続された新たな VSCode が開きます。
    画面下段からこのことが確認できます。
@z

@x
    Alternatively, you can type the name of your default Linux distro in your Start menu, open it, and then run `code` .
@y
    別の方法として、スタートメニューからデフォルト Linux ディストリビューション名を入力してこれを開き、その後に`code`を実行する方法もあります。
@z

@x
3. When you are in VSCode, you can use the terminal in VSCode to pull your code and start working natively from your Windows machine.
@y
3. VSCode 内では VSCode のターミナル画面を使うことができます。
   これによってソースコードをプルし、Windows マシン内からネイティブ環境のように作業を進めていくことができます。
@z

@x
## GPU support
@y
{: #gpu-support }
## GPU サポート
@z

@x
Starting with Docker Desktop 3.1.0, Docker Desktop supports WSL 2 GPU Paravirtualization (GPU-PV) on NVIDIA GPUs. To enable WSL 2 GPU Paravirtualization, you need:
@y
Docker Desktop 3.1.0 から Docker Desktop は、NVIDIA GPU に対して WSL 2 GPU 準仮想化（GPU Paravirtualization; GPU-PV）をサポートするようになりました。
WSL 2 GPU 準仮想化を有効にするためには以下が必要です。
@z

@x
- A machine with an NVIDIA GPU
- The latest Windows Insider version from the Dev Preview ring
- [Beta drivers](https://developer.nvidia.com/cuda/wsl){:target="_blank" rel="noopener" class="_"} from NVIDIA supporting WSL 2 GPU Paravirtualization
- Update WSL 2 Linux kernel to the latest version using `wsl --update` from an elevated command prompt
- Make sure the WSL 2 backend is enabled in Docker Desktop
@y
- NVIDIA GPU を搭載するマシン。
- 開発プレビューリング（Dev Preview ring）から最新の Windows Insider 版。
- WSL 2 GPU 準仮想化をサポートする NVIDIA の [ベータドライバー](https://developer.nvidia.com/cuda/wsl){:target="_blank" rel="noopener" class="_"}。
- WSL 2 Linux カーネルの最新版への更新。
  昇格権限によるコマンドプロンプトから`wsl --update`を実行。
- Docker Desktop において WSL 2 バックエンドの有効化。
@z

@x
To validate that everything works as expected, run the following command to run a short benchmark on your GPU:
@y
システムが期待どおりに動作するかどうかを確認するには、以下のように GPU に対する簡単なベンチマークを確認するコマンドを実行します。
@z

@x
```console
$ docker run --rm -it --gpus=all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
        -fullscreen       (run n-body simulation in fullscreen mode)
        -fp64             (use double precision floating point values for simulation)
        -hostmem          (stores simulation data in host memory)
        -benchmark        (run benchmark to measure performance)
        -numbodies=<N>    (number of bodies (>= 1) to run in simulation)
        -device=<d>       (where d=0,1,2.... for the CUDA device to use)
        -numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
        -compare          (compares simulation results running once on the default GPU and once on the CPU)
        -cpu              (run n-body simulation on the CPU)
        -tipsy=<file.bin> (load a tipsy model file for simulation)
        
> NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.

> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
MapSMtoCores for SM 7.5 is undefined.  Default to use 64 Cores/SM
GPU Device 0: "GeForce RTX 2060 with Max-Q Design" with compute capability 7.5

> Compute 7.5 CUDA device: [GeForce RTX 2060 with Max-Q Design]
30720 bodies, total time for 10 iterations: 69.280 ms
= 136.219 billion interactions per second
= 2724.379 single-precision GFLOP/s at 20 flops per interaction
```
@y
```console
$ docker run --rm -it --gpus=all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
        -fullscreen       (run n-body simulation in fullscreen mode)
        -fp64             (use double precision floating point values for simulation)
        -hostmem          (stores simulation data in host memory)
        -benchmark        (run benchmark to measure performance)
        -numbodies=<N>    (number of bodies (>= 1) to run in simulation)
        -device=<d>       (where d=0,1,2.... for the CUDA device to use)
        -numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
        -compare          (compares simulation results running once on the default GPU and once on the CPU)
        -cpu              (run n-body simulation on the CPU)
        -tipsy=<file.bin> (load a tipsy model file for simulation)
        
> NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.

> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
MapSMtoCores for SM 7.5 is undefined.  Default to use 64 Cores/SM
GPU Device 0: "GeForce RTX 2060 with Max-Q Design" with compute capability 7.5

> Compute 7.5 CUDA device: [GeForce RTX 2060 with Max-Q Design]
30720 bodies, total time for 10 iterations: 69.280 ms
= 136.219 billion interactions per second
= 2724.379 single-precision GFLOP/s at 20 flops per interaction
```
@z

@x
## Feedback
@y
{: #feedback }
## フィードバック
@z

@x
Your feedback is very important to us. Please let us know your feedback by creating an issue in the [Docker Desktop for Windows GitHub](https://github.com/docker/for-win/issues) repository and adding the **WSL 2** label.
@y
みなさんからのフィードバックは大変重要です。
フィードバックをいただくには、Github レポジトリ [Docker Desktop for Windows](https://github.com/docker/for-win/issues) に issue をあげて、**WSL 2** というラベルをつけてください。
@z
