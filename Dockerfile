FROM nginx:1.21.6-alpine

MAINTAINER Bluishoul <bluishoul@gmail.com>

# Overwrite default config
COPY nginx-site.conf /etc/nginx/conf.d/default.conf
COPY expires.conf /etc/nginx/conf.d/expires.conf

# Set a path to config file to be written, can be changed at runtime
ENV CONFIG_FILE_PATH /app

RUN mkdir /app

RUN echo "<code>Add your index.html to /app: COPY index.html /app/index.html</code>" > /app/index.html

# Copy our start script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
