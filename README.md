[toc]

# Adding more Shiny apps as containers. Example 3

Our last example will add the Euler Shiny app to the set of applications administered by *ShinyProxy*. I will be copying this repo and creating a new one where I change the configuration for the 3 applications instead of 2.

## Add the new Shiny app to ShinyProxy configuration

The changes I have to make are two: (1) add the new app to `application.yml` located in the folder `shinyproxy-container`; (2) and then build a new image that takes these changes. I will not  reuse the same image names; I will be creating new ones so the example  is very clear.

From the top (the first example), I copy+paste the section for the Euler app and inserted at the end of `application.yml`:

```
- id: euler
      display-name: Euler's number
      container-cmd: ["R", "-e", "shiny::runApp('/root/euler')"]
      container-image: euler-img
```

And save the modified `application.yml`:

```
proxy:
  port: 8080
  authentication: simple
  admin-groups: admins
  users:
  - name: jack
    password: password
    groups: admins
  - name: jeff
    password: password
  docker:
      internal-networking: true
  specs:
  - id: 07_widgets
    display-name: Widgets Application
    description: Application which demonstrates the basics of a Shiny app
    container-cmd: ["R", "-e", "shinyapps::run_07_widgets()"]
    container-image: shinyapps-img
    container-network: sp-example-net
  - id: 04_mpg
    display-name: MPG Application
    container-cmd: ["R", "-e", "shinyapps::run_04_mpg()"]
    container-image: shinyapps-img
    container-network: sp-example-net
  - id: euler
    display-name: Euler's number
    container-cmd: ["R", "-e", "shiny::runApp('/root/euler')"]
    container-image: euler-img
    container-network: sp-example-netlogging:
  file:
    shinyproxy.log
```



## Attach the new Shiny app to the shared network

You see only a minor change: we added the container network `sp-example-net` for the Euler app. All the containers must belong to the same network.

![Image for post](https://miro.medium.com/max/711/1*ZqoOcOnjj2C0yb92dlThWQ.png)



## Rebuild the ShinyProxy Docker image

Let’s build the new image for the three applications from the folder `shinyproxy-container` with:

```
docker build -t shinyproxy3-img .
```



## Run the new container

And launch the new container:

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --net sp-example-net \
    -p 8080:8080 \
    shinyproxy3-img
```

>   Note that we are now adding two new parameters: `-v /var/run/docker.sock:/var/run/docker.sock` to create a volume, and `--net sp-example-net` to connect to a shared network..

Open the browser at `127.0.0.1:8080`



![Image for post](https://miro.medium.com/max/925/1*uPTs9yCU-T9sfej72BCAvw.png)

There are three applications now. It will take few seconds to start the container and launch the *Shiny* app from the third container:



![Image for post](https://miro.medium.com/max/925/1*UgYf8H8ZdQkwKnHe0ffOcg.png)

Finally, our third application powered by the third container:

![Image for post](https://miro.medium.com/max/925/1*dHKSsFcax7G5rRSCLbDEDA.png)



![Image for post](https://miro.medium.com/max/1162/1*-DsOfZYrwXJmcxUyLPlVYw.png)

And we launch the “*MPG App*”. In `csysdig` we see now the three containers that were spun off from the images `euler-img`, `shinyapps-img`, and `shinyproxy3-img`.



![Image for post](https://miro.medium.com/max/1194/1*TTjr6kPhJRdmjyWhvXx5oA.png)

------

