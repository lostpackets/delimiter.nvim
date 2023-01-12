function! TestPy4() range
    let num_chars = input("Enter the number of characters to divide into sections: ")
    let symbol = input("Enter the symbol to join bbw with: ")
    let save_pos = getpos('.')

    if &selection == "visual"
        let currentLine = expand('<cword>')
    else
        let currentLine = expand('<cword>')
    endif

    python << EOF
import vim
import re
num_chars = int(vim.eval('num_chars'))
start = vim.eval('currentLine')
bbw = re.findall(r'.{'+str(num_chars)+'}', start)
symbol = vim.eval('symbol')
pr=symbol.join(bbw)
EOF
    let X = pyeval('pr')
    execute "s/" .. currentLine .. "/" .. X .. "/"
    call setpos('.',save_pos)
endfunction
nnoremap <F11> :call TestPy4()<CR>
vnoremap <F11> :call TestPy4()<CR>
