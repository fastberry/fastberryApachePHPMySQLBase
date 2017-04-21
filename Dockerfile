# start from the resin rpi-raspbian image
FROM fastberry/apachephp:latest
MAINTAINER fastberrypi@gmail.com

# install mysql
RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    bash \
    mysql-server \
    mysql-client \
    php5-mysql

# set DEBIAN_FRONTEND to supress prompt for root password and install mysql-server
#RUN export DEBIAN_FRONTEND=noninteractive && apt-get -q -y install mysql-server

# now set the mysql root password
# RUN mysqladmin -u root password fastberry

# copy the startup script for mysql
ADD src/checkenv.sh /usr/bin/checkenv.sh

# start and run apache in the foregroundlamp
CMD /usr/bin/checkenv.sh

