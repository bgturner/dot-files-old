" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins - Keep between vundle#begin and vundle#end
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'Valloric/YouCompleteMe' " Requires additional compilation on install
Plugin 'SirVer/ultisnips'
Plugin 'StanAngeloff/php.vim'
Plugin 'dsawardekar/wordpress.vim'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'reedes/vim-colors-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on
" End Vundle

" Utilisnps Config
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

set number

syntax on
colorscheme apprentice

" Splits
" Intuitive opening of new splits
set splitbelow
set splitright

" Easier navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Better Whitespace Visualization. Enable by :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" Setup tabs
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Open Explore in 'Tree' mode
let g:netrw_liststyle=3

" Bind shortcuts for CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Pencil Settings
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd,md 	call pencil#init()
	autocmd FileType text 				call pencil#init()
augroup END

" Interpret .md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

