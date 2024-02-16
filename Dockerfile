FROM golang:1.21.3-bullseye
ARG OAPI_CODEGEN_VERSION
ENV CGO_ENABLED=0
ENV GO111MODULE=on

RUN go install github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen@${OAPI_CODEGEN_VERSION}

ENTRYPOINT ["oapi-codegen"]