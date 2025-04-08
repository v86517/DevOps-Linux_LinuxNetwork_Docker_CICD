# Simple Docker


## Part 1. Готовый докер

- Взять официальный докер-образ с nginx и выкачать его при помощи `docker pull`  
![01 docker pull nginx.png](./images/01%20docker%20pull%20nginx.png)


- Проверить наличие докер-образа через `docker images`  
![02 sudo docker images.png](./images/02%20sudo%20docker%20images.png)


 - Запустить докер-образ через `docker run -d [image_id|repository]`  
![03 docker run -d nginx.png](./images/03%20docker%20run%20-d%20nginx.png)


- Проверить, что образ запустился через `docker ps`  
![04 docker ps.png](./images/04%20docker%20ps.png)


- Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`  
![05 docker inspect.png](./images/05%20docker%20inspect.png)
```text/x-nginx-conf
(base) slava@slava-ThinkPad-T490s:~$ sudo docker inspect -s f611247b32b5
[
    {
        "Id": "f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2",
        "Created": "2024-05-15T11:04:52.401891935Z",
        "Path": "/docker-entrypoint.sh",
        "Args": [
            "nginx",
            "-g",
            "daemon off;"
        ],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 24750,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2024-05-15T11:04:52.671320591Z",
            "FinishedAt": "0001-01-01T00:00:00Z"
        },
        "Image": "sha256:e784f4560448b14a66f55c26e1b4dad2c2877cc73d001b7cd0b18e24a700a070",
        "ResolvConfPath": "/var/lib/docker/containers/f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2/hostname",
        "HostsPath": "/var/lib/docker/containers/f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2/hosts",
        "LogPath": "/var/lib/docker/containers/f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2/f611247b32b5c8a379683c4e7698ee6c154615cae00ec4ffef49e3980e5680f2-json.log",
        "Name": "/relaxed_sinoussi",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "bridge",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                36,
                105
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "private",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": [],
            "BlkioDeviceWriteBps": [],
            "BlkioDeviceReadIOps": [],
            "BlkioDeviceWriteIOps": [],
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": null,
            "PidsLimit": null,
            "Ulimits": [],
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware",
                "/sys/devices/virtual/powercap"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/5641fab26460bd31625ab7d3aba4803ed3e193b87a0fea53719865b2206ab751-init/diff:/var/lib/docker/overlay2/5330e56f96a02b7490c54511458a84066df0dcff00767b2676d6ba1e89de19a1/diff:/var/lib/docker/overlay2/cb5a05483d6b0061b4e9197ab69788aa6adaf44fb48eacc481655ec4d69e5fee/diff:/var/lib/docker/overlay2/e35a1deb7c0760edb2bffe5c4343f3a46f496f520cf4cd3e2ddc9d2025da1c02/diff:/var/lib/docker/overlay2/1a54d47adbdd34548dec1b51fddbf374e5df7c68e9f686977cee1b0b75c76589/diff:/var/lib/docker/overlay2/6dee738d55fd6627d1064e272f7d59cf9b9e91acce775c1ebcec40b5e0564741/diff:/var/lib/docker/overlay2/a68bd90f1f0d7297e02d1d4f3eca8b508d533ba1bc90c430d7ddfa0703574c1d/diff:/var/lib/docker/overlay2/6f812ec3e350fabc8b046c73d4bc282b7e299fa49ba3d841b0f32aae4b5c1b40/diff",
                "MergedDir": "/var/lib/docker/overlay2/5641fab26460bd31625ab7d3aba4803ed3e193b87a0fea53719865b2206ab751/merged",
                "UpperDir": "/var/lib/docker/overlay2/5641fab26460bd31625ab7d3aba4803ed3e193b87a0fea53719865b2206ab751/diff",
                "WorkDir": "/var/lib/docker/overlay2/5641fab26460bd31625ab7d3aba4803ed3e193b87a0fea53719865b2206ab751/work"
            },
            "Name": "overlay2"
        },
        "SizeRw": 1095,
        "SizeRootFs": 187661042,
        "Mounts": [],
        "Config": {
            "Hostname": "f611247b32b5",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "80/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
                "NGINX_VERSION=1.25.5",
                "NJS_VERSION=0.8.4",
                "NJS_RELEASE=3~bookworm",
                "PKG_RELEASE=1~bookworm"
            ],
            "Cmd": [
                "nginx",
                "-g",
                "daemon off;"
            ],
            "Image": "nginx",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": [
                "/docker-entrypoint.sh"
            ],
            "OnBuild": null,
            "Labels": {
                "maintainer": "NGINX Docker Maintainers <docker-maint@nginx.com>"
            },
            "StopSignal": "SIGQUIT"
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "9188e4d31f68c23db703c5c843d962afbaa838a940aaf86563a294239c158168",
            "SandboxKey": "/var/run/docker/netns/9188e4d31f68",
            "Ports": {
                "80/tcp": null
            },
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "5fb388df9df4e1346ea6d90a45c668f33247725b3ad0f28fb7ef61ad960c44f8",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "MacAddress": "02:42:ac:11:00:02",
                    "NetworkID": "efdc72e0b1e8423869dca1d60095d6e70fd90f2d061d3a8c6319fe5b56f4ef91",
                    "EndpointID": "5fb388df9df4e1346ea6d90a45c668f33247725b3ad0f28fb7ef61ad960c44f8",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "DriverOpts": null,
                    "DNSNames": null
                }
            }
        }
    }
]
(base) slava@slava-ThinkPad-T490s:~$
```

 - По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера.

  - размер контейнера - (187,661 МБайт)
  `"SizeRootFs": 187661042`
  - список замапленных портов - 80
  `"NetworkSettings": {
 "Ports": {
 "80/tcp": null`
  - ip контейнера - 172.17.0.2
`"NetworkSettings": {
"IPAddress": "172.17.0.2",`
- Остановить докер образ через `docker stop [container_id|container_name]`  
![06 docker stop.png](./images/06%20docker%20stop.png)


- Проверить, что образ остановился через `docker ps`  
![07 docker ps.png](./images/07%20docker%20ps.png)


- Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду `run`  
![08 docker ps with ports 80 443.png](./images/08%20docker%20ps%20with%20ports%2080%20443.png)


- Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx  
![09 localhost 80.png](./images/09%20localhost%2080.png)


- Перезапустить докер контейнер через `docker restart [container_id|container_name]`  
![10 docker restart.png](./images/10%20docker%20restart.png)


- Проверить любым способом, что контейнер **nginx** запустился(по адресу *localhost:80*, в консоли)  
![11 docker ps.png](./images/11%20docker%20ps.png)
![12 curl localhost:80.png](./images/12%20curl%20localhost_80.png)


## Part 2. Операции с контейнером

- Прочитать конфигурационный файл `nginx.conf` внутри докер контейнера через команду *exec*  
![13 docker exec -it cat _etc_nginx_nginx.conf.png](./images/13%20docker%20exec%20-it%20cat%20_etc_nginx_nginx.conf.png)


- Создать на локальной машине файл `nginx.conf` и настроить в нем по пути `/status` отдачу страницы статуса сервера `nginx`  
![14 cat 21_docker_nginx.conf.png](./images/14%20cat%2021_docker_nginx.conf.png)


- Скопировать созданный файл `nginx.conf` внутрь докер-образа через команду `docker cp`  
![15 docker cp nginx.conf.png](./images/15%20docker%20cp%20nginx.conf.png)


- Перезапустить `nginx` внутри докер-образа через команду `exec`  
![16 docker exec -it service nginx reload.png](./images/16%20docker%20exec%20-it%20service%20nginx%20reload.png)


- Проверить что по адресу `localhost:80/status` отдается страничка со статусом сервера `nginx`  
![17 localhost:80_status.png](./images/17%20localhost_80_status.png)


- Экспортировать контейнер в файл *container.tar* через команду `export`  
![18 docker export container.tar.png](./images/18%20docker%20export%20container.tar.png)


- Остановить контейнер `docker stop [container_id|container_name]`  
![19 docker stop.png](./images/19%20docker%20stop.png)


- Удалить образ через `docker rmi -f [image_id|repository]`, не удаляя перед этим контейнеры  
![20 docker rmi -f nginx.png](./images/20%20docker%20rmi%20-f%20nginx.png)


- Удалить остановленный контейнер  
![21 docker rm.png](./images/21%20docker%20rm.png)
![22 docker ps -a.png](./images/22%20docker%20ps%20-a.png)


- Импортировать контейнер обратно через команду `import`  
![23 docker import --change CMD.png](./images/23%20docker%20import%20--change%20CMD.png)


- Запустить импортированный контейнер  
![24 docker run imported_nginx.png](./images/24%20docker%20run%20imported_nginx.png)


- Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера nginx  
![25 localhost:80_status.png](./images/25%20localhost_80_status.png)


- Останавливаем контейнер  
![26 docker stop.png](./images/26%20docker%20stop.png)



## Part 3. Мини веб-сервер

- Написать мини-сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!

- Скачиваем докер-образ *nginx*  
![301 docker pull nginx.png](./images/301%20docker%20pull%20nginx.png)


- Запускаем докер-образ с портом 81 в контейнере, замапленным на такой же порт на локальной машине  
![302 docker run 81:81.png](./images/302%20docker%20run%2081_81.png)


- Обновляем список доступного ПО в контейнере  
![303 docker exec -it apt update.png](./images/303%20docker%20exec%20-it%20apt%20update.png)


- Устанавливаем gcc и spawn-fcgi в контейнере  
![304 docker exec -it apt install gcc libfcgi-dev spawn-fcgi -y.png](./images/304%20docker%20exec%20-it%20apt%20install%20gcc%20libfcgi-dev%20sp.png)


- Создаем *nginx.conf* и *script.sh*  
![305 nginx.conf script.sh.png](./images/305%20nginx.conf%20script.sh.png)


- Копируем написанные файлы *nginx.conf* и *script.sh* в контейнер
- Делаем *script.sh* исполняемым
- Перезапускаем *nginx* внутри контейнера
- Запускаем *script.sh* (компиляция и запуск сервера внутри контейнера)  
![305 docker cp nginx.conf script.sh chmod nginx_reload exec_script.sh.png](./images/305%20docker%20cp%20nginx.conf%20script.sh%20chmod%20nginx_rel.png)


- Проверить, что в браузере по localhost:81 отдается написанная страничка  
![306 localhost:81.png](./images/306%20localhost_81.png)



## Part 4. Свой докер

- Собрать написанный докер-образ через `docker build` при этом указав имя и тег
- Проверить через `docker images`, что все собралось корректно  
![401 Dockerfile.png](./images/401%20Dockerfile.png)
![401 entrypoint.sh.png](./images/401%20entrypoint.sh.png)
![401 docker build.png](./images/401%20docker%20build.png)


- Запустить собранный докер-образ с маппингом 81 порта на 80 на локальной машине и маппингом папки *./nginx* внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)

- Список запущенных контейнеров `docker ps`  
![402 docker run docker ps.png](./images/402%20docker%20run%20docker%20ps.png)


- Проверить, что по localhost:80 доступна страничка написанного мини сервера  
![403 localhost:80.png](./images/403%20localhost_80.png)


- Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx  
![404 nginx.conf with status.png](./images/404%20nginx.conf%20with%20status.png)


- Перезапустить докер-образ  
![405 docker restart.png](./images/405%20docker%20restart.png)


- Проверить, что теперь по localhost:80/status отдается страничка со статусом nginx  
![406 localhost_status.png](./images/406%20localhost_status.png)



## Part 5. **Dockle**

- Установка `dockle`  
![501 install dockle.png](./images/501%20install%20dockle.png)


- Просканировать образ из предыдущего задания через `dockle [image_id|repository]`  
![502 dockle.png](./images/502%20dockle.png)


- Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений
- Исправленный *Dockerfile*  
![503 Dockerfile after fix.png](./images/503%20Dockerfile%20after%20fix.png)


- Запуск сканирования образа командой `dockle --ak NGINX_GPGKEY --ak NGINX_GPGKEY_PATH docker:v5`  
![504 dockle after fix.png](./images/504%20dockle%20after%20fix.png)


- Проверка, что по localhost:80/status отдается страничка со статусом nginx  
![505 localhost_status.png](./images/505%20localhost_status.png)



## Part 6. Базовый **Docker Compose**
- Установил docker-compose `sudo apt install docker-compose -y`

- Создал файл *docker-compose.yml* в папке *src/part6*  
![601 docker-compose.yml.png](./images/601%20docker-compose.yml.png)


- Создал `Dockerfile` и `nginx.conf` для сервера в папке *src/part6/serverpart5*  
![602 server Dockerfile nginx.conf.png](./images/602%20server%20Dockerfile%20nginx.conf.png)


- Создал `Dockerfile` и `nginx.conf` для прокси-сервера в папке *src/part6/proxy*  
![603 proxy Dockerfile nginx.conf.png](./images/603%20proxy%20Dockerfile%20nginx.conf.png)


- Остановил все запущенные контейнеры  
![604 remove containers and images.png](./images/604%20remove%20containers%20and%20images.png)


- Собрал проект  
![605 docker-compose build.png](./images/605%20docker-compose%20build.png)


- Запустил проект  
![606 docker-compose up -d.png](./images/606%20docker-compose%20up%20-d.png)


- Проверить, что в браузере по *localhost:80* отдается написанная страничка, как и ранее  
![607 localhost:80.png](./images/607%20localhost_80.png)
![608 localhost:80_status.png](./images/608%20localhost_80_status.png)




