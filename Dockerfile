FROM golang:1.9.2-alpine3.6  as build
ARG version=v1
RUN echo $GOPATH
WORKDIR /$GOPATH/src/github.com/linkit-group/pong-arra/
ADD . .
RUN go build -o /main ./$version

FROM alpine:3.6
COPY --from=build /main /main
EXPOSE 8080
CMD ["/main"]
