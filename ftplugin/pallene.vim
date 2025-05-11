" autocmd BufRead,BufNewFile *.pln 

setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
setlocal fileformat=unix
setlocal encoding=utf-8
setlocal fileencoding=utf-8
setlocal textwidth=100
setlocal expandtab

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * if getline('$') !=# '' | call append('$', '') | endif
