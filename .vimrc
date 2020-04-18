" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
        syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
        filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
        source /etc/vim/vimrc.local
endif
let mapleader=" "             " 设置leader键为空格键
set nocompatible              " 不以兼容模式运行
set encoding=utf-8            " utf-8编码
set helplang=cn               " 中文帮助文档
set number                    " 显示行号
set wrap                      " 自动换行
set showcmd                   " 显示输入信息
"set cursorline                " 显示光标所在行
set wildmenu                  " 显示补全提示
set hlsearch                  " 高亮搜索结果
set colorcolumn=80
"set foldenable               " 允许折叠 
"set foldmethod=manual        " 手动折叠  
"打开vim运行nohlsearch，取消高亮
exec "nohlsearch"
set ts=4                      " 设置tab键长度为四个空格
set expandtab                 " 设置tab键替换为四个空格键
set shiftwidth=4
" 将文件中的tab键替换成空格
map <LEADER>    :retab!<CR>
set incsearch                 " 一边输入一边高亮
set ignorecase                " 忽略大小写
set smartcase                 " 智能大小写
set laststatus=2              " 设置状态栏在倒数第2行

" 设置状态栏格式
"set statusline=%<%F%=%y%m%r%h%w%{&ff}\[%{&fenc}]0x%02B@%040h#%n\(%3l/%3L,%3c\|%3v\)%3p%%
set statusline=%1*\%<%.50F\               "显示文件名和文件路径
set statusline+=%=%2*\%y%m%r%h%w\ %*      "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %* "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %* "显示光标所在行和列
set statusline+=%5*\%3p%%\%*              "显示光标前文本所占总文本的比例
hi User1 cterm=none ctermfg=25 ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0

set mouse=a                           " 启用鼠标
set backspace=indent,eol,start        " 退格键可以退到上一行
set scrolloff=5                       " 光标行上下移动范围各缩小5行
"set ruler
"set transparency=11
" 设置背景透明
hi Normal ctermfg=252 ctermbg=none
"寻找下一搜索结果，并将其置于屏幕中心
noremap = nzz               
"寻找上一搜索结果，并将其置于屏幕中心
noremap - Nzz
"取消高亮
noremap <LEADER><CR> :nohlsearch<CR>
map s <nop>
"保存
map S :w<CR>
"退出
map Q :q<CR>
"右分屏，聚焦右窗口
map sl :set splitright<CR>:vsplit<CR>
"左分屏，聚焦左窗口
map sh :set nosplitright<CR>:vsplit<CR>
"上分屏，聚焦上窗口
map sk :set nosplitbelow<CR>:split<CR>
"下分屏，聚焦下窗口
map sj :set splitbelow<CR>:split<CR>
"光标移至右窗口
map <LEADER>l <C-w>l
"光标移至上窗口
map <LEADER>k <C-w>k
"光标移至下窗口
map <LEADER>j <C-w>j
"光标移至左窗口
map <LEADER>h <C-w>h
"窗口上移
map <up> :res +5<CR>
"窗口下移
map <down> :res -5<CR>
"窗口左移
map <left> :vertical resize-5<CR>
"窗口右移
map <right> :vertical resize+5<CR>
"新建标签页
map <C-n> :tabe<CR>
"前一标签页
map t- :-tabnext<CR>
"后一标签页
map t= :+tabnext<CR>
"重新加载vim配置文件
map rc :source $MYVIMRC<CR>
"寻找两个相等的单词
map <LEADER>fd /\(\<\w\+\>\)\_s*\1
"替换占空符<++>
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l
"全选
map <C-a> ggVG
"打开我的vimrc
map <LEADER>rc :e ~/.vimrc<CR>
"复制到系统剪切板
map +y "+y
"从系统剪切板粘贴
map +p "+p

"set list
"set listchars=tab:>-,trail:-
"自动匹配括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
function! ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endfunction
"不同模式下光标样式不同
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
let &t_SR = "\<Esc>]50;CursorShape=2\x7" 
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 
"打开文件，光标回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"创建文件头
autocmd BufNewFile *.py,*.tex exec ":call SetTitle()"

func! SetTitle()
        if &filetype == 'sh'
                call setline(1,          "#!/usr/bin/env bash")
                call append(line(".")+1,  "")
                call append(line(".")+2, "##########################################################################")
                call append(line(".")+3, "# File Name: ".expand("%"))
                call append(line(".")+4, "# Author: shengdexiang@gmail.com")
                call append(line(".")+5, "# Created Time: ".strftime("%c"))
                call append(line(".")+6, "##########################################################################")
                call append(line(".")+7, "")
                call append(line(".")+8, "")
        endif
        if &filetype == 'python'
                call setline(1,          "#!/usr/bin/env python3")
                call append(line("."),   "# -*- coding: utf-8 -*-")
                call append(line(".")+1,  "")
                call append(line(".")+2, "##########################################################################")
                call append(line(".")+3, "# File Name: ".expand("%"))
                call append(line(".")+4, "# Author: shengdexiang@gmail.com")
                call append(line(".")+5, "# Created Time: ".strftime("%c"))
                call append(line(".")+6, "##########################################################################")
                call append(line(".")+7, "")
                call append(line(".")+8, "")
        endif
        if &filetype == 'plaintex'
                call setline(1,          "% -*- coding: utf-8 -*-")
                call append(line("."),   "%#########################################################################")
                call append(line(".")+1, "% File Name: ".expand("%"))
                call append(line(".")+2, "% Author: stubborn vegeta")
                call append(line(".")+3, "% Created Time: ".strftime("%c"))
                call append(line(".")+4, "%#########################################################################")
        endif
        autocmd BufNewFile * normal G
endfunc

"" 设置注释快捷键 
map <LEADER>r :call Note()<CR>
func! Note()
        if &filetype == 'python'
                normal 0i#
        endif
        if &filetype == 'vim'
                normal 0i"
        endif
        if &filetype == 'plaintex'
                normal 0i%
        endif
endfunc

" 设置取消注释  
map <LEADER>t 0df j
"编译运行
map <F5> :call RunPython()<CR>

func! RunPython()
    exec "W"
    if &filetype == 'python'
        " exec "!time python3.6 %"
        "exec ":set splitbelow<CR>:split<CR>"
        exec "!time python3.6 %"
    endif
    if &filetype == 'dot'
        exec "!dot % -T png -o %.png"
        exec "!feh %.png"
    endif
endfunc

"colorscheme molokai
set t_Co=256            "开启256色支持
"set background=dark
