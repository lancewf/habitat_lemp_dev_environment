# Habitat PHP Starter

This is a simple Habitat package to create a php server. 

There is no database attached to this only a place to drop php files. 


# Using

.
├── habitat
│   ├── README.MD
│   ├── config
│   │   └── nginx.conf
│   ├── default.toml
│   ├── hooks
│   │   ├── init
│   │   └── run
│   └── plan.sh
└── source
    └── info.php


Setup your project like above. Where the habitat folder is the source from this repository. 
The `source` folder should contain any files that should run on the PHP server. 

From the root of this project run `hab studio enter`. You will enter a docker container where you can build your package. 
In the studio run `build`. The package will be built. 
To run this package in a docker container run 'hab pkg export docker lancefinfrock/php'. 
This will create a docker image on your local computer. 

Exit out of the studio with `exit` and run your docker container with `docker run -it -p 8080:8080 lancefinfrock/php`. 
Test that the container is working by going to localhost:8080. 

If the file you added to the source directory is not named index.php then you will have to goto localhost:8080/<your_file.php> 
