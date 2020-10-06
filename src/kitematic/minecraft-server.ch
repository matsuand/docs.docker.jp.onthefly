%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
advisory: kitematic
description: Tutorial demonstrating the setup of a Minecraft server using Docker and Kitematic
keywords: docker, documentation, about, technology, kitematic, gui, minecraft, tutorial
title: 'Kitematic tutorial: Set up a Minecraft server'
---
@y
---
advisory: kitematic
description: Tutorial demonstrating the setup of a Minecraft server using Docker and Kitematic
keywords: docker, documentation, about, technology, kitematic, gui, minecraft, tutorial
title: 'Kitematic tutorial: Set up a Minecraft server'
---
@z

@x
This is a quick tutorial demonstrating how to set up a local Minecraft server
using Kitematic and Docker.
@y
This is a quick tutorial demonstrating how to set up a local Minecraft server
using Kitematic and Docker.
@z

@x
### Create Minecraft server container
@y
### Create Minecraft server container
@z

@x
First, if you haven't yet done so, [download and start Kitematic](index.md).
Once installed and running, the app should look like this:
@y
First, if you haven't yet done so, [download and start Kitematic](index.md).
Once installed and running, the app should look like this:
@z

@x
Create a container from the recommended Minecraft image by clicking the "Create"
button.
@y
Create a container from the recommended Minecraft image by clicking the "Create"
button.
@z

@x
![create Minecraft container](images/minecraft-create.png)
@y
![create Minecraft container](images/minecraft-create.png)
@z

@x
After the image finishes downloading, you see the home screen for the
Minecraft container. Your Minecraft server is now up and running inside a Docker
container. We've marked the IP and port you can use to connect to
your Minecraft server in red (your IP and port may be different from what's
shown).
@y
After the image finishes downloading, you see the home screen for the
Minecraft container. Your Minecraft server is now up and running inside a Docker
container. We've marked the IP and port you can use to connect to
your Minecraft server in red (your IP and port may be different from what's
shown).
@z

@x
![Minecraft server port and IP info](images/minecraft-port.png)
@y
![Minecraft server port and IP info](images/minecraft-port.png)
@z

@x
### Connect to Minecraft server
@y
### Connect to Minecraft server
@z

@x
Open your Minecraft client, log in with your Minecraft account and click on the
"Multiplayer" button.
@y
Open your Minecraft client, log in with your Minecraft account and click on the
"Multiplayer" button.
@z

@x
![Minecraft login screen](images/minecraft-login.png)
@y
![Minecraft login screen](images/minecraft-login.png)
@z

@x
Click the "Add Server" button to add the Minecraft server you want to connect
to.
@y
Click the "Add Server" button to add the Minecraft server you want to connect
to.
@z

@x
![Add server](images/minecraft-login.png)
@y
![Add server](images/minecraft-login.png)
@z

@x
Fill in the "Server Address" text box with the marked IP and port from Kitematic
you saw earlier.
@y
Fill in the "Server Address" text box with the marked IP and port from Kitematic
you saw earlier.
@z

@x
![Minecraft server address](images/minecraft-server-address.png)
@y
![Minecraft server address](images/minecraft-server-address.png)
@z

@x
Click on the play button to connect to your Minecraft server and enjoy!
@y
Click on the play button to connect to your Minecraft server and enjoy!
@z

@x
### Change map using Docker volume
@y
### Change map using Docker volume
@z

@x
Open the "data" folder from Kitematic (Select "Enable all volumes to edit
files via Finder"). We use Docker Volume to map the folder from the Minecraft
Docker container onto your computer.
@y
Open the "data" folder from Kitematic (Select "Enable all volumes to edit
files via Finder"). We use Docker Volume to map the folder from the Minecraft
Docker container onto your computer.
@z

@x
![Minecraft data volume](images/minecraft-data-volume.png)
@y
![Minecraft data volume](images/minecraft-data-volume.png)
@z

@x
The Finder opens, allowing you to replace your current map with the new one
you desire.
@y
The Finder opens, allowing you to replace your current map with the new one
you desire.
@z

@x
![Minecraft maps](images/minecraft-map.png)
@y
![Minecraft maps](images/minecraft-map.png)
@z

@x
Restart your container by clicking the "Restart" button.
@y
Restart your container by clicking the "Restart" button.
@z

@x
![Restart Minecraft container](images/minecraft-restart.png)
@y
![Restart Minecraft container](images/minecraft-restart.png)
@z

@x
Go back to your Minecraft client and join your server. The new map should load.
@y
Go back to your Minecraft client and join your server. The new map should load.
@z

@x
## Next steps
@y
## Next steps
@z

@x
For an example using Kitematic to run Nginx, take a look at the
[Nginx web server](./nginx-web-server.md) page.
@y
For an example using Kitematic to run Nginx, take a look at the
[Nginx web server](./nginx-web-server.md) page.
@z
