# Use a lightweight PHP image with Apache
FROM php:8.2-apache

# Install the required PHP extensions for Drupal
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libzip-dev unzip mariadb-client && \
    docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install gd mysqli pdo pdo_mysql zip opcache && \
    a2enmod rewrite && \
    rm -rf /var/lib/apt/lists/*

# Copy Drupal files to the web server's root
COPY web/ /var/www/html/

# Set permissions for Drupal's files directory
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Expose port 80 for the web server
EXPOSE 80

# Run the Apache server
CMD ["apache2-foreground"]
