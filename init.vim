" --------------------------
"  --- Encoding Setting ----
" --------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-boms,euc-jp,cp932
set termencoding=utf-8
scriptencoding utf-8

" ---- Disable Filetype for Read file settings
filetype off
filetype plugin indent off

" --------------------------
" ---- Install vim-plug ----
" --------------------------
if has('vim_starting')
    set runtimepath+=~/.config/nvim/plugged/vim-plug
    if !isdirectory(expand('$NVIM_HOME') . '/plugged/vim-plug')
        call system('mkdir -p ~/.config/nvim/plugged/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ', expand('$NVIM_HOME/plugged/vim-plug/autoload'))
    end
endif

" let g:ale_completion_enabled = 1

" -------------------------
" ---- Plugins Install ----
" -------------------------
call plug#begin(expand('$NVIM_HOME') . '/plugged')
    Plug 'junegunn/vim-plug', {'dir': expand('$NVIM_HOME') . '/plugged/vim-plug/autoload'}
    Plug 'codota/tabnine-vim'
    Plug 'tyru/caw.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'sbdchd/neoformat'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'nvim-lua/completion-nvim'
call plug#end()

" --------------------------------------
" ---- Plugin Dependencies Settings ----
" --------------------------------------
if !has('python') && !has('pip')
    call system('pip install --upgrade pip')
    call system('pip install neovim --upgrade')
endif

if !has('python3') && !has('pip3')
    call system('pip3 install --upgrade pip')
    call system('pip3 install neovim --upgrade')
endif

let g:python_host_skip_check = 1
let g:python2_host_skip_check = 1
let g:python3_host_skip_check = 1

if executable('python2')
    let g:python_host_prog=system('which python2')
endif

if executable('python3')
    let g:python3_host_prog=system('which python3')
endif

" ----------------------------
" ---- AutoGroup Settings ----
" ----------------------------
augroup AutoGroup
    autocmd!
augroup END

command! -nargs=* Autocmd autocmd AutoGroup <args>
command! -nargs=* AutocmdFT autocmd AutoGroup FileType <args>

" --------------------------------------------------
" ---- Language Server Protocol Client settings ----
" --------------------------------------------------
" Tab補完
let g:trans_bin = '/usr/local/bin'

let s:undo_dir = expand('$NVIM_HOME/cache/undo')
if !isdirectory(s:undo_dir)
  call mkdir(s:undo_dir, 'p')
endif
if has('persistent_undo')
  let &undodir = s:undo_dir
  set undofile
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
AutocmdFT gitcommit let b:EditorConfig_disable = 1


" ----------------------------
" ---- File type settings ----
" ----------------------------
Autocmd BufNewFile,BufRead *.go,*go.mod set filetype=go
Autocmd BufNewFile,BufRead *.dart set filetype=dart
Autocmd BufNewFile,BufRead *.erls,*.erl set filetype=erlang
Autocmd BufNewFile,BufRead *.es6 set filetype=javascript
Autocmd BufNewFile,BufRead *.exs,*.ex set filetype=elixir
Autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
Autocmd BufNewFile,BufRead *.py set filetype=python
Autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
Autocmd BufNewFile,BufRead *.rs set filetype=rust
Autocmd BufNewFile,BufRead *.tmpl set filetype=html
Autocmd BufNewFile,BufRead *.ts set filetype=typescript
Autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
Autocmd BufNewFile,BufRead *.{[Dd]ockerfile,[Dd]ock} set filetype=dockerfile
Autocmd BufNewFile,BufRead Dockerfile* set filetype=dockerfile
Autocmd BufNewFile,BufRead *.rasi set filetype=css

" ------------------------------
" ---- Indentation settings ----
" ------------------------------
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=2
" let g:indent_guides_auto_colors=0
" let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1
let g:indentLine_faster = 1
nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>

local lspconfig = require'lspconfig'
lspconfig.gopls.setup{
  root_dir = lspconfig.util.root_pattern('.git');
}
AutocmdFT go setlocal omnifunc=v:lua.vim.lsp.omnifunc
"lsp.txtそのまま
nnoremap <silent> 1gD           <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <Leader>[     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_next_diagnostic()<CR>
nnoremap <silent> <Leader>]     <cmd>lua vim.lsp.strutures.Diagnostics.buf_move_prev_diagnostic()<CR>
nnoremap <silent> <c-k>         <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K             <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> g0            <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gD            <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gR            <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gW            <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd            <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gdd           <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr            <cmd>lua vim.lsp.buf.references()<CR>


