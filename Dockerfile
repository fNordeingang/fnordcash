# To build the image:
# sudo docker.io build -t cash .

# Run your container the first time with an interactive console
# sudo docker.io run -i -t cash

# (the SSH port is only available locally, but other ports are exposed publicly and must be available
# otherwise the container won't start)
# sudo docker.io run -d -p 22 -p 8080:80 cash


FROM ubuntu:14.04
MAINTAINER vileda (https://fnordeingang.de)

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qq -y openssh-server python3 python3-pip postgresql-client git-core libpq-dev python3-dev
RUN pip3 install django
RUN pip3 install psycopg2

RUN git clone https://github.com/fNordeingang/fnordcash.git /fnordcash

# How the instance is launched.
ENTRYPOINT ["/fnordcash/docker/init"]
CMD [""]
EXPOSE 22 80
