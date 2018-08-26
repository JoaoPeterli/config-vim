
"""""""""""""""""""" ~/.vimrc por janjo && joaopandolfi """"""""""""""""""" "
" Returns true if copy and paste mode is enabled
function! HasPaste()
        if &paste
            return 'PASTE MODE ON '
        en
            return 'PASTE MODE OFF '
        return ''
endfunction


"""""""""""""""""""" General settings """"""""""""""""""""
"
" Uses vim settings, not vi
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator' 
Plugin 'itchyny/lightline.vim'
Plugin 'acoustichero/goldenrod.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'elixir-editors/vim-elixir'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

                          

" All of your Plugins must be added before the following line
call vundle#end()     " required
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set history=1000
" Reloads the file if it is edited by an external program while open
set autoread
set nobackup

"""""""""""""""""""" Vim interface """""""""""""""""""""
set wildmenu
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set magic
set showmatch
set mat=10
set ve=all


""""""""""""""""""" Colors and fonts """"""""""""""""""""
set number
syntax enable
set background=dark
colorscheme goldenrod
set nolinebreak
set wrap
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent                                  
set laststatus=2
set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c
set undodir=~/.vim/undobackups
               
" Mapping tabs
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
map  <C-o> :tabnext<CR>
map  <C-i> :tabprev<CR>
     
" Mapping RSpec.vim   
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>


" Nerdtree settings
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>


" Personal use mappings
imap ff <ESC> 
map  <F4> <Esc>:set nu!<cr>
nmap ss <Esc>:w<cr>
nmap cc <ESC>:q<cr>
 
set term=screen-256color

if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
    source ~/.vim/plugin/abbreviations.vim
endif  


"====== Word complementation ====
"Use also insert mode to complete words
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>


"====== Mapping surround tags erbs ======"
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"


"====== Mapping  airline======"
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{strftime("%c")}'



