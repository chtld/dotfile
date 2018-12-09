set sw=2
set ts=2
set expandtab
set shiftwidth=2
set softtabstop=2
set winaltkeys=no
" set iskeyword

let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
" let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
" let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=-1  -src-specials -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'sumatrapdf -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\"" '

" let g:Tex_ViewRuleComplete_eps = 'start gsview64 $*.eps'
let g:Tex_ViewRule_eps = 'sumatrapdf'
let g:Tex_FormatDependency_eps = 'dvi,eps'
let g:Tex_CompileRule_eps = 'dvips -E -o $*.eps $*.dvi'
let g:Tex_CompileRule_dvi = 'latex -interaction=nonstopmode $*'

function! ChangeTexCompiler(complier)
  let g:Tex_CompileRule_pdf = a:complier.' -synctex=-1  -src-specials -interaction=nonstopmode $*'
endfunction

map <leader>lx :call ChangeTexCompiler('xelatex')<CR>
map <leader>lp :call ChangeTexCompiler('pdflatex')<CR>
map <leader>lt :!start tex -interaction=nonstopmode <C-R>%<CR>

