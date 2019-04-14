var glossary = [

{
"term": "amd64",
"def": "<p>AMD64 is AMD’s 64-bit extension of Intel’s x86 architecture, and is also\nreferred to as x86_64 (or x86-64).</p>\n"
},

{
"term": "aufs",
"def": "<p>aufs (advanced multi layered unification filesystem) is a Linux <a href=\"/glossary/?term=filesystem\">filesystem</a> that\nDocker supports as a storage backend. It implements the\n<a href=\"http://en.wikipedia.org/wiki/Union_mount\">union mount</a> for Linux file systems.</p>\n"
},

{
"term": "base image",
"def": "<p>An image that has no parent is a <strong>base image</strong>.</p>\n"
},

{
"term": "boot2docker",
"def": "<p><a href=\"http://boot2docker.io/\">boot2docker</a> is a lightweight Linux distribution made\nspecifically to run Docker containers. The boot2docker management tool for Mac\nand Windows was deprecated and replaced by <a href=\"/glossary/?term=machine\"><code class=\"highlighter-rouge\">docker-machine</code></a> which\nyou can install with the Docker Toolbox.</p>\n"
},

{
"term": "btrfs",
"def": "<p>btrfs (B-tree file system) is a Linux <a href=\"/glossary/?term=filesystem\">filesystem</a> that Docker\nsupports as a storage backend. It is a <a href=\"http://en.wikipedia.org/wiki/Copy-on-write\">copy-on-write</a>\nfilesystem.</p>\n"
},

{
"term": "build",
"def": "<p>build is the process of building Docker images using a <a href=\"/glossary/?term=dockerfile\">Dockerfile</a>.\nThe build uses a Dockerfile and a “context”. The context is the set of files in the\ndirectory in which the image is built.</p>\n"
},

{
"term": "cgroups",
"def": "<p>cgroups is a Linux kernel feature that limits, accounts for, and isolates\nthe resource usage (CPU, memory, disk I/O, network, etc.) of a collection\nof processes. Docker relies on cgroups to control and isolate resource limits.</p>\n\n<p><em>Also known as : control groups</em></p>\n"
},

{
"term": "collection",
"def": "<p>A collection is a group of swarm resources that Docker EE uses for role-based\naccess control. Collections enable organizing permissions for resources like\nnodes, services, containers, volumes, networks, and secrets. <a href=\"/datacenter/ucp/2.2/guides/access-control/manage-access-with-collections/\">Learn how to manage collections</a>.</p>\n"
},

{
"term": "Compose",
"def": "<p><a href=\"https://github.com/docker/compose\">Compose</a> is a tool for defining and\nrunning complex applications with Docker. With Compose, you define a\nmulti-container application in a single file, then spin your\napplication up in a single command which does everything that needs to\nbe done to get it running.</p>\n\n<p><em>Also known as : docker-compose, fig</em></p>\n"
},

{
"term": "copy-on-write",
"def": "<p>Docker uses a\n<a href=\"/engine/userguide/storagedriver/imagesandcontainers/#/the-copy-on-write-strategy\">copy-on-write</a>\ntechnique and a <a href=\"/glossary/?term=union file system\">union file system</a> for both images and\ncontainers to optimize resources and speed performance. Multiple copies of an\nentity share the same instance and each one makes only specific changes to its\nunique layer.</p>\n\n<p>Multiple containers can share access to the same image, and make\ncontainer-specific changes on a writable layer which is deleted when\nthe container is removed. This speeds up container start times and performance.</p>\n\n<p>Images are essentially layers of filesystems typically predicated on a base\nimage under a writable layer, and built up with layers of differences from the\nbase image. This minimizes the footprint of the image and enables shared\ndevelopment.</p>\n\n<p>For more about copy-on-write in the context of Docker, see <a href=\"/engine/userguide/storagedriver/imagesandcontainers/\">Understand images,\ncontainers, and storage\ndrivers</a>.</p>\n"
},

{
"term": "container",
"def": "<p>A container is a runtime instance of a <a href=\"/glossary/?term=image\">docker image</a>.</p>\n\n<p>A Docker container consists of</p>\n\n<ul>\n  <li>A Docker image</li>\n  <li>An execution environment</li>\n  <li>A standard set of instructions</li>\n</ul>\n\n<p>The concept is borrowed from Shipping Containers, which define a standard to ship\ngoods globally. Docker defines a standard to ship software.</p>\n"
},

{
"term": "Docker",
"def": "<p>The term Docker can refer to</p>\n\n<ul>\n  <li>The Docker project as a whole, which is a platform for developers and sysadmins to\ndevelop, ship, and run applications</li>\n  <li>The docker daemon process running on the host which manages images and containers\n(also called Docker Engine)</li>\n</ul>\n"
},

{
"term": "Docker Enterprise Edition",
"def": "<p>Docker Enterprise Edition (Docker EE) is a platform to build, ship, and run\ncontainerized applications, that you can deploy in the cloud or on-premise. It\nincludes a tested and certified version of Docker, web UIs for managing\nyour app resources, and support.</p>\n"
},

{
"term": "Docker Desktop for Mac",
"def": "<p><a href=\"/docker-for-mac/\">Docker Desktop for Mac</a> is an easy-to-install, lightweight\nDocker development environment designed specifically for the Mac. A native\nMac application, Docker Desktop for Mac uses the macOS Hypervisor\nframework, networking, and filesystem. It’s the best solution if you want\nto build, debug, test, package, and ship Dockerized applications on a\nMac. Docker Desktop for Mac supersedes <a href=\"/glossary/?term=toolbox\">Docker Toolbox</a> as\nstate-of-the-art Docker on macOS.</p>\n"
},

{
"term": "Docker Desktop for Windows",
"def": "<p><a href=\"/docker-for-windows/\">Docker Desktop for Windows</a> is an\neasy-to-install, lightweight Docker development environment designed\nspecifically for Windows 10 systems that support Microsoft Hyper-V\n(Professional, Enterprise and Education). Docker Desktop for Windows uses Hyper-V for\nvirtualization, and runs as a native Windows app. It works with Windows Server\n2016, and gives you the ability to set up and run Windows containers as well as\nthe standard Linux containers, with an option to switch between the two. Docker\nfor Windows is the best solution if you want to build, debug, test, package, and\nship Dockerized applications from Windows machines. Docker Desktop for Windows\nsupersedes <a href=\"/glossary/?term=toolbox\">Docker Toolbox</a> as state-of-the-art Docker on Windows.</p>\n"
},

{
"term": "Docker Hub",
"def": "<p>The <a href=\"https://hub.docker.com/\">Docker Hub</a> is a centralized resource for working with\nDocker and its components. It provides the following services:</p>\n\n<ul>\n  <li>Docker image hosting</li>\n  <li>User authentication</li>\n  <li>Automated image builds and work-flow tools such as build triggers and web hooks</li>\n  <li>Integration with GitHub and Bitbucket</li>\n</ul>\n"
},

{
"term": "Dockerfile",
"def": "<p>A Dockerfile is a text document that contains all the commands you would\nnormally execute manually in order to build a Docker image. Docker can\nbuild images automatically by reading the instructions from a Dockerfile.</p>\n"
},

{
"term": "ENTRYPOINT",
"def": "<p>In a Dockerfile, an <code class=\"highlighter-rouge\">ENTRYPOINT</code> is an optional definition for the first part\nof the command to be run. If you want your Dockerfile to be runnable without\nspecifying additional arguments to the <code class=\"highlighter-rouge\">docker run</code> command, you must specify\neither <code class=\"highlighter-rouge\">ENTRYPOINT</code>, <code class=\"highlighter-rouge\">CMD</code>, or both.</p>\n\n<ul>\n  <li>\n    <p>If <code class=\"highlighter-rouge\">ENTRYPOINT</code> is specified, it is set to a single command. Most official\nDocker images have an <code class=\"highlighter-rouge\">ENTRYPOINT</code> of <code class=\"highlighter-rouge\">/bin/sh</code> or <code class=\"highlighter-rouge\">/bin/bash</code>. Even if you\ndo not specify <code class=\"highlighter-rouge\">ENTRYPOINT</code>, you may inherit it from the base image that you\nspecify using the <code class=\"highlighter-rouge\">FROM</code> keyword in your Dockerfile. To override the\n<code class=\"highlighter-rouge\">ENTRYPOINT</code> at runtime, you can use <code class=\"highlighter-rouge\">--entrypoint</code>. The following example\noverrides the entrypoint to be <code class=\"highlighter-rouge\">/bin/ls</code> and sets the <code class=\"highlighter-rouge\">CMD</code> to <code class=\"highlighter-rouge\">-l /tmp</code>.</p>\n\n    <div class=\"language-bash highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code><span class=\"nv\">$ </span>docker run <span class=\"nt\">--entrypoint</span><span class=\"o\">=</span>/bin/ls ubuntu <span class=\"nt\">-l</span> /tmp\n</code></pre></div>    </div>\n  </li>\n  <li>\n    <p><code class=\"highlighter-rouge\">CMD</code> is appended to the <code class=\"highlighter-rouge\">ENTRYPOINT</code>. The <code class=\"highlighter-rouge\">CMD</code> can be any arbitrary string\nthat is valid in terms of the <code class=\"highlighter-rouge\">ENTRYPOINT</code>, which allows you to pass\nmultiple commands or flags at once. To override the <code class=\"highlighter-rouge\">CMD</code> at runtime, just\nadd it after the container name or ID. In the following example, the <code class=\"highlighter-rouge\">CMD</code>\nis overridden to be <code class=\"highlighter-rouge\">/bin/ls -l /tmp</code>.</p>\n\n    <div class=\"language-bash highlighter-rouge\"><div class=\"highlight\"><pre class=\"highlight\"><code><span class=\"nv\">$ </span>docker run ubuntu /bin/ls <span class=\"nt\">-l</span> /tmp\n</code></pre></div>    </div>\n  </li>\n</ul>\n\n<p>In practice, <code class=\"highlighter-rouge\">ENTRYPOINT</code> is not often overridden. However, specifying the\n<code class=\"highlighter-rouge\">ENTRYPOINT</code> can make your images more flexible and easier to reuse.</p>\n"
},

{
"term": "filesystem",
"def": "<p>A file system is the method an operating system uses to name files\nand assign them locations for efficient storage and retrieval.</p>\n\n<p>Examples :</p>\n\n<ul>\n  <li>Linux : ext4, aufs, btrfs, zfs</li>\n  <li>Windows : NTFS</li>\n  <li>macOS : HFS+</li>\n</ul>\n"
},

{
"term": "grant",
"def": "<p>A grant enables role-based access control for managing how users and\norganizations access Docker EE swarm resources. A grant is made up of a\nsubject, a role, and a collection. For more about grants and role-based access\ncontrol, see <a href=\"/datacenter/ucp/2.2/guides/access-control/grant-permissions/\">Grant permissions to users based on roles</a>.</p>\n"
},

{
"term": "image",
"def": "<p>Docker images are the basis of <a href=\"/glossary/?term=container\">containers</a>. An Image is an\nordered collection of root filesystem changes and the corresponding\nexecution parameters for use within a container runtime. An image typically\ncontains a union of layered filesystems stacked on top of each other. An image\ndoes not have state and it never changes.</p>\n"
},

{
"term": "Kitematic",
"def": "<p>A legacy GUI, bundled with <a href=\"/glossary/?term=toolbox\">Docker Toolbox</a>, for managing Docker\ncontainers. We recommend upgrading to <a href=\"/glossary/?term=docker for Mac\">Docker Desktop for Mac</a> or\n<a href=\"/glossary/?term=docker for Windows\">Docker Desktop for Windows</a>, which have superseded Kitematic.</p>\n"
},

{
"term": "layer",
"def": "<p>In an image, a layer is modification to the image, represented by an instruction in the\nDockerfile. Layers are applied in sequence to the base image to create the final image.\nWhen an image is updated or rebuilt, only layers that change need to be updated, and\nunchanged layers are cached locally. This is part of why Docker images are so fast\nand lightweight. The sizes of each layer add up to equal the size of the final image.</p>\n"
},

{
"term": "libcontainer",
"def": "<p>libcontainer provides a native Go implementation for creating containers with\nnamespaces, cgroups, capabilities, and filesystem access controls. It allows\nyou to manage the lifecycle of the container performing additional operations\nafter the container is created.</p>\n"
},

{
"term": "libnetwork",
"def": "<p>libnetwork provides a native Go implementation for creating and managing container\nnetwork namespaces and other network resources. It manages the networking lifecycle\nof the container performing additional operations after the container is created.</p>\n"
},

{
"term": "link",
"def": "<p>links provide a legacy interface to connect Docker containers running on the\nsame host to each other without exposing the hosts’ network ports. Use the\nDocker networks feature instead.</p>\n"
},

{
"term": "Machine",
"def": "<p><a href=\"https://github.com/docker/machine\">Machine</a> is a Docker tool which\nmakes it really easy to create Docker hosts on  your computer, on\ncloud providers and inside your own data center. It creates servers,\ninstalls Docker on them, then configures the Docker client to talk to them.</p>\n\n<p><em>Also known as : docker-machine</em></p>\n"
},

{
"term": "namespace",
"def": "<p>A <a href=\"http://man7.org/linux/man-pages/man7/namespaces.7.html\">Linux namespace</a>\nis a Linux kernel feature that isolates and virtualizes system resources. Processes which restricted to\na namespace can only interact with resources or processes that are part of the same namespace. Namespaces\nare an important part of Docker’s isolation model. Namespaces exist for each type of\nresource, including <code class=\"highlighter-rouge\">net</code> (networking), <code class=\"highlighter-rouge\">mnt</code> (storage), <code class=\"highlighter-rouge\">pid</code> (processes), <code class=\"highlighter-rouge\">uts</code> (hostname control),\nand <code class=\"highlighter-rouge\">user</code> (UID mapping). For more information about namespaces, see <a href=\"/engine/reference/run/\">Docker run reference</a>\nand <a href=\"https://success.docker.com/KBase/Introduction_to_User_Namespaces_in_Docker_Engine\">Introduction to user namespaces</a>.</p>\n"
},

{
"term": "node",
"def": "<p>A <a href=\"/engine/swarm/how-swarm-mode-works/nodes/\">node</a> is a physical or virtual\nmachine running an instance of the Docker Engine in swarm mode.</p>\n\n<p><strong>Manager nodes</strong> perform swarm management and orchestration duties. By default\nmanager nodes are also worker nodes.</p>\n\n<p><strong>Worker nodes</strong> execute tasks.</p>\n"
},

{
"term": "overlay network driver",
"def": "<p>Overlay network driver provides out of the box multi-host network connectivity\nfor docker containers in a cluster.</p>\n"
},

{
"term": "overlay storage driver",
"def": "<p>OverlayFS is a <a href=\"/glossary/?term=filesystem\">filesystem</a> service for Linux which implements a\n<a href=\"http://en.wikipedia.org/wiki/Union_mount\">union mount</a> for other file systems.\nIt is supported by the Docker daemon as a storage driver.</p>\n"
},

{
"term": "parent image",
"def": "<p>An image’s <strong>parent image</strong> is the image designated in the <code class=\"highlighter-rouge\">FROM</code> directive\nin the image’s Dockerfile. All subsequent commands are applied to this parent\nimage. A Dockerfile with no <code class=\"highlighter-rouge\">FROM</code> directive has no parent image, and is called\na <strong>base image</strong>.</p>\n"
},

{
"term": "registry",
"def": "<p>A Registry is a hosted service containing <a href=\"/glossary/?term=repository\">repositories</a> of <a href=\"/glossary/?term=image\">images</a>\nwhich responds to the Registry API.</p>\n\n<p>The default registry can be accessed using a browser at <a href=\"/glossary/?term=docker hub\">Docker Hub</a>\nor using the <code class=\"highlighter-rouge\">docker search</code> command.</p>\n"
},

{
"term": "repository",
"def": "<p>A repository is a set of Docker images. A repository can be shared by pushing it\nto a <a href=\"/glossary/?term=registry\">registry</a> server. The different images in the repository can be\nlabeled using <a href=\"/glossary/?term=tag\">tags</a>.</p>\n\n<p>Here is an example of the shared <a href=\"https://hub.docker.com/_/nginx/\">nginx repository</a>\nand its <a href=\"https://hub.docker.com/r/library/nginx/tags/\">tags</a>.</p>\n"
},

{
"term": "role",
"def": "<p>A role is a set of permitted API operations on a collection of Docker EE swarm\nresources. As part of a grant, a role is assigned to a subject (a user, team, or\norganization) and a collection. For more about roles, see <a href=\"/datacenter/ucp/2.2/guides/access-control/permission-levels/\">Roles and\npermission levels</a>.</p>\n"
},

{
"term": "role-based access control",
"def": "<p>Role-based access control enables managing how Docker EE users can access\nswarm resources. UCP administrators create grants to control how users access\nresource collections. A grant is made up of a subject, a role, and a collection.\nA grant defines who (subject) has how much access (role) to a set of resources\n(collection). For more about role-based access control, see\n<a href=\"/datacenter/ucp/2.2/guides/access-control/\">Authentication</a>.</p>\n"
},

{
"term": "SSH",
"def": "<p>SSH (secure shell) is a secure protocol for accessing remote machines and applications.\nIt provides authentication and encrypts data communication over insecure networks such\nas the Internet. SSH uses public/private key pairs to authenticate logins.</p>\n"
},

{
"term": "service",
"def": "<p>A <a href=\"/engine/swarm/how-swarm-mode-works/services/\">service</a> is the definition of how\nyou want to run your application containers in a swarm. At the most basic level\na service  defines which container image to run in the swarm and which commands\nto run in the container. For orchestration purposes, the service defines the\n“desired state”, meaning how many containers to run as tasks and constraints for\ndeploying the containers.</p>\n\n<p>Frequently a service is a microservice within the context of some larger\napplication. Examples of services might include an HTTP server, a database, or\nany other type of executable program that you wish to run in a distributed\nenvironment.</p>\n"
},

{
"term": "service discovery",
"def": "<p>Swarm mode <a href=\"/engine/swarm/networking/#use-swarm-mode-service-discovery\">service discovery</a> is a DNS component\ninternal to the swarm that automatically assigns each service on an overlay\nnetwork in the swarm a VIP and DNS entry. Containers on the network share DNS\nmappings for the service via gossip so any container on the network can access\nthe service via its service name.</p>\n\n<p>You don’t need to expose service-specific ports to make the service available to\nother services on the same overlay network. The swarm’s internal load balancer\nautomatically distributes requests to the service VIP among the active tasks.</p>\n"
},

{
"term": "subject",
"def": "<p>A subject represents a user, team, or organization in Docker EE. A subject is\ngranted a role for access to a collection of swarm resources.\nFor more about role-based access, see <a href=\"/datacenter/ucp/2.2/guides/access-control/\">Authentication</a>.</p>\n"
},

{
"term": "swarm",
"def": "<p>A <a href=\"/engine/swarm/\">swarm</a> is a cluster of one or more Docker Engines running in <a href=\"/glossary/?term=swarm mode\">swarm mode</a>.</p>\n"
},

{
"term": "Docker Swarm",
"def": "<p>Do not confuse <a href=\"https://github.com/docker/swarm\">Docker Swarm</a> with the <a href=\"/glossary/?term=swarm mode\">swarm mode</a> features in Docker Engine.</p>\n\n<p>Docker Swarm is the name of a standalone native clustering tool for Docker.\nDocker Swarm pools together several Docker hosts and exposes them as a single\nvirtual Docker host. It serves the standard Docker API, so any tool that already\nworks with Docker can now transparently scale up to multiple hosts.</p>\n\n<p><em>Also known as : docker-swarm</em></p>\n"
},

{
"term": "swarm mode",
"def": "<p><a href=\"/engine/swarm/\">Swarm mode</a> refers to cluster management and orchestration\nfeatures embedded in Docker Engine. When you initialize a new swarm (cluster) or\njoin nodes to a swarm, the Docker Engine runs in swarm mode.</p>\n"
},

{
"term": "tag",
"def": "<p>A tag is a label applied to a Docker image in a <a href=\"/glossary/?term=repository\">repository</a>.\nTags are how various images in a repository are distinguished from each other.</p>\n\n<p><em>Note : This label is not related to the key=value labels set for docker daemon.</em></p>\n"
},

{
"term": "task",
"def": "<p>A <a href=\"/engine/swarm/how-swarm-mode-works/services/#/tasks-and-scheduling\">task</a> is the\natomic unit of scheduling within a swarm. A task carries a Docker container and\nthe commands to run inside the container. Manager nodes assign tasks to worker\nnodes according to the number of replicas set in the service scale.</p>\n\n<p>The diagram below illustrates the relationship of services to tasks and\ncontainers.</p>\n\n<p><img src=\"/engine/swarm/images/services-diagram.png\" alt=\"services diagram\" /></p>\n"
},

{
"term": "Toolbox",
"def": "<p><a href=\"/toolbox/overview/\">Docker Toolbox</a> is a legacy\ninstaller for Mac and Windows users. It uses Oracle VirtualBox for\nvirtualization.</p>\n\n<p>For Macs running OS X El Capitan 10.11 and newer macOS releases, <a href=\"/docker-for-mac/\">Docker Desktop for\nMac</a> is the better solution.</p>\n\n<p>For Windows 10 systems that support Microsoft Hyper-V (Professional, Enterprise\nand Education), <a href=\"/docker-for-windows/\">Docker Desktop for\nWindows</a> is the better solution.</p>\n"
},

{
"term": "Union file system",
"def": "<p>Union file systems implement a <a href=\"https://en.wikipedia.org/wiki/Union_mount\">union\nmount</a> and operate by creating\nlayers. Docker uses union file systems in conjunction with\n<a href=\"/glossary/?term=copy-on-write\">copy-on-write</a> techniques to provide the building blocks for\ncontainers, making them very lightweight and fast.</p>\n\n<p>For more on Docker and union file systems, see <a href=\"/engine/userguide/storagedriver/aufs-driver/\">Docker and AUFS in\npractice</a>,\n<a href=\"/engine/userguide/storagedriver/btrfs-driver/\">Docker and Btrfs in\npractice</a>,\nand <a href=\"/engine/userguide/storagedriver/overlayfs-driver/\">Docker and OverlayFS in\npractice</a>.</p>\n\n<p>Example implementations of union file systems are\n<a href=\"https://en.wikipedia.org/wiki/UnionFS\">UnionFS</a>,\n<a href=\"https://en.wikipedia.org/wiki/Aufs\">AUFS</a>, and\n<a href=\"https://btrfs.wiki.kernel.org/index.php/Main_Page\">Btrfs</a>.</p>\n"
},

{
"term": "virtual machine",
"def": "<p>A virtual machine is a program that emulates a complete computer and imitates dedicated hardware.\nIt shares physical hardware resources with other users but isolates the operating system. The\nend user has the same experience on a Virtual Machine as they would have on dedicated hardware.</p>\n\n<p>Compared to containers, a virtual machine is heavier to run, provides more isolation,\ngets its own set of resources and does minimal sharing.</p>\n\n<p><em>Also known as : VM</em></p>\n"
},

{
"term": "volume",
"def": "<p>A volume is a specially-designated directory within one or more containers\nthat bypasses the Union File System. Volumes are designed to persist data,\nindependent of the container’s life cycle. Docker therefore never automatically\ndelete volumes when you remove a container, nor will it “garbage collect”\nvolumes that are no longer referenced by a container.\n<em>Also known as: data volume</em></p>\n\n<p>There are three types of volumes: <em>host, anonymous, and named</em>:</p>\n\n<ul>\n  <li>\n    <p>A <strong>host volume</strong> lives on the Docker host’s filesystem and can be accessed from within the container.</p>\n  </li>\n  <li>\n    <p>A <strong>named volume</strong> is a volume which Docker manages where on disk the volume is created,\nbut it is given a name.</p>\n  </li>\n  <li>\n    <p>An <strong>anonymous volume</strong> is similar to a named volume, however, it can be difficult, to refer to\nthe same volume over time when it is an anonymous volumes. Docker handle where the files are stored.</p>\n  </li>\n</ul>\n"
},

{
"term": "x86_64",
"def": "<p>x86_64 (or x86-64) refers to a 64-bit instruction set invented by AMD as an\nextension of Intel’s x86 architecture. AMD calls its x86_64 architecture,\nAMD64, and Intel calls its implementation, Intel 64.</p>\n"
}

]
