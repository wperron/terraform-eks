FROM hashicorp/terraform:light as deps
RUN apk update && \
  apk --no-cache add \
    curl=~7.67 \
    zip=~3.0 \
    unzip=~6.0 \
    tar=~1.32 && \
  rm -rf /var/cache/apk/*
RUN curl --silent --location -o ./terraform_0.12.20_linux_amd64.zip https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip && \
  unzip terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/ && \
  curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/kubectl && \
  chmod +x /usr/local/bin/kubectl && \
  curl --silent --location -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator && \
  curl --silent --location -o ./helm-v2.14.3-linux-amd64.tar.gz https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz && \
  tar -zxvf helm-v2.14.3-linux-amd64.tar.gz && \
  mv linux-amd64/helm /usr/local/bin/

FROM hashicorp/terraform:light

COPY --from=deps /lib /lib
COPY --from=deps /bin /bin
COPY --from=deps /usr/local/bin /usr/local/bin
