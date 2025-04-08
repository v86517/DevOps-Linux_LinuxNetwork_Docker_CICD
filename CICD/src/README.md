# Basic CI/CD
## Part 1. Настройка gitlab-runner

* Поднять виртуальную машину *Ubuntu Server 22.04 LTS*
Воспользуемся Docker. Создаем образ виртуальной машины с нужными приложениями  
![0101 Dockerfile.png](./images/0101%20Dockerfile.png)



`docker build -f Dockerfile1/Dockerfile -t ubuntu_22.04:ci .`  
![0102 docker build.png](./images/0102%20docker%20build.png)



Создаем контейнер виртуальной машины из созданного образа  
`docker run -d -it --name ci ubuntu_22.04:ci`  
![0103 docker run.png](./images/0103%20docker%20run.png)



* Скачать и установить на виртуальную машину *gitlab-runner*  
`docker exec -it ci /bin/bash`  
`curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | bash`  
`apt-get install gitlab-runner -y`  
![0104 docker exec and curl.png](./images/0104%20docker%20exec%20and%20curl.png)  
![0105 apt-get install gitlab-runner.png](./images/0105%20apt-get%20install%20gitlab-runner.png)



* Запустить *gitlab-runner* и зарегистрировать его для использования в текущем проекте (DO6_CICD)
Для регистрации понадобятся URL и токен, которые можно получить на страничке задания на платформе  
`gitlab-runner register`  
`service gitlab-runner status`  
![0106 gitlab-runner register and status.png](./images/0106%20gitlab-runner%20register%20and%20status.png)


Видим что *gitlab-runner* не запускается. Вносим следующие изменения в файл */etc/init.d/gitlab-runner*
```
DAEMON="/usr/bin/gitlab-runner"
DESC="GitLab Runner"
USER="gitlab-runner"

--exec "$DAEMON" --  "run" "--working-directory" "/var/lib/gitlab-runner" "--config" "/etc/gitlab-runner/config.toml" "--service" "gitlab-runner" "--syslog" "--user" "$USER"
```

`vim /etc/init.d/gitlab-runner`  
![0107 vim etc_init.d_gitlab-runner.png](./images/0107%20vim%20etc_init.d_gitlab-runner.png)  
![0108 etc_init.d_gitlab-runner.png](./images/0108%20etc_init.d_gitlab-runner.png)


Проверяем запустился ли *gitlab-runner*  
`service gitlab-runner status`  
![0109 sevice gitlab-runner status.png](./images/0109%20sevice%20gitlab-runner%20status.png)



## Part 2. Сборка

* Написать этап для CI по сборке приложений из проекта *C2_SimpleBashUtils*
В файле *gitlab-ci.yml* добавить этап запуска сборки через мейк файл из проекта C2.
Файлы, полученные после сборки (артефакты), сохранить в произвольную директорию со сроком хранения 30 дней.  
Создаем файл *gitlab-ci.yml* в корне репозитория проекта CICD
`vim .gitlab-ci.yml`  
![0110 vim .gitlab-ci.yml.png](./images/0110%20vim%20.gitlab-ci.yml.png)  
![0111 .gitlab-ci.yml.png](./images/0111%20.gitlab-ci.yml.png)




Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0112 pipeline1.png](./images/0112%20pipeline1.png)  
![0113 pipeline2.png](./images/0113%20pipeline2.png)  
![0114 pipeline3.png](./images/0114%20pipeline3.png)




## Part 3. Тест кодстайла

* Написать этап для CI, который запускает скрипт кодстайла (clang-format). Если кодстайл не прошел, то «зафейлить» пайплайн. В пайплайне отобразить вывод утилиты clang-format.  

В файл *gitlab-ci.yml* добавляем этап проверки кодстайла:  
![0115 vim .gitlab-ci.yml.png](./images/0115%20vim%20.gitlab-ci.yml.png)



Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0116 pipeline1.png](./images/0116%20pipeline1.png)  
![0117 pipeline2.png](./images/0117%20pipeline2.png)



Вносим ошибки стиля в *.с* файлы. Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0118 pipeline fail1.png](./images/0118%20pipeline%20fail1.png)  
![0119 pipeline fail2.png](./images/0119%20pipeline%20fail2.png)



## Part 4. Интеграционные тесты

* Написать этап для CI, который запускает твои интеграционные тесты из того же проекта. Запустить этот этап автоматически только при условии, если сборка и тест кодстайла прошли успешно. Если тесты не прошли, то «зафейлить» пайплайн.  

В файл *gitlab-ci.yml* добавляем этап проверки кодстайла. Он запускается автоматически если  предыдущие утапы выполнены успешно.  
![0120 vim .gitlab-ci.yml.png](./images/0120%20vim%20.gitlab-ci.yml.png)



Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0121 pipeline all is OK1.png](./images/0121%20pipeline%20all%20is%20OK1.png)  
![0122 pipeline all is OK2.png](./images/0122%20pipeline%20all%20is%20OK2.png)



Вносим ошибки стиля в *.с* файлы. Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0123 pipeline on success.png](./images/0123%20pipeline%20on%20success.png)



