# Habitat LEMP Development Environment

This is a simple Habitat package to create a php server with nginx and mysql. This can be used for php development. By placing these files in your root directory you will be able to have a local running php site without installing anything but habitat and docker. 

Features:
* Modifying your PHP code directly changes your running server without having to deploy or run anything extra.
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
```

## Running example
We will be building two docker containers. One with the nginx with PHP and the other with mysql. With the habatit managers binding we can easier connect the two services together. 

From the root of this project, run `hab studio enter`. When ran, you will enter a docker container where you can build your packages. 

In the studio run `build`. This will build all of your habitat packages. 
To run these package in a docker container they need to be exported to a docker image. To export the nginx/PHP run 'hab pkg export docker lancewf/lemp'. To export the mysql into a docker image run'hab pkg export docker core/mysql'.

Then exit out of the studio with `exit`. To ensure your docker images were exported run `docker image`. You should see listed as output `lancewf/lemp` and `core/mysql` images. 

To run the dev environment, goto the root of this project where the docker-compose.yml file is and run `docker-compose up`. 
Test that the container is working by going to localhost:8080. 

There you go! You have a local running PHP server! Try modifying the index.php file and see the change when reloading localhost:8080. 

If you want to explore the mysql database run `docker-compose exec lemp mysql.sh` and you will be logged in the mysql shell. 

Change the `/habitat/database/create-tables.sql` file to add your own database data and fill the data. 

Change the `/habitat/config/database.conf` file to have a custum way to connect to the database. To change the location where the database config file is placed in your project, update `habitat/hooks/init` file around line 26 in the `Project Setup` section. 

I running PHP Codeigniter project that is using this setup for development is located at https://github.com/lancewf/Marine-Mammal-Stranding-Network-Server. 
