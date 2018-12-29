from ubuntu:16.04
ADD ./sources.list /etc/apt/sources.list

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y libmysqlclient-dev 

## 时区
RUN apt-get update -y && apt-get install -y tzdata
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
## pip env
RUN mkdir /root/.pip/
ADD ./pip.conf /root/.pip/pip.conf

## locale and encode
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen &&   locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8   

## vim 
RUN apt-get update -y && apt-get install -y vim

## zsh
RUN apt-get update -y && \
    apt-get install -y zsh && \
    apt-get install -y curl && \
    apt-get install -y git


## uwsgi
RUN pip3 install uwsgi



