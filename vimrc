syntax on

set number
nnoremap <F2> :set nonumber!<CR>

set ts=4
set et
set sw=4
set cindent
filetype indent on
filetype detect
autocmd FileType python setlocal et sw=4 ts=4 cindent


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,default
set termencoding=utf-8
set encoding=utf-8
set formatoptions+=m
set formatoptions+=B
