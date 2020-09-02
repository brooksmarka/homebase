# pull official base image
FROM node:13.12.0-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent

# Inform Docker that the container is listening on the specified port at runtime.
# EXPOSE 8080

# Copy the rest of your app's source code from your host to your image filesystem.
COPY . ./

# start app
CMD ["npm", "start"]