#!/usr/local/bin/zsh

if [ -z $DOTENV_LOADED ]; then
    stty stop undef
    stty start undef

    setopt no_global_rcs
    if [ -x /usr/libexec/path_helper ]; then
        PATH=""
        eval "$(/usr/libexec/path_helper -s)"
    fi

    # 環境変数
    export LANG=en_US.UTF-8
    export MANLANG=ja_JP.UTF-8
    export LC_TIME=en_US.UTF-8

    export PASSWORD="PASSWORD"

    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    export SHELL=$(which zsh)

    export CPUCORES="$(getconf _NPROCESSORS_ONLN)"

    #プログラミング環境構築
    export PROGRAMMING=$HOME/Documents/Programming;
    export XDG_CONFIG_HOME=$HOME/.config;
    export NVIM_HOME=$XDG_CONFIG_HOME/nvim;
    export XDG_DATA_HOME=$NVIM_HOME/log;
    export NVIM_LOG_FILE_PATH=$XDG_DATA_HOME;
    export NVIM_TUI_ENABLE_TRUE_COLOR=1;
    export NVIM_PYTHON_LOG_LEVEL=WARNING;
    export NVIM_PYTHON_LOG_FILE=$NVIM_LOG_FILE_PATH/nvim.log;

    export LLVM_HOME=/usr/local/opt/llvm;

    #GO
    export GOPATH=$PROGRAMMING/go;
    export CGO_ENABLED=1;
    export GOBIN=$GOPATH/bin;
    export GO15VENDOREXPERIMENT=1;
    export NVIM_GO_LOG_FILE=$XDG_DATA_HOME/go;
    export CGO_CFLAGS="-g -Ofast -march=native"
    export CGO_CPPFLAGS="-g -Ofast -march=native"
    export CGO_CXXFLAGS="-g -Ofast -march=native"
    export CGO_FFLAGS="-g -Ofast -march=native"
    export CGO_LDFLAGS="-g -Ofast -march=native"

    #Nim
    export NIMPATH=/usr/local/bin/Nim;
    export NIMBLE_PATH=$HOME/.nimble;

    # Rust
    export RUST_SRC_PATH=/usr/local/src/rust/src;
    export RUST_BACKTRACE=1;
    export CARGO_HOME=$HOME/.cargo;

    #QT
    export QT_HOME=/usr/local/opt/qt;

    # IntelliJ
    export NVIM_LISTEN_ADDRESS="127.0.0.1:7650";

    # CoreUtil
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH

    #JAVA
    if type java >/dev/null 2>&1; then
        export JDK_HOME=/Library/Java/JavaVirtualMachines/jdk$(java -version 2>&1 >/dev/null | grep 'java version' | sed -e 's/java\ version\ \"//g' -e 's/\"//g').jdk;
        export STUDIO_JDK=$JDK_HOME;
        export JAVA_HOME=$JDK_HOME/Contents/Home;
        export JAVA8_HOME=$JAVA_HOME;
        export JRE_HOME=$JAVA_HOME/jre/bin;
        export ANDROID_HOME=/usr/local/share/android-sdk;
        if type jetty >/dev/null 2>&1; then
            export JETTY_HOME=/usr/local/opt/jetty;
        fi
    fi

    if type composer >/dev/null 2>&1; then
        export COMPOSER_HOME="$HOME/.composer/vendor"
    fi

    # Athenz PATH
    export ATHENZ_HOME=/usr/local/athenz;

    if [ -z $TMUX ]; then
        export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/share/npm/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/go/bin:/opt/local/bin:$HOME/.cabal/bin:$HOME/.local/bin:$LLVM_HOME/bin:$GOBIN:$COMPOSER_HOME/bin:$JAVA_HOME/bin:$JRE_HOME:$NIMPATH/bin:$NIMBLE_PATH/bin:$CARGO_HOME:$CARGO_HOME/bin:$ATHENZ_HOME/bin:$HOME/Documents/Programming/go/src/github.com/uber/go-torch/FlameGraph:$PATH";
        #anyenv init
        if [ -d "$HOME/.anyenv" ] ; then
            export PATH="$HOME/.anyenv/bin:$HOME/.anyenv/libexec:$PATH"
            eval "$(anyenv init - --no-rehash zsh)"
        fi
    fi

    export PHP_BUILD_CONFIGURE_OPTS="--with-openssl=/usr/local/opt/openssl"
    export PYTHON_CONFIGURE_OPTS="--enable-framework"

    if type nvim >/dev/null 2>&1; then
        export VIM=$(which nvim);
        export VIMRUNTIME=/usr/local/share/nvim/runtime;
    else
        export VIM=$(which vim);
        export VIMRUNTIME=/usr/share/vim/vim*;
    fi

    export EDITOR=$VIM;
    export VISUAL=$VIM;
    export PAGER=$(which less);
    export SUDO_EDITOR=$EDITOR;

    #ReactNative
    export REACT_EDITOR=$EDITOR;

    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib64

    #LLVM
    # if type lld >/dev/null 2>&1; then
    #     export C=$LLVM_HOME/bin/clang;
    #     export CC=$LLVM_HOME/bin/clang;
    #     export CPP=$LLVM_HOME/bin/clang++;
    #     export CXX=$LLVM_HOME/bin/clang++;
    #     export LD_LIBRARY_PATH=$(llvm-config --libdir):$LD_LIBRARY_PATH;
    #     export LIBRARY_PATH=$LLVM_HOME/lib;
    #     export LLVM_CONFIG_PATH=$LLVM_HOME/bin/llvm-config;
    #
    #     #CLANG
    #     export CFLAGS=-I$LLVM_HOME/include:-I$QT_HOME/include:-I/usr/local/opt/openssl/include:$CFLAGS;
    #     export CPPFLAGS=$CFLAGS;
    #     export LDFLAGS=-L$LLVM_HOME/lib:-L$QT_HOME/lib:-L/usr/local/opt/openssl/lib:-L/usr/local/opt/bison/lib:$LDFLAGS;
    #     export C_INCLUDE_PATH=$LLVM_HOME/include:$QT_HOME/include:$C_INCLUDE_PATH;
    #     export CPLUS_INCLUDE_PATH=$LLVM_HOME/include:$QT_HOME/include:$CPLUS_INCLUDE_PATH;
    # fi

    if type ndenv > /dev/null 2>&1; then
        export NODE_BIN="$(ndenv prefix)/bin"
        export PATH="$NODE_BIN:$PATH"
    fi

    if type go >/dev/null 2>&1; then
        export GOROOT="$(go env GOROOT)";
        export GOOS="$(go env GOOS)";
        export GOARCH="$(go env GOARCH)";
    fi

    export ZPLUG_HOME=$HOME/.zplug;

    if [ -e $ZPLUG_HOME/repos/zsh-users/zsh-completions ]; then
        fpath=($ZPLUG_HOME/repos/zsh-users/zsh-completions/src $fpath)
    fi

    #Node
    if type npm >/dev/null 2>&1; then
        export NODE_PATH=$(\npm root -g);
    fi

    if type vagrant > /dev/null 2>&1; then
        export VAGRANT_HOME=$HOME/Documents/vagrant;
    fi

    export HTTP_PROXY_HOST="HTTP_PROXY_HOST"
    export HTTP_PROXY_PORT="HTTP_PROXY_PORT"
    export HTTP_PROXY_PASSWORD="PASSWORD"
    export HTTPS_PROXY_HOST=$HTTP_PROXY_HOST
    export HTTPS_PROXY_PORT="HTTPS_PROXY_PORT"

    if type zplug >/dev/null 2>&1; then
        if zplug check junegunn/fzf; then
            export FZF_DEFAULT_COMMAND='rg --files --hidden --smartcase --glob "!.git/*"'
        fi

        if zplug check b4b4r07/enhancd; then
            export ENHANCD_FILTER=fzf-tmux
            export ENHANCD_COMMAND=ccd
            export ENHANCD_FILTER=fzf:peco:gof
            export ENHANCD_DOT_SHOW_FULLPATH=1
        fi
    fi

    if [ ! -f "$HOME/.zshrc.zwc" -o "$HOME/.zshrc" -nt "$HOME/.zshrc.zwc" ]; then
        zcompile $HOME/.zshrc
    fi

    if [ ! -f "$HOME/.zcompdump.zwc" -o "$HOME/.zcompdump" -nt "$HOME/.zcompdump.zwc" ]; then
        zcompile $HOME/.zcompdump
    fi
    export DOTENV_LOADED=1
