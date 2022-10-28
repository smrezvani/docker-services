# Builder
FROM node:lts as builder

ARG PUBLIC_URL=/
ARG REACT_APP_SERVER

RUN git clone https://github.com/Awesome-Technologies/synapse-admin.git /src

WORKDIR /src

RUN yarn --network-timeout=100000 install
RUN PUBLIC_URL=$PUBLIC_URL REACT_APP_SERVER=$REACT_APP_SERVER yarn build


# App
FROM nginx:latest

# Install netstat
RUN apt update && apt upgrade -y && apt install -y net-tools && apt autoremove -y

COPY --from=builder /src/build /app

RUN rm -rf /usr/share/nginx/html \
 && ln -s /app /usr/share/nginx/html

# Copy healthcheck script
COPY healthcheck.sh /usr/local/bin/healthcheck.sh

# Health check
HEALTHCHECK --interval=10s --start-period=10s CMD bash /usr/local/bin/healthcheck.sh
