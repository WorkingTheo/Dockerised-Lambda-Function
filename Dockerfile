FROM node:latest as lambda

WORKDIR /usr/src
COPY . .
RUN apt-get update
RUN apt-get install zip
RUN cd src && npm install && zip -r lambdas.zip . 

FROM localstack/localstack:2.3.2
COPY --from=lambda /usr/src/src/lambdas.zip ./lambdas.zip
