# Build Stage
FROM --platform=linux/amd64 ubuntu:20.04 as builder

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y cmake

## Add source code to the build stage.
ADD . /q3vm
WORKDIR /q3vm

## TODO: ADD YOUR BUILD INSTRUCTIONS HERE.
RUN make

#Package Stage
FROM --platform=linux/amd64 ubuntu:20.04

## TODO: Change <Path in Builder Stage>
COPY --from=builder /q3vm/q3vm /