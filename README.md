# Flowise + n8n

- in your chosen directory run "git clone https://github.com/mohgamalmoh/AI.git"
- get into the directory AI/docker and run "docker-compose up --build"


### the directory "AI/docker" contains a docker-compose file that referes to the "AI/Flowise/Dockerfile" to do the build.
### this docker-compose file will be a central file to do other builds for other projects like n8n

in AI/Flowise/Dockerfile, we just added this "RUN apk add --no-cache git" as it is required fo the build

##TODO:
1- we need to implement kind of env values management for things like the ip address mentioned in AI/docker/nginx.conf to convert it from "localhost" to the IP of EC2 machine

note: 
- the AI/docker/selfsigned.key file is not in the repo as it is in .gitignore, i created the file directly in the ec2 machine as it is not in the repo.
- we added this env var "- NODE_TLS_REJECT_UNAUTHORIZED=0" to flowise to allow selfsigned certificate untill we use a certificate from trusted provider.
