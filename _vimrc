" >--------------------------<
" 关于submodule的同步：
"   Storage >git submodule init
"   Storage >git submodule update
" >--------------------------<
" Normal Setting {
let mapleader = ";"

"保存文件
map <F2> :w<CR>
"关闭文件
map <F3> :q<CR> 
"打开上级菜单
"map <F4> :e .<CR>
map <F4> :NERDTree<CR>
map <F5> :Tlist<CR>
" 清除文件末尾空格
map <F6> :%s/\s\+$//gi<CR>
"map <silent> <F7> :TlistToggle<CR>
" 设置是否显示行号
"map <F12> :set nu!<CR>
map <F12> :call ToggleHighlightError()<CR>

imap jj <ESC>
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

" 打开语法高亮
syntax on
" 使~/.vim/after/ftplugin生效
filetype plugin indent on
set fileformats=unix
" 显示行号
set nu
" 颜色主题
colo desert
" 不兼容旧版vi
set nocompatible
" 一直显示状态栏
set laststatus=2
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 缩进为4个空格宽度
set tabstop=4
" 自动缩进使用的空格数
set shiftwidth=4
" 编辑插入tab时，把tab算作的空格数
set softtabstop=4
" 缩进使用空格
set expandtab
" 自动缩进
set autoindent
" 鼠标捕捉
set mouse=a
" 文件如果外部被修改则自动读取
set autoread
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
" so = scrolloff
set so=5
" 搜索高亮
set hlsearch
" 开启高光标行
" set cursorline
hi CursorLine guibg=#252525
" 开启高光标列 
"set cursorcolumn 
"hi CursorColumn guibg=#252525

"文件默认编码"
set enc=utf-8
"set enc=cp936
"set encoding=cp936
"文件保存时使用的编码
set fileencoding=utf-8
"打开文件进行解码的猜测列表，严格编码放在前面，宽松的放后面
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 高亮行尾空格
hi WhiteSpace guibg=red
syn match WhiteSpace /\s\+$/

"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.UTF-8

" Format the statusline
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
" Status color
" highlight StatusLine guifg=SlateBlue guibg=Yellow
" highlight StatusLine guifg=SlateBlue guibg=White
" highlight StatusLineNC guifg=Gray guibg=White

" persistent undo
set undofile
set undodir=$HOME/\_undofiles
set undolevels=2000

" 设置显示字体
if has("win32")
    " cp936是GBK的别名，GBK是GB2312的超集
    "map <F7> :set fileencoding=cp936<CR>
    "map <F8> :set fileencoding=utf-8<CR>
    " Set helplang
    set helplang=cn
    " guioption 隐藏菜单栏
    set go=
    "Fast reloading of the _vimrc
    map <silent> <leader>s :source ~/_vimrc<cr>
    "Fast editing of _vimrc
    map <silent> <leader>e :call SwitchToBuf("~/_vimrc")<cr>
    "When _vimrc is edited, reload it
    autocmd! bufwritepost _vimrc source ~/_vimrc
    "set backupdir=D:\backup\
    "最大化窗口
    au GUIEnter * simalt ~x
    set guifont=Bitstream\ Vera\ Sans\ Mono:h11:cANSI
    set guifontwide=YouYuan:h12
    source $VIMRUNTIME\vimrc_example.vim
    source $VIMRUNTIME\mswin.vim
    behave mswin
else
    "Fast reloading of the .vimrc
    map <silent> <leader>s :source ~/.vimrc<cr>
    "Fast editing of .vimrc
    map <silent> <leader>e :call SwitchToBuf("~/.vimrc")<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
    "set backupdir=$HOME/vim_backup/
endif

" 取消文件备份
set nobackup
set nowb
set noswapfile
" 设置备份文件后缀
set backupext=.bak
" }

""""""""""""""""""""""""""""""

" Pathogen {
call pathogen#infect()
" }

""""""""""""""""""""""""""""""

