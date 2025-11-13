FROM golang:1.25-alpine

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

COPY tracker.db ./

RUN go build -o parcel-tracker .

CMD ["./parcel-tracker"]