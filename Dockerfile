# Use an official PHP image with Apache, compatible with Drupal 10
FROM php:8.2-apache

# Install required PHP extensions
RUN apt-get update && apt-get install -y \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    mariadb-client \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip opcache \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /var/www/html

# Copy project files into the container
COPY . .

# Install production dependencies
RUN composer install --no-dev --optimize-autoloader

# Set permissions for the Drupal files directory
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Set the Apache document root to the Drupal web directory
RUN echo "DocumentRoot /var/www/html/web" > /etc/apache2/sites-available/000-default.conf

# Expose port 80
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
