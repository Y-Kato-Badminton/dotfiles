" --------------------------
" ---- Encoding Setting ----
" --------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
scriptencoding utf-8

" ---- Disable Filetype for Read file settings
filetype off
filetype plugin indent off

" ---- Enable % for HTML and def~end
runtime macros/matchit.vim

" -----------------
" ---- Plugins ----
" -----------------
if has('vim_starting')
    set runtimepath+=~/.config/nvim/plugged/vim-plug
    if !isdirectory(expand('$NVIM_HOME') . '/plugged/vim-plug')
        call system('mkdir -p ~/.config/nvim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/.config/nvim/plugged/vim-plug/autoload')
    end
endif

call plug#begin(expand('$NVIM_HOME') . '/plugged')
    Plug 'junegunn/vim-plug', {'dir': expand('$NVIM_HOME') . '/plugged/vim-plug/autoload'}
" ---- common plugins
    Plug 'Chiel92/vim-autoformat'
    Plug 'Shougo/context_filetype.vim'
    Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/neoyank.vim'
    Plug 'Shougo/vimproc.vim', {'dir': expand('$NVIM_HOME') . '/plugged/vimproc.vim', 'do': 'make' }
    Plug 'Townk/vim-autoclose'
    Plug 'airblade/vim-gitgutter'
    Plug 'bronson/vim-trailing-whitespace', {'on': 'FixWhitespace'}
    Plug 'cocopon/vaffle.vim'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'janko-m/vim-test', {'for': ['go','rust','elixir','python','ruby','javascript','sh','lua','php','perl','java']}
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/fzf', { 'dir': expand('$NVIM_HOME') . '/plugged/fzf', 'do': expand('$NVIM_HOME') . '/plugged/fzf/install --all' }
    Plug 'junegunn/vim-easy-align', {'on': 'EasyAlign'}
    Plug 'lilydjwg/colorizer', {'do': 'make'}
    Plug 'majutsushi/tagbar'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'neomake/neomake'
    Plug 'nixprime/cpsm', {'do': expand('$NVIM_HOME') . '/plugged/cpsm/install.sh'}
    Plug 'osyo-manga/shabadou.vim'
    Plug 'osyo-manga/vim-precious'
    Plug 'osyo-manga/vim-watchdogs'
    Plug 'rizzatti/dash.vim', {'on': 'Dash'}
    Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
    Plug 'terryma/vim-multiple-cursors'
    Plug 'thinca/vim-quickrun'
    Plug 'tpope/vim-surround'
    Plug 'tyru/caw.vim'
"     Plug 'ujihisa/neco-look'
    Plug 'vim-scripts/sudo.vim'
" ---- Vim Setting
    Plug 'Shougo/neco-vim', {'for': 'vim'}
    Plug 'Shougo/neco-syntax', {'for': 'vim'}
" ---- Yaml Setting
    Plug 'stephpy/vim-yaml', {'for': ['yaml','yml']}
" ---- Clang Setting
    Plug 'zchee/deoplete-clang', {'for': ['c', 'cpp', 'cxx', 'cmake', 'clang']}
    Plug 'vim-jp/vim-cpp', {'for': ['c', 'cpp', 'cxx', 'cmake', 'clang']}
    Plug 'Mizuchi/STL-Syntax', {'for': ['c', 'cpp', 'cxx', 'cmake', 'clang']}
"     Plug 'rhysd/vim-clang-format', {'for': ['c', 'cpp', 'cxx', 'cmake', 'clang']}
    Plug 'critiqjo/lldb.nvim', {'do': ':UpdateRemotePlugins', 'for': ['c', 'cpp', 'cxx', 'cmake', 'clang', 'go']}
" ---- Golang Setting
    " Plug 'dgryski/vim-godef', { 'for': 'go' }
    " Plug 'zchee/nvim-go', { 'for': 'go', 'do': 'make'}
    " Plug 'fatih/vim-go', {'for': 'go', 'on': 'GoAddTags'}
    Plug 'fatih/vim-go', {'for': 'go'}
    Plug 'nsf/gocode', { 'for': 'go', 'rtp': 'nvim', 'do': expand('$NVIM_HOME') . '/plugged/gocode/nvim/symlink.sh'}
    Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
    Plug 'zchee/vim-goiferr', {'for': 'go', 'on': 'GoIferr'}
    Plug 'buoto/gotests-vim', {'for': 'go', 'on': 'GoTests'}
    Plug 'tweekmonster/hl-goimport.vim', {'for': 'go'}
" ---- Elixir Setting
    Plug 'archSeer/elixir.nvim', {'for': ['elixir', 'eelixir']}
    Plug 'c-brenn/phoenix.vim', {'for': ['elixir', 'eelixir']}
    Plug 'avdgaag/vim-phoenix', {'for': ['elixir', 'eelixir']}
    Plug 'carlosgaldino/elixir-snippets', {'for': ['elixir', 'eelixir']}
    Plug 'elixir-lang/vim-elixir',{'for': ['elixir', 'eelixir']}
    Plug 'mattreduce/vim-mix', {'for': ['elixir', 'eelixir']}
    Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
    Plug 'tpope/vim-projectionist', {'for': ['elixir', 'eelixir']}
" ---- Erlang Setting
    Plug 'edkolev/erlang-motions.vim', {'for': 'erlang'}
    Plug 'vim-erlang/vim-erlang-compiler', {'for': 'erlang'}
    Plug 'vim-erlang/vim-erlang-omnicomplete', {'for': 'erlang'}
    Plug 'vim-erlang/vim-erlang-runtime', {'for': 'erlang'}
    Plug 'vim-erlang/vim-erlang-tags', {'for': 'erlang'}
