set number
set relativenumber
syntax enable
set smartcase
set ruler
set magic

" Default indentation
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set ai
set si

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

augroup linux_kernel_style
    autocmd!
    autocmd BufRead,BufNewFile *.c,*.h call s:LinuxKernelStyle()
augroup END

function! s:LinuxKernelStyle()
    setlocal noexpandtab
    setlocal tabstop=8
    setlocal shiftwidth=8
    setlocal softtabstop=8
endfunction
