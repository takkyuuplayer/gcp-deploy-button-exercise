FROM golang AS build
WORKDIR /workspace
COPY go.mod /workspace/
RUN go mod download
COPY . /workspace
RUN go build -o main

FROM gcr.io/distroless/base
WORKDIR /workspace
COPY --from=build /workspace/main /workspace/main
CMD ["/workspace/main"]
