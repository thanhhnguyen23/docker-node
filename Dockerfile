# specify a base image
FROM node:14-alpine

# install npm dependencies
RUN apk add --update npm

# declare working directory
WORKDIR /usr/app

# * NOTE: reduce npm rebuild overhead
# copy package.json to directory 
COPY ./package.json ./

# install dependency
RUN npm install

# * NOTE: copy all other files after npm 
# update any changes to bulid directory
COPY ./ ./

# default command
CMD ["npm", "start"]
#CMD ["npm", "-v"]

#-------------------------------------------------------------------------------- 
# * NOTE: common docker commands
#-------------------------------------------------------------------------------- 

# * NOTE: start the docker container
# $ docker run -p 8080:8080 <image-id>

# * NOTE: used for debugging interactively
# $ docker run -it thn/simpleweb sh 
