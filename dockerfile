# Use official Ubuntu image
FROM ubuntu:20.04

# Avoid interactive prompts during build
ARG DEBIAN_FRONTEND=noninteractive

# Install Apache
RUN apt update && apt install -y apache2 && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy code to Apache directory
COPY . /var/www/html

# Expose Apache port
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