fi

########################################
#Zplug Settings
if [[ -f ~/.zplug/init.zsh ]]; then

    source "$HOME/.zplug/init.zsh"

    zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
    zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
    zplug "soimort/translate-shell", at:stable, as:command, use:"build/*", hook-build:"make build &> /dev/null"
    zplug "zchee/go-zsh-completions"
    zplug "zsh-users/zsh-autosuggestions"
    zplug "zsh-users/zsh-completions", as:plugin, use:"src"
    zplug "zsh-users/zsh-history-substring-search"
    zplug "zsh-users/zsh-syntax-highlighting", defer:2

    if ! zplug check --verbose; then
        zplug install
    fi

    zplug load
else
    rm -rf $ZPLUG_HOME
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
    source "$HOME/.zshrc"
    return 0
fi

if ! [ -z $TMUX ]||[ -z $ZSH_LOADED ]; then

    # 色を使用出来るようにする
    autoload -Uz colors
    colors

    # ヒストリの設定
    HISTFILE=$HOME/.zsh_history
    HISTSIZE=1000000
    SAVEHIST=1000000
    setopt APPEND_HISTORY
    setopt SHARE_HISTORY
    setopt hist_ignore_all_dups
    setopt hist_ignore_space
    setopt hist_reduce_blanks
    setopt hist_save_no_dups
    LISTMAX=1000
    WORDCHARS="$WORDCHARS|:"
    export PROMPT_COMMAND='hcmd=$(history 1); hcmd="${hcmd# *[0-9]*  }"; if [[ ${hcmd%% *} == "cd" ]]; then pwd=$OLDPWD; else pwd=$PWD; fi; hcmd=$(echo -e "cd $pwd && $hcmd"); history -s "$hcmd"'

    # プロンプト
    PROMPT="%{${fg[cyan]}%}%/ $%{${reset_color}%} %"
    # PS1="%{${fg[green]}%}%/#%{${reset_color}%} %"

    # 単語の区切り文字を指定する
    autoload -Uz select-word-style
    select-word-style default

    # ここで指定した文字は単語区切りとみなされる
    # / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
    zstyle ':zle:*' word-chars " /=;@:{},|"
    zstyle ':zle:*' word-style unspecified

    ########################################
    # 補完
    # 補完機能を有効にする
    autoload -Uz compinit -C && compinit -C

    zstyle ':completion:*' format '%B%d%b'
    zstyle ':completion:*' group-name ''
    zstyle ':completion:*' ignore-parents parent pwd ..
    zstyle ':completion:*' keep-prefix
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    zstyle ':completion:*' menu select
    zstyle ':completion:*' squeeze-slashes true
    zstyle ':completion:*' verbose yes
    zstyle ':completion:*:(nano|vim|nvim|vi|emacs|e):*' ignored-patterns '*.(wav|mp3|flac|ogg|mp4|avi|mkv|webm|iso|dmg|so|o|a|bin|exe|dll|pcap|7z|zip|tar|gz|bz2|rar|deb|pkg|gzip|pdf|mobi|epub|png|jpeg|jpg|gif)'
    zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
    zstyle ':completion:*:*:*:*:*' menu select
    zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
    zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
    zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
    zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'expand'
    zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
    zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
    zstyle ':completion:*:default' list-prompt '%S%M matches%s'
    zstyle ':completion:*:default' menu select=1
    zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
    zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
    zstyle ':completion:*:history-words' list false
    zstyle ':completion:*:history-words' menu yes
    zstyle ':completion:*:history-words' remove-all-dups yes
    zstyle ':completion:*:history-words' stop yes
    zstyle ':completion:*:manuals' separate-sections true
    zstyle ':completion:*:manuals.(^1*)' insert-sections true
    zstyle ':completion:*:matches' group 'yes'
    zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
    zstyle ':completion:*:options' auto-description '%d'
    zstyle ':completion:*:options' description 'yes'
    zstyle ':completion:*:processes' command 'ps x -o pid, s, args'
    zstyle ':completion:*:rm:*' file-patterns '*:all-files'
    zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
    zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
    zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-${HOME}}/.zcompcache"
    zstyle ':completion::complete:*' use-cache on

    ########################################
    # vcs_info
    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook

    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

    _update_vcs_info_msg() {
        LANG=en_US.UTF-8 vcs_info
        RPROMPT="%F{green}${vcs_info_msg_0_} %F{gray}[%D{%Y-%m-%d %H:%M:%S}]"
    }
    add-zsh-hook precmd _update_vcs_info_msg

    ########################################
    # オプション
    setopt auto_cd              # ディレクトリ名だけでcdする
    setopt auto_list            # 補完候補を一覧表示
    setopt auto_menu            # 補完候補が複数あるときに自動的に一覧表示する
    setopt auto_param_keys      # カッコの対応などを自動的に補完
    setopt auto_pushd           # cd したら自動的にpushdする
    setopt correct
    setopt extended_glob
    setopt ignore_eof
    setopt interactive_comments # '#' 以降をコメントとして扱う
    setopt list_packed          # 補完候補を詰めて表示
    setopt list_types           # 補完候補一覧でファイルの種別をマーク表示
    setopt magic_equal_subst    # = の後はパス名として補完する
    setopt no_beep              # beep を無効にする
    setopt no_flow_control      # フローコントロールを無効にする
    setopt noautoremoveslash    # 最後のスラッシュを自動的に削除しない
    setopt nonomatch
    setopt notify               # バックグラウンドジョブの状態変化を即時報告
    setopt print_eight_bit      # 日本語ファイル名を表示可能にする
    setopt prompt_subst         # プロンプト定義内で変数置換やコマンド置換を扱う
    setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
    ########################################
    # ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
    bindkey -e
    bindkey '^R' history-incremental-pattern-search-backward

    fzf-z-search (){
        local res=$(history -n 1 | tail -f | fzf)
        if [ -n "$res" ]; then
            BUFFER+="$res"
            zle accept-line
        else
            return 0
        fi
    }
    zle -N fzf-z-search
    bindkey '^s' fzf-z-search

    # sudo の後のコマンドでエイリアスを有効にする
    alias sudo="echo $PASSWORD | sudo -S "

    if type git >/dev/null 2>&1; then
        alias gco="git checkout"
        alias gsta="git status"
        alias gcom="git commit -m"
        alias gdiff="git diff"
        alias gbra="git branch"
        gitthisrepo(){
            git symbolic-ref --short HEAD|tr -d "\n"
        }
        alias tb=gitthisrepo
        gfr(){
            git fetch;
            git reset --hard origin/$(tb);
        }
        alias gfr=gfr
        gfrs(){
            git fetch;
            git reset --hard origin/$(tb);
            git submodule foreach git pull origin master
        }
        alias gfrs=gfrs
        gitpull(){
            git pull --rebase origin $(tb)
        }
        alias gpull=gitpull
        gpush(){
            git push -u origin $(tb)
        }
        alias gpush=gpush
        gitcompush(){
            git add -A;
            git commit -m $1;
            git push -u origin $2;
        }
        alias gitcompush=gitcompush
        gcp(){
            gitcompush $1 "$(tb)";
        }
        alias gcp=gcp
        alias gfix="gcp fix"
        alias gedit="$EDITOR $HOME/.gitconfig"
    fi

    if type go >/dev/null 2>&1; then
        go-get(){
            sudo rm -rf $GOPATH/src/$1
            go get -u -f -v -fix $1;
            # go get -u $1;
            go install $1;
        }

        goup(){
            mv $GOPATH/src/github.com/kpango $HOME/
            sudo rm -rf "$GOPATH/bin" "$GOPATH/pkg"
            sudo rm -rf "$GOPATH/src/github.com"
            sudo rm -rf "$GOPATH/src/golang.org"
            sudo rm -rf "$GOPATH/src/google.golang.org"
            sudo rm -rf "$GOPATH/src/gopkg.in"
            sudo rm -rf "$GOPATH/src/code.cloudfoundry.org"
            sudo rm -rf "$GOPATH/src/sourcegraph.com"

            go-get github.com/Masterminds/glide &
            go-get github.com/cespare/prettybench &
            go-get github.com/concourse/fly &
            go-get github.com/cweill/gotests/... &
            go-get github.com/derekparker/delve/cmd/dlv &
            go-get github.com/gogo/protobuf/protoc-gen-gofast &
            go-get github.com/golang/dep/... &
            go-get github.com/gopherjs/gopherjs &
            go-get github.com/motemen/go-iferr/cmd/goiferr &
            go-get github.com/pwaller/goimports-update-ignore &
            go-get github.com/sugyan/ttygif &
            go-get github.com/tsenart/vegeta &
            go-get github.com/uber/go-torch &
            go-get golang.org/x/tools/cmd/present &
            go-get google.golang.org/grpc &
            go-get sourcegraph.com/sqs/goreturns &

            wait

            mkdir -p $GOPATH/src/github.com
            mv $HOME/kpango $GOPATH/src/github.com/

            $VIM main.go +GoInstall +GoInstallBinaries +GoUpdateBinaries +qall

            gocode set autobuild true
            gocode set lib-path $GOPATH/pkg/$GOOS\_$GOARCH/
            gocode set propose-builtins true
            gocode set unimported-packages true
            gometalinter -i
        }

        cover () {
            t=$(mktemp -t cover)
            go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -func=$t && unlink $t
        }
        cover-web() {
            t=$(mktemp -t cover)
            go test $COVERFLAGS -coverprofile=$t $@ && go tool cover -html=$t && unlink $t
        }

        alias goui=goimports-update-ignore
        alias goup=goup

        gobg-build(){
            while true;
            do 
                if [ ! $(git -C $PWD diff --name-only HEAD | wc -l ) -eq 0 ]; then
                    go build;
                    ./${PWD##*/};
                fi;
                sleep 2;
            done;
        }
        alias gobg-build=gobg-build

        go-bench(){
            if [ $# -eq 2 ]; then
                go test -count=$1 -run=NONE -bench $2 -benchmem
            else
                go test -count=$1 -run=NONE -bench . -benchmem
            fi
        }
        alias gobench=go-bench
        go-pprof-out(){
            go test -count=10 -run=NONE -bench=. -benchmem -o pprof/test.bin -cpuprofile pprof/cpu.out -memprofile pprof/mem.out
        }

    fi

    mkcd() {
        if [[ -d $1 ]]; then
            \cd $1
        else
            printf "Confirm to Make Directory? $1 [y/N]: "
            if read -q; then
                echo; \mkdir -p $1 && \cd $1
            fi
        fi
    }

    if type rustc >/dev/null 2>&1; then
        rust_run() {
            rustc $1
            local binary=$(basename $1 .rs)
            ./$binary
        }
        alias rust="rustc -O"
        alias rrun="rust_run"
    fi

    # エイリアス
    alias cp='cp -r'
    alias ln="sudo ln -Fsnfiv"
    alias mv='mv -i'

    if type axel >/dev/null 2>&1; then
        alias wget='axel -a -n 10'
    else
        alias wget='wget --no-cookies --no-check-certificate --no-dns-cache -4'
    fi

    alias mkdir='mkdir -p'
    alias gtrans='trans -b -e google'

    # グローバルエイリアス
    alias -g L='| less'
    alias -g G='| grep'

    if type exa >/dev/null 2>&1; then
        alias ll='exa -l'
        alias la='exa -aghHliS'
        alias lla='exa -aghHliSm'
        alias tree='exa -T'
        alias ls='exa -G'
        alias lg='la | rg'
    else
        alias ll='ls -la'
        alias ls='ls -G -F'
        alias lg='ls -a | rg'
    fi

    if type anyenv >/dev/null 2>&1; then
        anyenvup(){
            anyenv update --force;
            anyenv git gc --aggressive;
            anyenv git prune;
        }
        alias anyenvup=anyenvup
    fi

    if type nim >/dev/null 2>&1; then
        nimup(){
            CURRENT=$(pwd)
            \cd $NIMPATH;
            git -C $NIMPATH pull;
            nim c $NIMPATH/koch;
            $NIMPATH/koch boot -d:release;
            \cd $CURRENT
        }
        alias nimup=
    fi

    if type apm >/dev/null 2>&1; then
        atomup(){
            sudo apm update;
            sudo apm upgrade;
            sudo apm rebuild;
            sudo apm clean;
        }
        alias atomup=atomup
    fi

    if type gem >/dev/null 2>&1; then
        gemup(){
            echo $PASSWORD | sudo -S  chmod -R 777 $HOME/.anyenv/envs/rbenv/versions/;
            echo $PASSWORD | sudo -S  chmod -R 777 /Library/Ruby/;
            gem update --system;
            gem update;
        }
        alias gemup=gemup
    fi

    if type stack >/dev/null 2>&1; then
        haskellup(){
            stack upgrade;
            stack update;
            cabal update;
        }
        alias haskellup=haskellup
    fi

    if type npm >/dev/null 2>&1; then
        npmup(){
            npm i -g npm;
            npm update -g npm;
            npm update -g;
            npm upgrade -g;
        }
        alias npmup=npmup
    fi

    if type pip >/dev/null 2>&1; then
        pipup(){
            echo $PASSWORD | sudo -S chown -R $(whoami) $HOME/.anyenv/envs/pyenv/versions/$(python -V 2>&1 >/dev/null | sed -e 's/Python\ //g')/lib/python2.7/site-packages;
            pip install --upgrade pip;
            pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -P $CPUCORES pip install -U --upgrade;
        }
        alias pipup=pipup
    fi

    if type pip2 >/dev/null 2>&1; then
        pip2up(){
            echo $PASSWORD | sudo -S chown -R $(whoami) $HOME/.anyenv/envs/pyenv/versions/$(python -V 2>&1 >/dev/null | sed -e 's/Python\ //g')/lib/python2.7/site-packages;
            pip2 install --upgrade pip;
            pip2 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -P $CPUCORES pip2 install -U --upgrade;
        }
        alias pip2up=pip2up
    fi

    if type pip3 >/dev/null 2>&1; then
        pip3up(){
            echo $PASSWORD | sudo -S chown -R $(whoami) $HOME/.anyenv/envs/pyenv/versions/$(python3 -V 2>&1 >/dev/null | sed -e 's/Python\ //g')/lib/python3.7/site-packages;
            pip3 install --upgrade pip;
            pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -P $CPUCORES pip3 install -U --upgrade;
        }
        alias pip3up=pip3up
    fi

    alias mkcd=mkcd
    alias ..='\cd ../'
    alias ...='\cd ../../'
    alias ....='\cd ../../../'
    alias ,,='\cd ../'
    alias ,,,='\cd ../../'
    alias ,,,,='\cd ../../../'
    alias cdad='mkcd $HOME/Documents/Programming/Android'
    alias cdarch='mkcd $HOME/Documents/vagrant/ArchLinux'
    alias cdc='mkcd $HOME/Documents/Programming/C'
    alias cdcent='mkcd $HOME/Documents/vagrant/CentOS7'
    alias cddc='mkcd $HOME/Documents'
    alias cddl='mkcd $HOME/Downloads'
    alias cdex='mkcd $HOME/Documents/Programming/elixir'
    alias cdgo='mkcd $HOME/Documents/Programming/go/src'
    alias cdjava='mkcd $HOME/Documents/Programming/Java'
    alias cdjavaee='mkcd $HOME/Documents/Programming/JavaEE'
    alias cdjavafx='mkcd $HOME/Documents/Programming/JavaFX'
    alias cdjs='mkcd $HOME/Documents/Programming/JavaScript'
    alias cdlc='mkcd /usr/local/'
    alias cdmd='mkcd $HOME/Documents/Programming/Markdown/'
    alias cdnim='mkcd $HOME/Documents/Programming/Nim'
    alias cdnode='mkcd $HOME/Documents/Programming/Node'
    alias cdpg='mkcd $HOME/Documents/Programming/'
    alias cdph='mkcd $HOME/Documents/Programming/PHP'
    alias cdpl='mkcd $HOME/Documents/Programming/perl'
    alias cdpy='mkcd $HOME/Documents/Programming/Python'
    alias cdrb='mkcd $HOME/Documents/Programming/Ruby'
    alias cdrs='mkcd $HOME/Documents/Programming/rust'
    alias cdsh='mkcd $HOME/Documents/Programming/shells'
    alias cdv='mkcd $HOME/Documents/vagrant'
    alias cdvf='mkcd $HOME/Documents/vagrant/ForceVM'

    if type rails >/dev/null 2>&1; then
        alias railskill="kill -9 `ps aux | grep rails | awk '{print $2}'`"
    fi

    alias tarzip="tar Jcvf"
    alias tarunzip="tar Jxvf"
    alias f="open ."
    alias ks="ls "
    alias rm='sudo rm -rf'
    alias find='sudo find'
    alias grep='grep --color=auto'

    if type tmux >/dev/null 2>&1; then
        alias aliastx='alias | grep tmux'
        alias tmls='\tmux list-sessions'
        alias tmlc='\tmux list-clients'
        alias tkill='\tmux kill-server'
        alias tmkl='\tmux kill-session'
        alias tmaw='\tmux main-horizontal'
        alias tmuxa='\tmux -2 a -t'
    fi

    if type javac >/dev/null 2>&1; then
        alias javad="\javac -d64 -Dfile.encoding=UTF8"
        alias javacd="\javac -d64 -J-Dfile.encoding=UTF8"
    fi

    rsagen(){
        sudo -u $USER ssh-keygen -t rsa -b 4096 -P $1 -f $HOME/.ssh/id_rsa -C $USER
    }
    alias rsagen=rsagen
    ecdsagen(){
        sudo -u $USER ssh-keygen -t ecdsa -b 521 -P $1 -f $HOME/.ssh/id_ecdsa -C $USER
    }
    alias ecdsagen=ecdsagen

    alias sedit="$EDITOR $HOME/.ssh/config"
    sshls(){
        rg "Host " $HOME/.ssh/config | awk '{print $2}' | rg -v "\*"
    }
    alias sshls=sshls
    alias sshinit="sudo rm -rf $HOME/.ssh/known_hosts;chmod 600 $HOME/.ssh/config"

    alias tedit="$EDITOR $HOME/.tmux.conf"

    zscompile(){
        for f in $(find $HOME -name "*.zsh"); do
            zcompile $f;
        done;
    }
    alias zscompile=zscompile
    zshaddhistory(){
        whence ${${(z)1}[1]} >| /dev/null || return 1
    }
    alias zshaddhistory=zshaddhistory

    zsup(){
        sudo rm -rf $HOME/.zcompd*;
        sudo rm -rf $HOME/.zplug/zcompd*;
        sudo rm $HOME/.zshrc.zwc;
        zplug update;
        zplug clean;
        zplug clear;
        zplug info;
        sudo rm -rf $HOME/.bashrc;
        sudo rm -rf $HOME/.fzf.bash;
        zscompile;
    }
    alias zsup=zsup

    zsinit(){
        sudo rm -rf $ZPLUG_HOME;
        sudo rm -rf $HOME/.zcompd*;
        sudo rm -rf $HOME/.zplug/zcompd*;
        sudo rm -rf $HOME/.zshrc.zwc;
    }
    alias zsinit=zsinit

    zstime(){
        for i in $(seq 1 $1); do
            time (zsh -i -c exit);
        done
    }
    alias zstime=zstime

    alias zedit="$EDITOR $HOME/.zshrc"

    alias zsback="cp $HOME/.zshrc $HOME/.zshrc.back"

    greptext(){
        if [ $# -eq 2 ]; then
            if type rg >/dev/null 2>&1; then
                rg $2 $1
            elif type jvgrep >/dev/null 2>&1; then
                jvgrep -I -R $2 $1 --exclude '(^|\/)\.zsh_history$|(^|\/)\.z$|(^|\/)\.cache|\.emlx$|\.mbox$|\.tar*|(^|\/)\.glide|(^|\/)\.stack|(^|\/)\.gradle|(^|\/)vendor|(^|\/)Application\ Support|(^|\/)\.cargo|(^|\/)com\.apple\.|(^|\/)\.idea|(^|\/)\.zplug|(^|\/)\.nimble|(^|\/)build|(^|\/)node_modules|(^|\/)\.git$|(^|\/)\.svn$|(^|\/)\.hg$|\.o$|\.obj$|\.a$|\.exe~?$|(^|\/)tags$'
            else
                find $1 -type d \( -name 'vendor' -o -name '.git' -o -name '.svn' -o -name 'build' -o -name '*.mbox' -o -name '.idea' -o -name '.cache' -o -name 'Application\ Support' \) \
                    -prune -o -type f \( -name '.zsh_history' -o -name '*.zip' -o -name '*.tar.gz' -o -name '*.tar.xz' -o -name '*.o' -o -name '*.so' -o -name '*.dll' -o -name '*.a' -o -name '*.out' -o -name '*.pdf' -o -name '*.swp' -o -name '*.bak' -o -name '*.back' -o -name '*.bac' -o -name '*.class' -o -name '*.bin' -o -name '.z' -o -name '*.dat' -o -name '*.plist' -o -name '*.db' -o -name '*.webhistory' \) \
                    -prune -o -type f -print0 | xargs -0 -P $CPUCORES grep -rnwe $2 /dev/null
            fi
        else
            echo "Not enough arguments"
        fi
    }
    alias gt=greptext

   chword(){
        if [ $# -eq 3 ]; then
            if type rg >/dev/null 2>&1; then
                rg -l $2 $1 | xargs -t -P $CPUCORES sed -i "" -E "s/$2/$3/g";
            elif type jvgrep >/dev/null 2>&1; then
                jvgrep -I -R $2 $1 --exclude '(^|\/)\.zsh_history$|(^|\/)\.z$|(^|\/)\.cache|\.emlx$|\.mbox$|\.tar*|(^|\/)\.glide|(^|\/)\.stack|(^|\/)\.anyenv|(^|\/)\.gradle|(^|\/)vendor|(^|\/)Application\ Support|(^|\/)\.cargo|(^|\/)\.config|(^|\/)com\.apple\.|(^|\/)\.idea|(^|\/)\.zplug|(^|\/)\.nimble|(^|\/)build|(^|\/)node_modules|(^|\/)\.git$|(^|\/)\.svn$|(^|\/)\.hg$|\.o$|\.obj$|\.a$|\.exe~?$|(^|\/)tags$' -l -r \
                    | xargs -t -P $CPUCORES sed -i "" -e "s/$2/$3/g";
            else
                find $1 -type d \( -name 'vendor' -o -name '.git' -o -name '.svn' -o -name 'build' -o -name '*.mbox' -o -name '.idea' -o -name '.cache' -o -name 'Application\ Support' \) \
                    -prune -o -type f \( -name '.zsh_history' -o -name '*.zip' -o -name '*.tar.gz' -o -name '*.tar.xz' -o -name '*.o' -o -name '*.so' -o -name '*.dll' -o -name '*.a' -o -name '*.out' -o -name '*.pdf' -o -name '*.swp' -o -name '*.bak' -o -name '*.back' -o -name '*.bac' -o -name '*.class' -o -name '*.bin' -o -name '.z' -o -name '*.dat' -o -name '*.plist' -o -name '*.db' -o -name '*.webhistory' \) \
                    -prune -o -type f -print0 | xargs -0 -P $CPUCORES grep -rnwe $2 | xargs -t -P $CPUCORES sed -i "" -e "s/$2/$3/g";
            fi
        elif [ $# -eq 4 ]; then
            if type rg >/dev/null 2>&1; then
                rg -l $2 $1 | xargs -t -P $CPUCORES sed -i "" -E "s$4$2$4$3$4g";
            elif type jvgrep >/dev/null 2>&1; then
                jvgrep -I -R $2 $1 --exclude '(^|\/)\.zsh_history$|(^|\/)\.z$|(^|\/)\.cache|\.emlx$|\.mbox$|\.tar*|(^|\/)\.glide|(^|\/)\.stack|(^|\/)\.anyenv|(^|\/)\.gradle|(^|\/)vendor|(^|\/)Application\ Support|(^|\/)\.cargo|(^|\/)\.config|(^|\/)com\.apple\.|(^|\/)\.idea|(^|\/)\.zplug|(^|\/)\.nimble|(^|\/)build|(^|\/)node_modules|(^|\/)\.git$|(^|\/)\.svn$|(^|\/)\.hg$|\.o$|\.obj$|\.a$|\.exe~?$|(^|\/)tags$' -l -r \
                    | xargs -t -P $CPUCORES sed -i "" -e "s$4$2$4$3$4g";
            else
                find $1 -type d \( -name 'vendor' -o -name '.git' -o -name '.svn' -o -name 'build' -o -name '*.mbox' -o -name '.idea' -o -name '.cache' -o -name 'Application\ Support' \) \
                    -prune -o -type f \( -name '.zsh_history' -o -name '*.zip' -o -name '*.tar.gz' -o -name '*.tar.xz' -o -name '*.o' -o -name '*.so' -o -name '*.dll' -o -name '*.a' -o -name '*.out' -o -name '*.pdf' -o -name '*.swp' -o -name '*.bak' -o -name '*.back' -o -name '*.bac' -o -name '*.class' -o -name '*.bin' -o -name '.z' -o -name '*.dat' -o -name '*.plist' -o -name '*.db' -o -name '*.webhistory' \) \
                    -prune -o -type f -print0 | xargs -0 -P $CPUCORES grep -rnwe $2 | xargs -t -P $CPUCORES sed -i "" -e "s$4$2$4$3$4g";
            fi
        else
            echo "Not enough arguments"
        fi
    }
    alias chword=chword;

    alias :q=exit;

    alias 600='chmod -R 600'
    alias 644='chmod -R 644'
    alias 655='chmod -R 655'
    alias 755='chmod -R 755'
    alias 777='chmod -R 777'

    nvinstall(){
        sudo rm -rf $HOME/neovim
        sudo rm -rf /usr/local/bin/nvim
        sudo rm -rf /usr/local/share/nvim
        rm -rf "$HOME/.config/gocode";
        rm -rf "$HOME/.config/nvim/autoload";
        rm -rf "$HOME/.config/nvim/ftplugin";
        rm -rf "$HOME/.config/nvim/log";
        rm -rf "$HOME/.config/nvim/plugged";
        rm "$HOME/.nvimlog";
        rm "$HOME/.viminfo";
        cd $HOME
        git clone https://github.com/neovim/neovim
        cd neovim
        rm -r build/
        make clean
        make CMAKE_BUILD_TYPE=RelWithDebInfo
        sudo make install
        cd ../
        rm -rf neovim
        nvim +UpdateRemotePlugins +PlugInstall +PlugUpdate +PlugUpgrade +PlugClean +qall;
        \wget -P "$HOME/.config/nvim/plugged/nvim-go/syntax/" https://raw.githubusercontent.com/fatih/vim-go/master/syntax/go.vim;
        mv "$HOME/.config/nvim/plugged/nvim-go/bin/nvim-go-$GOOS-$GOARCH" "$HOME/.config/nvim/plugged/nvim-go/bin/nvim-go";
    }
    alias nvinstall=nvinstall

    if type nvim >/dev/null 2>&1; then

        alias nvup="nvim +UpdateRemotePlugins +PlugInstall +PlugUpdate +PlugUpgrade +PlugClean +qall"; 

        nvim-init(){
            rm -rf "$HOME/.config/gocode";
            rm -rf "$HOME/.config/nvim/autoload";
            rm -rf "$HOME/.config/nvim/ftplugin";
            rm -rf "$HOME/.config/nvim/log";
            rm -rf "$HOME/.config/nvim/plugged";
            nvup;
            rm "$HOME/.nvimlog";
            rm "$HOME/.viminfo";
            \wget -P "$HOME/.config/nvim/plugged/nvim-go/syntax/" https://raw.githubusercontent.com/fatih/vim-go/master/syntax/go.vim;
            mv "$HOME/.config/nvim/plugged/nvim-go/bin/nvim-go-${GOOS}-${GOARCH}" "$HOME/.config/nvim/plugged/nvim-go/bin/nvim-go";
        }
        alias vedit="$EDITOR $HOME/.config/nvim/init.vim"
        alias nvinit="nvim-init";
        alias vback="cp $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vim.back";
    else
        alias vedit="$EDITOR $HOME/.vimrc"
    fi

    alias vi="$EDITOR"
    alias vim="$EDITOR"
    alias bim="$EDITOR"
    alias cim="$EDITOR"
    alias v="$EDITOR"
    alias vspdchk="rm -rf /tmp/starup.log && $EDITOR --startuptime /tmp/startup.log +q && less /tmp/startup.log"

    # OS 別の設定
    case ${OSTYPE} in
        darwin*)
            proxy(){
                if [ $1 = "start" ]; then
                    export http_proxy="http://$HTTP_PROXY_HOST:$HTTP_PROXY_PORT";
                    export HTTP_PROXY="http://$HTTP_PROXY_HOST:$HTTP_PROXY_PORT";
                    sudo networksetup -setwebproxy Wi-Fi $HTTP_PROXY_HOST $HTTP_PROXY_PORT;
                    sudo networksetup -setwebproxystate Wi-Fi on;
                elif [ $1 = "stop" ]; then
                    export http_proxy="";
                    export HTTP_PROXY="";
                    unset http_proxy;
                    unset HTTP_PROXY;
                    sudo networksetup -setwebproxy Wi-Fi $HTTP_PROXY_HOST $HTTP_PROXY_PORT;
                    sudo networksetup -setwebproxystate Wi-Fi off
                elif [ $1 = "status" ]; then
                    echo $http_proxy;
                fi
                ssh ci "echo $HTTP_PROXY_PASSWORD | sudo -S systemctl $1 proxy"
            }

            dns(){
                if [ $1 = "start" ]; then
                    sudo networksetup -setdnsservers Wi-Fi  106.186.17.181 129.250.35.250 129.250.35.251 8.8.8.8 8.8.4.4
                elif [ $1 = "stop" ]; then
                    sudo networksetup -setdnsservers Wi-Fi Empty
                elif [ $1 = "status" ]; then
                    networksetup -getdnsservers Wi-Fi
                fi
            }

            dock(){
                if [ $1 = "l" ] || [ $1 = "left" ];then
                    defaults write com.apple.dock orientation -string left
                elif [ $1 = "r" ] || [ $1 = "right" ];then
                    defaults write com.apple.dock orientation -string right
                else
                    defaults write com.apple.dock orientation -string bottom
                fi

                killall Dock
            }

            clean(){
                sudo pkill sh
                sudo pkill zsh
                sudo pkill bash
                sudo pkill tr
                sudo pkill cat
                sudo pkill grep
                sudo pkill find
                sudo pkill tmux
                sudo update_dyld_shared_cache -force
                sudo dscacheutil -flushcache;
                sudo killall -INFO mDNSResponder;
                sudo killall -HUP mDNSResponder;
                sudo kextcache -system-caches
                sudo kextcache -system-prelinked-kernel

                sudo rm -rf $HOME/Library/Developer/Xcode/DerivedData
                sudo rm -rf $HOME/Library/Developer/Xcode/Archives
                sudo rm -rf $HOME/Library/Caches

                cd /tmp
                sudo ls -a /tmp/ | rg -v mysql | xargs sudo rm -rf
                cd -
                cd /private/tmp
                sudo ls -a /private/tmp/ | rg -v mysql | xargs sudo rm -rf
                cd -

                sudo purge
                sudo du -sx /* &
                sudo mkdir /usr/local/etc/my.cnf.d
            }

            alias clean=clean

            alias -g C='| pbcopy'
            xcodeUUIDFix(){
                sudo find -L $HOME/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins -name Info.plist -maxdepth 3 | \
                    xargs -P $CPUCORES -I{} defaults write {} DVTPlugInCompatibilityUUIDs -array-add $(defaults read /Applications/Xcode.app/Contents/Info DVTPlugInCompatibilityUUID);
                sudo xcode-select --reset;
            }
            alias xcodeUUIDFix=xcodeUUIDFix
            alias proxy=proxy
            alias dns=dns
            alias dock=dock


            if type brew >/dev/null 2>&1; then
                if [ -z $OSXENV_LOADED ]; then
                    export CLICOLOR=1
                    export HOMEBREW_GITHUB_API_TOKEN="Input Your API Token"
                    export HOMEBREW_EDITOR=$EDITOR
                    export HOMEBREW_MAKE_JOBS=6
                    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
                    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include:$CFLAGS"
                    export OSXENV_LOADED=1
                fi
                brewcaskup(){
                    brew untap caskroom/homebrew-cask;
                    rm -rf $(brew --prefix)/Library/Taps/phinze-cask;
                    rm $(brew --prefix)/Library/Formula/brew-cask.rb;
                    rm -rf $(brew --prefix)/Library/Taps/caskroom;
                    brew uninstall --force brew-cask;
                    brew update;
                    brew cask update;
                    brew cleanup;
                    brew cask cleanup;
                    mas upgrade
                }
                alias brew="env PATH=${PATH//$HOME\/.anyenv\/envs\/*\/shims:/} brew";
                brewup(){
                    brew upgrade;
                    \cd $(brew --repo) && git fetch && git reset --hard origin/master && brew update && \cd -;
                    brewcaskup;
                    brew prune;
                    brew doctor;
                }
                alias brewup=brewup;


            fi

            findfile(){
                sudo mdfind -onlyin $1 "kMDItemFSName == '$2'c && (kMDItemSupportFileType == MDSystemFile || kMDItemSupportFileType != MDSystemFile || kMDItemFSInvisible == *)"
            }
            ;;
        linux*)
            findfile(){
                sudo find $1 -name $2
            }
            alias ls='ls -F --color=auto'
            alias -g C='| xsel --input --clipboard'
            ;;
    esac
    alias findfile=findfile

    update(){
        sudo chown -R $(whoami) /usr/local;
        anyenvup &;
        brewup &;

        wait

        gemup &;
        haskellup &;
        npmup &;
        pipup &;
        pip2up &;
        pip3up &;

        wait

        pip install vim-vint --force-reinstall &;
        nimup &;

        atomup &;

        wait

        nvinstall;

        goup;

        zsup;
        rm $HOME/.lesshst;
        rm $HOME/.mysql_history;
        clean;
    }
    alias update=update;

    # eval "$(rbenv init - --no-rehash zsh)";
    # eval "$(pyenv init - --no-rehash zsh)"

    export TERM="xterm-256color";

    export ZSH_LOADED=1;
fi

if [[ $SHLVL = 1 && -z $TMUX ]]; then
    tmux -2 new-session
fi
