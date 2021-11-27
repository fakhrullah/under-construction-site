FROM mhart/alpine-node:16 AS builder
WORKDIR /app
ARG from_team
ARG page_type
COPY . .
RUN npm install
RUN echo "${page_type} ${from_team}"
RUN node ./src/builder.js "${from_team}" "${page_type}"
# COPY ./build ./build

FROM nginx:alpine
#copy the config file to nginx directory and replace default
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html
