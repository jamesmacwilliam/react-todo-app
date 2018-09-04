FROM centos:7
MAINTAINER James Mac William "jimmy.macwilliam@gmail.com"

# add puppet files and install agent
ADD puppet /puppet
RUN /puppet/docker_install_agent.sh

# add application files
ADD app /tmp/app

# open port 80 for nginx
EXPOSE 80

# run puppet provisioner (we expect the firewall portion to fail, the rest will succeed)
RUN /opt/puppetlabs/bin/puppet apply --modulepath=puppet/modules puppet/manifests/default.pp

CMD nginx -g 'daemon off;'
