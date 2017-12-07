FROM golang:latest 
ARG version=v1
ADD . /go/ 
WORKDIR /go 
RUN go build -o main ./$version
RUN mv /go/main /main
RUN rm -rf $GOPATH
EXPOSE 8080
CMD ["/main"]
