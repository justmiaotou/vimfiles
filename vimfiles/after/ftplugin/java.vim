" JAVA section {
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"let JavaBrowser_Ctags_Cmd = "C:\ctags58\ctags.exe"
let JavaBrowser_Ctags_Cmd = "/usr/local/bin/ctags"

setlocal omnifunc=javacomplete#Complete

"Set 'completefunc' option to show parameters information IF YOU LIKE. e.g.
setlocal completefunc=javacomplete#CompleteParamsInfo
"You can map as follows for better display:
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
imap <C-X> <C-X><C-O>
" }
