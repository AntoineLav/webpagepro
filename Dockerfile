FROM ubuntu:latest

MAINTAINER Antoine Lavignotte "antoine.lavignotte@gmail.com"

# Update aptitude with new repo
RUN apt-get update -y

# Install software 
RUN apt-get install -y python3-pip python3-dev build-essential git ssh

# Add Host Key from Github to my known_hosts
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts

# Clone the project's github repository
RUN git clone https://github.com/AntoineLav/webpagepro.git
WORKDIR /webpagepro

# Install python requirements (Flask)
RUN pip3 install -r requirements.txt

# Declare environment variables
ENV FLASK_APP=webpagepro.py
ENV FLASK_ENV=development
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Run command
ENTRYPOINT ["python3"]
CMD ["webpagepro.py"]