" ---- HTML
    Plug 'digitaltoad/vim-jade', { 'for': ['jade', 'pug'] }
    Plug 'gregsexton/MatchTag', { 'for': ['html','php'] }
    Plug 'hokaccha/vim-html5validator', {'for': ['html', 'php']}
    Plug 'mattn/emmet-vim', {'for': ['html', 'php']}
    Plug 'mustache/vim-mustache-handlebars', { 'for': ['html','php','haml'] }
    Plug 'othree/html5.vim', {'for': ['html', 'php']}
    Plug 'tpope/vim-haml', {'for': 'haml'}
" ---- LESS SASS CSS
    Plug 'ap/vim-css-color', {'for': ['css','less','sass','scss','stylus'] }
    Plug 'cakebaker/scss-syntax.vim', { 'for': ['sass','scss'] }
    Plug 'groenewege/vim-less', {'for': 'less'}
    Plug 'hail2u/vim-css3-syntax', {'for': ['css','less','sass','scss','stylus'] }
    Plug 'wavded/vim-stylus', {'for': ['stylus']}
" ---- JavaScript
    Plug 'carlitux/deoplete-ternjs', { 'for': ['js', 'javascript', 'javascript.jsx', 'json'], 'do': 'npm install -g tern' }
    Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
    Plug 'heavenshell/vim-jsdoc', {'for': ['javascript', 'javascript.jsx', 'json']}
    Plug 'itspriddle/vim-jquery', {'for': ['javascript', 'javascript.jsx', 'html']}
    Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'html'] }
    Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    Plug 'mhartington/deoplete-typescript', { 'for': 'typescript' }
    Plug 'moll/vim-node', {'for': 'javascript'}
    Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx'] }
    Plug 'myhere/vim-nodejs-complete', {'for': 'javascript'}
    Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/jsdoc-syntax.vim', {'for': ['javascript', 'javascript.jsx', 'json']}
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'ramitos/jsctags', {'for': ['javascript', 'javascript.jsx', 'json']}
" ---- Dart
    Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
    Plug 'miyakogi/vim-dartanalyzer', {'for': 'dart'}
" ---- PHP
    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'evidens/vim-twig', {'for': 'php'}
    Plug 'h1mesuke/vim-alignta', {'for': 'php'}
    Plug 'm2mdas/phpcomplete-extended', {'for': 'php'}
    Plug 'pbogut/deoplete-padawan', {'for': 'php'}
    Plug 'stephpy/vim-php-cs-fixer', {'for': 'php', 'on': 'PhpCsFixerFixFile'}
    Plug 'thinca/vim-ref', {'for': 'php'}
" ---- Ruby
    Plug 'astashov/vim-ruby-debugger', {'for': 'ruby'}
    Plug 'ecomba/vim-ruby-refactoring', {'for': 'ruby'}
    Plug 'thoughtbot/vim-rspec', {'for': 'ruby'}
    Plug 'tpope/vim-endwise', {'for': ['ruby', 'elixir']}
    Plug 'tpope/vim-projectionist', {'for': 'ruby'}
    Plug 'tpope/vim-rails', {'for': 'ruby'}
    Plug 'tpope/vim-rake', {'for': 'ruby'}
" ---- Crystal
    Plug 'rhysd/vim-crystal', {'for': ['crystal'] }
" ---- Java Scala
    Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}
    Plug 'derekwyatt/vim-scala', {'for': 'scala'}
    Plug 'ensime/ensime-vim', {'for': ['scala'], 'do': ':UpdateRemotePlugins'}
    Plug 'ktvoelker/sbt-vim', {'for': 'scala'}
    Plug 'vhakulinen/neovim-intellij-complete', {'for': ['java', 'scala']}
    Plug 'vhakulinen/neovim-intellij-complete-deoplete', {'for': ['java','scala']}
    Plug 'vim-scripts/java_getset.vim', {'for': 'java'}
    Plug 'tfnico/vim-gradle', {'for': 'groovy' }
" ---- Nim
    Plug 'zah/nim.vim', {'for': 'nim'}
    " Plug 'baabelfish/nvim-nim', {'for': 'nim'}
" ---- Rust
    Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}
    Plug 'rhysd/rust-doc.vim', {'for': 'rust', 'on': ['RustDoc', 'Denite']}
    Plug 'rust-lang/rust.vim', {'for': 'rust'}
" ---- Haskell
    Plug 'dag/vim2hs', {'for': 'haskell'}
    Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
    Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
    Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
    Plug 'pbrisbin/vim-syntax-shakespeare', {'for': 'haskell'}
