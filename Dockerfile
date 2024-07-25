FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 \
                       zip \
                       unzip \
                       wget

WORKDIR /var/www/html/

# Download the zip file using wget
RUN wget -O oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip oxer.zip
RUN cp -rvf oxoxer-html/* .
RUN rm -rf oxer oxer.zip

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
