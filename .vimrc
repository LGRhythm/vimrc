if has('gui_running')
    set guioptions-=m
    set guioptions-=T  " no toolbar
    autocmd GUIEnter * simalt ~x
    if has('gui_win32')
        set guifont=TerminessTTF_Nerd_Font_Mono:h12:cANSI
    else
        set guifont=TerminessTTF\ Nerd\ Font\ Mono\ 12
    endif
endif
"================================================
"          基础设置
"================================================
let mapleader="\<space>"	"设置leader快捷键
syntax on	"自动语法高亮
set nocompatible	"去除vi一致性
set smartindent	"智能对齐
set autoindent	"自动对齐
set number	"显示行号
set confirm	"保存确认
set tabstop=4	"Tab键宽度
set softtabstop=4
set shiftwidth=4	"统一缩进宽度
set expandtab	"tab为空格
set hlsearch	"高亮搜索内容
set incsearch	"搜索实时高亮
set encoding=UTF-8	"编码设置
set laststatus=2	"总是显示状态行
set ruler	"右下角显示光标位置
set cmdheight=2	"命令行高度
set scrolloff=5	"头尾与光标保持5行距离
set autowrite	"切换buffer时自动保存当前文件
set wildmenu	"自身命令行模式补全
set clipboard=unnamed "可以访问系统剪切板

" 代码折叠
set foldmethod=syntax	"基于缩进或语法进行代码折叠
set nofoldenable	"启动时关闭代码折叠

"================================================
"        括号自动生成
"================================================
" vnoremap $1 <esc>`>a)<esc>`<i(<esc>
" vnoremap $2 <esc>`>a]<esc>`<i[<esc>
" vnoremap $3 <esc>`>a}<esc>`<i{<esc>
" vnoremap $$ <esc>`>a"<esc>`<i"<esc>
" vnoremap $q <esc>`>a'<esc>`<i'<esc>
" vnoremap $e <esc>`>a“<esc>`<i”<esc>

" 使用Tab键自动补全
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

" 使用回车键结束补全
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" 切换分屏窗口
map <leader>ww <C-w>w
map <leader>wj <C-w>j
map <leader>wk <C-w>k
map <leader>wh <C-w>h
map <leader>wl <C-w>l

" 常用操作映射leader键位
vnoremap <leader>/ :nohls<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>

"================================================
"        plug插件
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"================================================
call plug#begin('$HOME/.vim/plugged')

" 自动补全
" install yarn node
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim',{'branch': 'release'}
let g:coc_global_extensions=['coc-emmet', 'coc-highlight', 'coc-pairs', 'coc-snippets', 'coc-lists', 'coc-yank', 'coc-git', 'coc-json', 'coc-html', 'coc-css', 'coc-wxml', 'coc-eslint', 'coc-python', 'coc-yaml', 'coc-terminal', 'coc-lua', 'coc-sql', 'coc-texlab', 'coc-flutter', 'coc-vetur', 'coc-java', 'coc-rls', 'coc-prettier', 'coc-omnisharp']
" ccls - install ccls
" coc-flutter - install flutter dart
" bash - npm i -g bash-language-server
" coc-vetur - npm i -g vue-language-server
" coc-java - install jdk
" go - install gopls
" coc-python - sudo pip install jedi
" coc-prettier
command! -nargs=0 Prettier :CocComand prettier.formatFile

" NERDTree
Plug 'preservim/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'greggerz/nerdtree-svn-plugin'
" let NERDTreeWinPos='left'
" let NERDTreeWinSize=50
map <F2> :NERDTreeToggle<CR>

" TabBar
Plug 'humiaozuzu/TabBar'
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

" tagbar
Plug 'majutsushi/tagbar'
map <F3> :TagbarToggle<CR>
map <leader>td :Tbbd<CR>
map <leader>tp :Tbbp<CR>
map <leader>tn :Tbbn<CR>

" vim-airline
Plug 'bling/vim-airline'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
map <leader>ff :FZF<CR>
map <leader>FF :FZF ~<CR>
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Vue高亮
"Plug 'posva/vim-vue'
"au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css
"au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" 注释
Plug 'preservim/nerdcommenter'

" 版本控制行显示
Plug 'mhinz/vim-signify'

" 主题
Plug 'joshdick/onedark.vim'
set rtp+=$HOME/.vim/plugged/onedark.vim/
"Plug 'dracula/vim', { 'as': 'dracula' }
"set rtp+=$HOME/.vim/plugged/dracula/
"Plug 'tomasr/molokai'
"set rtp+=$HOME/.vim/plugged/molokai
"Plug 'ron-rs/ron.vim'
"set rtp+=$HOME/.vim/plugged/ron.vim/
colorscheme onedark

call plug#end()

" 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on

autocmd BufWritePost $MYVIMRC source $MYVIMRC
