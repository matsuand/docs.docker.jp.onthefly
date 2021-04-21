%This is the change file for the original Docker's Documentation file.
%This is part of Japanese translation version for Docker's Documantation.

@x
---
description: Create a Docker Compose application using ASP.NET Core and SQL Server on Linux in Docker.
keywords: dotnet, .NET, Core, example, ASP.NET Core, SQL Server, mssql
title: "Quickstart: Compose and ASP.NET Core with SQL Server"
redirect_from:
  - /compose/aspnet-mssql-compose/
---
@y
---
description: Create a Docker Compose application using ASP.NET Core and SQL Server on Linux in Docker.
keywords: dotnet, .NET, Core, example, ASP.NET Core, SQL Server, mssql
title: "Quickstart: Compose and ASP.NET Core with SQL Server"
redirect_from:
  - /compose/aspnet-mssql-compose/
---
@z

@x
This quick-start guide demonstrates how to use Docker Engine on Linux and Docker
Compose to set up and run the sample ASP.NET Core application using the
[.NET Core SDK image](https://hub.docker.com/_/microsoft-dotnet-core-sdk)
with the
[SQL Server on Linux image](https://hub.docker.com/_/microsoft-mssql-server).
You just need to have [Docker Engine](../get-docker.md)
and [Docker Compose](../compose/install.md) installed on your
platform of choice: Linux, Mac or Windows.
@y
This quick-start guide demonstrates how to use Docker Engine on Linux and Docker
Compose to set up and run the sample ASP.NET Core application using the
[.NET Core SDK image](https://hub.docker.com/_/microsoft-dotnet-core-sdk)
with the
[SQL Server on Linux image](https://hub.docker.com/_/microsoft-mssql-server).
You just need to have [Docker Engine](../get-docker.md)
and [Docker Compose](../compose/install.md) installed on your
platform of choice: Linux, Mac or Windows.
@z

@x
For this sample, we create a sample .NET Core Web Application using the
`microsoft/dotnet:2.1-sdk` Docker image. After that, we create a `Dockerfile`,
configure this app to use our SQL Server database, and then create a
`docker-compose.yml` that defines the behavior of all of these components.
@y
For this sample, we create a sample .NET Core Web Application using the
`microsoft/dotnet:2.1-sdk` Docker image. After that, we create a `Dockerfile`,
configure this app to use our SQL Server database, and then create a
`docker-compose.yml` that defines the behavior of all of these components.
@z

@x
> **Note**: This sample is made for Docker Engine on Linux. For Windows
> Containers, visit
> [Docker Labs for Windows Containers](https://github.com/docker/labs/tree/master/windows).
@y
> **Note**: This sample is made for Docker Engine on Linux. For Windows
> Containers, visit
> [Docker Labs for Windows Containers](https://github.com/docker/labs/tree/master/windows).
@z

@x
1.  Create a new directory for your application.
@y
1.  Create a new directory for your application.
@z

@x
    This directory is the context of your docker-compose project. For
    [Docker Desktop for Windows](../docker-for-windows/index.md#file-sharing) and
    [Docker Desktop for Mac](../docker-for-mac/index.md#file-sharing), you
    need to set up file sharing for the volume that you need to map.
@y
    This directory is the context of your docker-compose project. For
    [Docker Desktop for Windows](../docker-for-windows/index.md#file-sharing) and
    [Docker Desktop for Mac](../docker-for-mac/index.md#file-sharing), you
    need to set up file sharing for the volume that you need to map.
@z

@x
1.  Within your directory, use the `dotnet:2.1-sdk` Docker image to generate a
    sample web application within the container under the `/app` directory and
    into your host machine in the working directory:
@y
1.  Within your directory, use the `dotnet:2.1-sdk` Docker image to generate a
    sample web application within the container under the `/app` directory and
    into your host machine in the working directory:
@z

@x
    ```bash
    $ docker run -v ${PWD}:/app --workdir /app microsoft/dotnet:2.1-sdk dotnet new mvc --auth Individual
    ```
@y
    ```bash
    $ docker run -v ${PWD}:/app --workdir /app microsoft/dotnet:2.1-sdk dotnet new mvc --auth Individual
    ```
@z

@x
    > **Note**: If running in Docker Desktop for Windows, make sure to use Powershell
    or specify the absolute path of your app directory.
@y
    > **Note**: If running in Docker Desktop for Windows, make sure to use Powershell
    or specify the absolute path of your app directory.
@z

@x
1.  Create a `Dockerfile` within your app directory and add the following content:
@y
1.  Create a `Dockerfile` within your app directory and add the following content:
@z

@x
    ```dockerfile
    # syntax=docker/dockerfile:1
    FROM microsoft/dotnet:2.1-sdk
    COPY . /app
    WORKDIR /app
    RUN ["dotnet", "restore"]
    RUN ["dotnet", "build"]
    EXPOSE 80/tcp
    RUN chmod +x ./entrypoint.sh
    CMD /bin/bash ./entrypoint.sh
    ```
@y
    ```dockerfile
    # syntax=docker/dockerfile:1
    FROM microsoft/dotnet:2.1-sdk
    COPY . /app
    WORKDIR /app
    RUN ["dotnet", "restore"]
    RUN ["dotnet", "build"]
    EXPOSE 80/tcp
    RUN chmod +x ./entrypoint.sh
    CMD /bin/bash ./entrypoint.sh
    ```
@z

@x
    This file defines how to build the web app image. It uses the
    [.NET Core SDK image](https://hub.docker.com/_/microsoft-dotnet-core-sdk),
    maps the volume with the generated code, restores the dependencies, builds the
    project and exposes port 80. After that, it calls an `entrypoint` script
    that we create in the next step.
@y
    This file defines how to build the web app image. It uses the
    [.NET Core SDK image](https://hub.docker.com/_/microsoft-dotnet-core-sdk),
    maps the volume with the generated code, restores the dependencies, builds the
    project and exposes port 80. After that, it calls an `entrypoint` script
    that we create in the next step.
@z

@x
1.  The `Dockerfile` makes use of an entrypoint to your webapp Docker
    image. Create this script in a file called `entrypoint.sh` and paste the
    contents below.
@y
1.  The `Dockerfile` makes use of an entrypoint to your webapp Docker
    image. Create this script in a file called `entrypoint.sh` and paste the
    contents below.
@z

@x
    > **Note**: Make sure to use UNIX line delimiters. The script doesn't work if
    > you use Windows-based delimiters (Carriage return and line feed).
@y
    > **Note**: Make sure to use UNIX line delimiters. The script doesn't work if
    > you use Windows-based delimiters (Carriage return and line feed).
@z

@x
    ```bash
    #!/bin/bash
@y
    ```bash
    #!/bin/bash
@z

@x
    set -e
    run_cmd="dotnet run --server.urls http://*:80"
@y
    set -e
    run_cmd="dotnet run --server.urls http://*:80"
@z

@x
    until dotnet ef database update; do
    >&2 echo "SQL Server is starting up"
    sleep 1
    done
@y
    until dotnet ef database update; do
    >&2 echo "SQL Server is starting up"
    sleep 1
    done
@z

@x
    >&2 echo "SQL Server is up - executing command"
    exec $run_cmd
    ```
@y
    >&2 echo "SQL Server is up - executing command"
    exec $run_cmd
    ```
@z

@x
    This script restores the database after it starts up, and then runs
    the application. This allows some time for the SQL Server database image to
    start up.
@y
    This script restores the database after it starts up, and then runs
    the application. This allows some time for the SQL Server database image to
    start up.
@z

@x
1.  Create a `docker-compose.yml` file. Write the following in the file, and
    make sure to replace the password in the `SA_PASSWORD` environment variable
    under `db` below. This file defines the way the images interact as
    independent services.
@y
1.  Create a `docker-compose.yml` file. Write the following in the file, and
    make sure to replace the password in the `SA_PASSWORD` environment variable
    under `db` below. This file defines the way the images interact as
    independent services.
@z

@x
    > **Note**: The SQL Server container requires a secure password to startup:
    > Minimum length 8 characters, including uppercase and lowercase letters,
    > base 10 digits and/or non-alphanumeric symbols.
@y
    > **Note**: The SQL Server container requires a secure password to startup:
    > Minimum length 8 characters, including uppercase and lowercase letters,
    > base 10 digits and/or non-alphanumeric symbols.
@z

@x
    ```yaml
    version: "{{ site.compose_file_v3 }}"
    services:
        web:
            build: .
            ports:
                - "8000:80"
            depends_on:
                - db
        db:
            image: "mcr.microsoft.com/mssql/server"
            environment:
                SA_PASSWORD: "Your_password123"
                ACCEPT_EULA: "Y"
    ```
@y
    ```yaml
    version: "{{ site.compose_file_v3 }}"
    services:
        web:
            build: .
            ports:
                - "8000:80"
            depends_on:
                - db
        db:
            image: "mcr.microsoft.com/mssql/server"
            environment:
                SA_PASSWORD: "Your_password123"
                ACCEPT_EULA: "Y"
    ```
@z

@x
    This file defines the `web` and `db` micro-services, their relationship, the
    ports they are using, and their specific environment variables.
@y
    This file defines the `web` and `db` micro-services, their relationship, the
    ports they are using, and their specific environment variables.
@z

@x
    > **Note**: You may receive an error if you choose the wrong Compose file
    > version. Be sure to choose a version that is compatible with your system.
@y
    > **Note**: You may receive an error if you choose the wrong Compose file
    > version. Be sure to choose a version that is compatible with your system.
@z

@x
1.  Go to `Startup.cs` and locate the function called `ConfigureServices` (Hint:
    it should be under line 42). Replace the entire function to use the following
    code (watch out for the brackets!).
@y
1.  Go to `Startup.cs` and locate the function called `ConfigureServices` (Hint:
    it should be under line 42). Replace the entire function to use the following
    code (watch out for the brackets!).
@z

@x
    > **Note**: Make sure to update the `Password` field in the `connection`
    > variable below to the one you defined in the `docker-compose.yml` file.
@y
    > **Note**: Make sure to update the `Password` field in the `connection`
    > variable below to the one you defined in the `docker-compose.yml` file.
@z

@x
    ```csharp
    [...]
    public void ConfigureServices(IServiceCollection services)
    {
        // Database connection string.
        // Make sure to update the Password value below from "Your_password123" to your actual password.
        var connection = @"Server=db;Database=master;User=sa;Password=Your_password123;";
@y
    ```csharp
    [...]
    public void ConfigureServices(IServiceCollection services)
    {
        // Database connection string.
        // Make sure to update the Password value below from "Your_password123" to your actual password.
        var connection = @"Server=db;Database=master;User=sa;Password=Your_password123;";
@z

@x
        // This line uses 'UseSqlServer' in the 'options' parameter
        // with the connection string defined above.
        services.AddDbContext<ApplicationDbContext>(
            options => options.UseSqlServer(connection));
@y
        // This line uses 'UseSqlServer' in the 'options' parameter
        // with the connection string defined above.
        services.AddDbContext<ApplicationDbContext>(
            options => options.UseSqlServer(connection));
@z

@x
        services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<ApplicationDbContext>()
            .AddDefaultTokenProviders();
@y
        services.AddIdentity<ApplicationUser, IdentityRole>()
            .AddEntityFrameworkStores<ApplicationDbContext>()
            .AddDefaultTokenProviders();
@z

@x
        services.AddMvc();
@y
        services.AddMvc();
@z

@x
        // Add application services.
        services.AddTransient<IEmailSender, AuthMessageSender>();
        services.AddTransient<ISmsSender, AuthMessageSender>();
    }
    [...]
    ```
@y
        // Add application services.
        services.AddTransient<IEmailSender, AuthMessageSender>();
        services.AddTransient<ISmsSender, AuthMessageSender>();
    }
    [...]
    ```
@z

@x
1.  Go to `app.csproj`. You see a line like:
@y
1.  Go to `app.csproj`. You see a line like:
@z

@x
    ```
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="1.1.2" />
    ```
@y
    ```
    <PackageReference Include="Microsoft.EntityFrameworkCore.Sqlite" Version="1.1.2" />
    ```
@z

@x
    The generated project uses sqlite by default. To use SQL Server, add this line to
    `app.csproj`:
@y
    The generated project uses sqlite by default. To use SQL Server, add this line to
    `app.csproj`:
@z

@x
    ```
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="1.1.2" />
    ```
@y
    ```
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="1.1.2" />
    ```
@z

@x
    The Sqlite dependency was at version 1.1.2 at the time of this writing. Use the same
    version for the SQL Server dependency.
@y
    The Sqlite dependency was at version 1.1.2 at the time of this writing. Use the same
    version for the SQL Server dependency.
@z

@x
1.  Ready! You can now run the `docker-compose build` command.
@y
1.  Ready! You can now run the `docker-compose build` command.
@z

@x
    ```bash
    $ docker-compose build
    ```
@y
    ```bash
    $ docker-compose build
    ```
@z

@x
1.  Make sure you allocate at least 2GB of memory to Docker Engine. Here is how
    to do it on
    [Docker Desktop for Mac](../docker-for-mac/index.md#advanced) and
    [Docker Desktop for Windows](../docker-for-windows/index.md#advanced).
    This is necessary to run the SQL Server on Linux container.
@y
1.  Make sure you allocate at least 2GB of memory to Docker Engine. Here is how
    to do it on
    [Docker Desktop for Mac](../docker-for-mac/index.md#advanced) and
    [Docker Desktop for Windows](../docker-for-windows/index.md#advanced).
    This is necessary to run the SQL Server on Linux container.
@z

@x
1.  Run the `docker-compose up` command. After a few seconds, you should be able
    to open [localhost:8000](http://localhost:8000) and see the ASP.NET core
    sample website. The application is listening on port 80 by default, but we
    mapped it to port 8000 in the `docker-compose.yml`.
@y
1.  Run the `docker-compose up` command. After a few seconds, you should be able
    to open [localhost:8000](http://localhost:8000) and see the ASP.NET core
    sample website. The application is listening on port 80 by default, but we
    mapped it to port 8000 in the `docker-compose.yml`.
@z

@x
    ```bash
    $ docker-compose up
    ```
@y
    ```bash
    $ docker-compose up
    ```
@z

@x
    Go ahead and try out the website! This sample uses the SQL Server
    database image in the back-end for authentication.
@y
    Go ahead and try out the website! This sample uses the SQL Server
    database image in the back-end for authentication.
@z

@x
Ready! You now have an ASP.NET Core application running against SQL Server in
Docker Compose! This sample made use of some of the most popular Microsoft
products for Linux. To learn more about Windows Containers, check out
[Docker Labs for Windows Containers](https://github.com/docker/labs/tree/master/windows)
to try out .NET Framework and more SQL Server tutorials.
@y
Ready! You now have an ASP.NET Core application running against SQL Server in
Docker Compose! This sample made use of some of the most popular Microsoft
products for Linux. To learn more about Windows Containers, check out
[Docker Labs for Windows Containers](https://github.com/docker/labs/tree/master/windows)
to try out .NET Framework and more SQL Server tutorials.
@z

@x
## Next steps
@y
## Next steps
@z

@x
- [Build your app using SQL Server](https://www.microsoft.com/en-us/sql-server/developer-get-started/?utm_medium=Referral&utm_source=docs.docker.com)
- [SQL Server on Docker Hub](https://hub.docker.com/r/microsoft/mssql-server/)
- [ASP.NET Core](https://www.asp.net/core)
- [ASP.NET Core Docker image](https://hub.docker.com/r/microsoft/aspnetcore/) on DockerHub
@y
- [Build your app using SQL Server](https://www.microsoft.com/en-us/sql-server/developer-get-started/?utm_medium=Referral&utm_source=docs.docker.com)
- [SQL Server on Docker Hub](https://hub.docker.com/r/microsoft/mssql-server/)
- [ASP.NET Core](https://www.asp.net/core)
- [ASP.NET Core Docker image](https://hub.docker.com/r/microsoft/aspnetcore/) on DockerHub
@z

@x
## More Compose documentation
@y
{: #more-compose-documentation }
## その他の Compose ドキュメント
@z

@x
- [Docker Compose overview](../compose/index.md)
- [Install Docker Compose](../compose/install.md)
- [Getting Started with Docker Compose](../compose/gettingstarted.md)
- [Docker Compose Command line reference](../compose/reference/index.md)
- [Compose file reference](../compose/compose-file/index.md)
- [Awesome Compose samples](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@y
- [Docker Compose 概要](../compose/index.md)
- [Docker Compose のインストール](../compose/install.md)
- [Docker Compose をはじめよう](../compose/gettingstarted.md)
- [Docker Compose コマンドラインリファレンス](../compose/reference/index.md)
- [Compose ファイルリファレンス](../compose/compose-file/index.md)
- [Awesome Compose サンプル](https://github.com/docker/awesome-compose/){:target="_blank" rel="noopener" class="_"}
@z
