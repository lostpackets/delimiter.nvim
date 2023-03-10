function! main#TestPy3() range
    let symbol = input("Enter the symbol to join bbw with: ")
    let save_pos = getpos('.')

    if &selection == "visual"
        let currentLine = expand('<cword>')
    else
        let currentLine = expand('<cword>')
    endif

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

nnoremap <S-F1> :call main#TestPy3()<CR>
vnoremap <S-F1> :call main#TestPy3()<CR>
