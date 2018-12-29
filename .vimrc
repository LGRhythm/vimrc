let mapleader=";"
syntax on	"自动语法高亮
set smartindent	"智能对齐
set autoindent	"自动对齐
set number	"显示行号
set confirm	"保存确认
set tabstop=4	"Tab键宽度
set softtabstop=4
set shiftwidth=4	"统一缩进为4
set expandtab	"expand tab to space
set hlsearch
set incsearch	"搜索逐字符高亮
set encoding=utf-8	"编码设置
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
set laststatus=2	"总是显示状态行
set ruler	"右下角显示光标位置
set cmdheight=2	"命令行高度
set scrolloff=3	"光标移动到buffer顶部和底部时保持3行距离
set showmatch	"高亮显示对应括号
set autowrite	"切换buffer时自动保存挡墙文件
"set whichwrap=b,s,<,>,{,}	"开启Normal或Visual模式下Backspace键，空格键，左右方向键，Insert或replace模式下左右方向键跳行功能

" 搜索设置
set incsearch	"开启实时搜索功能
set ignorecase	"搜索时大小写不敏感
set wildmenu	"自身命令行模式补全

"代码折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 配色方案
"colorscheme solarized
"colorscheme monokai

" 文件类型匹配
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"================================================自定义映射=================================================
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a”<esc>`<i“<esc>
"括号自动生成

map <F7> :if exists("syntax_on") <BAR>
			\	syntax off <BAR><CR>
			\	else <BAR>
			\	syntax enable <BAR>
			\	endif
"单键<F7>控制syntax on/off。有时候颜色太多影响阅读

set nocompatible              " 去除VI一致性,必须要添加
filetype on		"文件侦测
filetype plugin on	"根据不同文件类型加载对应插件

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理插件版本,必须
Bundle 'VundleVim/Vundle.vim'

"================================================
"	NERDTree
"================================================
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'greggerz/nerdtree-svn-plugin'
"let NERDTreeWinPos='left'
"let NERDTreeWinSize=50
"let g:NERDTreeNodeDelimiter=''
map <F2> :NERDTreeToggle<CR>

"================================================
"	TabBar
"================================================
Bundle 'humiaozuzu/TabBar'
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

"================================================
"	tagbar
"================================================
Bundle 'majutsushi/tagbar'
map <F3> :TagbarToggle<CR>

"================================================
"	syntastic语法检查
"================================================
"Bundle 'scrooloose/syntastic'

"================================================
"	emmet
"================================================
Bundle 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key='<C-j>'

"================================================
"	vim-airline
"================================================
Bundle 'bling/vim-airline'

"================================================
"	ctrlp
"================================================
"Bundle 'kien/ctrlp.vim'

"================================================
"	vim-ack
"================================================
"Bundle 'mileszs/ack.vim'

"================================================
"	YouCompleteMe
"================================================
Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"================================================
"   代码块
"================================================
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

"================================================
"	Vue高亮
"================================================
Bundle 'posva/vim-vue'
au BufRead,BufNewFile *.wpy setlocal filetype=vue.html.javascript.css
au BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"================================================
"   自动补齐括号
"================================================
Bundle 'jiangmiao/auto-pairs'

"================================================
"   注释
"================================================
Bundle 'scrooloose/nerdcommenter'

"================================================
"   版本控制
"================================================
Bundle 'mhinz/vim-signify'
"Bundle 'borissov/nerdtree-svn-plugin'

"================================================
"   调试
"================================================
Bundle 'idanarye/vim-vebugger'
Bundle 'Shougo/vimproc.vim'
let g:vebugger_leader=';'

"================================================
"	配色插件
"================================================
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'fisadev/fisa-vim-colorscheme'

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall     - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后

autocmd BufWritePost $MYVIMRC source $MYVIMRC
