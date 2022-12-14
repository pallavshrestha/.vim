"General settings
"
""""""""""""""""""""""""""""""
filetype plugin indent on
syntax on
set tw=108
set mouse=a
set ignorecase
set incsearch
"set dir=~/tmp

set backspace=indent,eol,start
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent

colorscheme nord   "Color scheme
""""""""""""""""""""""""""""""



"Auto line numbers
""""""""""""""""""""""""""""""
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
""""""""""""""""""""""""""""""



"Plugins
""""""""""""""""""""""""""""""
call plug#begin()

Plug 'SirVer/ultisnips' "snippets engine

Plug 'honza/vim-snippets' "snippets

Plug 'ycm-core/YouCompleteMe' "fuzzy search and code complettion

Plug 'lervag/vimtex' "Vim tex

Plug 'townk/vim-autoclose' "auto brackets, quotesi

Plug 'tpope/vim-surround' "change surrounding brackets

Plug 'junegunn/vim-easy-align' "align gaip

Plug 'itchyny/lightline.vim'    "lightiline

Plug 'junegunn/fzf.vim'

call plug#end()
"""""""""""""""""""""""""""""



"Lightline
"""""""""""""""""""""""""""""
set laststatus=2
set noshowmode

let g:lightline = { 
                \ 'colorscheme': 'nord',
                \}
"""""""""""""""""""""""""""""



"Bindings
"""""""""""""""""""""""""""""
" map ctrl+backspace to delete last word
"imap <C-BS> <C-w>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" ultisnips
""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"


" Vim Easy Align
""""""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Window Splits
""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://bash<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://bash<CR>ipython3<CR><C-\><C-n><C-w>k
map <Leader>td :new term://bash<CR>isqlite3<CR><C-\><C-n><C-w>k
map <Leader>tj :new term://bash<CR>ijulia<CR><C-\><C-n><C-w>k
map <Leader>ts :new term://bash<CR>iscala<CR><C-\><C-n><C-w>k

" python alias 
""""""""""""""""""""
" ,p runs python on script. ,t times python script
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>
""""""""""""""""""""""""""""""



" YouCompleteme
""""""""""""""""""""""""""""""
 let g:ycm_semantic_triggers = {
        \ 'tex'  : ['{']
    \}

 let g:ycm_semantic_triggers = {
        \ 'markdown'  : ['@']
    \}

 let g:ycm_filetype_blacklist = {}
 let g:ycm_filetype_whitelist = {
        \ 'text': 1,
        \ 'markdown': 1,
        \ 'notes': 1
        \}
""""""""""""""""""""""""""""""


"fzf related
""""""""""""""""""""""""""""""

"bibtex-ls
""""""""""""""""""""
"let $FZF_BIBTEX_CACHEDIR = '~/work/docVault/collections/library.bib'
let $FZF_BIBTEX_SOURCES = '/home/pallav/work/docVault/collections/library.bib'

function! s:bibtex_cite_sink(lines)
    let r=system("bibtex-cite ", a:lines)
    execute ':normal! a' . r
endfunction

function! s:bibtex_markdown_sink(lines)
    let r=system("bibtex-markdown ", a:lines)
    execute ':normal! a' . r
endfunction

nnoremap <silent> <leader>c :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_cite_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

nnoremap <silent> <leader>m :call fzf#run({
                        \ 'source': 'bibtex-ls',
                        \ 'sink*': function('<sid>bibtex_markdown_sink'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Markdown> "'})<CR>


""""""""""""""""""""""""""""""
<<<<<<< HEAD
           
=======
>>>>>>> 3ef197c (Syncing local with remote)
