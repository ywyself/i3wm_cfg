" 文件被改动后自动重新载入
set autoread


" 打开状态栏标尺
set ruler

" 显示行号
set number

" 不使用vi的键盘模式
set nocompatible

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"搜索逐字符高亮
set hlsearch
set incsearch

" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

set smarttab

" 设置tab符为4个空格
set tabstop=4
set softtabstop=4

" 设置自动缩进长度为4个空格
set shiftwidth=4

" 设置tab符自动转换为空格
set expandtab

" 设置智能缩进，可选方式：autoindent(继承前一行的缩进方式)，cindent(使用C样式的缩进 )，indentexpr
" 为C程序提供自动缩进
set smartindent

" 设置配色方案
colorscheme detorte
"let g:detorte_theme_mode = 'light'

" 语法高亮
syntax on

" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"set statusline=%m[%F]%r%m%y\ [FORMAT=%{&ff}]\ [TYPE=%Y]%*%= [asc=%03.3b] [L:%l,C:%c][Line:%L][%p%%]

function! File_size(f)
    let l:size = getfsize(expand(a:f))
    if l:size == 0 || l:size == -1 || l:size == -2
        return ''
    endif
    if l:size < 1024
        return l:size.' bytes'
    elseif l:size < 1024*1024
        return printf('%.1f', l:size/1024.0).'k'
    elseif l:size < 1024*1024*1024
        return printf('%.1f', l:size/1024.0/1024.0) . 'm'
    else
        return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'g'
    endif
endfunction

set statusline=%m%9*\ %*[%F]
set statusline+=%3*[%{File_size(@%)}]%y%r%w%*
set statusline+=%3*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*%9*%=%*
set statusline+=%5*\ %l:%c%V\ %*
set statusline+=%6*\ %L\ L\ %*
set statusline+=%7*\ %{&ff}\ %*
set statusline+=%6*\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}\ %*
set statusline+=\ %P\ %9*\ %*

hi User1 cterm=bold ctermfg=232 ctermbg=179
hi User2 cterm=None ctermfg=214 ctermbg=242
hi User3 cterm=None ctermfg=251 ctermbg=240
hi User4 cterm=bold ctermfg=169 ctermbg=239
hi User5 cterm=None ctermfg=208 ctermbg=238
hi User6 cterm=None ctermfg=246 ctermbg=237
hi User7 cterm=None ctermfg=250 ctermbg=238
hi User8 cterm=None ctermfg=249 ctermbg=240

" 总是显示状态行
set laststatus=2

" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 设置显示空白字符
set list
set listchars=tab:\>\ ,trail:.

" 设置行尾空格高亮
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

autocmd BufNewFile *.sh 0r ~/.vim/template/sh.tpl
autocmd BufNewFile *.html 0r ~/.vim/template/html.tpl
