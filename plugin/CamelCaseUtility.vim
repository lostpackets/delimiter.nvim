function! CapitalizeWord() range
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
bbw = [word.capitalize() for word in bbw]
pr=''.join(bbw)
EOF
    let X = pyeval('pr')
    execute "s/" .. currentLine .. "/" .. X .. "/"
    call setpos('.',save_pos)
endfunction
nnoremap <F12> :call CapitalizeWord()<CR>
vnoremap <F12> :call CapitalizeWord()<CR>
