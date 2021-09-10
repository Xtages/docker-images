FROM amazonlinux:2018.03

ARG TERRAFORM_VER=0.14.7
ENV TERRAFORM_VER=${TERRAFORM_VER}
ARG NODE_VER=15.13.0
ENV NODE_VER=${NODE_VER}
ARG NVM_VER=0.38.0
ENV NVM_VER=${NVM_VER}

RUN yum -y install update git unzip docker

COPY init.sh /opt/init.sh

# Terraform install
RUN curl -L -O https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip
RUN unzip terraform_${TERRAFORM_VER}_linux_amd64.zip -d /usr/sbin && rm *.zip

# NodeJS install
RUN touch ~/.bashrc && chmod +x ~/.bashrc
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VER}/install.sh | bash
RUN source ~/.bashrc && nvm install ${NODE_VER}

# AWS CLI latest version install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -q awscliv2.zip && rm *.zip
RUN ./aws/install

VOLUME /var/lib/docker
