FROM kpango/dev-base:latest AS env

LABEL maintainer="kpango <kpango@vdaas.org>"

ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/lib:/usr/local/lib:/lib:/lib64:/var/lib:/google-cloud-sdk/lib:/usr/local/go/lib:/usr/lib/dart/lib:/usr/lib/node_modules/lib


ENV USER kpango
ENV HOME /home/${USER}
ENV SHELL /usr/bin/zsh
ENV GROUP sudo,root,users,docker
ENV UID 1000
ENV GID 985

RUN addgroup --gid ${GID} docker \
    && useradd --uid ${UID} --create-home --shell ${SHELL} --base-dir ${HOME} -G ${GROUP} ${USER} \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && sed -i -e 's/# %users\tALL=(ALL)\tNOPASSWD: ALL/%users\tALL=(ALL)\tNOPASSWD: ALL/' /etc/sudoers \
    && sed -i -e 's/%users\tALL=(ALL)\tALL/# %users\tALL=(ALL)\tALL/' /etc/sudoers \
    && visudo -c


WORKDIR /tmp
RUN echo $'/lib\n\
/lib64\n\
/var/lib\n\
/usr/lib\n\
/usr/local/lib\n\
/usr/local/go/lib\n\
/usr/local/clang/lib\n\
/usr/lib/dart/lib\n\
/usr/lib/node_modules/lib\n\
/google-cloud-sdk/lib' > /etc/ld.so.conf.d/usr-local-lib.conf \
    && echo $(ldconfig) \
    && apt update -y \
    && apt upgrade -y \
    && apt install -y --no-install-recommends --fix-missing \
    bash \
    diffutils \
    exuberant-ctags \
    gawk \
    gnupg \
    graphviz \
    jq \
    less \
    libhdf5-serial-dev \
    libomp-dev \
    libprotobuf-dev \
    libprotoc-dev \
    luajit \
    mariadb-client \
    mtr \
    ncurses-term \
    neovim \
    nodejs \
    npm \
    openssh-client \
    pass \
    perl \
    protobuf-compiler \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-venv \
    ruby-dev \
    sed \
    tar \
    tig \
    tmux \
    xclip \
    && rm -rf /var/lib/apt/lists/* \
    && pip3 install --upgrade pip neovim ranger-fm thefuck httpie python-language-server vim-vint grpcio-tools \
    && gem install neovim -N \
    && npm config set user ${USER} \
    && npm install -g \
        bash-language-server \
        dockerfile-language-server-nodejs \
        markdownlint-cli \
        n \
        neovim \
        npm \
        prettier \
        resume-cli \
        typescript \
        typescript-language-server \
        yarn \
    && n stable \
    && apt purge -y nodejs npm \
    && git clone https://github.com/soimort/translate-shell \
    && cd /tmp/translate-shell/ \
    && make TARGET=zsh -j -C /tmp/translate-shell \
    && make install -C /tmp/translate-shell \
    && cd /tmp \
    && rm -rf /tmp/translate-shell/ \
    && apt -y autoremove

WORKDIR /tmp
ENV NGT_VERSION 1.12.2
ENV CFLAGS "-mno-avx512f -mno-avx512dq -mno-avx512cd -mno-avx512bw -mno-avx512vl"
ENV CXXFLAGS ${CFLAGS}
# ENV LDFLAGS="-L/usr/local/opt/llvm/lib"
# ENV CPPFLAGS="-I/usr/local/opt/llvm/include"
RUN curl -LO "https://github.com/yahoojapan/NGT/archive/v${NGT_VERSION}.tar.gz" \
    && tar zxf "v${NGT_VERSION}.tar.gz" -C /tmp \
    && cd "/tmp/NGT-${NGT_VERSION}" \
    && cmake -DNGT_LARGE_DATASET=ON . \
    && make -j -C "/tmp/NGT-${NGT_VERSION}" \
    && make install -C "/tmp/NGT-${NGT_VERSION}" \
    && cd /tmp \
    && rm -rf /tmp/*

WORKDIR /tmp
ENV TENSORFLOW_C_VERSION 2.3.0
RUN curl -LO https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-cpu-linux-x86_64-${TENSORFLOW_C_VERSION}.tar.gz \
    && tar -C /usr/local -xzf libtensorflow-cpu-linux-x86_64-${TENSORFLOW_C_VERSION}.tar.gz \
    && rm -f libtensorflow-cpu-linux-x86_64-${TENSORFLOW_C_VERSION}.tar.gz \
    && ldconfig \
    && rm -rf /tmp/* /var/cache

WORKDIR ${HOME}
