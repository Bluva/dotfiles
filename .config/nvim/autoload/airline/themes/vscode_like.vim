
" Save this as: autoload/airline/themes/vscode_like.vim
let g:airline#themes#vscode_like#palette = {}

function! airline#themes#vscode_like#refresh()
  let s:N1 = [ '#000000' , '#569cd6' , 17 , 75  ] " Normal mode - Left
  let s:N2 = [ '#d4d4d4' , '#2d2d2d' , 253, 236 ] " Normal mode - Middle
  let s:N3 = [ '#d4d4d4' , '#000000' , 253, 16  ] " Normal mode - Right
  let g:airline#themes#vscode_like#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let s:I1 = [ '#000000' , '#4ec9b0' , 17 , 73  ]
  let g:airline#themes#vscode_like#palette.insert = airline#themes#generate_color_map(s:I1, s:N2, s:N3)

  let s:V1 = [ '#000000' , '#c586c0' , 17 , 133 ]
  let g:airline#themes#vscode_like#palette.visual = airline#themes#generate_color_map(s:V1, s:N2, s:N3)

  let s:R1 = [ '#000000' , '#ce9178' , 17 , 167 ]
  let g:airline#themes#vscode_like#palette.replace = airline#themes#generate_color_map(s:R1, s:N2, s:N3)

  let g:airline#themes#vscode_like#palette.inactive = airline#themes#generate_color_map(
        \ [ '#666666' , '#1e1e1e' , 242 , 235 ],
        \ [ '#666666' , '#1e1e1e' , 242 , 235 ],
        \ [ '#666666' , '#1e1e1e' , 242 , 235 ])
endfunction

call airline#themes#vscode_like#refresh()
