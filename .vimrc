
"""""""""""""""""""" ~/.vimrc por janjo """"""""""""""""""" "
"
"" Retorna verdadeiro se o modo de copiar e colar estiver ativado
function! HasPaste()
        if &paste
            return 'PASTE MODE ON '
        en
            return 'PASTE MODE OFF '
        return ''
endfunction


"""""""""""""""""""" 1) Configurações gerais """"""""""""""""""""
"
"" Usa as definições do vim, não as do vi
 set nocompatible
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'git://git.wincent.com/command-t.git'
 Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 Plugin 'ascenator/L9', {'name': 'newL9'}

" Meus plugins
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

 " All of your Plugins must be added before the following line
   call vundle#end()            " required
    
  set nocompatible      " We're running Vim, not Vi!
  syntax on             " Enable syntax highlighting
  filetype on           " Enable filetype detection
  filetype indent on    " Enable filetype-specific indenting
  filetype plugin on    " Enable filetype-specific plugins
 
  set history=1000
   " Recarrega o arquivo caso ele seja editado por um programa
   "externo enquanto aberto
  set autoread
  set nobackup
  """""""""""""""""""" 2) Interface do vim """""""""""""""""""""
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


 """""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
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
                 
  " Mapeamento das tabs
   map  <C-l> :tabn<CR>
   map  <C-h> :tabp<CR>
   map  <C-n> :tabnew<CR>
      
       
  " RSpec.vim mapeamento  
   map <Leader>t :call RunCurrentSpecFile()<CR>
   map <Leader>s :call RunNearestSpec()<CR>
   map <Leader>l :call RunLastSpec()<CR>
   map <Leader>a :call RunAllSpecs()<CR>


 " configurações do nerdtree
  autocmd vimenter * NERDTree
  map <C-n> :NERDTreeToggle<CR>

  "mapeamentos pessoais 
  imap ff <ESC> 
  map  <F4> <Esc>:set nu!<cr>
  nmap <F2> :w<cr>
  nmap <F3> <ESC>:q<cr>
  nmap bf <Esc>:bf<cr>

set term=screen-256color

if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
    source ~/.vim/plugin/abbreviations.vim
endif
