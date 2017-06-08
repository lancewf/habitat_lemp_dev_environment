# Habitat PHP Starter

This is a simple Habitat package to create a php server with nginx.

There is no database only a place to run php files. 

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
    └── index.php 
```

Setup your project like above. Where the habitat folder is the source from this repository. 
The `source` folder should contain any files that should run on the PHP server. It will make everything easier if you have 
a `index.php` file. 

From the root of this project, run `hab studio enter` (outside of the habitat folder). 
When ran, you will enter a docker container where you can build your package. 

In the studio run `build`. The package will be built. 
To run this package in a docker container run 'hab pkg export docker lancefinfrock/php'. 
This will create a docker image on your local computer. 

Exit out of the studio with `exit`,
Run `docker image` and you should see a `lancefinfrock/php` image. 
To run your docker container use `docker run -it -p 8080:8080 lancefinfrock/php`. 
Test that the container is working by going to localhost:8080. 

If you don't have a `index.php` file in the source directory you will have to goto localhost:8080/<your_file.php> 

There you go! You have a running php server!
