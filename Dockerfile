FROM drupal:9.1-apache

# Install git, unzip, and mysql-client
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    mysql-client

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Drush
RUN composer global require drush/drush

# Add global composer bin directory to PATH
ENV PATH="/root/.composer/vendor/bin:${PATH}"

# Copy your Drupal code into the image
COPY . /var/www/html

# Copy entrypoint script into the image
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
