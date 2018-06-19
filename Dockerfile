FROM ubuntu:latest
MAINTAINER Antoine Lavignotte "antoine.lavignotte@gmail.com"
RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev build-essential
COPY . /webpagepro
WORKDIR /webpagepro
RUN pip3 install -r requirements.txt
ENV FLASK_APP=webpagepro.py
ENV FLASK_ENV=development
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENTRYPOINT ["python3"]
CMD ["webpagepro.py"]