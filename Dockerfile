FROM ubuntu:24.04
RUN apt-get update && apt-get -y install curl gnupg ruby
RUN curl -fsSL https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/newrelic-infra.gpg

RUN echo "deb https://download.newrelic.com/infrastructure_agent/linux/apt/ noble main" > /etc/apt/sources.list.d/newrelic-infra.list
RUN apt-get update
# NRI Agent doesn't understand that this is a container
RUN echo "echo systemctl $@" > /usr/bin/systemctl; chmod +x /usr/bin/systemctl

RUN NRIA_MODE="UNPRIVILEGED" apt-get -y install newrelic-infra nri-postgresql nri-mysql nri-elasticsearch nri-mongodb nri-mysql nri-rabbitmq nri-redis

RUN mkdir /usr/yml
ADD templates/bin /usr/local/bin
ADD templates/yml /usr/yml/

CMD ["/usr/local/bin/newrelic-wrapper"]
