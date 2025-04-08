FROM nginx
LABEL author=tyreknor
WORKDIR /home/

COPY /nginx.conf /etc/nginx/nginx.conf
COPY /miniserver.c .
COPY /entrypoint.sh .
RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    useradd -d /home/tyreknor -m -s /bin/bash tyreknor && \
    chown -R tyreknor:tyreknor /etc/nginx/nginx.conf && \
    chown -R tyreknor:tyreknor /var/cache/nginx && \
    chown -R tyreknor:tyreknor /home && \
    touch /var/run/nginx.pid && \
    chown -R tyreknor:tyreknor /var/run/nginx.pid && \
    rm -rf /var/lib/apt/lists/*
USER tyreknor
ENTRYPOINT ["sh", "./entrypoint.sh"]