" ---- Perl
    Plug 'c9s/perlomni.vim', {'for': 'perl'}
    Plug 'hotchpotch/perldoc-vim', {'for': 'perl'}
    Plug 'vim-perl/vim-perl', { 'branch': 'dev', 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
" ---- Python
    Plug 'davidhalter/jedi-vim', {'for': ['python', 'python3','djangohtml'], 'do': 'pip install jedi'}
    Plug 'zchee/deoplete-jedi', {'for': ['python', 'python3','djangohtml'], 'do': 'pip install jedi'}
" ---- Lisp
    Plug 'vim-scripts/slimv.vim', {'for': 'lisp'}
" ---- Lua
    Plug 'xolox/vim-misc', {'for': 'lua'}
    Plug 'xolox/vim-lua-ftplugin', {'for': 'lua'}
    Plug 'xolox/vim-lua-inspect', {'for': 'lua'}
" ---- Swift
    Plug 'keith/swift.vim', {'for': 'swift'}
    Plug 'kballard/vim-swift', {'for': 'swift'}
"     Plug 'landaire/deoplete-swift', {'for': 'swift'}
    Plug 'mitsuse/autocomplete-swift', {'for': 'swift'}
" ---- Markdown
    Plug 'kannokanno/previm', {'for': 'markdown'}
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'shinespark/vim-list2tree', {'for': 'markdown', 'on': 'List2Tree'}
    Plug 'sotte/presenting.vim', {'for': 'markdown'}
    Plug 'tyru/open-browser.vim', {'for': 'markdown'}
" ---- SQL
    Plug 'SQLComplete.vim', { 'for': 'sql' }
" ---- TOML
    Plug 'cespare/vim-toml', {'for': 'toml'}
" ---- LLVM
    Plug 'qnighy/llvm.vim', {'for': 'llvm'}
" ---- ZSH
    Plug 'zchee/deoplete-zsh', {'for': 'zsh'}

call plug#end()

" -------------------------
" ---- Plugin Settings ----
" -------------------------
if !has('python') && !has('pip')
    call system('pip install --upgrade pip')
    call system('pip install neovim --upgrade')
endif

if !has('python3') && !has('pip3')
    call system('pip3 install --upgrade pip')
    call system('pip3 install neovim --upgrade')
endif

if !has('gb') && has('go')
    call system('go get -u -v github.com/constabulary/gb/...')
endif

" ---- Deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:python_host_skip_check = 1
let g:python2_host_skip_check = 1
let g:python3_host_skip_check = 1

if executable('python')
    let g:python_host_prog = system('which python')
endif

if executable('python3')
    let g:python3_host_prog = system('which python3')
endif

let g:neosnippet#snippets_directory=expand('$NVIM_HOME') . '/plugged/neosnippet-snippets/neosnippets/'

let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_completion_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000

set statusline+=%#warningmsg#
set statusline+=%{neomake#utils#ErrorMessage()}
set statusline+=%*
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

augroup FileTypeSetting
    autocmd!
    autocmd BufNewFile,BufRead *.dart set filetype=dart
    autocmd BufNewFile,BufRead *.erls,*.erl set filetype=erlang
    autocmd BufNewFile,BufRead *.es6 set filetype=javascript
    autocmd BufNewFile,BufRead *.exs,*.ex set filetype=elixir
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
    autocmd BufNewFile,BufRead *.rs set filetype=rust
    autocmd BufNewFile,BufRead *.ts set filetype=typescript
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

augroup NeomakeSetting
    autocmd!
    autocmd BufRead,BufWritePost * Neomake
    autocmd QuitPre * lclose
    autocmd BufRead * let g:neomake_open_list = 2
    autocmd BufRead * let g:neomake_list_height = 6
    autocmd FileType coffee,javascript,javascript.jsx,json let g:neomake_javascript_enabled_makers=['eslint_d']
    autocmd FileType go let g:neomake_go_enabled_makers = ['go', 'golint', 'govet']
    autocmd FileType html,xhtml let g:neomake_html_enabled_makers = ['tidy', 'htmlhint']
    autocmd FileType css let g:neomake_css_enabled_makers = ['csslint', 'stylelint']
    autocmd FileType nim let g:neomake_nim_enabled_makers = ['nim', 'nimsuggest']
    autocmd FileType php let g:neomake_php_enabled_makers = ['php', 'phpcs', 'phpmd']
    autocmd FileType php let g:neomake_php_phpcs_args_standard='psr4'
    autocmd FileType python let g:neomake_python_enabled_makers = ['python', 'pyflakes', 'flake8']
    autocmd FileType rust let g:neomake_rust_enabled_makers = ['rustc']
    autocmd FileType sh let g:neomake_sh_enabled_makers = ['sh', 'shellcheck']
    autocmd FileType vim let g:neomake_vim_enabled_makers = ['vint']
    autocmd FileType zsh let g:neomake_zsh_enabled_makers = ['zsh', 'shellcheck']
    autocmd FileType swift let g:neomake_swift_enabled_makers = ['swiftc']
augroup END

augroup DeopleteSetting
    autocmd!
    autocmd FileType go call deoplete#custom#set('go', 'matchers', ['matcher_full_fuzzy'])
    autocmd FileType go call deoplete#custom#set('go', 'sorters', [])
    autocmd FileType go let g:deoplete#sources#go#align_class = 1
    autocmd FileType go let g:deoplete#sources#go#cgo = 1
    autocmd FileType go let g:deoplete#sources#go#cgo#libclang_path= expand("/usr/local/Cellar/llvm/*/lib/libclang.dylib")
    autocmd FileType go let g:deoplete#sources#go#cgo#sort_algo = 'alphabetical'
    autocmd FileType go let g:deoplete#sources#go#gocode_binary = globpath($GOPATH,"/bin/gocode")
    autocmd FileType go let g:deoplete#sources#go#json_directory = globpath($NVIM_HOME,"/plugged/deoplete-go/data/json/*/").expand("$GOOS")."_".expand("$GOARCH")
    autocmd FileType go let g:deoplete#sources#go#package_dot = 1
    autocmd FileType go let g:deoplete#sources#go#on_event = 1
    autocmd FileType go let g:deoplete#sources#go#pointer = 1
    autocmd FileType go let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    autocmd FileType go let g:deoplete#sources#go#use_cache = 1
    " clang
    autocmd FileType c,cpp,clang,hpp let g:deoplete#sources#clang#libclang_path= expand("/usr/local/Cellar/llvm/*/lib/libclang.dylib")
    autocmd FileType c,cpp,clang,hpp let g:deoplete#sources#clang#clang_header = expand("/usr/local/Cellar/llvm/*/include/clang")
    " Python
    autocmd FileType python call deoplete#custom#set('jedi', 'disabled_syntaxes', ['Comment'])
    autocmd FileType python call deoplete#custom#set('jedi', 'matchers', ['matcher_fuzzy'])
    autocmd FileType python let g:deoplete#sources#jedi#statement_length = 0
    autocmd FileType python let g:deoplete#sources#jedi#short_types = 0
    autocmd FileType python let g:deoplete#sources#jedi#show_docstring = 1
    autocmd FileType python let g:deoplete#sources#jedi#worker_threads = 2
    autocmd FileType python let g:deoplete#sources#jedi#python_path = g:python3_host_prog
augroup END

augroup IndentSetting
    autocmd!
    autocmd FileType coffee,javascript,javascript.jsx,jsx,json setlocal sw=2 sts=2 ts=2 expandtab completeopt=menu,preview omnifunc=nodejscomplete#CompleteJS
    autocmd FileType go setlocal noexpandtab sw=4 ts=4 completeopt=menu,preview
    autocmd FileType html,xhtml setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
    autocmd FileType nim setlocal noexpandtab sw=4 ts=4 completeopt=menu,preview
    autocmd FileType php setlocal ts=4 sts=4 sw=4 expandtab omnifunc=phpcomplete_extended#CompletePHP

    autocmd FileType python setlocal smartindent expandtab sw=4 ts=8 sts=4 colorcolumn=79 completeopt=menu,preview formatoptions+=croq cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    autocmd FileType rust setlocal smartindent expandtab ts=4 sw=4 sts=4 completeopt=menu,preview
    autocmd FileType ruby setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
    autocmd FileType scala setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
    autocmd FileType sh,zsh,markdown setlocal expandtab ts=4 sts=4 sw=4 completeopt=menu,preview
    autocmd FileType xml setlocal smartindent expandtab ts=2 sw=2 sts=2 completeopt=menu,preview
augroup END

augroup TagBarSetting
    autocmd!
    autocmd FileType go let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
    autocmd FileType nim let g:tagbar_type_nim = {
                \ 'ctagstype' : 'nim',
                \ 'kinds' : [
                \   'h:Headline',
                \   't:class',
                \   't:enum',
                \   't:tuple',
                \   't:subrange',
                \   't:proctype',
                \   'f:procedure',
                \   'f:method',
                \   'o:operator',
                \   't:template',
                \   'm:macro',
                \ ],
                \ }
    autocmd FileType ruby let g:tagbar_type_ruby = {
                \ 'ctagstype' : 'ruby',
                \ 'kinds' : [
                \   'm:modules',
                \   'c:classes',
                \   'd:describes',
                \   'C:contexts',
                \   'f:methods',
                \   'F:singleton methods'
                \ ]
                \}
augroup END

" ---- Clang
if executable('clang-format')
    augroup ClangSetting
        autocmd!
        autocmd FileType cpp,c,hpp,clang command! CFmt :call vimproc#system_bg("clang-format -style='Google' -i " . expand("%"))
        " autocmd BufWritePre *.cpp,*.c,*.cc,*.hpp call vimproc#system_bg("clang-format -style='Google' -i " . expand("%"))
    augroup END
endif

" ---- Golang
augroup GolangSetting
    autocmd!
    " ---- GoFmtコマンドを保存時に走らせる
    autocmd BufWritePre *.go GoFmt
    " autocmd BufWritePre *.go Gofmt
    autocmd FileType go compiler go
    autocmd FileType go :highlight goExtraVars cterm=bold ctermfg=214
    autocmd FileType go :match goExtraVars /\<ok\>\|\<err\>/
    " autocmd FileType go nmap  <silent><buffer>K                   <Plug>(go-doc)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>]      :<C-u>GoGeneDefinition<CR>
    " autocmd FileType go nmap  <silent><buffer><C-]>               :<C-u>call GoGuru('definition')<CR>
    " autocmd FileType go nmap  <silent><buffer><Leader>]           :<C-u>Godef<CR>
    " autocmd FileType go nmap  <silent><buffer><Leader>a           <Plug>(nvim-go-analyze-buffer)
    " autocmd FileType go nmap  <silent><buffer><Leader>e           <Plug>(nvim-go-rename)
    " autocmd FileType go nmap  <silent><buffer><Leader>i           <Plug>(nvim-go-iferr)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>db     :<C-u>DlvBreakpoint<CR>
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>dc     :<C-u>DlvContinue<CR>
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>dd     :<C-u>DlvDebug<CR>
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>dn     :<C-u>DlvNext<CR>
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>dr     :<C-u>DlvBreakpoint<CR>
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gb      <Plug>(nvim-go-build)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gc     <Plug>(nvim-go-callers)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gcs    <Plug>(nvim-go-callstack)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>ge     <Plug>(nvim-go-callees)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gs     <Plug>(nvim-go-implements)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gml    <Plug>(nvim-go-metalinter)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gr     <Plug>(nvim-go-referrers)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gts    <Plug>(nvim-go-test-switch)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gl     <Plug>(nvim-go-lint)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gr     <Plug>(nvim-go-run)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>gt     <Plug>(nvim-go-test)
    " autocmd FileType go nmap  <silent><buffer><LocalLeader>v      <Plug>(nvim-go-vet)
    " autocmd FileType go nmap <leader>gc <Plug>(go-coverage)
    " autocmd FileType go nmap <leader>gi <Plug>(go-import)
    " autocmd FileType go nmap <Leader>ge <Plug>(go-rename)
    " autocmd FileType go nmap <Leader>gi <Plug>(go-info)
    " autocmd FileType go nmap <leader>gdf <Plug>(go-def-split)
    " autocmd FileType go nmap <leader>gdfv <Plug>(go-def-vertical)
    " autocmd FileType go nmap <leader>gdft <Plug>(go-def-tab)
    " autocmd FileType go nmap <leader>gd <Plug>(go-doc)
    " autocmd FileType go nmap <leader>gdv <Plug>(go-doc-vertical)
    autocmd FileType go highlight goErr cterm=bold ctermfg=214
    autocmd FileType go match goErr /\<err\>/
    autocmd FileType go let g:go#highlight#cgo = 1
    autocmd FileType go let g:go#build#autosave = 1
    autocmd FileType go let g:go#build#force = 0
    autocmd FileType go let g:go#fmt#autosave  = 1
    autocmd FileType go let g:go#fmt#mode = 'goimports'
    autocmd FileType go let g:go#guru#keep_cursor = {
                \       'callees'    : 0,
                \       'callers'    : 0,
                \       'callstack'  : 0,
                \       'definition' : 1,
                \       'describe'   : 0,
                \       'freevars'   : 0,
                \       'implements' : 0,
                \       'peers'      : 0,
                \       'pointsto'   : 0,
                \       'referrers'  : 0,
                \       'whicherrs'  : 0
                \ }
    autocmd FileType go let g:go#guru#reflection = 0
    autocmd FileType go let g:go#iferr#autosave = 0
    autocmd FileType go let g:go#lint#golint#autosave = 1
    autocmd FileType go let g:go#lint#golint#ignore = ['internal']
    autocmd FileType go let g:go#lint#golint#mode = 'root'
    autocmd FileType go let g:go#lint#govet#autosave = 0
    autocmd FileType go let g:go#lint#govet#flags = ['-v', '-lostcancel']
    autocmd FileType go let g:go#lint#metalinter#autosave = 0
    autocmd FileType go let g:go#lint#metalinter#autosave#tools = ['vet', 'golint']
    autocmd FileType go let g:go#lint#metalinter#deadline = '20s'
    autocmd FileType go let g:go#lint#metalinter#skip_dir = ['internal', 'vendor', 'testdata', '__*.go', '*_test.go']
    autocmd FileType go let g:go#lint#metalinter#tools = ['vet', 'golint', 'errcheck']
    autocmd FileType go let g:go#rename#prefill = 1
    autocmd FileType go let g:go#terminal#height = 120
    autocmd FileType go let g:go#terminal#start_insert = 1
    autocmd FileType go let g:go#terminal#width = 120
    autocmd FileType go let g:go#test#args = ['-v']
    autocmd FileType go let g:go#test#autosave = 0
    autocmd FileType go let g:go_highlight_functions = 1
    autocmd FileType go let g:go_highlight_operators = 1
    autocmd FileType go set runtimepath+=globpath($GOROOT, "/misc/vim")
    autocmd FileType go set runtimepath+=globpath($GOPATH, "src/github.com/nsf/gocode/vim")
    autocmd FileType go set runtimepath+=globpath($GOPATH, "src/github.com/golang/lint/misc/vim")
    autocmd FileType go nnoremap <F5> :GoRun<CR>
augroup END

" ---- Scala Settings
augroup ScalaSetting
    autocmd!
    autocmd BufWritePost *.scala silent :EnTypeCheck
    autocmd FileType scala compiler sbt
augroup END

" ---- HTML Settings
augroup HTMLSetting
    autocmd!
    autocmd FileType html,xhtml imap <buffer><expr><tab> emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" : "\<tab>"
augroup END

" ---- Swift Settings
augroup SwiftSetting
    autocmd!
    autocmd FileType swift let g:deoplete#sources#swift#source_kitten_binary = system("which sourcekitten")
    autocmd FileType swift let g:neomake_swift_swiftc_maker = {
                \ 'exe': 'swiftc',
                \ 'args': ['-parse'],
                \ 'errorformat': {
                \ '%E%f:%l:%c: error: %m,' .
                \ '%W%f:%l:%c: warning: %m,' .
                \ '%Z%\s%#^~%#,' .
                \ '%-G%.%#'
                \ },
                \ }
    autocmd FileType swift let g:quickrun_config['swift'] = {
                \ 'command': 'xcrun',
                \ 'cmdopt': 'swift',
                \ 'exec': '%c %o %s',
                \}
augroup END

" ---- PHP Settings
augroup PHPSetting
    autocmd!
    autocmd FileType php let g:php_baselib       = 1
    autocmd FileType php let g:php_htmlInStrings = 1
    autocmd FileType php let g:php_noShortTags   = 1
    autocmd FileType php let g:php_sql_query     = 1
    autocmd FileType php let g:php_parent_error_close  = 1
    autocmd FileType php let g:php_cs_fixer_config                 = 'default'
    autocmd FileType php let g:php_cs_fixer_dry_run                = 0
    autocmd FileType php let g:php_cs_fixer_enable_default_mapping = 0
    autocmd FileType php let g:php_cs_fixer_fixers_list            = 'align_equals,align_double_arrow'
    autocmd FileType php let g:php_cs_fixer_level                  = 'symfony'
    autocmd FileType php let g:php_cs_fixer_php_path               = 'php'
    autocmd FileType php let g:php_cs_fixer_verbose                = 0
augroup END

" ---- JavaScript Settings
augroup JavaScriptSettings
    autocmd!
    autocmd BufWritePre *.js,*.jsx,*.coffee EsFix
    autocmd BufWritePre *.js,*.jsx,*.coffee Autoformat
    autocmd FileType coffee,javascript,javascript.jsx,json let g:node_usejscomplete = 1
    autocmd FileType coffee,javascript,javascript.jsx,json let g:tern_request_timeout = 1
    autocmd FileType coffee,javascript,javascript.jsx,json let g:tern_show_signature_in_pum = '0'
    autocmd FileType coffee,javascript,javascript.jsx,json let g:jsx_ext_required = 1        " ファイルタイプがjsxのとき読み込む．
    autocmd FileType coffee,javascript,javascript.jsx,json let g:js_indent_typescript = 1
    autocmd FileType coffee,javascript,javascript.jsx,json let g:tagbar_type_javascript = {'ctagsbin' : system('which jsctags')}
    autocmd FileType coffee,javascript,javascript.jsx,json command! EsFix :call vimproc#system_bg("eslint --fix " . expand("%"))
    autocmd! VimLeave *.js  !eslint_d stop
augroup END

" ---- TypeScript Settings
augroup TypeScriptSettings
    autocmd!
    autocmd BufWritePre *.ts EsFix
    autocmd BufWritePre *.ts Autoformat
    autocmd FileType typescript let g:neomake_typescript_tsc_maker = {
                \ 'args': [
                \ '--project', getcwd(), '--noEmit'
                \ ],
                \ 'append_file': 0,
                \ 'errorformat':
                \ '%E%f %#(%l\,%c): error %m,' .
                \ '%E%f %#(%l\,%c): %m,' .
                \ '%Eerror %m,' .
                \ '%C%\s%\+%m'
                \ }
    autocmd FileType coffee,javascript,javascript.jsx,json command! EsFix :call vimproc#system_bg("eslint --fix " . expand("%"))
    autocmd! VimLeave *.js  !eslint_d stop
augroup END

" ---- Java Settings
augroup JavaSettings
    autocmd!
    autocmd FileType java,jsp setlocal omnifunc=javacomplete#Complete
    autocmd FileType java,jsp setlocal completefunc=javacomplete#CompleteParamsInfo
    autocmd FileType java,jsp let g:java_highlight_all=1
    autocmd FileType java,jsp let g:java_highlight_debug=1
    autocmd FileType java,jsp let g:java_allow_cpp_keywords=1
    autocmd FileType java,jsp let g:java_space_errors=1
    autocmd FileType java,jsp let g:java_highlight_functions=1
    autocmd FileType java,jsp let b:javagetset_enable_K_and_R=1
    autocmd FileType java,jsp let b:javagetset_add_this=1
    autocmd FileType java,jsp let g:JavaComplete_MavenRepositoryDisable = 0
    autocmd FileType java,jsp let g:JavaComplete_UseFQN = 0
    autocmd FileType java,jsp nmap <F5> <Plug>(JavaComplete-Imports-Add)
    autocmd FileType java,jsp imap <F5> <Plug>(JavaComplete-Imports-Add)
    autocmd FileType java,jsp nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    autocmd FileType java,jsp imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
    autocmd FileType java,jsp no <F9> :make clean<CR>
    autocmd FileType java,jsp no <F10> :wa<CR> :make compile<CR>
    autocmd FileType java,jsp no <F11> :make exec:exec<CR>
augroup END

" ---- Nim Settings
augroup NimSettings
    autocmd!
    autocmd FileType nim let g:nvim_nim_enable_async = 0
augroup END

" ---- Rust Settings
augroup RustSetting
    autocmd!
    autocmd BufWritePre *.rust RustFmt
    autocmd FileType BufWritePost *.rs QuickRun -type syntax/rust
    autocmd FileType rust let g:rustfmt_autosave = 1
    autocmd FileType rust let g:rustfmt_command = system('which rustfmt')
    autocmd FileType rust let g:rustfmt_options = "--write-mode=overwrite"
    autocmd FileType rust let g:racer_cmd = system('which racer')
    autocmd FileType rust let g:deoplete#sources#rust#racer_binary = globpath("$HOME",".cargo/bin/racer")
    autocmd FileType rust let g:deoplete#sources#rust#rust_source_path = expand("$RUST_SRC_PATH")
    autocmd FileType rust let g:deoplete#sources#rust#documentation_max_height=20
augroup END

" ---- Erlang Settings
augroup ErlangSettings
    autocmd!
    autocmd FileType erlang let erlang_folding = 1
    autocmd FileType erlang let erlang_show_errors = 1
augroup END

" ---- Elixir Settings
augroup ElixirSettings
    autocmd!
    autocmd FileType elixir imap >> \|><Space>
    autocmd FileType elixir let g:quickrun_config.mix_test = {
                \ 'command'     : 'mix',
                \ 'exec'        : 'mix test',
                \ 'outputter'   : 'quickfix',
                \ 'errorformat' : '%E\ %#%n)\ %.%#,%C\ %#%f:%l,%Z%.%#stacktrace:,%C%m,%.%#(%.%#Error)\ %f:%l:\ %m,%-G%.%#',
                \ 'hook/cd/directory': yacd#get_root_dir(expand('%:p:h'))
                \ }
    autocmd FileType elixir nnoremap <Leader>t :QuickRun mix_test<CR>
augroup END

" ---- Python Settings
augroup PythonSettings
    autocmd!
    autocmd FileType python let g:jedi#auto_initialization = 0
    autocmd FileType python let g:jedi#auto_vim_configuration = 0
    autocmd FileType python let g:jedi#completions_command = "<C-Space>"
    autocmd FileType python let g:jedi#completions_enabled = 0
    autocmd FileType python let g:jedi#documentation_command = "K"
    autocmd FileType python let g:jedi#force_py_version = 3
    autocmd FileType python let g:jedi#goto_assignments_command = "<leader>g"
    autocmd FileType python let g:jedi#goto_definitions_command = "<leader>d"
    autocmd FileType python let g:jedi#max_doc_height = 150
    autocmd FileType python let g:jedi#popup_on_dot = 0
    autocmd FileType python let g:jedi#popup_select_first = 0
    autocmd FileType python let g:jedi#rename_command = "<leader>r"
    autocmd FileType python let g:jedi#show_call_signatures = 0
    autocmd FileType python let g:jedi#smart_auto_mappings = 0
    autocmd FileType python let g:jedi#usages_command = "<leader>n"
    autocmd FileType python let g:jedi#use_splits_not_buffers = ''
augroup END

" ---- Ruby Setting
augroup RubySettings
    autocmd!
    autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby let g:rubycomplete_rails = 1
    autocmd FileType ruby map <Leader>t :call RunCurrentSpecFile()<CR>
    autocmd FileType ruby map <Leader>s :call RunNearestSpec()<CR>
    autocmd FileType ruby map <Leader>l :call RunLastSpec()<CR>
    autocmd FileType ruby map <Leader>a :call RunAllSpecs()<CR>
    autocmd FileType ruby nnoremap <leader>rap  :RAddParameter<cr>
    autocmd FileType ruby nnoremap <leader>rcpc :RConvertPostConditional<cr>
    autocmd FileType ruby nnoremap <leader>rel  :RExtractLet<cr>
    autocmd FileType ruby vnoremap <leader>rec  :RExtractConstant<cr>
    autocmd FileType ruby vnoremap <leader>relv :RExtractLocalVariable<cr>
    autocmd FileType ruby nnoremap <leader>rit  :RInlineTemp<cr>
    autocmd FileType ruby vnoremap <leader>rrlv :RRenameLocalVariable<cr>
    autocmd FileType ruby vnoremap <leader>rriv :RRenameInstanceVariable<cr>
    autocmd FileType ruby vnoremap <leader>rem  :RExtractMethod<cr>
augroup END

nmap <F8> :TagbarToggle<CR>
set updatetime=300

let g:tagbar_left = 0
let g:tagbar_autofocus = 1

let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config._={ 'runner':'vimproc',
            \       'runner/vimproc/updatetime' : 10,
            \       'outputter/buffer/close_on_empty' : 1,
            \ }

" ---- emmet-vim
let g:user_emmet_expandabbr_key = '<c-E>'
let g:user_emmet_leader_key='<c-e>'
let g:user_emmet_settings = {
            \    'variables': {
            \       'lang': 'ja'
            \    },
            \   'indentation': '  '
            \ }

" ----------------------
" ---- Dash Setting ----
" ----------------------
" Dash.app連携
function! s:dash(...)
    if len(a:000) == 1 && len(a:1) == 0
        echomsg 'No keyword'
    else
        let l:ft = &filetype
        if &filetype ==# 'python'
            let l:ft = l:ft.'2'
        endif
        let l:ft = l:ft.':'
        let l:word = len(a:000) == 0 ? input('Keyword: ', l:ft.expand('<cword>')) : l:ft.join(a:000, ' ')
        call system(printf("open dash://'%s'", l:word))
    endif
endfunction

command! -nargs=* Dash call <SID>dash(<f-args>)

nnoremap <Leader>d :call <SID>dash(expand('<cword>'))<CR>

let g:gitgutter_max_signs = 10000

set completeopt=menu,preview

if executable('jq')
    function! s:jq(has_bang, ...) abort range
        execute 'silent' a:firstline ',' a:lastline '!jq' string(a:0 == 0 ? '.' : a:1)
        if !v:shell_error || a:has_bang
            return
        endif
        let l:error_lines = filter(getline('1', '$'), 'v:val =~# "^parse error: "')
        " 範囲指定している場合のために，行番号を置き換える
        let l:error_lines = map(l:error_lines, 'substitute(v:val, "line \\zs\\(\\d\\+\\)\\ze,", "\\=(submatch(1) + a:firstline - 1)", "")')
        let l:winheight = len(l:error_lines) > 10 ? 10 : len(l:error_lines)
        " カレントバッファがエラーメッセージになっているので，元に戻す
        undo
        " カレントバッファの下に新たにウィンドウを作り，エラーメッセージを表示するバッファを作成する
        execute 'botright' l:winheight 'new'
        setlocal nobuflisted bufhidden=unload buftype=nofile
        call setline(1, l:error_lines)
        " エラーメッセージ用バッファのundo履歴を削除(エラーメッセージをundoで消去しないため)
        let l:save_undolevels = &l:undolevels
        setlocal undolevels=-1
        execute "normal! a \<BS>\<Esc>"
        setlocal nomodified
        let &l:undolevels = l:save_undolevels
        " エラーメッセージ用バッファは読み取り専用にしておく
        setlocal readonly
    endfunction
    command! -bar -bang -range=% -nargs=? Jq <line1>,<line2>call s:jq(<bang>0, <f-args>)
endif

if executable('trans')
    " translate-shellを使う
    let s:trans_cmd = 'trans'
    let s:trans_opt = '-b --no-ansi -e google'
    command! -range=% -nargs=? Trans <line1>,<line2> s:trans_cmd s:trans_opt
    nnoremap <silent> <F3> :Trans<CR>
endif

" ------------------------
" ---- Denite Setting ----
" ------------------------
nnoremap <silent> <C-k><C-f> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-k><C-g> :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> <C-k><C-r> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent> <C-k><C-n> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nnoremap <silent> <C-k><C-p> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
nnoremap <silent> <C-k><C-l> :<C-u>Denite line<CR>
nnoremap <silent> <C-k><C-u> :<C-u>Denite file_mru<CR>
nnoremap <silent> <C-k><C-y> :<C-u>Denite neoyank<CR>

call denite#custom#map('_', '<C-h>','<denite:do_action:split>')
call denite#custom#map('insert', '<C-h>','<denite:do_action:split>')
call denite#custom#map('_', '<C-v>','<denite:do_action:vsplit>')
call denite#custom#map('insert','<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')

if executable('rg')
    call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
else
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
endif
" -------------------------
" ---- Default Setting ----
" -------------------------
colorscheme monokai
" colorscheme spring-night

" ---- Enable Word Wrap
set wrap

" ---- Max Syntax Highlight Per Colmun
set synmaxcol=2000

" ---- highlight both bracket
set showmatch matchtime=2
set list listchars=tab:>\ ,trail:_,eol:↲,extends:»,precedes:«,nbsp:%

" ---- 2spaces width for ambient
set ambiwidth=double

" ---- incremental steps
set nrformats=""

" ---- Blockwise
set virtualedit=block

" ---- Filename Suggestion
set wildmenu
set wildmode=list:longest,full

" ---- auto reload when edited
set autoread
set autowrite

" ---- Disable Swap
set noswapfile

" ---- Disable Backup File
set nowritebackup

" ---- Disable Backup
set nobackup

" ---- link clipboard
set clipboard+=unnamedplus

" ---- Fix Current Window Position
set splitright
set splitbelow

" ---- Enable Incremental Search
set incsearch

" ---- Disable letter Distinction
set ignorecase
set wrapscan

" ---- Always Shows Status line
set laststatus=2

" ---- Always Show cmd
set showcmd

" ---- Disable Beep Sound
set visualbell t_vb=
set novisualbell
set noerrorbells

" ---- \+p to paste mode
"imap <F5> <nop>
"set pastetoggle=<F5>

" ---- convert to soft tab
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set softtabstop=0
set autoindent
set smartindent

" ---- Indentation shiftwidth width
set shiftround

" ---- Visibility Tabs and EOL
set list

" ---- Free move cursor
set whichwrap=b,s,h,l,<,>,[,]

" ---- scrolls visibility
set scrolloff=5

" ---- Enhance Backspace
set backspace=indent,eol,start

" ---- Add <> pairs to bracket
set matchpairs+=<:>

" ---- Disable Search Result Distinction
set infercase

" ---- open current buffer
set switchbuf=useopen

" ---- History Count
set history=100

" ---- Enable mouse Controll
set mouse=a

set lazyredraw
set ttyfast
"set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!
set shortmess+=I
set fileformats=unix,dos,mac
set foldmethod=manual
if executable('zsh')
    set shell=zsh
endif
" ------------------------
" ---- Color settings ----
" ------------------------
let g:monokai_italic = 1
let g:monokai_thick_border = 1

" ----------------------
" ---- Key mappings ----
" ----------------------

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Returnキーは常に新しい行を追加するように
nnoremap <CR> o<Esc>
" シェルのカーソル移動コマンドを有効化
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-e> <End>
cnoremap <C-f> <Right>
inoremap <C-f> <Right>
cnoremap <C-b> <Left>
inoremap <C-b> <Left>
" 折り返した行を複数行として移動
nnoremap <silent> j gj
nnoremap <silent> k gk
" ウィンドウの移動をCtrlキーと方向指定でできるように
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Esc2回で検索のハイライトを消す
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
" gをバインドキーとしたtmuxと同じキーバインドでタブを操作
nnoremap <silent> gc :<C-u>tabnew<CR>
nnoremap gn gt
nnoremap gp gT
nnoremap <silent> gx :<C-u>tabclose<CR>
" g+oで現在開いている以外のタブを全て閉じる
nnoremap <silent> go :<C-u>tabonly<CR>

noremap ; :
imap <C-j> <esc>

" Tab補完
function! s:completion_check_bs()
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1] =~? '\s'
endfunction

inoremap <expr><silent><Tab> pumvisible() ? "\<C-n>" : (<sid>completion_check_bs() ? "\<Tab>" : deoplete#mappings#manual_complete())
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

set completeopt+=noinsert

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:caw_hatpos_skip_blank_line = 0
let g:caw_no_default_keymappings = 1
let g:caw_operator_keymappings = 0
nmap <C-C> <Plug>(caw:hatpos:toggle)
vmap <C-C> <Plug>(caw:hatpos:toggle)

" ------------------------
" ---- Other settings ----
" ------------------------
" ---- Enable Binary Mode
augroup BinaryEditVimrcCommands
    autocmd!
    autocmd BufReadPre  *.bin let &binary = 1
    autocmd BufReadPost * if &binary | silent %!xxd -g 1
    autocmd BufReadPost * set ft=xxd | endif
    autocmd BufWritePre * if &binary | %!xxd -r | endif
    autocmd BufWritePost * if &binary | silent %!xxd -g 1
    autocmd BufWritePost * set nomod | endif
augroup END

" ----------------------------
" ---- File type settings ----
" ----------------------------
" ---- Enable Filetype
filetype plugin indent on
filetype on
