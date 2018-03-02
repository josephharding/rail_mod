TAG=rail_mod
BIN=gen
VIRT_BUILD_DIR="/go/src/github.com/username/reponame"

make: Dockerfile app.go
	docker run --rm -v ${PWD}:${VIRT_BUILD_DIR} -w ${VIRT_BUILD_DIR} iron/go:dev /bin/sh -c "go get; go build -o ${BIN}"
	docker build -t rail_mod -f Dockerfile --build-arg bin=${BIN} .
	rm ${BIN}

push:
	docker tag ${TAG} gyrospike/${TAG}
	docker push gyrospike/${TAG}