" JSLint {
let g:JSLintHighlightErrorLine = 0
function! ToggleHighlightError()
    if g:JSLintHighlightErrorLine == 0
        let g:JSLintHighlightErrorLine = 1
    else
        let g:JSLintHighlightErrorLine = 0
    endif
endfun
" }

""""""""""""""""""""""""""""""

" Powerline {
set nocompatible
set t_Co=256
if has('win32')
    let g:Powerline_symbols = 'compatible'
else
    let g:Powerline_symbols = 'fancy'
endif
let g:Powerline_colorscheme = 'solarized256'
" }

""""""""""""""""""""""""""""""

" NERDTree {
let NERDTreeWinSize=20
" }

""""""""""""""""""""""""""""""

" Tag list (ctags) {
if has("win32")                         "设定windows系统中ctags程序的位置
    let Tlist_Ctags_Cmd = 'C:\ctags58\ctags.exe'
else                    "设定linux系统中ctags程序的位置
    let Tlist_Ctags_Cmd = '~/.vim/lib/ctags'
endif
let Tlist_Show_One_File = 1             "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1          "在右侧窗口中显示taglist窗口
let Tlist_WinWidth=30
" }

""""""""""""""""""""""""""""""

" Syntastic {
" active mode: 当一个buffer保存或第一次打开时自动检查
" passive mode: 当使用命令:SyntasticCheck时进行检查
" lnext: 跳至下一个错误
" lprev: 跳至上一个错误
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['', ''],
            \ 'passive_filetypes': ['javascript'] }
" 自动跳转到第一个错误
let g:syntastic_auto_jump=1
" 当有错误时自动打开error window
let g:syntastic_auto_loc_list=1
" }

""""""""""""""""""""""""""""""

" Functions {
" 想预先打开的文件
function! PreOpen()
    cd D:\Users\Administrator\Documents\My doc\FE\lab\
    open canvas.html
    tabe js\test\canvas-test.js
    tabe css\memo.css
    tabe js\test\common.js

    "set autochdir
endfunction

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" Platform
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

function! SwitchToBuf(filename)
    " let fullfn = substitute(a:filename, "^\\~/", $HOME . "/", "")
    " find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        "exec bufwinnr . "wincmd w"
        return
    else
        " find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal " . tab . "gt"
                "exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab + 1
        endwhile
        " not exist, new tab
        exec "tabnew " . a:filename
    endif
endfunction
" }
"
""""""""""""""""""""""""""""""""""""""""""""
"           常用 TIPs
""""""""""""""""""""""""""""""""""""""""""""
"   :vimgrep /pattern/gj *.js   当前目录下的js文件中查找符合正则的行
"                               :cl 所有匹配结果
"                               :cn 到下一个
"                               :cp 到上一个
"                               j标志位表示搜索后留在当前文件
"                   >>----------------------------------<< 
"   :w !sudo tee %      保存需要sudo权限的文件      
"                   >>----------------------------------<< 
"   CTRL + ]            跳转到XXX标签（可跨文件，例如帮助文件里的绿色关键字）
"   CTRL + t            回跳到上个标签（同上）
"   ``                  可以回跳到上一个位置. 多次按``会在两个位置间跳转
"   CTRL + o            跳到前一个编辑点
"   CTRL + i            跳到下一个编辑点
"                   >>------------- mark ----------------<< 
"   :marks              当前可用marks
"   mt                  t为任意字母。在当前位置设置一个名字为t的mark
"   `t                  可以通过查看:marks查询有哪些t可用，然后用此命令跳转至
"                   >>------------ record --------------<< 
"   q[a-z]             开始记录键入的指令，名称为a-z中的一个字母
"   q                  记录完成
"   q[A-Z]             扩展之前记录的名称为[a-z]的指令集
"   [n]@[a-z]          执行n次之前记录的名称为[a-z]的行为
"   @@                 重复上次指令
