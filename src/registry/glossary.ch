%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
published: false
---
@y
---
published: false
---
@z

@x
# Glossary
@y
# Glossary
@z

@x
This page contains definitions for distribution related terms.
@y
This page contains definitions for distribution related terms.
@z

@x
<dl>
	<dt id="blob"><h4>Blob</h4></dt>
	<dd>
      <blockquote>A blob is any kind of content that is stored by a Registry under a content-addressable identifier (a "digest").</blockquote>
      <p>
      	<a href="#layer">Layers</a> are a good example of "blobs".
      </p>
	</dd>
@y
<dl>
	<dt id="blob"><h4>Blob</h4></dt>
	<dd>
      <blockquote>A blob is any kind of content that is stored by a Registry under a content-addressable identifier (a "digest").</blockquote>
      <p>
      	<a href="#layer">Layers</a> are a good example of "blobs".
      </p>
	</dd>
@z

@x
	<dt id="image"><h4>Image</h4></dt>
	<dd>
      <blockquote>An image is a named set of immutable data from which a Docker container can be created.</blockquote>
      <p>
      An image is represented by a json file called a <a href="#manifest">manifest</a>, and is conceptually a set of <a href="#layer">layers</a>.
@y
	<dt id="image"><h4>Image</h4></dt>
	<dd>
      <blockquote>An image is a named set of immutable data from which a Docker container can be created.</blockquote>
      <p>
      An image is represented by a json file called a <a href="#manifest">manifest</a>, and is conceptually a set of <a href="#layer">layers</a>.
@z

@x
      Image names indicate the location where they can be pulled from and pushed to, as they usually start with a <a href="#registry">registry</a> domain name and port.
@y
      Image names indicate the location where they can be pulled from and pushed to, as they usually start with a <a href="#registry">registry</a> domain name and port.
@z

@x
      </p>
    </dd>
@y
      </p>
    </dd>
@z

@x
	<dt id="layer"><h4>Layer</h4></dt>
	<dd>
	<blockquote>A layer is a tar archive bundling partial content from a filesystem.</blockquote>
	<p>
	Layers from an <a href="#image">image</a> are usually extracted in order on top of each other to make up a root filesystem from which containers run out.
	</p>
	</dd>
@y
	<dt id="layer"><h4>Layer</h4></dt>
	<dd>
	<blockquote>A layer is a tar archive bundling partial content from a filesystem.</blockquote>
	<p>
	Layers from an <a href="#image">image</a> are usually extracted in order on top of each other to make up a root filesystem from which containers run out.
	</p>
	</dd>
@z

@x
	<dt id="manifest"><h4>Manifest</h4></dt>
	<dd><blockquote>A manifest is the JSON representation of an image.</blockquote></dd>
@y
	<dt id="manifest"><h4>Manifest</h4></dt>
	<dd><blockquote>A manifest is the JSON representation of an image.</blockquote></dd>
@z

@x
	<dt id="namespace"><h4>Namespace</h4></dt>
	<dd><blockquote>A namespace is a collection of repositories with a common name prefix.</blockquote>
	<p>
	The namespace with an empty prefix is considered the Global Namespace.
	</p>
	</dd>
@y
	<dt id="namespace"><h4>Namespace</h4></dt>
	<dd><blockquote>A namespace is a collection of repositories with a common name prefix.</blockquote>
	<p>
	The namespace with an empty prefix is considered the Global Namespace.
	</p>
	</dd>
@z

@x
	<dt id="registry"><h4>Registry</h4></dt>
	<dd><blockquote>A registry is a service that let you store and deliver <a href="#images">images</a>.</blockquote>
	</dd>
@y
	<dt id="registry"><h4>Registry</h4></dt>
	<dd><blockquote>A registry is a service that let you store and deliver <a href="#images">images</a>.</blockquote>
	</dd>
@z

@x
	<dt id="registry"><h4>Repository</h4></dt>
	<dd>
	<blockquote>A repository is a set of data containing all versions of a given image.</blockquote>
	</dd>
@y
	<dt id="registry"><h4>Repository</h4></dt>
	<dd>
	<blockquote>A repository is a set of data containing all versions of a given image.</blockquote>
	</dd>
@z

@x
	<dt id="scope"><h4>Scope</h4></dt>
	<dd><blockquote>A scope is the portion of a namespace onto which a given authorization token is granted.</blockquote></dd>
@y
	<dt id="scope"><h4>Scope</h4></dt>
	<dd><blockquote>A scope is the portion of a namespace onto which a given authorization token is granted.</blockquote></dd>
@z

@x
	<dt id="tag"><h4>Tag</h4></dt>
	<dd><blockquote>A tag is conceptually a "version" of a <a href="#image">named image</a>.</blockquote>
	<p>
	Example: `docker pull myimage:latest` instructs docker to pull the image "myimage" in version "latest".
	</p>
@y
	<dt id="tag"><h4>Tag</h4></dt>
	<dd><blockquote>A tag is conceptually a "version" of a <a href="#image">named image</a>.</blockquote>
	<p>
	Example: `docker pull myimage:latest` instructs docker to pull the image "myimage" in version "latest".
	</p>
@z

@x
	</dd>
@y
	</dd>
@z

@x
</dl>
@y
</dl>
@z
