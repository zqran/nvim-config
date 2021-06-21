" =========================================================
" =======       Plug 插件初始化代码       ===================
" =========================================================
" 设置nvim插件安装位置
" - 推荐安装到For Neovim: ~/.local/share/nvim/plugged
"   我自己安装到~/.config/nvim/plugged文件夹
" - 尽量不要使用标准的vim目录
"   Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')


" === 编辑器相关工具 === 
Plug  '907th/vim-auto-save'
" 类似于资源管理器
Plug 'scrooloose/nerdtree'
" 模糊搜索工具fzf，需要先使用HomeBrew安装fzf
" 当然也可以不使用HomeBrew安装fzf，但是需要使用别的方式来使用fzf
" Plugin '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
" 快速移动插件
Plug 'easymotion/vim-easymotion'
" vim-tmux的窗口切换整合插件 可以非常方便的在vim的split和tmux的pane之间完成切换
Plug 'christoomey/vim-tmux-navigator'
" 全文搜索ACK
" Plug 'mileszs/ack.vim'
" most recently use 最常使用的文件
" Plug 'vim-scripts/mru.vim'
" fuzzy导航插件，文件导航，buffer导航
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" emoji支持
Plug 'junegunn/vim-emoji'
" fuzzy emoji
Plug 'pocari/vim-denite-emoji'


" === Git相关插件 ===
" diffgutter 差异插件
Plug 'airblade/vim-gitgutter'
" Gist的插件
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Git插件
Plug 'tpope/vim-fugitive'


" === 代码语法类 ===
" VIM-MarkDown Preview
" Plug 'suan/vim-instant-markdown'
" yaml 语法支持
Plug 'chase/vim-ansible-yaml'
" emmet语法支持
Plug 'mattn/emmet-vim'
" JSX支持
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" TypeScript支持
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Vue 支持
Plug 'posva/vim-vue'
" Node.js 支持
Plug 'moll/vim-node'
" ale语法检测
" Plug 'w0rp/ale'


" === 代码片段插件 ===
" neo代码段插件
" Plug 'Shougo/neosnippet'
" " neo代码段库
" Plug 'Shougo/neosnippet-snippets'
" vscode代码段库
" Plug 'andys8/vscode-jest-snippets'
" vim-snippets代码段库
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'



" === 代码效率类 ===
" 自动补全插件
Plug 'neoclide/coc.nvim'
" 多光标，类似于sublime
Plug 'terryma/vim-multiple-cursors'
" autoPair自动配对括号什么的
Plug 'jiangmiao/auto-pairs'
" 写css用的
" Plug 'rstacruz/vim-hyperstyle'
" 用各种符号将文字包裹起来 加双引号 加标签什么的 都能用
Plug 'tpope/vim-surround'
" prettier插件
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x'}

" === 注释类插件 ===
" 注释插件nerdcommenter
Plug 'scrooloose/nerdcommenter'
" JsDoc js文档注释插件 
Plug 'heavenshell/vim-jsdoc'
" 显示文档插件（api提示）
Plug 'Shougo/echodoc.vim'




" === UI相关插件 ===
" 底部状态栏插件
Plug 'vim-airline/vim-airline'
" 底部状态栏主题插件
Plug 'vim-airline/vim-airline-themes'
" vim solarized颜色主题
Plug 'altercation/vim-colors-solarized'
" vim synthwave84 赛博朋克主题
Plug 'artanikin/vim-synthwave84'
" vim flattr颜色主题
Plug 'farseer90718/flattr.vim'
" vim ayu颜色主题
Plug 'ayu-theme/ayu-vim'
" onedark 颜色主题
Plug 'joshdick/onedark.vim'
" material 颜色主题
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" 缩进级别 标识线
Plug 'Yggdroot/indentLine'
" nerdtree语法高亮
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" 启动画面
Plug 'mhinz/vim-startify'
" 图标插件
Plug 'ryanoasis/vim-devicons'

" 初始化插件系统Initialize plugin system
call plug#end()
