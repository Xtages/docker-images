# Docker image to build console
FROM debian:stable

ARG JAVA_VER=15
ARG GRADLE_VER=6.8.3
ARG TERRAFORM_VER=0.14.7
ARG NODE_VER=15.13.0
ARG NVM_VER=0.38.0

ENV JAVA_VER=${JAVA_VER}
ENV GRADLE_VER=${GRADLE_VER}
ENV TERRAFORM_VER=${TERRAFORM_VER}
ENV NODE_VER=${NODE_VER}
ENV NVM_VER=${NVM_VER}
ENV POSTGRES_VER=${POSTGRES_VER}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update --fix-missing
RUN apt-get -y install unzip postgresql-13 curl software-properties-common gnupg npm

# JAVA install
RUN curl -L -O https://apt.corretto.aws/corretto.key
RUN apt-key add corretto.key
RUN add-apt-repository 'deb https://apt.corretto.aws stable main'
RUN apt-get update; apt-get install -y java-${JAVA_VER}-amazon-corretto-jdk

# Gradle install
RUN curl -L -O https://services.gradle.org/distributions/gradle-${GRADLE_VER}-all.zip
RUN unzip -q gradle-${GRADLE_VER}-all.zip -d /opt && rm *.zip
RUN ln -s /opt/gradle-${GRADLE_VER} /opt/gradle
ENV GRADLE_HOME=/opt/gradle
ENV PATH="${GRADLE_HOME}/bin:${PATH}"

# Terraform install
RUN curl -L -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VER}_linux_amd64.zip -d /usr/sbin && rm *.zip

# Node install
RUN npm cache clean -f && npm install -g n && n ${NODE_VER}

# AWS CLI install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.1.36.zip" -o "awscliv2.zip"
RUN unzip -q awscliv2.zip && rm *.zip
RUN ./aws/install

# Docker install
RUN apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce

# Postgres config
COPY pg_hba.conf /etc/postgresql/13/main/pg_hba.conf

COPY start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
VOLUME /var/lib/docker
ENTRYPOINT /opt/start.sh
