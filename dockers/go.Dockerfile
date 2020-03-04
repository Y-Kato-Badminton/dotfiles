FROM kpango/dev-base:latest AS go-base

ENV GO_VERSION 1.14
ENV GO111MODULE on
ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No
ENV LANG en_US.UTF-8
ENV GOROOT /opt/go
ENV GOPATH /go
ENV GOFLAGS "-ldflags=-w -ldflags=-s"

WORKDIR /opt
RUN curl -sSL -O "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" \
    && tar zxf "go${GO_VERSION}.linux-amd64.tar.gz" \
    && rm "go${GO_VERSION}.linux-amd64.tar.gz" \
    && ln -s /opt/go/bin/go /usr/bin/ \
    && mkdir $GOPATH

FROM go-base AS gojson
RUN GO111MODULE=on go get -u  \
    github.com/ChimeraCoder/gojson/gojson

FROM go-base AS syncmap
RUN GO111MODULE=on go get -u  \
    github.com/a8m/syncmap

FROM go-base AS gotests
RUN GO111MODULE=on go get -u  \
    github.com/cweill/gotests/gotests

FROM go-base AS fillstruct
RUN GO111MODULE=on go get -u  \
    github.com/davidrjenni/reftools/cmd/fillstruct

FROM go-base AS gomodifytags
RUN GO111MODULE=on go get -u  \
    github.com/fatih/gomodifytags

FROM go-base AS chidley
RUN GO111MODULE=on go get -u  \
    github.com/gnewton/chidley

FROM go-base AS dlv
RUN GO111MODULE=on go get -u  \
    github.com/go-delve/delve/cmd/dlv

FROM go-base AS hub
RUN GO111MODULE=on go get -u  \
    github.com/github/hub

FROM go-base AS impl
RUN GO111MODULE=on go get -u  \
    github.com/josharian/impl

FROM go-base AS gotags
RUN GO111MODULE=on go get -u  \
    github.com/jstemmer/gotags

FROM go-base AS errcheck
RUN GO111MODULE=on go get -u  \
    github.com/kisielk/errcheck

FROM go-base AS iferr
RUN GO111MODULE=on go get -u  \
    github.com/koron/iferr

FROM go-base AS dragon-imports
RUN GO111MODULE=on go get -u  \
    github.com/monochromegane/dragon-imports/cmd/dragon-imports

FROM go-base AS ghq
RUN GO111MODULE=on go get -u  \
    github.com/x-motemen/ghq

FROM go-base AS gocode
RUN GO111MODULE=on go get -u  \
    github.com/nsf/gocode

FROM go-base AS goimports-update-ignore
RUN GO111MODULE=on go get -u  \
    github.com/pwaller/goimports-update-ignore

FROM go-base AS godef
RUN GO111MODULE=on go get -u  \
    github.com/rogpeppe/godef

FROM go-base AS efm
RUN GO111MODULE=on go get -u  \
    github.com/mattn/efm-langserver

FROM go-base AS golint
RUN GO111MODULE=on go get -u  \
    golang.org/x/lint/golint

FROM go-base AS goimports
RUN GO111MODULE=on go get -u  \
    golang.org/x/tools/cmd/goimports

FROM go-base AS ghz
RUN GO111MODULE=on go get -u  \
    github.com/bojand/ghz/cmd/ghz

FROM go-base AS gopls
RUN GO111MODULE=on go get \
    golang.org/x/tools/gopls@latest

FROM go-base AS gorename
RUN GO111MODULE=on go get -u  \
    golang.org/x/tools/cmd/gorename

FROM go-base AS guru
RUN GO111MODULE=on go get -u  \
    golang.org/x/tools/cmd/guru

FROM go-base AS keyify
RUN GO111MODULE=on go get -u  \
    honnef.co/go/tools/cmd/keyify

FROM go-base AS goreturns
RUN GO111MODULE=on go get -u  \
    sourcegraph.com/sqs/goreturns

