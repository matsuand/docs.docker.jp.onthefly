%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<!-- This text will be included in the CLI plugin docs that are marked as experimental in Docker Enterprise 3.0 release -->
@y
<!-- This text will be included in the CLI plugin docs that are marked as experimental in Docker Enterprise 3.0 release -->
@z

@x
Experimental features provide early access to future product functionality.
These features are intended for testing and feedback only as they may change
between releases without warning or can be removed entirely from a future
release. Experimental features must not be used in production environments.
Docker does not offer support for experimental features.
@y
試験的な機能は、将来の製品に搭載される機能をいち早く試すことができるものです。
ただし現段階でのこの機能は、テストとフィードバックのためだけを意図しています。
したがってリリース時には予告なく変更される場合があり、将来のリリースでは完全に削除されることもあります。
試験的な機能は本番環境では利用しないでください。
Docker ではこの試験的機能に対するサポートは行っていません。
@z

@x
> To enable experimental features in the Docker CLI, edit the `config.json`
> file and set `experimental` to enabled.
@y
> Docker CLI において試験的機能を有効にするには、`config.json` ファイルを編集して `experimental` を有効に設定してください。
@z

@x
> To enable experimental features from the Docker Desktop menu, click
> **Settings** (**Preferences** on macOS) > **Command Line** and then turn on
> the **Enable experimental features** toggle. Click **Apply & Restart**.
{: .important }
@y
> Docker Desktop メニューから試験的機能を有効にするには、**Settings** (macOS の場合は **Preferences**) > **Command Line** をクリックし、**Enable experimental features** チェックを有効にします。
そして **Apply & Restart** をクリックしてください。
{: .important }
@z

@x
For a list of current experimental features in the Docker CLI, see [Docker CLI Experimental features](https://github.com/docker/cli/blob/master/experimental/README.md).
@y
Docker CLI における現時点での試験的機能については [Docker CLI 試験的機能](https://github.com/docker/cli/blob/master/experimental/README.md) の一覧を参照してください。
@z
