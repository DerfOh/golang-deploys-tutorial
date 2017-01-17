FROM golang:latest
MAINTAINER Fredrick Paulin <fredrick.p@outlook.com>

# Create the directory for the application to run from
RUN mkdir /app 

# Add the contents of the current directory to the dockerimage
ADD . /app/ 

#Set your working directory
WORKDIR /app 

# While not needed for this particular example you can include any dependencies
# here that you need for your app.
# The following is an example of getting the mysql package
RUN go get github.com/go-sql-driver/mysql

# Build the application
RUN go build -o main . 

# Set the port that your web application communicates on
EXPOSE 80:80

# This is the command that runs by defualt when the container is run, include
# any flags or arguments for your app here.
CMD ["/app/main"]
