FROM ubuntu:latest
MAINTAINER ashishtiwari1234@gmail.com
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kider.zip
RUN cp -rvf markups-kider/* .
RUN rm -rf __MACOSX markups-kider kider.zip
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
