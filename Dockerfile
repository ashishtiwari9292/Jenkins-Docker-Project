FROM ubuntu:latest
MAINTAINER ashishtiwari1234@gmail.com
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page247/kindle.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf __MACOSX markups-kindle kindle.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
