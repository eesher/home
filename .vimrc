"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 全局配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"关掉兼容模式
set nocompatible
 
"设置历史记录步数
set history=400
 
"开启文件类型判断插件
filetype plugin on
filetype indent on
 
"当文件在外部被修改，自动更新该文件
set autoread

"设置快速保存和退出
"快速保存为,s
"快速退出（保存）为,w
"快速退出（不保存）为,q
nmap <leader>s :w!<cr>
nmap <leader>w :wq!<cr>
nmap <leader>q :q!<cr>

"map <C-F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"设置快捷键为win方式的快捷键
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set pastetoggle=<F3>

"tag
set tag=../tags,../TAGS,tags,TAGS

"cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-

"c\h文件切换
nnoremap <silent> <F12> :A<CR>

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>	neocomplete#undo_completion()
inoremap <expr><C-l>	neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ?
	neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up> neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let	g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
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
"cobalt2
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
autocmd FileType lua setlocal et | setlocal sta | setlocal sw=4
autocmd FileType proto setlocal et | setlocal sta | setlocal sw=4
"set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 缩进
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"自动缩进
set ai
 
"智能缩进
set si

"设置缩进的空格数为4
set autoindent

"设置自动缩进:即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set shiftwidth=4

"设置使用 C/C++ 语言的自动缩进方式
set cindent


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
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"winmanager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

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
"set fileencodings=Unicode,utf-8,gb2312,gbk,gb18030,latin-1
"set fencs=utf-8,Unicode,gb2312,gbk,gb18030,latin-1,cp936
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,latin-1,prc
"set fileencodings=ucs-bom,utf8,prc

"Vim 中当前编辑的文件的字符编码方式，
"Vim 保存文件时也会将文件保存为这种字符编码方式。
set fileencoding=utf-8
"set fileencoding=prc

" termencoding: Vim 所工作的终端 (或者 Windows 的 Console 窗口) 
" 的字符编码方式。这个选项对 GUI 模式的 gVim 无效，
" 而对 Console 模式的 Vim 而言就是Windows 控制台的代码页 
" (对于 Windows 而言)，并且通常我们不需要改变它。
" 下面这句只影响普通模式 (非图形界面) 下的 Vim。
"set termencoding=prc
let &termencoding=&encoding



