filetype plugin on
filetype plugin indent on
syntax enable
syntax on 

" set <leader>
let mapleader=";"

" active file type distinguish
filetype on
filetype plugin on

" line head
nmap lb 0
" line tail
nmap le $
" paste
nmap <Leader>p "+p
" close split windows
nmap <Leader>q :q<CR>
" save current windows content
nmap <Leader>w :w<CR>
" save all windows content and quit
nmap <Leader> WQ :wa<CR>:q<CR>
" quit vim without saving
nmap <Leader>Q :qa!<CR>
" go through all windows
nnoremap nw <C-W><C-W>
" jump to right window
nnoremap <Leader>lw <C-W>l
" jump to left window
nnoremap <Leader>hw <C-W>h
" jump to up window
nnoremap <Leader>kw <C-W>k
" jump to down window
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader>pa %

" active realtime search
set incsearch
" case un-sensitive during search
set ignorecase
" close compatilble mode
set nocompatible
" vim command line auto complete
set wildmenu


" runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" color scheme
" let g:rehash256 = 1
"

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>

" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()


" 总是显示状态栏
set laststatus=2
" " 显示光标当前位置
set ruler
" " 开启行号显示
set number
" " 高亮显示当前行/列
set cursorline
" set cursorcolumn
" " 高亮显示搜索结果
set hlsearch


" 自适应不同语言的智能缩进
filetype indent on
" " 将制表符扩展为空格
set expandtab
" " 设置编辑时制表符占用空格数
set tabstop=4
" " 设置格式化时制表符占用空格数
set shiftwidth=4
" " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" 基于缩进或语法进行代码折叠
set foldmethod=indent
set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <Leader>ch :A<CR>
" " 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>


" Tagbar
nmap <F8> :TagbarToggle<CR>


" Bundle 'majutsushi/tagbar'
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" " 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <Leader>tl :TagbarToggle<CR> 
" " 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" " 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
    \ ],
    \ 'sro'        : '::',
    \ 'kind2scope' : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 's' : 'struct',
        \ 'u' : 'union'
    \ },
    \ 'scope2kind' : {
        \ 'enum'      : 'g',
        \ 'namespace' : 'n',
        \ 'class'     : 'c',
        \ 'struct'    : 's',
        \ 'union'     : 'u'
    \ }
\ }


" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in  project
nnoremap <Leader>sp :CtrlSF<CR>



" YCM 补全菜单配色
" " 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" " 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" " 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" " 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" " 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" " 引入 C++ 标准库tags
set tags+=/data/misc/software/misc./vim/stdcpp.tags
" " YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" " 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" " 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" " 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" " 语法关键字补全         
let g:ycm_seed_identifiers_with_syntax=1


" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" " 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" " 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" " 显示隐藏文件
let NERDTreeShowHidden=1
" " NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" " 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" " buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>


nnoremap Q <nop>
