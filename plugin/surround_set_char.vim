function! TestPy3() range
    let num_chars = input("Enter the number of characters to divide into sections: ")
    let surround_symbol = input("Enter the characters you want to surround your split characters with (example: '(@)'): ")
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
surround_symbol = vim.eval('surround_symbol')
start = vim.eval('currentLine')
bbw = re.findall(r'.{'+str(num_chars)+'}', start)
bbw = [surround_symbol.replace('@', word) for word in bbw]
pr=''.join(bbw)
EOF
    let X = pyeval('pr')
    execute "s/" .. currentLine .. "/" .. X .. "/"
    call setpos('.', save_pos)
endfunction
nnoremap <F11> :call TestPy3()<CR>
vnoremap <F11> :call TestPy3()<CR>
