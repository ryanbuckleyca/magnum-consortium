# Use the DDEV webserver as the base image
FROM drud/ddev-webserver:v1.22.1

# Set the working directory
WORKDIR /var/www/html

# Copy the Drupal project files into the container
COPY . .

# Install production dependencies
RUN composer install --no-dev --optimize-autoloader

# Ensure proper permissions for files directory
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Set up Apache with Drupal's document root
RUN echo "DocumentRoot /var/www/html/web" > /etc/apache2/sites-available/000-default.conf

# Enable Apache rewrite module
RUN a2enmod rewrite

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
