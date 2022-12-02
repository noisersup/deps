FROM golang:1.19.3

# ignore "-race is not supported on linux/arm"
RUN go install -v -race std; exit 0
