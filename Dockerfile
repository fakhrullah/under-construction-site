FROM mhart/alpine-node:16 AS builder
WORKDIR /app
COPY ./src/work-in-progress.html ./build/index.html

FROM nginx:alpine
#copy the config file to nginx directory and replace default
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy docusaurus generated files to webserver serve file
COPY --from=builder /app/build /usr/share/nginx/html
