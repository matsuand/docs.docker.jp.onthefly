%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
title: "Sorry, we can't find that page"
permalink: /404.html
noratings: true
notoc: true
sitemap: false
skip_read_time: true
---
@y
---
title: "申し訳ありません。ページが見つかりません。"
permalink: /404.html
noratings: true
notoc: true
sitemap: false
skip_read_time: true
---
@z

@x
There might be a mistake in the URL or you might've clicked a link to content
that no longer exists. If you think it's the latter, please file an issue in
our [issue tracker on GitHub](https://github.com/docker/docker.github.io/issues/new)
and let us know what happened. Please also include a link to where the error
occurred, if applicable.
@y
URL の記述に誤りがあるか、あるいはクリックしたリンクの先が存在していなかった可能性があります。
後者に相当している場合は、[GitHub 上の issue トラッカー](https://github.com/docker/docker.github.io/issues/new) に issue をあげて、どんな状況が発生したかを教えてください。
そしてもしわかれば、エラーとなったときのリンクも含めて報告してください。
@z

@x
[**Click here to create a new ticket**](https://github.com/docker/docker.github.io/issues/new){:.newissue.button.primary-btn}
@y
[**新たなチケットはこちらをクリック**](https://github.com/matsuand/docs.docker.jp.onthefly/issues/new){:.newissue.button.primary-btn}
@z

@x
[![404 page not found](/images/404-docs.png)](https://docs.docker.com/ "Go to the homepage")
@y
[![404 page not found]({{ site.baseurl }}/images/404-docs.png)]({{site.url}}{{ site.baseurl }}/ "ホームページへ")
@z

@x
<script>
let el = document.querySelector("a.newissue");
if (el) {
    let url = new URL("https://github.com/docker/docker.github.io/issues/new");
    url.searchParams.set("title", "404 at " + window.location.pathname);
    let body = "I found a broken link : " + window.location.href;
    if (document.referrer !== "") {
        body += "\nI arrived on this page through: " + document.referrer
    }
    url.searchParams.set("body", body);
    el.setAttribute("href", url.toString());
}
</script>
@y
<script>
let el = document.querySelector("a.newissue");
if (el) {
    let url = new URL("https://github.com/matsuand/docs.docker.jp.onthefly/issues/new");
    url.searchParams.set("title", "404 at " + window.location.pathname);
    let body = "リンク切れを発見しました: " + window.location.href;
    if (document.referrer !== "") {
        body += "\n当ページは以下から参照しました: " + document.referrer
    }
    url.searchParams.set("body", body);
    el.setAttribute("href", url.toString());
}
</script>
@z
