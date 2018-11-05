set nu
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=80
set hlsearch
set incsearch
set showmatch
set autoindent

filetype indent on
syntax on

if has("autocmd")
    " Highlight TODO, FIXME, NOTE, etc.
    if v:version > 701
        autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\|OPTIMIZE\)')
        autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
    endif
endif

