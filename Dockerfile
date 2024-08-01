FROM golang:1.21.3-bullseye AS builder
ARG OAPI_CODEGEN_VERSION
ENV CGO_ENABLED=0
ENV GO111MODULE=on

RUN go install github.com/deepmap/oapi-codegen/v2/cmd/oapi-codegen@${OAPI_CODEGEN_VERSION}

FROM scratch
COPY --from=builder /go/bin/oapi-codegen /usr/bin/
ENTRYPOINT ["/usr/bin/oapi-codegen"]