# Habitat LEMP Environment

This is a simple Habitat package to create a php server with nginx and mysql. This can be used for php development. By placing these files in your root directory you will be able to have a local running php site without installing anything but habitat and docker. 

Features:
* Easy command to enter into the mysql command line. 
* Easy way to upload build your database and table. 
* Templating for setting up your database config files. 

# Using

```
.
├── README.MD
├── docker-compose.yml
├── habitat
│   ├── config
│   │   ├── database.conf     <- database config file example
│   │   └── nginx.conf
│   ├── database
│   │   └── create-tables.sql <- the sql to create your projects tables
│   ├── default.toml
│   ├── hooks
│   │   └── init              <- edit this file to point the database config file to another location
│   └── plan.sh               <- edit this file to depoly your project
|── src                       <- all the php files need for your project
```

## Running example
Everything will be ran within the habitat studio with custom commands added in the .studiorc file.

From the root of this project, run `hab studio enter`.

In the studio run `start`. This will preform the following steps inorder
* First check if the service is already running
* Starts mysql
* String the php-fpm service need for parsing php files
* builds the services hab pkg
* Starts the sup with the custom config for each service. These are loaded from the 'load_dev_config' function
* Starts the service with the mysql and php-fpm bindings
* Waits until the service is started

To see the project running to localhost:8080. Here you can see that the PHP code has pulled two rows from the database and displayed them on the screen. 

There you go! You have a local running PHP server without having to install or configure anything!

If you want to explore the mysql database run `mysql_shell` and you will be logged in the mysql shell. 

Change the `/habitat/database/create-tables.sql` file to create your own database and fill in your own test data. 

Change the `/habitat/config/database.conf` file to create your database config file. Then to change the location where the database config file is placed in your project, update the `habitat/hooks/init` file around line 26 in the `Project Setup` section. 
