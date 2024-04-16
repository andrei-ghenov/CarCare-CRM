#!/bin/bash

# Wait for MySQL
until mysql -h db -u drupal -pdrupal -e 'select 1'; do sleep 1; done

# Install Drupal with the standard profile
drush site-install standard --yes --db-url=mysql://drupal:drupal@db/drupal

# Import latest configurations
drush config-import --yes

# Start Apache
apache2-foreground
