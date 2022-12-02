FROM golang:1.19.3

RUN go install -v std
RUN go install -v -trimpath std

# ignore "-race is not supported on linux/arm"
RUN go install -v -race std; exit 0
RUN go install -v -trimpath -race std; exit 0
