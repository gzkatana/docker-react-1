FROM node:alpine as builder
WORKDIR /usr/front
COPY package.json .
RUN npm install 
COPY ./ ./
RUN chmod 777 /usr/front/node_modules
RUN npm run build

# all the file of the build will be in /usr/front/build

FROM nginx
COPY --from=builder /usr/front/build /usr/share/nginx/html
# no need to start nginx command , it will start automatically 
