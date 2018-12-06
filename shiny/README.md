This is source files of building docker image ustcgxd/shiny. The idea of this shiny docker image is to pull shiny apps from repositories in bitbucket or github.

### How-To
- cd the the shiny folder
- create `files` folder
- add id_rsa private key file to the `files` folder, make sure the public keys are added to the repositories like bitbucket or github
- add repos.yml file that specify the location of shiny apps and environment values
- modify docker-compose.yml as needed
- run `docker-compose up -d` to start the server
- run `docker-compose down` to stop the server

#### Example of repos.yml file
```
app1:
  src: git@github.com:youraccount/yourrepo1.git
  branch: prod
  envs:
    HOST: MYHOST
    USER: MYUSER
    PASS: MYPASS

app2:
  src: git@github.com:youraccount/yourrepo2.git
  envs:
    HOST: MYHOST
    USER: MYUSER
    PASS: MYPASS
```
