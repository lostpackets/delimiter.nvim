function! s:TestPy3() range
    let currentLine = expand('<cword>')
    let symbol = input("Enter the symbol to join bbw with: ")
    let save_pos = getpos('.')

    python << EOF
import vim
import wordninja
start=vim.eval('currentLine')

bbw=wordninja.split(start)

symbol = vim.eval('symbol')
pr=symbol.join(bbw)

EOF
    let X = pyeval('pr')
    execute "s/" .. currentLine .. "/" .. X .. "/"
    call setpos('.',save_pos)

endfunction
command! Test call s:TestPy3()

nnoremap <F1> :call s:TestPy3()<CR>
vnoremap <F1> :call s:TestPy3()<CR>

