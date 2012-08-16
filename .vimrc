" Author fanshengshuai (fanshengshuai@gmail.com)

" 环境设置
let mapleader = ","
let g:mapleader = ","

set enc=utf-8
set ambiwidth=double
set fencs=utf-8,gb2312,gbk
set helplang=cn

" 关闭 vi 兼容模式
set nocp
set viminfo='20,\"50,:20,%,n~/.viminfo " Remember things between sessions

syntax on
colorscheme koehler
filetype plugin indent on

" 打开文件时，按照 viminfo 保存的上次关闭时的光标位置重新设置光标
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"autocmd FileType php set bin noeol
au BufRead,BufNewFile *.tpl set filetype=html

"set cinkeys=0{,0},:,0#,!<Tab>,!^F
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

au FileType javascript call JavaScriptFold()
au FileType javascript let g:neocomplcache_enable_at_startup=1
"au FileType javascript setl fen
"au FileType javascript setl nocindent
"au FileType javascript setl nosi
"au FileType javascript setl cinoptions=J0,e100

set list
set ai " 自动缩进
set sm "显示括号配对情况

set ru " Show line, column number, and relative position within a file in the status line
set nu " show line number
set rulerformat=%15(%c%V\ %p%%%)

set linebreak " 英文单词在换行时不被截断
"set textwidth=80 " 设置每行80个字符自动换行，加上换行符
set wrap " 设置自动折行

set formatoptions+=r " 自动加注释
set comments=:// " 单行注释
set comments=s1:/*,mb:*,ex0:/ " 段落注释

set incsearch " Enable incremental search
set hlsearch " Don't highlight results of a search

set autowrite " Write contents of the file, if it has been modified, on buffer exit
set backspace=indent,eol,start " Allow backspacing over everything
set completeopt=menu,longest,preview " Insert mode completion options
set history=100 " Remember up to 100 'colon' commmands and search patterns
set laststatus=2 " Always show status line, even for one window
set matchtime=2 " Jump to matching bracket for 2/10th of a second (works with showmatch)
set nrformats=octal,hex,alpha " Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set pastetoggle=<F10> " Use F10 to toggle 'paste' mode
set scrolloff=3 " Scroll when cursor gets within 3 characters of top/bottom edge

set expandtab
set lcs=tab:>-,trail:-
set tabstop=4 " Use 4 spaces for <Tab> and :retab
set softtabstop=4
set shiftwidth=4 " Use 4 spaces for (auto)indent
set shiftround " Round indent to multiple of 'shiftwidth' for > and < commands

set showcmd " Show (partial) commands (or size of selection in Visual mode) in the status line
set showmatch " When a bracket is inserted, briefly jump to a matching one
set t_RV= " Don't request terminal version string (for xterm)
set updatecount=50 " Write swap file to disk after every 50 characters
set wildmode=list:longest,full " Set command-line completion mode
"set tags=./tags,./../tags,./*/tags

set complete=.,w,b,k,t,i " 自动完成
set completeopt=longest,menu " 只在下拉菜单中显示匹配项目，并且会自动插入所有匹配项目的相同文本
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set wildmenu "打开 wildmenu 选项，启动具有菜单项提示的命令行自动完成。
set matchpairs=(:),{:},[:],<:>
set whichwrap=b,s,<,>,[,]
set stl=\ %F%y[%{&fileformat},%{&fileencoding}]\ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "设置状态栏的信息
set ignorecase " 搜索时无视大小写
set pastetoggle=<F3>

