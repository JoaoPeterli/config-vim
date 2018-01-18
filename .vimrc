 
"""""""""""""""""""" ~/.vimrc por janjo && joaopandolfi """"""""""""""""""" "
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
  set mouse=a

 """""""""""""""""""" 3) Cores e fontes """"""""""""""""""""
  set number
  syntax enable
  set background=dark
  colorscheme goldenrod
  set nolinebreak
  set wrap
  set expandtab
  set smarttab
  set shiftwidth=4
  set tabstop=4
  set softtabstop=0
  set autoindent                                  
  set laststatus=2
  set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c
  set undodir=~/.vim/undobackups
                 
  " Mapeamento das tabs
   map  <C-l> :tabn<CR>
   map  <C-h> :tabp<CR>
   map  <C-n> :tabnew<CR>
   map  <C-o> :tabnext<CR>
   map  <C-i> :tabprev<CR>
       
  " RSpec.vim mapeamento  
   map <Leader>t :call RunCurrentSpecFile()<CR>
   map <Leader>s :call RunNearestSpec()<CR>
   map <Leader>l :call RunLastSpec()<CR>
   map <Leader>a :call RunAllSpecs()<CR>


 " configurações do nerdtree
  autocmd vimenter * NERDTree
  map <C-n> :NERDTreeToggle<CR>

  
set term=screen-256color


if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
    source ~/.vim/plugin/abbreviations.vim
endif  


"====== complementação de palavras ====
"usa o tab em modo insert para completar palavras
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

syntax on
