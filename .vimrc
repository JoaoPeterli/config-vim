"""""""""""""""""""" ~/.vimrc por janjo && joaopandolfi """"""""""""""""""" "

" --- Helpers ---
function! HasPaste()
  if &paste
    return 'PASTE MODE ON '
  endif
  return 'PASTE MODE OFF '
endfunction

" --- General ---
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ascenator/L9', {'name': 'newL9'}

" My plugins
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator' 
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Townk/vim-autoclose'
Plugin 'ryanoasis/vim-devicons'
Plugin 'altercation/vim-colors-solarized'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'pangloss/vim-javascript'
Plugin 'posva/vim-vue'
Plugin 'leafOfTree/vim-vue-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }

call vundle#end()

syntax on
filetype plugin indent on

set history=1000
set autoread
set nobackup

" --- UI ---
set wildmenu
set ruler
set cmdheight=2
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set magic
set showmatch
set mat=10

" --- Colors & indent ---
set number
syntax enable
set background=dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set wrap
set nolinebreak
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set laststatus=2
set statusline=\ %{HasPaste()}\ Arquivo:\ %F%m%r%h\ %w\ \ Diretório\ de\ trabalho:\ %r%{getcwd()}%h\ -\ Linha:\ %l\ -\ Coluna:\ %c

" Undo persistente
set undofile
set undodir=~/.vim/undobackups

" --- Tabs mapeamentos ---
nnoremap <C-l> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>
nnoremap <C-n> :tabnew<CR>
" removidos os antigos <C-o> e <C-i> para preservar go-back/go-forward padrão

" --- Go back / forward personalizados ---
nnoremap gb <C-o>   " voltar pro arquivo anterior
nnoremap gB <C-i>   " avançar novamente

" --- RSpec (se usar rspec.vim) ---
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>

" --- Nerdtree ---
autocmd VimEnter * NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" --- Pessoais ---
inoremap ff <ESC>
nnoremap <F4> :set nu!<CR>
nnoremap ss :w<CR>
nnoremap cc :q<CR>

if filereadable(expand("~/.vim/plugin/abbreviations.vim"))
  source ~/.vim/plugin/abbreviations.vim
endif  

" --- Word completion ---
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  elseif a:direction ==# 'backward'
    return "\<C-p>"
  else
    return "\<C-n>"
  endif
endfunction
inoremap <Tab>   <C-r>=InsertTabWrapper('forward')<CR>
inoremap <S-Tab> <C-r>=InsertTabWrapper('backward')<CR>

" --- Surround para ERB (em buffers ERB) ---
augroup erb_surround
  autocmd!
  autocmd FileType eruby let b:surround_{char2nr('=')} = "<%= \r %>"
  autocmd FileType eruby let b:surround_{char2nr('-')} = "<% \r %>"
augroup END

" --- Airline ---
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{strftime("%c")}'

" --- Prettier ---
let g:prettier#autoformat = 0
autocmd BufWritePre *.jsx,*.js,*.ts,*.tsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync


