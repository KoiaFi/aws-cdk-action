FROM alpine:3

LABEL name="aws-cdk-action"
LABEL repository="https://github.com/KoiaFi/aws-cdk-action"
LABEL homepage="https://github.com/KoiaFi/aws-cdk-action"
LABEL org.opencontainers.image.source="https://github.com/KoiaFi/aws-cdk-action"

LABEL "com.github.actions.name"="koia-aws-cdk-action"
LABEL "com.github.actions.description"="GitHub Action for AWS CDK"
LABEL "com.github.actions.icon"="box"
LABEL "com.github.actions.color"="yellow"

LABEL "maintainer"="Ben Riazy <ben@joinkoia.com>"

RUN apk --no-cache add nodejs npm python3 py3-pip
RUN npm install -g aws-cdk
RUN pip3 install aws-cdk.core

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
