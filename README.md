# docker-htaccess
- An environment where you can perform simulated editing of .htaccess.


## How to use.
```shell script
docker network create DockerHtaccessApache2
docker-compose up
```

- [https://example.localhost/contents.html](https://example.localhost/contents.html)


## Requirement
- [Docker](https://www.docker.com/)
- Browser


## Setup

### Create Self-signed Certificate
- [noranuko13/cathand-oreore-certificate](https://github.com/noranuko13/cathand-oreore-certificate)
  - Put server.crt and server.key in the "openssl" directory.


### Add the domain to the hosts file.
- Examine Docker container's IP address.
```shell script
docker ps --filter "name=docker-htaccess-apache2" --format "{{.ID}}"
7ff33e868d9e
docker inspect -f "{{.NetworkSettings.Networks.DockerHtaccessApache2.IPAddress}}" 7ff33e868d9e
172.23.0.2
```

- Modify the hosts file. Add the following code.
```text
172.23.0.2 example.localhost
172.23.0.2 www.example.localhost
172.23.0.2 sub.example.localhost
```

#### By the way
- If you are using PowerShell 7.0.0,
```shell script
$id = docker ps --filter "name=docker-htaccess-apache2" --format "{{.ID}}"
$ip = docker inspect -f "{{.NetworkSettings.Networks.DockerHtaccessApache2.IPAddress}}" $id
$domain = "example.localhost"
Write-Host "$ip $domain`r`n$ip www.$domain`r`n$ip sub.$domain";
```


## Teardown
- Remove the docker network.
```shell script
docker network rm DockerHtaccessApache2
```


## Tips

### The deleted file is displayed.
- "Shift + F5".

### Settings in httpd.conf are not reflected.
- Stop "docker-compose up", and then ...
```shell script
docker-compose build --no-cache
```

- Then restart.


## Note

### Final Operation Confirmation Datetime
- 2020/05/10 06:00

### Operation check environment
- Microsoft Windows [Version 10.0.18363.778]
- PowerShell 7.0.0
- Docker version 19.03.8, build afacb8b
- Google Chrome 81.0.4044.138（Official Build）


## Licence
- Released under the [MIT License](https://opensource.org/licenses/MIT).
