FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 \
                       zip \
                       unzip

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip oxer.zip
RUN cp -rvf oxer/* .
RUN rm -rf oxer oxer.zip

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
 