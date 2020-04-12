"================================================
"          基础设置
"================================================
let mapleader=";"	"设置leader快捷键
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

"================================================
"        plug插件
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"================================================
call plug#begin('$HOME/.vim/plugged')

" 自动补全
" install yarn node
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" coc-emmet coc-highlight coc-pairs coc-snippet coc-lists coc-yank coc-git
" coc-json coc-html coc-css coc-wxml coc-eslint coc-yaml coc-prettier
" coc-tabnine coc-terminal coc-lua coc-sql coc-texlab
" ccls - install ccls
" coc-flutter - install flutter dart
" bash - npm i -g bash-language-server
" coc-vetur - npm i -g vue-language-server
" coc-java - install jdk
" go - install gopls
" coc-python - sudo pip install jedi
command! -nargs=0 Prettier :CocComand prettier.formatFile

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'greggerz/nerdtree-svn-plugin'
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

" vim-airline
Plug 'bling/vim-airline'

" Vue高亮
"Plug 'posva/vim-vue'
"au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css
"au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" 注释
Plug 'preservim/nerdcommenter'

" 版本控制行显示
Plug 'mhinz/vim-signify'

" 主题
Plug 'dracula/vim', { 'as': 'dracula' }
set rtp+=$HOME/.vim/plugged/dracula/
colorscheme dracula

call plug#end()

" 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on

autocmd BufWritePost $MYVIMRC source $MYVIMRC
