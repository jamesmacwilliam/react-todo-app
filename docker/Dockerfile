FROM centos:7
MAINTAINER James Mac William "jimmy.macwilliam@gmail.com"

# add puppet files and install agent
ADD puppet /puppet
RUN ./puppet/docker_install_agent.sh

# add application files
ADD app /tmp/app
