# Habitat LEMP Development Environment

This is a simple Habitat package to create a php server with nginx and mysql. This can be used for php development. Where one and change files and the database without restarting the service. 

# Using

```
.
├── habitat    
│   ├── config
│   │   └── nginx.conf
│   ├── default.toml
│   ├── hooks
│   │   ├── init
│   │   └── run
│   └── plan.sh
└── source       <- your PHP files go in here 
|    └── index.php 
└── docker-compose.yml <- contents below
└── README.MD
```

The `source` folder should contain your PHP project files. 

From the root of this project, run `hab studio enter`. 
When ran, you will enter a docker container where you can build your package. 

In the studio run `build`. The PHP service package will be built. 
To run this package in a docker container run 'hab pkg export docker lancewf/lemp'. 
This will create a docker image on your local computer. 
Then create the mysql docker container with 'hab pkg export docker core/mysql'

Exit out of the studio with `exit`,
Run `docker image` and you should see `lancewf/lemp` and `core/mysql` images listed. 
To run your project, goto the root of this project where the docker-compose.yml is and run `docker-compose up`. 
Test that the container is working by going to localhost:8080. 

There you go! You have a local running php server!

If you want to explore the database run `docker-compose exec lemp mysql.sh` and you will be logged in the mysql shell. 

File changes in the source directory are automatically reflected in the running service. 
