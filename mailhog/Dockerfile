#
# MailHog Dockerfile
#

FROM golang:1.18-bullseye as builder

# Install MailHog:
RUN apt update
RUN apt install -y git \
  && mkdir -p /root/gocode \
  && export GOPATH=/root/gocode \
  && go install github.com/mailhog/MailHog@latest

FROM debian:stable-slim

RUN apt update && apt upgrade -y && apt install -y net-tools && apt autoremove -y

# Add mailhog user
RUN useradd -u 1000 mailhog

COPY --chown=1000:mailhog --from=builder /root/gocode/bin/MailHog /usr/local/bin/

# Copy healthcheck script
COPY --chown=1000:mailhog healthcheck.sh /usr/local/bin/healthcheck.sh

USER mailhog

RUN chmod u+x /usr/local/bin/healthcheck.sh

WORKDIR /home/mailhog

ENV MH_SMTP_BIND_ADDR=0.0.0.0:25

ENTRYPOINT ["MailHog"]

# Expose the SMTP and HTTP ports:
EXPOSE 25 8025

# Health check
HEALTHCHECK --interval=10s --start-period=10s CMD bash /usr/local/bin/healthcheck.sh
