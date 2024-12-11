FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx netcat netcat-openbsd openssl -y
RUN mkdir -p /run/nginx
RUN mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod -R 755 /etc/nginx /var/www/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -subj "/C=BE/ST=Bruxelles/L=Bruxelles/0=42/OU=vdarras/CN=vdarras.42.fr" \
    -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
