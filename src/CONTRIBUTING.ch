%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
## Contributing
@y
## 貢献
@z

@x
We value your documentation contributions, and we want to make it as easy
as possible to work in this repository. One of the first things to decide is
which branch to base your work on. If you get confused, just ask and we will
help. If a reviewer realizes you have based your work on the wrong branch, we'll
let you know so that you can rebase it.
@y
ドキュメント生成に貢献して頂ける方を歓迎します。そこで、このリポジトリ内での作業を、できるだけやりやすくしたいと思っています。まずはじめに取り決めて頂きたいことは、どのブランチに基づいて作業を進めるかです。よく分からない場合は、聞いて頂ければお答えします。あなたが誤ったブランチに基づいて作業していることにレビューアーが気づいたら、リベースして頂くようにお伝えします。
@z

@x
>**Note**: To contribute code to Docker projects, see the
[Contribution guidelines](/opensource/index.md).
@y
>**メモ**: Docker プロジェクトへコード提供をする場合は、[貢献のためのガイドライン](/opensource/index.md) を参照してください。
@z

@x
### Quickstart
@y
### クィックスタート
@z

@x
If you spot a problem while reading the documentation and want to try to fix it
yourself, click the **Edit this page** link at the bottom of that page. The
page will open in the Github editor, which means you don't need to know a lot
about Git, or even about Markdown.
@y
ドキュメントを読んでいて何か問題を見つけ、それをご自身で直したいと思った場合は、各ページの下の方にある **Edit this page** リンクをクリックしてください。Github エディターのページが開きます。Git についてあるいはマークダウンについて、あまり知識がなくても進められます。
@z

@x
When you save, you will be prompted to create a fork if you don't already have
one, and to create a branch in your fork and submit the pull request. We hope
you give it a try!
@y
保存の際に、まだフォークしていなかったら、フォークを生成するかどうかを聞かれます。フォークを生成すれば、そのフォーク内にブランチを生成します。是非、試してみてください。
@z

@x
### Overall doc improvements
@y
### 全体的なドキュメントの改善
@z

@x
Most commits will be made against the `master` branch. This includes:
@y
コミットはたいていは `master` ブランチに対して行います。このブランチでは以下を行います。
@z

@x
- Conceptual and task-based information not specific to new features
- Restructuring / rewriting
- Doc bug fixing
- Typos and grammar errors
@y
- 新機能には特定されない概念的あるいはタスクベースの情報
- 再構成、再記述
- 文章のバグフィックス
- タイポや文法エラー
@z

@x
One quirk of this project is that the `master` branch is where the live docs are
published from, so upcoming features can't be documented there. See
[Specific new features for a project](#specific-new-features-for-a-project)
for how to document upcoming features. These feature branches will be periodically
merged with `master`, so don't worry about fixing typos and documentation bugs
there.
@y
このプロジェクトの慣わしとして、`master`ブランチは公開用の最新ドキュメントを取り扱います。したがって開発中の新機能に関してはここで文書化はされません。新機能の文書化がどのように行われるかは、[各プロジェクトにおける特定の新機能](#specific-new-features-for-a-project)を参照してください。新機能に関するブランチは定期的に `master` にマージされます。このためタイポやバグに関してはあまり気にしないでください。
@z

@x
>Do you enjoy creating graphics? Good graphics are key to great documentation,
and we especially value contributions in this area.
@y
>グラフィックを作成するのはお好きですか？ 良質のグラフィックは優れたドキュメントを作り出すための重要な要素です。グラフィックに関する貢献も特に歓迎します。
@z

@x
## Collaborate on a pull request
@y
## プルリクエストでの共同作業
@z

@x
Unless the PR author specifically disables it, you can push commits into another
contributor's PR. You can do it from the command line by adding and fetching
their remote, checking out their branch, and adding commits to it. Even easier,
you can add commits from the Github web UI, by clicking the pencil icon for a
given file in the **Files** view.
@y
プルリクエストを行っている他の貢献者が特に設定をしていない限り、その貢献者に対してコミットをプルすることができます。コマンドラインから追加やリモートのフェッチ、ブランチからのチェックアウト、コメントの追加などを行います。もっと簡単に Github ウェブ画面からコミットすることもできます。これを行うには**File**画面に表示されたファイルに対応した鉛筆アイコンをクリックします。
@z

@x
If a PR consists of multiple small addendum commits on top of a more significant
one, the commit will usually be "squash-merged", so that only one commit is
merged in. On occasion this is not appropriate and all commits will be kept
separate when merging.
@y
プルリクエストが行っている重要なコミットに対して、小さな追加のコミットがいくつか加わっていることがあります。このようなコミットは通常は「squashマージ」が行われ、1 つのコミットとしてマージされます。これが不適当である場合には、マージの際に個別にコミットが行われる場合もあります。
@z

@x
## Pull request guidelines
@y
## プルリクエストのガイドライン
@z

@x
Help us review your PRs more quickly by following these guidelines.
@y
プルリクエストのレビューを迅速に行えるように、以下のガイドラインに従ってください。
@z

@x
- Try not to touch a large number of files in a single PR if possible.
@y
- 一つのプルリクエストにて多数のファイルを対象として含めることは、できるだけやめてください。
@z

@x
- Don't change whitespace or line wrapping in parts of a file you are not
  editing for other reasons. Make sure your text editor is not configured to
  automatically reformat the whole file when saving.
@y
- 編集対象にしていないのに、理由もなく空白や改行文字を変更することはやめてください。利用しているテキストエディターが、ファイル保存の際にファイル全体の書式を自動変更するような設定にはなっていないことを確認してください。
@z

@x
- A Netlify test runs for each PR that is against one of our long-lived
  branches like `master` and the `vnext` branches, and deploys the result of
  your PR to a staging site. The URL will be available at the bottom of the PR
  in the **Conversation** view. Check the staging site for problems and fix them
  if necessary. Reviewers will check the staging site too.
@y
- 長期に運用している`master`や`vnext`といったブランチにおけるプルリクエストには Netlify によるテストが実行されます。そしてプルリクエストの結果はステージングサイトにデプロイされます。その URL は、プルリクエストの**Conversation**画面の下部に示されています。ステージングサイトを確認し問題がないかどうか、もし必要なら修正を行ってください。レビューアーもステージングサイトを確認してください。
@z

@x
If you can think of other ways we could streamline the review process, let us
know.
@y
レビュー方法に関して改善すべき方法があればお伝えください。
@z

@x
## Style guide
@y
## スタイルガイド
@z

@x
Docker does not currently maintain a style guide. Use your best judgment, and
try to follow the example set by the existing documentation.
@y
Docker では現在、スタイルガイドをメンテナンスしていません。適宜の判断をお願いします。また既存のドキュメントを例として従ってください。
@z
