%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-key-gen" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-key-gen" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-key-gen" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-key-gen" class="tab-pane fade in active">
<br>
{% capture mac-content-gen %}
1.  Open a command-line terminal.
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-key-gen" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-key-gen" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-key-gen" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-key-gen" class="tab-pane fade in active">
<br>
{% capture mac-content-gen %}
1.  Open a command-line terminal.
@z

@x
2.  Paste the text below, substituting in your GitHub email address.
@y
2.  Paste the text below, substituting in your GitHub email address.
@z

@x
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@y
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@z

@x
    This creates a new SSH key, using the provided email as a label.
@y
    This creates a new SSH key, using the provided email as a label.
@z

@x
    ```none
    Generating public/private rsa key pair.
    ```
@y
    ```none
    Generating public/private rsa key pair.
    ```
@z

@x
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@y
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@z

@x
    ```none
    Enter a file in which to save the key (/Users/you/.ssh/id_rsa):
    ```
@y
    ```none
    Enter a file in which to save the key (/Users/you/.ssh/id_rsa):
    ```
@z

@x
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@y
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@z

@x
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ mac-content-gen | markdownify }}
<hr>
</div>
@y
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ mac-content-gen | markdownify }}
<hr>
</div>
@z

@x
<div id="win-key-gen" class="tab-pane fade">
<br>
{% capture win-content-gen %}
1.  Open Git Bash.
@y
<div id="win-key-gen" class="tab-pane fade">
<br>
{% capture win-content-gen %}
1.  Open Git Bash.
@z

@x
2.  Paste the text below, substituting in your GitHub email address.
@y
2.  Paste the text below, substituting in your GitHub email address.
@z

@x
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@y
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@z

@x
    This creates a new SSH key, using the provided email as a label.
@y
    This creates a new SSH key, using the provided email as a label.
@z

@x
    ```none
    Generating public/private rsa key pair.
    ```
@y
    ```none
    Generating public/private rsa key pair.
    ```
@z

@x
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@y
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@z

@x
    ```none
    Enter a file in which to save the key (c/Users/you/.ssh/id_rsa):
    ```
@y
    ```none
    Enter a file in which to save the key (c/Users/you/.ssh/id_rsa):
    ```
@z

@x
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@y
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@z

@x
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ win-content-gen | markdownify }}
<hr>
</div>
@y
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ win-content-gen | markdownify }}
<hr>
</div>
@z

@x
<div id="linux-key-gen" class="tab-pane fade">
<br>
{% capture linux-content-gen %}
1.  Open a command-line terminal.
@y
<div id="linux-key-gen" class="tab-pane fade">
<br>
{% capture linux-content-gen %}
1.  Open a command-line terminal.
@z

@x
2.  Paste the text below, substituting in your GitHub email address.
@y
2.  Paste the text below, substituting in your GitHub email address.
@z

@x
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@y
    ```none
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
    ```
@z

@x
    This creates a new SSH key, using the provided email as a label.
@y
    This creates a new SSH key, using the provided email as a label.
@z

@x
    ```none
    Generating public/private rsa key pair.
    ```
@y
    ```none
    Generating public/private rsa key pair.
    ```
@z

@x
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@y
3.  When prompted with "Enter a file in which to save the key", press the Return key (Enter) to accept the default location.
@z

@x
    ```none
    Enter a file in which to save the key (/home/you/.ssh/id_rsa):
    ```
@y
    ```none
    Enter a file in which to save the key (/home/you/.ssh/id_rsa):
    ```
@z

@x
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@y
4.  At the prompt, type a secure passphrase, and re-enter as prompted.
@z

@x
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ linux-content-gen | markdownify }}
<hr>
</div>
</div>
@y
    ```none
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    ```
{% endcapture %}
{{ linux-content-gen | markdownify }}
<hr>
</div>
</div>
@z
