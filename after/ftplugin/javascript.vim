" JavaScript section {
let b:javascript_fold=1 "打开javascript折叠
let javascript_enable_domhtmlcss=1 "打开javascript对dom、html和css的支持
setlocal foldlevel=1

" check js syntax when you save
let g:syntastic_javascript_checker = "closurecompiler"

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

" Google Closure三件套
if has("win32")
    let g:syntastic_javascript_closure_compiler_path = 'c:\compiler.jar'
    " javascript dict path
    set dictionary=$VIMRUNTIME/vimfile/dict/javascript.dict

    " 对JS文件进行压缩
    map <F7> :!java -jar c:\compiler.jar --js % --js_output_file %:r.min.js --charset utf-8<CR>
else
    " javascript dict path
    set dictionary=$HOME/.vim/dict/javascript.dict

    " 对JS文件进行压缩
    map <F7> :!java -jar $HOME/.vim/lib/jscompiler.jar --js % --js_output_file %:r.min.js<CR>
endif
"map <F10> :!python C:\Python32\Lib\site-packages\closure_linter\gjslint-wrapper.py --nojsdoc %<CR>
" 对JS进行校验
map <F9> :!gjslint --nojsdoc % \| grep -v "Line too long"<CR>
" 对JS格式进行修正
"map <F9> :!fixjsstyle %<CR>

call JavaScriptFold()
setl fen
setl nocindent
" }
