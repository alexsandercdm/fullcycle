FROM golang:1.22-alpine as build
WORKDIR /usr/src/app
COPY go.mod fullcycle.go ./
RUN go build -v -o ./fullcycle ./...



FROM scratch
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/fullcycle .
CMD ["/usr/src/app/fullcycle"]