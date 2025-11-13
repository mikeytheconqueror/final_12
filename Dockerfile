FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY . .
RUN go mod init parcel-tracker
RUN go mod tidy
RUN CGO_ENABLED=0 go build -o /parcel-tracker

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /parcel-tracker .
CMD ["./parcel-tracker"]