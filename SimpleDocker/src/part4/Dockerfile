FROM nginx
LABEL author=tyreknor
WORKDIR /home/
COPY /nginx/nginx.conf /etc/nginx/nginx.conf
COPY /part4/miniserver.c .
COPY /part4/entrypoint.sh .
RUN apt-get update 
RUN apt-get install -y gcc spawn-fcgi libfcgi-dev
ENTRYPOINT ["sh", "./entrypoint.sh"]
EXPOSE 81

#sudo docker build -f part4/Dockerfile -t docker:v4 .
#sudo docker run -d -p 80:81 -v /nginx/nginx.conf:/etc/nginx/nginx.conf --name part4 docker:v4