call sign_define("LspDiagnosticsErrorSign", {"text" : "E", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "W", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})

let g:diagnostic_show_sign = 1
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 0
let g:diagnostic_virtual_text_prefix = '<'

" -------------------------
" ---- Format settings ----
" -------------------------
"  JSON Formatter
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

" ----------------------------
" ---- gitgutter settings ----
" ----------------------------
let g:gitgutter_max_signs = 10000
let g:gitgutter_git_executable = '/usr/bin/git'

" ---------------------
" ---- Caw Setting ----
" ---------------------
let g:caw_hatpos_skip_blank_line = 0
let g:caw_no_default_keymappings = 1
let g:caw_operator_keymappings = 0
nmap <C-C> <Plug>(caw:hatpos:toggle)
vmap <C-C> <Plug>(caw:hatpos:toggle)

Autocmd BufWritePre * Neoformat

AutocmdFT  go let g:go_def_reuse_buffer = 1
AutocmdFT *.zsh,*.bash,*.sh,zshrc let g:neoformat_zsh_shfmt = {
      \   'exe': 'shfmt',
      \   'args': ['-l','-w','-s','-i', 4],
      \   'stdin': 1,
      \ }

" ------------------------
" ---- Other settings ----
" ------------------------
" ---- Enable Binary Mode
Autocmd BufReadPre  *.bin let &binary = 1
Autocmd BufReadPost * if &binary | silent %!xxd -g 1
Autocmd BufReadPost * set ft=xxd | endif
Autocmd BufWritePre * if &binary | %!xxd -r | endif
Autocmd BufWritePost * if &binary | silent %!xxd -g 1
Autocmd BufWritePost * set nomod | endif

" -------------------------
" ---- Default Setting ----
" -------------------------

set completeopt=menu,preview,noinsert

" ---- Enable Word Wrap
set wrap

" ---- Max Syntax Highlight Per Colmun
set synmaxcol=2000

" ---- highlight both bracket
set showmatch matchtime=2
set list listchars=tab:>\ ,trail:_,eol:↲,extends:»,precedes:«,nbsp:%

set display=lastline
" ---- 2spaces width for ambient
" set ambiwidth=double

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

" ---- Disable Search Result Distinction
set infercase

" ---- Disable Lower Upper
set smartcase

" ---- Always Shows Status line
set laststatus=2

" ---- Always Show cmd
set showcmd

" ---- Disable Beep Sound
set visualbell t_vb=
set novisualbell
set noerrorbells

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

" ---- open current buffer
set switchbuf=useopen

" ---- History Count
set history=100

" ---- Enable mouse Controll
set mouse=a
set guioptions+=a

" ---- Faster Scroll
set lazyredraw
set ttyfast

set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!
set shortmess+=I
set fileformat=unix
set fileformats=unix,dos,mac
set foldmethod=manual
if executable('zsh')
    set shell=zsh
endif

" --------------------------
" ----- Color Setting ------
" --------------------------
colorscheme monokai
highlight Normal ctermbg=none
" colorscheme spring-night
" colorscheme gotham256
" let g:lightline = { 'colorscheme': 'gotham256' }

let g:monokai_italic = 1
let g:monokai_thick_border = 1
" hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

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
nnoremap <silent> gj j
nnoremap <silent> gk k

" ウィンドウの移動をCtrlキーと方向指定でできるように
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Esc2回で検索のハイライトを消す
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" gをバインドキーとしたtmuxと同じキーバインドでタブを操作
nnoremap <silent> gc :<C-u>tabnew<CR>
nnoremap <silent> gx :<C-u>tabclose<CR>
nnoremap gn gt
nnoremap gp gT
" g+oで現在開いている以外のタブを全て閉じる
nnoremap <silent> go :<C-u>tabonly<CR>

noremap ; :
inoremap <C-j> <esc>
inoremap <C-s> <esc>:w<CR>
nnoremap <C-q> :qall<CR>

" ---- Enable Filetype
filetype plugin indent on
filetype on
