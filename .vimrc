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

"================================================
"        plug插件
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"================================================
call plug#begin('$HOME/.vim/plugged')

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
map <A-w> :Tbbd<CR>

" emmet
Plug 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key='C-j'

" vim-airline
Plug 'bling/vim-airline'

" 代码块
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Vue高亮
Plug 'posva/vim-vue'
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

" 自动补齐括号
Plug 'jiangmiao/auto-pairs'

" 注释
Plug 'mhinz/vim-signify'

" 主题
Plug 'dracula/vim', { 'as': 'dracula' }
set rtp+=$HOME/.vim/plugged/dracula/
colorscheme dracula

call plug#end()

" 加载vim自带和插件相应的语法和文件类型相关脚本
filetype plugin indent on

autocmd BufWritePost $MYVIMRC source $MYVIMRC
