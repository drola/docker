Docker images
=============

Android
---

Go-static
---

Includes everything you need to build statically linked Go apps


Example:

    FROM drola/go-static:latest
	ENV APP_DIR $GOPATH/src/dev.drola.si/callwhisper/server
	ENTRYPOINT ["/opt/app/server"]
	ADD . $APP_DIR
	RUN mkdir -p /opt/app && \
		cd $APP_DIR &&\
		godep get && \
		CGO_ENABLED=0 go build -o /opt/app/server -ldflags '-d -w -s'
