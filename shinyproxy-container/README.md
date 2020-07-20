
# Run ShinyProxy as a container


## Sources

*   Article:
*   GitHub: https://github.com/openanalytics/shinyproxy-config-examples/tree/master/02-containerized-docker-engine
*   Main examples page: https://github.com/openanalytics/shinyproxy-config-examples
* Main examples page: https://github.com/openanalytics/shinyproxy-config-examples



## Characteristics

*   Build on `openjdk:8-jre`
*   Uses ShinyProxy to publish Shiny apps
*   This image/container only runs ShinyProxy. The Shiny applications are installed separately
*   

## Steps

1.  Create network

    ```
    docker network create sp-example-net
    ```

    

2.  Build image for ShinyProxy

    ```
    docker build -t shinyproxy2-img .
    ```

    

3.  Run container

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --net sp-example-net \
    -p 8080:8080 \
    shinyproxy2-img
```

    ```
    docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --net sp-example-net \
        -p 8080:8080 \
        shinyproxy2-img
    ```

For the user names and passwords, open the file `application.yml` under the ShinyProxy server.

```
  - name: jack
    password: password
    groups: admins
  - name: jeff
    password: password
```    
