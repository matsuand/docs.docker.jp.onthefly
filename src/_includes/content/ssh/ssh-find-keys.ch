%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-find-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-find-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-find-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-find-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-find %}
@y
<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" data-target="#mac-find-keys" data-group="mac">Mac</a></li>
  <li><a data-toggle="tab" data-target="#win-find-keys" data-group="win">Windows</a></li>
  <li><a data-toggle="tab" data-target="#linux-find-keys" data-group="linux">Linux</a></li>
</ul>
<div class="tab-content">
<div id="mac-find-keys" class="tab-pane fade in active">
<br>
{% capture mac-content-find %}
@z

@x
1.  Open a command-line terminal.
@y
1.  Open a command-line terminal.
@z

@x
    ```none
    $ ls -al ~/.ssh
    ```
@y
    ```none
    $ ls -al ~/.ssh
    ```
@z

@x
    This lists files in your `.ssh` directory.
@y
    This lists files in your `.ssh` directory.
@z

@x
2.  Check to see if you already have a SSH keys you can use.
@y
2.  Check to see if you already have a SSH keys you can use.
@z

@x
    Default file names for public keys are:
@y
    Default file names for public keys are:
@z

@x
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@y
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@z

@x
    Here are example results showing a public and private key pair with the default names:
@y
    Here are example results showing a public and private key pair with the default names:
@z

@x
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@y
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@z

@x
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@y
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@z

@x
{% endcapture %}
{{ mac-content-find | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ mac-content-find | markdownify }}
<hr>
</div>
@z

@x
<div id="win-find-keys" class="tab-pane fade">
<br>
{% capture win-content-find %}
@y
<div id="win-find-keys" class="tab-pane fade">
<br>
{% capture win-content-find %}
@z

@x
1.  Open Git Bash.
@y
1.  Open Git Bash.
@z

@x
    ```none
    $ ls -al ~/.ssh
    ```
@y
    ```none
    $ ls -al ~/.ssh
    ```
@z

@x
    This lists files in your `.ssh` directory.
@y
    This lists files in your `.ssh` directory.
@z

@x
2.  Check to see if you already have SSH keys you can use.
@y
2.  Check to see if you already have SSH keys you can use.
@z

@x
    Default file names for public keys are:
@y
    Default file names for public keys are:
@z

@x
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@y
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@z

@x
    Here are example results showing a public and private key pair with the default names:
@y
    Here are example results showing a public and private key pair with the default names:
@z

@x
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@y
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@z

@x
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@y
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@z

@x
{% endcapture %}
{{ win-content-find | markdownify }}
<hr>
</div>
@y
{% endcapture %}
{{ win-content-find | markdownify }}
<hr>
</div>
@z

@x
<div id="linux-find-keys" class="tab-pane fade">
<br>
{% capture linux-content-find %}
@y
<div id="linux-find-keys" class="tab-pane fade">
<br>
{% capture linux-content-find %}
@z

@x
1.  Open a command-line terminal.
@y
1.  Open a command-line terminal.
@z

@x
    ```none
    $ ls -al ~/.ssh
    ```
@y
    ```none
    $ ls -al ~/.ssh
    ```
@z

@x
    This lists files in your `.ssh` directory.
@y
    This lists files in your `.ssh` directory.
@z

@x
2.  Check to see if you already have a SSH keys you can use.
@y
2.  Check to see if you already have a SSH keys you can use.
@z

@x
    Default file names for public keys are:
@y
    Default file names for public keys are:
@z

@x
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@y
    * id_dsa.pub
    * id_ecdsa.pub
    * id_ed25519.pub
    * id_rsa.pub
@z

@x
    Here are example results showing a public and private key pair with the default names:
@y
    Here are example results showing a public and private key pair with the default names:
@z

@x
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@y
    ```none
    drwx------   8 me  staff   272 Mar 27 14:04 .
    drwxr-xr-x+ 69 me  staff  2346 Apr  7 10:03 ..
    -rw-r--r--   1 me  staff   420 Mar 27 14:04 config
    -rw-------   1 me  staff  3326 Mar 27 14:01 id_rsa
    -rw-r--r--   1 me  staff   752 Mar 27 14:01 id_rsa.pub
    ```
@z

@x
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@y
    The file `id_rsa` contains the private key which resides on the local machine, and `id_rsa.pub` is the public key we can provide to a remote account.
@z

@x
{% endcapture %}
{{ linux-content-find | markdownify }}
<hr>
</div>
</div>
@y
{% endcapture %}
{{ linux-content-find | markdownify }}
<hr>
</div>
</div>
@z
