FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip \
    curl

# Download the zip file using curl
RUN curl -o /var/www/html/kider.zip https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip

# Change working directory
WORKDIR /var/www/html

# Unzip the file and set up the content
RUN unzip kider.zip
# RUN cp -rvf markups-kider/* .
# RUN rm -rf __MACOSX markups-kider kider.zip

# Command to start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
