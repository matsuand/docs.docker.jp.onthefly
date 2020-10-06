%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-add-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-add-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-add-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-add-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-add %}
1.  Start the `ssh-agent` in the background using the command `eval "$(ssh-agent -s)"`. You get the agent process ID in return.
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-add-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-add-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-add-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-add-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-add %}
1.  Start the `ssh-agent` in the background using the command `eval "$(ssh-agent -s)"`. You get the agent process ID in return.
@z

@x
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@y
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@z

@x
2.  On macOS Sierra 10.12.2 or newer, modify your
`~/.ssh/config` file to automatically load keys into the `ssh-agent` and store
passphrases in your keychain.
@y
2.  On macOS Sierra 10.12.2 or newer, modify your
`~/.ssh/config` file to automatically load keys into the `ssh-agent` and store
passphrases in your keychain.
@z

@x
    ```none
    Host *
     AddKeysToAgent yes
     UseKeychain yes
     IdentityFile ~/.ssh/id_rsa
    ```
@y
    ```none
    Host *
     AddKeysToAgent yes
     UseKeychain yes
     IdentityFile ~/.ssh/id_rsa
    ```
@z

@x
3.  Add your SSH private key to the ssh-agent, using the default macOS `ssh-add` command.
@y
3.  Add your SSH private key to the ssh-agent, using the default macOS `ssh-add` command.
@z

@x
    ```none
    $ ssh-add -K ~/.ssh/id_rsa
    ```
@y
    ```none
    $ ssh-add -K ~/.ssh/id_rsa
    ```
@z

@x
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@y
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@z

@x
{% endcapture %}
{{ mac-content-add | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ mac-content-add | markdownify }}
<hr>
</div>
@z

@x
<div id="win-add-keys" class="tab-pane fade">
<br>
{% capture win-content-add %}
@y
<div id="win-add-keys" class="tab-pane fade">
<br>
{% capture win-content-add %}
@z

@x
1.  Start the `ssh-agent` in the background.
@y
1.  Start the `ssh-agent` in the background.
@z

@x
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@y
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@z

@x
2.  Add your SSH private key to the ssh-agent.
@y
2.  Add your SSH private key to the ssh-agent.
@z

@x
    ```none
    $ ssh-add ~/.ssh/id_rsa
    ```
@y
    ```none
    $ ssh-add ~/.ssh/id_rsa
    ```
@z

@x
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@y
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@z

@x
{% endcapture %}
{{ win-content-add | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ win-content-add | markdownify }}
<hr>
</div>
@z

@x
<div id="linux-add-keys" class="tab-pane fade">
<br>
{% capture linux-content-add %}
@y
<div id="linux-add-keys" class="tab-pane fade">
<br>
{% capture linux-content-add %}
@z

@x
1.  Start the `ssh-agent` in the background.
@y
1.  Start the `ssh-agent` in the background.
@z

@x
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@y
    ```none
    eval "$(ssh-agent -s)"
    Agent pid 59566
    ```
@z

@x
2.  Add your SSH private key to the ssh-agent.
@y
2.  Add your SSH private key to the ssh-agent.
@z

@x
    ```none
    $ ssh-add ~/.ssh/id_rsa
    ```
@y
    ```none
    $ ssh-add ~/.ssh/id_rsa
    ```
@z

@x
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@y
    If you created your key with a different name or have an existing key
    with  a different name, replace `id_rsa` in the command with the
    name of your private key file.
@z

@x
{% endcapture %}
{{ linux-content-add | markdownify }}
<hr>
</div>
</div>
@y
{% endcapture %}
{{ linux-content-add | markdownify }}
<hr>
</div>
</div>
@z