map <F4> :call AddTitle()<cr>'s
map <F6> :!php %<cr>
nmap <tab> :tabnext<cr>
nmap <S-Tab> :tabprevious<cr>
nmap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>
nmap <C-m> :call PhpDocSingle()<cr>
map mc :set mouse=<cr>
map mo :set mouse=a<cr>
map ca :Calendar<cr>
map f/ :Grep 
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<cr>
nmap ,fn :TlistToggle<cr>
nmap ,fi :NERDTreeToggle<cr>
nmap gf :new %:p:h/<cfile><cr>
nmap ctags :!ctags -R --exclude="\.svn" --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public \|static \|abstract \|protected \|private )+function ([^ (]*)/\2/f/'
vmap < <gv
vmap > >gv

highlight Comment cterm=none ctermfg=Gray
highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
highlight Search cterm=none ctermfg=White ctermbg=4
highlight String cterm=none ctermfg=DarkGreen
highlight treeDir cterm=none ctermfg=Cyan
highlight treeUp cterm=none ctermfg=DarkYellow
highlight treeCWD cterm=none ctermfg=DarkYellow
highlight netrwDir cterm=none ctermfg=Cyan


" {{{ lookupfile setting
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let tlist_php_settings='php;c:Classes;f:Functions;d:Constants;j:Javascript Functions'
" let Tlist_Auto_Open=1
"let Tlist_Close_On_Select=1
"let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
" taglist窗口是最后一个窗口时退出VIM
let Tlist_Exit_OnlyWindow=1
" 不想同时显示多个文件中的tag
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=0
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" winManager setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout="BufExplorer,TagsExplorer|FileExplorer,TagList"
let g:winManagerWindowLayout="BufExplorer|FileExplorer"
let g:winManagerWidth=30
let g:defaultExplorer=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree configuration
" Increase window size to 35 columns
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinSize=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_enable_domhtmlcss=1 " 打开javascript对dom、html和css的支持
let g:sql_type_default = 'mysql'
au FileType php set dictionary=~/.vim/dict/php.dict
au FileType php set dictionary+=~/.vim/dict/sql.dict
au FileType sql set dictionary=~/.vim/dict/sql.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin – EasyGrep 多文档字符串搜索
" vv – Grep for the word under the cursor
" va – Like vv, but add to existing list
" vo – Select the files to search in and set grep options
" :Grep SearchString 现指定为f/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:EasyGrepCommand = 1
"let g:EasyGrepRecursive = 1
"let g:EasyGrepHidden = 0
"let g:EasyGrepExtraWarnings=0
"let g:EasyGrepIgnoreCase= 1

" Avoid loading MatchParen plugin
"let loaded_matchparen = 1

" netRW: Open files in a split window
"let g:netrw_browse_split = 1

" use space instead of tab

"call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""
" zencoding
" http://www.vim.org/scripts/script.php?script_id=2981
"""""""""""""""""""""""""""""""""

"let g:user_zen_expandabbr_key = '<c-e>'
"let g:use_zen_complete_tag = 1

"""""""""""""""""""""""""""""""""
" vimwiki
" http://www.vim.org/scripts/script.php?script_id=2226
"""""""""""""""""""""""""""""""""
let g:vimwiki_upper = "A-Z\u0410-\u042f"
let g:vimwiki_lower = "a-z\u0430-\u044f"
" Enable/disable vimwiki's folding/outline functionality. Folding in vimwiki
let g:vimwiki_folding = 1
" Enable/disable folding of list subitems.
let g:vimwiki_fold_lists = 1
" Create new or open existing diary wiki-file for the date selected in Calendar.
let g:vimwiki_use_calendar = 1
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/public_html/'},
            \ {'path': '~/my_docs/', 'ext': '.mdox'}]
:hi VimwikiHeader1 guifg=#FF0000
:hi VimwikiHeader2 guifg=#00FF00
:hi VimwikiHeader3 guifg=#0000FF
:hi VimwikiHeader4 guifg=#FF00FF
:hi VimwikiHeader5 guifg=#00FFFF
:hi VimwikiHeader6 guifg=#FFFF00

"""""""""""
let g:calendar_smnd = 1
let g:calendar_monday = 1 " week start with monday.
let g:calendar_weeknm = 1 " don't work with g:calendar_diary
let g:calendar_mark = 'left-fit' " let plus(+) near the date, like +8.
let g:calendar_mruler = '一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月'
let g:calendar_wruler = '日 一 二 三 四 五 六'
let g:calendar_navi_label = '上月,本月,下月'
let g:calendar_list = [
            \ {'name': 'Works[Doit.im]', 'path': '~/diary/works/Doit.im', 'ext': 'wiki'},
            \ {'name': 'Works', 'path': '~/diary/works', 'ext': 'task'},
            \ {'name': 'Tasks', 'path': '~/diary/tasks', 'ext': 'task'},
            \ {'name': 'Diary', 'path': '~/diary/diary', 'ext': 'diary'},
            \ ]
autocmd BufNewFile *.cal read $HOME/.vim/templates/calendar_morning_diary.tpl | normal ggdd "日历套用模版
""""""""
"Highlight current
"if has("gui_running")
"set cursorline
" set cursorcolumn
"hi cursorline guibg=#0D142C
"hi CursorColumn guibg=#0D142C
"endif


" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /\t/


" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 返回当前时期
func! GetDateStamp()
    return strftime('%Y-%m-%d')
endfunction

function InitPHP()
    call CheckSyntax(1)
    set foldmethod=indent " 代码折叠
endfunction

function AddTitle()
    call append(2,"/**")
    call append(3," *")
    call append(4," * 作者: 范圣帅(fanshengshuai@gmail.com)")
    call append(5," *")
    call append(6," * 创建: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(7," * vim: set expandtab sw=4 ts=4 sts=4 * ")
    call append(8," *")
    call append(9," * $Id$")
    call append(10," */")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction

function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syntax region foldBraces start=/[( ]{\n/ end=/^ *}[\n ,);]/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction


" PHPDOC
imap <C-o> :set paste<cr>:exe PhpDoc()<cr>:set nopaste<cr>i
