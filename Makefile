all: install

install:
	go install -v

test:
	go run github.com/onsi/ginkgo/v2/ginkgo -mod vendor -r --keep-going -p --trace --randomize-all --race

fmt:
	go fmt ./...

fly:
	fly -t persi execute -c scripts/ci/run_unit.build.yml -i smbbroker=$$PWD
