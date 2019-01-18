FROM python:3
ENV PYTHONUNBUFFERED 1
ARG USR=user
 
RUN apt-get update && \
  apt-get install sudo && \
  useradd -ms /bin/bash $USR && \
  usermod -aG sudo $USR && \
  echo "$USR ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN mkdir /code && \
  chown -R $USR:$USR /code/

USER $USR:$USR 
WORKDIR /code
ADD . /code/
RUN sudo pip install -r requirements.txt
