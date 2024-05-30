FROM golang:alpine as builder
WORKDIR /src
COPY . .
RUN go build -o main main.go

FROM scratch
COPY --from=builder /src/main /main
ENTRYPOINT ["/main"]