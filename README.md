# Magnum Consortium

This is the new Drupal 10 instance of the The Magnum Consortium, previously a Drupal 7 project that is now being reconfigured.

## Prerequisites
- PHP (version as per Drupal 10 requirements, typically PHP 7.4 or later)
- Composer (for managing PHP packages)
- MAMP (or any other local server environment that supports PHP and MySQL)
- Git (for version control)

## Installation Steps
### 1. Clone the Repository
```
git clone https://github.com/yourusername/yourprojectname.git
cd yourprojectname
```
### 2. Install Dependencies with Composer
Before running the install command, ensure Composer is installed on your machine. If not, follow the installation instructions on the Composer website. Then, install the PHP dependencies:
```
composer install
```

### 3. Configure MAMP
- Start MAMP and open the MAMP Preferences.
- Set the Document Root to the `web/` folder where this repo was cloned (e.g., `/path/to/magnum-conosrtium/web`).
- Ensure the PHP version matches the project requirements.
- Start the servers.

### 4. Create a Database
- Use phpMyAdmin (included with MAMP) or another tool to create a new database for your Drupal site.

### 5. Copy Default Settings File
- If not already done, copy the default settings file:
```cp web/sites/default/default.settings.php web/sites/default/settings.php```

### 6. Install Drupal
Navigate to your site in a web browser (usually http://localhost:8888 for MAMP). Follow the Drupal installation steps. When prompted, use the database credentials and name of the database you created earlier.
