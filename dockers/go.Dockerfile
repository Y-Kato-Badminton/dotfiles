FROM golang:1.12-alpine AS go

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    git \
    curl \
    gcc \
    musl-dev \
    wget \
    upx

# RUN --mount=type=cache,target=/root/.cache/go-build \
#     go get -v -u \
RUN go get -u  \
    github.com/ChimeraCoder/gojson/gojson \
    github.com/a8m/syncmap \
    github.com/cweill/gotests/... \
    github.com/davidrjenni/reftools/cmd/fillstruct \
    github.com/derekparker/delve/cmd/dlv \
    github.com/dominikh/go-tools/cmd/keyify \
    github.com/fatih/gomodifytags \
    github.com/fatih/motion \
    github.com/gnewton/chidley \
    github.com/gohugoio/hugo \
    github.com/golang/dep/... \
    github.com/golangci/golangci-lint/cmd/golangci-lint \
    # github.com/goodwithtech/dockle/cmd/dockle \
    github.com/josharian/impl \
    github.com/jstemmer/gotags \
    github.com/kisielk/errcheck \
    github.com/klauspost/asmfmt/cmd/asmfmt \
    # github.com/knqyf263/trivy/cmd/trivy \
    github.com/koron/iferr \
    github.com/mattn/efm-langserver \
    github.com/motemen/ghq \
    github.com/motemen/go-iferr/cmd/goiferr \
    github.com/nsf/gocode \
    github.com/orisano/dlayer \
    github.com/orisano/minid \
    github.com/pwaller/goimports-update-ignore \
    github.com/rogpeppe/godef \
    github.com/sugyan/ttygif \
    github.com/uber/go-torch \
    # github.com/wagoodman/dive \
    github.com/zmb3/gogetdoc \
    golang.org/x/lint/golint \
    golang.org/x/tools/cmd/goimports \
    golang.org/x/tools/cmd/gopls \
    golang.org/x/tools/cmd/gorename \
    golang.org/x/tools/cmd/guru \
    google.golang.org/grpc \
    honnef.co/go/tools/cmd/keyify \
    sourcegraph.com/sqs/goreturns \
    && git clone https://github.com/saibing/bingo.git \
    && cd bingo \
    && GO111MODULE=on go install \
    && upx --best --ultra-brute ${GOPATH}/bin/* \
    && git clone https://github.com/brendangregg/FlameGraph /tmp/FlameGraph \
    && cp /tmp/FlameGraph/flamegraph.pl /go/bin/ \
    && cp /tmp/FlameGraph/stackcollapse.pl /go/bin/ \
    && cp /tmp/FlameGraph/stackcollapse-go.pl /go/bin/

