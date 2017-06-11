# Habitat PHP Starter

This is a simple Habitat package to create a php server with nginx and mysql.

# Using

```
.
├── habitat       <- this repository
│   ├── README.MD
│   ├── config
│   │   └── nginx.conf
│   ├── default.toml
│   ├── hooks
│   │   ├── init
│   │   └── run
│   └── plan.sh
└── source       <- your files go in here 
|    └── index.php 
└── docker-compose.yml <- contents below
```

Setup your project like above. Where the habitat folder is the file from this repository. 
The `source` folder should contain any files that should run on the PHP server. It will make everything easier if you have 
a `index.php` file. 

From the root of this project, run `hab studio enter` (outside of the habitat folder). 
When ran, you will enter a docker container where you can build your package. 

In the studio run `build`. The package will be built. 
To run this package in a docker container run 'hab pkg export docker lancewf/lemp'. 
This will create a docker image on your local computer. 
Then create the mysql docker container with 'hab pkg export docker core/mysql'

Exit out of the studio with `exit`,
Run `docker image` and you should see a `lancewf/lemp` and `core/mysql` images. 
To run your project, goto the root of this project where the docker-compose.yml is and run `docker-compose up`. 
Test that the container is working by going to localhost:8080. 

If you don't have a `index.php` file in the source directory you will have to goto localhost:8080/<your_file.php> 

There you go! You have a running php server!

If you want to explore the database run `docker-compose exec lemp mysql.sh` and you will be logged in the mysql shell. 

docker-compose.yml
```
version: '2'
services:
  database:
   image: core/mysql
   command: "start core/mysql --group lemp"
   environment:
      HAB_MYSQL: |
        app_username='lancewf'
        app_password='lancewf'
        bind='0.0.0.0'
  lemp:
   image: lancewf/lemp
   command: "start lancewf/lemp --peer database --bind database:mysql.lemp"
   ports:
     - "8080:8080"
   volumes:
     - ./source:/hab/svc/lemp/data
volumes:
  data-volume: {}
```
