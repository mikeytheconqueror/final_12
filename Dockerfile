FROM golang:1.25

WORKDIR /app

COPY go.mod ./
COPY *.go ./

RUN go build -o /parcel-tracker

FROM alpine:latest

WORKDIR /root/

COPY --from=builder /parcel-tracker .

CMD ["./parcel-tracker"]