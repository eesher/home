"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 全局配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"关掉兼容模式
set nocompatible

"vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'fatih/vim-go'
"Plugin 'darrikonn/vim-gofmt'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'Valloric/YouCompleteMe'
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
 
"设置历史记录步数
set history=30
 
"开启文件类型判断插件
"filetype plugin on
"filetype indent on
 
"当文件在外部被修改，自动更新该文件
set autoread

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>

"tag
"set tag=../tags,../TAGS,tags,TAGS

"cscope
"set cscopequickfix=s-,c-,d-,i-,t-,e-

"c\h文件切换
nnoremap <silent> <F12> :A<CR>


"minibuffer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


" YouCompleteMe配置
"let g:ycm_key_list_select_completion = ['<Tab>']
"let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_gopls_binary_path = expand('$GOPATH/bin/gopls')
let g:ycm_gopls_args = ['-remote=auto']
"autocmd FileType c,cpp let b:ycm_hover = { 'command': 'GetDoc', 'syntax': &syntax }

" vim-go
"只开一个gopls
"let g:go_gopls_options = ['-remote=auto']

"autocmd BufWritePre *.go Fmt
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 字体和颜色
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开启语法
syntax enable
 
"设置字体
set guifont=Monospace:h12
 
"设置配色
"let base16colorspace=256 
"set background=dark
set t_Co=256
"autocmd BufRead,BufNewFile * syn match parens /[(){}\[\]]/ | hi parens ctermfg=blue
colorscheme onedark
"base16-ocean
 
"高亮显示当前行
set cursorline
"hi cursorline guibg=#222222
"hi CursorColumn guibg=#333333

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件和备份
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"关闭自动备份
set nobackup
set nowb

"关闭交换文件
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"开启折叠
set nofen
set fdl=0
set fdc=2
set fdm=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文字处理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置（软）制表符宽度为4
set tabstop=4
set softtabstop=4
set expandtab
"sw=4
set shiftwidth=4
autocmd FileType lua setlocal et | setlocal sta | setlocal sw=4
autocmd FileType proto setlocal et | setlocal sta | setlocal sw=4
autocmd FileType go setlocal et | setlocal sta | setlocal sw=4
"set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动缩进
set ai
 
"智能缩进
set si

"设置自动缩进:即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set autoindent


"设置使用 C/C++ 语言的自动缩进方式
set cindent

"tab=4 space
"set expandtab


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim 界面
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the curors - when moving vertical..
"set so=7
 
"Turn on WiLd menu
"set wildmenu
 
"显示标尺
set ruler
 
"设置命令行的高度
set cmdheight=1
 
"显示行数
set nu

"显示匹配的括号([{和}])
set showmatch

"高亮显示搜索的内容
set hlsearch

"taglist
"let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1

" open new buffer with go define
"let g:godef_split=0
"let g:go_def_mode = 'gopls'
"let g:go_info_mode='gopls'

"winmanager
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap <F3> :WMToggle<cr>

" tagbar
"nmap <F2> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、
"消息文本等。用户手册上建议只在 .vimrc 中改变它的值，
"事实上似乎也只有在 .vimrc 中改变它的值才有意义。
set encoding=utf-8
"set encoding=prc

"Vim 启动时会按照它所列出的字符编码方式逐一探测即将打开的文件的
"字符编码方式，并且将 fileencoding 设置为最终探测到的字符编码方式。
"因此最好将 Unicode 编码方式放到这个列表的最前面。
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1,prc


"Vim 中当前编辑的文件的字符编码方式，
"Vim 保存文件时也会将文件保存为这种字符编码方式。
set fileencoding=utf-8

" termencoding: Vim 所工作的终端 (或者 Windows 的 Console 窗口) 
" 的字符编码方式。这个选项对 GUI 模式的 gVim 无效，
" 而对 Console 模式的 Vim 而言就是Windows 控制台的代码页 
" (对于 Windows 而言)，并且通常我们不需要改变它。
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
let &termencoding=&encoding

