FROM node:15-buster

RUN npm install -g dynamodump

RUN apt update && apt install curl unzip -y

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip" && \
    cd /tmp && \
    unzip awscliv2.zip && \
    aws/install && \
    rm -rfv /tmp/awscliv2.zip /tmp/aws

WORKDIR /data

ENTRYPOINT [ "/usr/local/bin/dynamodump" ]

CMD [ "/usr/local/bin/dynamodump", "-h" ]
