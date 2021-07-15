# build step
FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
#RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache
COPY ./ ./

#run step
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
