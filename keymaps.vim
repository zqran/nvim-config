" =====================
" =   Vim自身键盘映射   =
" =====================
" 按键设置开始
let mapleader=','
map <F3> <C-W>w
map <F10> :sh<CR>

" 窗口切换快捷键mapping
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" 禁用上下左右方向键·
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" buffer 导航
map gbn :bnext<CR>
map gbp :bprevious<CR

" 代码行上下移动快捷键设置  本来应该是<A-j> <A-k>
" 但是在mac下Alt和字母按键会产生新的字符，所以设置快捷键需要使用特殊的字符
" 在window及其他平台下，需要修改此项配置
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" 字体放大缩小快捷键设置
nmap <leader>=  :resize +3<CR>
nmap <leader>-  :resize -3<CR>

" =====================
" =   粘贴模式键盘映射   =
" =====================
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>


" =====================
" =  NerdTree键盘映射  =
" =====================
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>


" =====================
" =  Prettier键盘映射  =
" =====================
nmap <Leader>ff :Prettier<cr>


" =====================
" =TmuxNavigate键盘映射=
" =====================
nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>kk


" =====================
" = easymotion键盘映射 =
" =====================
" 配置prefix按键为leader键
map <Leader> <Plug>(easymotion-prefix)
" 配置默认搜索使用easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" 配置jkhl不用再重复按好多次
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  <Leader>w <Plug>(easymotion-bd-w)


" =====================
" =    fzf键盘映射     =
" =====================
" 配置fzf按键
" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"nmap <leader>f :Files<CR>
"nmap <leader>b :Buffers<CR>


"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)

"" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" =====================
" =   Denite 键盘映射  = 
" =====================
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and
"   close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer -split=floating -winrow=1 <CR>
nmap <leader>p :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


" =====================
" = Coc.nvim 键盘映射  = 
" =====================
 "use <tab> for trigger completion and navigate to next complete item
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-y>" :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
       " \ coc#refresh()
inoremap <silent><expr><TAB> pumvisible() ? coc#_select_confirm() : 
 \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <leader>jd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
 \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>


" =====================
" = vim-jsdoc 键盘映射 = 
" =====================
nmap <leader>z :JsDoc<CR>

" =====================
" =    ale键盘映射     = 
" =====================
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>a :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ad :ALEDetail<CR>
