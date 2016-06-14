TARGET		= app.example
UBUNTU_RELEASE 	= trusty

build:
	go build -v

test:
	go test -v

image:
	./scripts/image.sh

run:
	./scripts/run.sh
