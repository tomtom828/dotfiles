execute pathogen#infect()
filetype plugin indent on
" essentials
set encoding=utf-8
inoremap jj <ESC>
set mouse=a
set number
set relativenumber
set numberwidth=5
syntax enable
set backspace=2
set ruler

" Theming
syntax enable
syntax on
colorscheme lucario
" color molokai 
" let g:molokai_original = 1
let g:rehash256 = 1

" Softtabs, 2spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufWinEnter * NERDTreeMirror
let NERDTreeShowHidden=1
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Open new split panes to right and bottom
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>
nnoremap <C-k> <C-w>
nnoremap <C-h> <C-w>
nnoremap <C-l> <C-w>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" Syntastic Recommended Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline Configuration
set laststatus=2

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
