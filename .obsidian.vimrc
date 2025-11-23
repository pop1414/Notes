" 设置编码和自动缩进
set encoding=utf-8
set autoindent
" 设置行号
set number
" 启用搜索时的高亮
set hlsearch
" 开启模式显示
set showmode
" 搜索时智能匹配大小写
set ignorecase smartcase
" 搜索使用正则表达式
nmap / /\v
vmap / /\v
" 设置光标和行数保持
set scrolloff=5
set startofline=on
" 高亮显示被复制的文本
set highlightedyank
let g:highlightedyank_highlight_duration = 600
" 大写H和L跳转至行首和行尾
nmap H ^
nmap L $
" 使用jk返回普通模式
inoremap jk <Esc>
" 使用kj返回普通模式
inoremap kj <Esc>
" 设置leader键
let mapleader = "<space>"
" Sets how many lines of history VIM has to remember
set history=500
" 禁用错误提示音
set visualbell
set noerrorbells
" 在输入部分查找模式时显示相应的匹配点
set incsearch
" 显示匹配括号
set showmatch
" 搜索时居中显示
nmap n nzz
nmap N Nzz
vmap n nzz
vmap N Nzz
" 取消搜索高亮
nmap <Leader>u :noh<CR>
" visual 模式下按*号搜索光标选中的内容
vmap * "ry/<C-R>r<CR>
" 复制粘贴相关（如果Obsidian支持系统剪贴板）
" set clipboard=unnamed
nmap <Leader>y "*y
nmap <Leader>p "*p
nmap P "0p
vmap Y "+y
" 选中引号内
nmap <Leader>v vi"
" 选择模式选到行首
vmap H ^
" 选择模式选到行尾
vmap L $
