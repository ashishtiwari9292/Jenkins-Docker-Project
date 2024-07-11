FROM ubuntu:latest
MAINTAINER ashishtiwari1234@gmail.com

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip

# Download and extract the website files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip kider.zip

# Move the extracted files to the correct location
RUN cp -rvf markups-kider/* .
RUN rm -rf __MACOSX markups-kider kider.zip

# Command to start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80

