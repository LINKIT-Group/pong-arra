FROM golang:latest 
ARG version=v1
RUN mkdir /app 
ADD . /app/ 
WORKDIR /app 
RUN go build -o main ./$version
EXPOSE 8080
CMD ["/app/main"]