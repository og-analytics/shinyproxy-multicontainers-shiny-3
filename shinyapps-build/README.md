
# ShinyProxy Demo Image
Contains two Shiny apps:
* `run_01_hello`
* `run_06_tabsets`


## Characteristics
* Application bundled as a package `shinyapps`
* This container only deals with the Shiny apps, 
* ShinyProxy has to be launched in another container


## Build the image
To build the image from the Dockerfile, navigate into the root directory of this repository and run

```
docker build -t shinyapps-img .
```

## Run a container

```

```