Вносим ошибки для неуспешного прохождения тестов. Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0124 pipeline fail test1.png](./images/0124%20pipeline%20fail%20test1.png)  
![0125 pipeline fail test2.png](./images/0125%20pipeline%20fail%20test2.png)




## Part 5. Этап деплоя

* Поднять вторую виртуальную машину Ubuntu Server 22.04 LTS.

Написать этап для CD, который «разворачивает» проект на другой виртуальной машине.

Запустить этот этап вручную при условии, что все предыдущие этапы прошли успешно.

Написать bash-скрипт, который при помощи ssh и scp копирует файлы, полученные после сборки (артефакты), в директорию /usr/local/bin второй виртуальной машины. Будь готов объяснить по скрипту, как происходит перенос.

В файле gitlab-ci.yml добавить этап запуска написанного скрипта. В случае ошибки «зафейлить» пайплайн.
В результате должны получить готовые к работе приложения из проекта C2_SimpleBashUtils (s21_cat и s21_grep) на второй виртуальной машине.

* Создаем образ второй виртуальной машины с нужными приложениями  
![0201 Dockerfile2.png](./images/0201%20Dockerfile2.png)



`docker build -f Dockerfile2/Dockerfile -t ubuntu_22.04:cd .`  
![0202 docker build.png](./images/0202%20docker%20build.png)



Создаем контейнер виртуальной машины из созданного образа  
`docker run -d -it --name cd ubuntu_22.04:cd`  
![0203 docker run.png](./images/0203%20docker%20run.png)



* Настраиваем ssh-сервер на второй машине
IP адреса контейнеров находятся в одной подсети (172.17.0.2 и 172.17.0.3)  
Заходим на вторую машину `docker exec -it cd /bin/bash`  
Смотрим IP адрес `ip a`  
Проверяем связь с первой машиной `ping`  
![0204 ssh server.png](./images/0204%20ssh%20server.png)


В */etc/ssh/sshd_config* меняем *#PermitRootLogin prohibit-password* на *PermitRootLogin yes*
```
grep -i permitrootlogin /etc/ssh/sshd_config
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
grep -i permitrootlogin /etc/ssh/sshd_config
```
Запускаем ssh сервер `service ssh start`  
![0205 ssh server.png](./images/0205%20ssh%20server.png)



* Заходим на первую машину, проверяем ssh соединение  
![0206 ssh from 1 to 2.png](./images/0206%20ssh%20from%201%20to%202.png)


Для беспарольного доступа пользователя *gitlab-runner* генерируем ssh-ключ `ssh-keygen` и копируем его на вторую машину (ssh сервер) `ssh-copy-id root@172.17.0.3`. Проверяем ssh доступ  
![0207 on 1 ssh-keygen.png](./images/0207%20on%201%20ssh-keygen.png)



* Создаем скрипт *scp_to_deploy.sh* для копирования артефактов на вторую машину. Права на исполнение выдаются  в *gitlab-ci.yml*
```
#!/bin/bash

scp cat/s21_cat root@172.17.0.3:/usr/local/bin
scp grep/s21_grep root@172.17.0.3:/usr/local/bin
ssh root@172.17.0.3 "
cd /usr/local/bin
pwd
ls -lah
"
```

* Дописываем этап в файл *gitlab-ci.yml*  
![0209 vim .gitlab-ci.yml.png](./images/0209%20vim%20.gitlab-ci.yml.png)



Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0210 pipeline1.png](./images/0210%20pipeline1.png)  
![0211 pipeline2.png](./images/0211%20pipeline2.png)  
![0212 pipeline3.png](./images/0212%20pipeline3.png)


Файлы появились на второй машине:  
![0213 usr_local_bin ls.png](./images/0213%20usr_local_bin%20ls.png)





## Part 6. Дополнительно. Уведомления

* Настроить уведомления о успешном/неуспешном выполнении пайплайна через бота с именем «[твой nickname] DO6 CI/CD» в Telegram.

Текст уведомления должен содержать информацию об успешности прохождения как этапа CI, так и этапа CD. В остальном текст уведомления может быть произвольным.
* Получаем токен бота в *Telegram* через *@botfather*  
![0301 bot1.png](./images/0301%20bot1.png)


* Получаем *chat ID* в браузере по адресу *https://api.telegram.org/bot<YOUR_BOT_TOKEN>/getUpdates* отправив любое сообщение в созданный чат  
![0302 bot2.png](./images/0302%20bot2.png)



* Создаем скрипт `notification.sh` и делаем его исполняемым. 
```
#!/bin/bash

URL="https://api.telegram.org/bot7324615808:AAES1FLNOXTTU2F6rU-tY4UzajZPzGeyF4o/sendMessage"
TEXT="Deploy status: $CI_JOB_NAME $CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time 300 -d "chat_id=5484157606&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null
```
* В задачи *test-job* и *deploy-job* добавляем запуск скрипта:  
![0303 vim .gitlab-ci.yaml.png](./images/0303%20vim%20.gitlab-ci.yaml.png)



* Пушим файлы проекта. Переходим в репозиторий *https://repos.21-school.ru/*. Смотрим результат.  
![0304 bot3.png](./images/0304%20bot3.png)




