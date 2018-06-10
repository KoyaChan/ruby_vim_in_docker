set number
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,utf-16le,sjis,iso-2022-jp,euc-jp
set noundofile
set nobackup
set nowrap
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
au BufEnter * lcd `=expand('%:p:h')`
set background=dark
if has('multi_byte_ime')
	highlight Cursor guifg=NONE guibg=SkyBlue
	highlight CursorIM guifg=NONE guibg=Purple
endif
set guifont=MS_Gothic:h10:cSHIFTJIS

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

language ctype ja_JP.UTF-8
language messages ja_JP.UTF-8

" === dein script ===
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#add('vim-scripts/Lucius')
 call dein#add('scrooloose/nerdtree')
 call dein#add('vim-syntastic/syntastic')
 call dein#add('thinca/vim-quickrun')
 call dein#add('simeji/winresizer')

 call dein#end()
 call dein#save_state()
endif

if dein#check_install()
  call dein#install()
end

filetype plugin indent on
syntax enable
" === dein script end ===

" === Lucius ==="
colorscheme lucius

set background=dark
set t_Co=256
" === Lucius end ===

" === rubocop ===
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
" === rubocop end ===

" === NerdTree ===
autocmd vimenter * NERDTree
" === NerdTree end ===