FROM go-base AS hugo
RUN git clone https://github.com/gohugoio/hugo --depth 1 \
    && cd hugo \
    && go install

FROM go-base AS prototool
RUN GO111MODULE=on go get -u \
    github.com/uber/prototool/cmd/prototool@dev

FROM golangci/golangci-lint:latest AS golangci-lint

FROM go-base AS go

COPY --from=chidley $GOPATH/bin/chidley $GOPATH/bin/chidley
COPY --from=dlv $GOPATH/bin/dlv $GOPATH/bin/dlv
COPY --from=dragon-imports $GOPATH/bin/dragon-imports $GOPATH/bin/dragon-imports
COPY --from=efm $GOPATH/bin/efm-langserver $GOPATH/bin/efm-langserver
COPY --from=errcheck $GOPATH/bin/errcheck $GOPATH/bin/errcheck
COPY --from=fillstruct $GOPATH/bin/fillstruct $GOPATH/bin/fillstruct
COPY --from=ghq $GOPATH/bin/ghq $GOPATH/bin/ghq
COPY --from=ghz $GOPATH/bin/ghz $GOPATH/bin/ghz
COPY --from=gocode $GOPATH/bin/gocode $GOPATH/bin/gocode
COPY --from=godef $GOPATH/bin/godef $GOPATH/bin/godef
COPY --from=goimports $GOPATH/bin/goimports $GOPATH/bin/goimports
COPY --from=goimports-update-ignore $GOPATH/bin/goimports-update-ignore $GOPATH/bin/goimports-update-ignore
COPY --from=gojson $GOPATH/bin/gojson $GOPATH/bin/gojson
COPY --from=golangci-lint /usr/bin/golangci-lint $GOPATH/bin/golangci-lint
COPY --from=golint $GOPATH/bin/golint $GOPATH/bin/golint
COPY --from=gomodifytags $GOPATH/bin/gomodifytags $GOPATH/bin/gomodifytags
COPY --from=gopls $GOPATH/bin/gopls $GOPATH/bin/gopls
COPY --from=gorename $GOPATH/bin/gorename $GOPATH/bin/gorename
COPY --from=goreturns $GOPATH/bin/goreturns $GOPATH/bin/goreturns
COPY --from=gotags $GOPATH/bin/gotags $GOPATH/bin/gotags
COPY --from=gotests $GOPATH/bin/gotests $GOPATH/bin/gotests
COPY --from=guru $GOPATH/bin/guru $GOPATH/bin/guru
COPY --from=hub $GOPATH/bin/hub $GOPATH/bin/hub
COPY --from=hugo $GOPATH/bin/hugo $GOPATH/bin/hugo
COPY --from=iferr $GOPATH/bin/iferr $GOPATH/bin/iferr
COPY --from=impl $GOPATH/bin/impl $GOPATH/bin/impl
COPY --from=keyify $GOPATH/bin/keyify $GOPATH/bin/keyify
COPY --from=prototool $GOPATH/bin/prototool $GOPATH/bin/prototool
COPY --from=syncmap $GOPATH/bin/syncmap $GOPATH/bin/syncmap

RUN upx -9 ${GOPATH}/bin/* \
    \
    && git clone https://github.com/brendangregg/FlameGraph /tmp/FlameGraph \
    && cp /tmp/FlameGraph/flamegraph.pl /go/bin/ \
    && cp /tmp/FlameGraph/stackcollapse.pl /go/bin/ \
    && cp /tmp/FlameGraph/stackcollapse-go.pl /go/bin/

FROM scratch
ENV GOROOT /opt/go
ENV GOPATH /go
COPY --from=go $GOROOT/bin $GOROOT/bin
COPY --from=go $GOROOT/src $GOROOT/src
COPY --from=go $GOROOT/lib $GOROOT/lib
COPY --from=go $GOROOT/pkg $GOROOT/pkg
COPY --from=go $GOROOT/misc $GOROOT/misc
COPY --from=go /go/bin $GOPATH/bin
