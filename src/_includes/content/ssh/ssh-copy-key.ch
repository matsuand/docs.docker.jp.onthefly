%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-copy-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-copy-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-copy-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-copy-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-copy %}
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-copy-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-copy-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-copy-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-copy-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-copy %}
@z

@x
Copy the public SSH key to your clipboard.
@y
Copy the public SSH key to your clipboard.
@z

@x
```none
$ pbcopy < ~/.ssh/id_rsa.pub
```
@y
```none
$ pbcopy < ~/.ssh/id_rsa.pub
```
@z

@x
If your SSH key file has a different name than the example code, modify the
filename to match your current setup.
@y
If your SSH key file has a different name than the example code, modify the
filename to match your current setup.
@z

@x
>**Tip:** If you don't have `pbcopy`, you navigate to the hidden `.ssh`
folder, open the file in a text editor, and copy it to your clipboard.
For example: `$ atom ~/.ssh/id_rsa.pub`
@y
>**Tip:** If you don't have `pbcopy`, you navigate to the hidden `.ssh`
folder, open the file in a text editor, and copy it to your clipboard.
For example: `$ atom ~/.ssh/id_rsa.pub`
@z

@x
{% endcapture %}
{{ mac-content-copy | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ mac-content-copy | markdownify }}
<hr>
</div>
@z

@x
<div id="win-copy-keys" class="tab-pane fade">
<br>
{% capture win-content-copy %}
@y
<div id="win-copy-keys" class="tab-pane fade">
<br>
{% capture win-content-copy %}
@z

@x
Copy the public SSH key to your clipboard.
@y
Copy the public SSH key to your clipboard.
@z

@x
```none
$ clip < ~/.ssh/id_rsa.pub
```
@y
```none
$ clip < ~/.ssh/id_rsa.pub
```
@z

@x
If your SSH key file has a different name than the example code, modify the
filename to match your current setup.
@y
If your SSH key file has a different name than the example code, modify the
filename to match your current setup.
@z

@x
>**Tip:** If `clip` doesn't work, navigate the hidden `.ssh`
folder, open the file in a text editor, and copy it to your clipboard.
For example: `$ notepad ~/.ssh/id_rsa.pub`
@y
>**Tip:** If `clip` doesn't work, navigate the hidden `.ssh`
folder, open the file in a text editor, and copy it to your clipboard.
For example: `$ notepad ~/.ssh/id_rsa.pub`
@z

@x
{% endcapture %}
{{ win-content-copy | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ win-content-copy | markdownify }}
<hr>
</div>
@z

@x
<div id="linux-copy-keys" class="tab-pane fade">
<br>
{% capture linux-content-copy %}
@y
<div id="linux-copy-keys" class="tab-pane fade">
<br>
{% capture linux-content-copy %}
@z

@x
If you don't already have it, install `xclip`. (The example uses `apt-get` to install, but you might want to use another package installer like `yum`.)
@y
If you don't already have it, install `xclip`. (The example uses `apt-get` to install, but you might want to use another package installer like `yum`.)
@z

@x
```none
$ sudo apt-get install xclip
```
@y
```none
$ sudo apt-get install xclip
```
@z

@x
Copy the SSH key to your clipboard.
@y
Copy the SSH key to your clipboard.
@z

@x
```none
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```
@y
```none
$ xclip -sel clip < ~/.ssh/id_rsa.pub
```
@z

@x
>**Tip:** If you `xclip` isn't working, navigate to hidden `.ssh` folder,
open the file in a text editor, and copy it to your clipboard.
For example: `$ vi ~/.ssh/id_rsa.pub`
@y
>**Tip:** If you `xclip` isn't working, navigate to hidden `.ssh` folder,
open the file in a text editor, and copy it to your clipboard.
For example: `$ vi ~/.ssh/id_rsa.pub`
@z

@x
{% endcapture %}
{{ linux-content-copy | markdownify }}
<hr>
</div>
</div>
@y
{% endcapture %}
{{ linux-content-copy | markdownify }}
<hr>
</div>
</div>
@z
