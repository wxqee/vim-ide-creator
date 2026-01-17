" Vim Web 前端开发 IDE 配置
" 专为 MacOS 系统设计

" =============================================
" 基本设置
" =============================================

" 启用语法高亮
syntax enable

" 启用文件类型检测
filetype plugin indent on

" 设置编码
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb2312,cp936

" 设置行号
set number
set relativenumber

" 设置光标行高亮
set cursorline

" 设置自动缩进
autocmd FileType * setlocal autoindent smartindent
set tabstop=2        " Tab 宽度为 2 空格
set shiftwidth=2     " 缩进宽度为 2 空格
set expandtab        " 将 Tab 转换为空格
set smarttab         " 智能 Tab 处理

" 设置滚动
set scrolloff=5      " 光标距离顶部/底部 5 行时开始滚动
set sidescrolloff=5  " 光标距离左侧/右侧 5 列时开始滚动

" 设置搜索
set incsearch        " 实时搜索
set ignorecase       " 忽略大小写
set smartcase        " 智能大小写（当搜索包含大写字母时区分大小写）
set hlsearch         " 高亮搜索结果

" 设置状态栏
set laststatus=2     " 总是显示状态栏
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" 设置窗口分割
set splitbelow       " 水平分割时新窗口在下方
set splitright       " 垂直分割时新窗口在右侧

" 设置鼠标支持（仅在终端中）
if has('mouse') && !has('gui_running')
  set mouse=a
endif

" 设置自动保存
set autowrite
set autowriteall

" 设置代码折叠
set foldmethod=indent
set foldlevel=99

" 设置拼写检查
set spelllang=en,zh_CN
set complete+=kspell

" 设置字体（仅在 GUI 模式下）
if has('gui_running')
  set guifont=Monaco:h12
endif

" =============================================
" 插件管理器配置 (Vundle)
" =============================================

" 设置 Vundle 目录
set rtp+=~/.vim/bundle/Vundle.vim

" 初始化 Vundle
call vundle#begin()

" Vundle 插件
Plugin 'VundleVim/Vundle.vim'

" =============================================
" 语法高亮与补全插件
" =============================================

" 智能代码补全（支持Vim 9.0的版本）
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" JavaScript 增强支持
Plugin 'pangloss/vim-javascript'

" JSX/TSX 语法高亮和格式化
Plugin 'MaxMEllon/vim-jsx-pretty'

" 主题插件
Plugin 'tomasr/molokai'

" CSS3 语法高亮
Plugin 'hail2u/vim-css3-syntax'

" TypeScript 支持
Plugin 'leafgarland/typescript-vim'

" Python 开发环境
Plugin 'python-mode/python-mode'

" HTML 增强
Plugin 'mattn/emmet-vim'

" JSON 增强
Plugin 'elzr/vim-json'

" SQL 语法高亮
Plugin 'vim-scripts/SQLComplete.vim'

" Dockerfile 支持
Plugin 'ekalinin/Dockerfile.vim'

" Markdown 支持
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" =============================================
" 文件管理与导航插件
" =============================================

" 文件浏览器
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" 状态栏增强
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 文件搜索
Plugin 'kien/ctrlp.vim'

" 标签栏增强
Plugin 'vim-scripts/bufexplorer.zip'

" =============================================
" 代码质量与版本控制插件
" =============================================

" 异步 linting 引擎
Plugin 'dense-analysis/ale'

" Prettier 代码格式化
Plugin 'prettier/vim-prettier'

" Git 集成
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" =============================================
" 其他增强插件
" =============================================

" 括号/标签操作
Plugin 'tpope/vim-surround'

" 快速注释
Plugin 'tpope/vim-commentary'

" 颜色预览
Plugin 'lilydjwg/colorizer.vim'

" 自动配对
Plugin 'jiangmiao/auto-pairs'

" 初始化完成
call vundle#end()

" 设置主题（必须在Vundle初始化之后）
colorscheme molokai

" =============================================
" 插件配置
" =============================================

" =============================================
" NERDTree 配置
" =============================================
map <leader>n :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | q | endif
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['\.git$', '\.svn$', '\.swp$', '\.swo$', '\~$']

" =============================================
" coc.nvim 配置
" =============================================
" 启用代码补全
let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-tsserver',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-prettier',
      \ 'coc-python',
      \ 'coc-snippets',
      \ 'coc-git',
      \ 'coc-docker',
      \ 'coc-markdownlint'
      \]

" 补全配置
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
inoremap <silent><expr> <C-space> coc#refresh()

" 诊断配置
nnoremap <silent> <F8> :CocDiagnostics<CR>
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" 跳转到定义等
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" =============================================
" ALE 配置
" =============================================
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'python': ['flake8'],
      \}

let g:ale_fixers = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'javascriptreact': ['eslint', 'prettier'],
      \ 'typescriptreact': ['eslint', 'prettier'],
      \ 'css': ['stylelint', 'prettier'],
      \ 'scss': ['stylelint', 'prettier'],
      \ 'python': ['autopep8', 'black'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \}

let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" =============================================
" Prettier 配置
" =============================================
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#config#tab_width = 2
let g:prettier#config#single_quote = v:true

" =============================================
" Emmet 配置
" =============================================
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_mode='a'
let g:user_emmet_install_global=1

" =============================================
" vim-airline 配置
" =============================================
let g:airline_theme = 'molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" =============================================
" 快捷键配置
" =============================================

" 设置 Leader 键为空格
let mapleader=" "

" 保存和退出
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
noremap <leader>x :x<CR>
noremap <leader>Q :qa!<CR>

" 窗口管理
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>v :vsplit<CR>
noremap <leader>s :split<CR>
noremap <leader>c :close<CR>

" 标签页管理
nnoremap <leader>t :tabnew<CR>
noremap <leader>n :tabnext<CR>
noremap <leader>p :tabprevious<CR>
noremap <leader>d :tabclose<CR>

" 代码编辑
nnoremap <leader>f :Prettier<CR>
vnoremap <leader>f :Prettier<CR>
noremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>

" 搜索
nnoremap <leader><space> :nohlsearch<CR>

" 快速移动
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" =============================================
" 文件类型特定配置
" =============================================

" HTML 配置
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html inoremap <C-y>, <C-r>=emmet#expandAbbrIntelligent('<C-y>,', '<C-y>,', '<C-y>')<CR>

" CSS 配置
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal iskeyword+=-  " 支持 CSS 中的连字符

" JavaScript 配置
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal expandtab
autocmd FileType javascript setlocal foldmethod=syntax

" React JSX 配置
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType javascriptreact setlocal expandtab
autocmd FileType javascriptreact setlocal foldmethod=syntax

" TypeScript 配置
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal expandtab

" Python 配置
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType python setlocal expandtab
autocmd FileType python setlocal textwidth=79

" JSON 配置
autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType json setlocal expandtab

" Markdown 配置
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2
autocmd FileType markdown setlocal expandtab
autocmd FileType markdown setlocal spell

" Dockerfile 配置
autocmd FileType dockerfile setlocal shiftwidth=2 tabstop=2
autocmd FileType dockerfile setlocal expandtab

" SQL 配置
autocmd FileType sql setlocal shiftwidth=2 tabstop=2
autocmd FileType sql setlocal expandtab

" =============================================
" 启动优化
" =============================================

" 禁用一些不需要的插件以提高启动速度
let g:loaded_netrwPlugin = 1
let g:loaded_netrw = 1
let g:loaded_matchparen = 1

" 仅在需要时加载某些插件
command! -nargs=0 PrettyJSON %!python -m json.tool

" 加载用户自定义配置（如果存在）
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif