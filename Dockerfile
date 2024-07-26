FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y apache2 \
                       zip \
                       unzip \
                       wget
WORKDIR /var/www/html/
RUN wget -O oxer.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/oxer.zip
RUN unzip oxer.zip
RUN cp -rvf oxer-html/* .
RUN rm -rf oxer oxer-html oxer.zip
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80

# FROM ubuntu:latest
# RUN apt-get update && \
#     apt-get install -y apache2 \
#                        zip \
#                        unzip \
#                        wget
# WORKDIR /var/www/html/
# RUN wget -O klinik.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/klinik.zip
# RUN unzip klinik.zip
# RUN cp -rvf clinic-website-template/* .
# RUN rm -rf clinic-website-template klinik.zip
# CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
# EXPOSE 80
