let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

if has('termguicolors')
    set termguicolors
endif
set t_Co=256

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
"Plug 'ycm-core/YouCompleteMe'
" audo complete pairs
Plug 'jiangmiao/auto-pairs'

" Grammer
"Plug 'w0rp/ale'
"" schema color
Plug 'morhetz/gruvbox'

Plug 'prabirshrestha/vim-lsp'

Plug 'vim-airline/vim-airline'

" Auto comment
Plug 'scrooloose/nerdcommenter'


" Git runtime
Plug 'airblade/vim-gitgutter'


Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

Plug 'mattn/vim-lsp-settings'

"Plug 'Shougo/ddc.vim'
"Plug 'shun/ddc-vim-lsp'

Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'sainnhe/everforest'
Plug 'rhysd/vim-go-impl'

Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'mattn/vim-goimports'

Plug 'andymass/vim-matchup'

call plug#end()


" own config
set nu
map J 5j
map K 5k

set ts=4
set expandtab
set softtabstop=4
set autoindent
set shiftwidth=4
let mapleader=";"

set updatetime=5
set incsearch
set ignorecase
set hlsearch
set clipboard=unnamed

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap > <C-w>>
noremap < <C-w><
noremap + <C-w>+
noremap _ <C-w>-

set colorcolumn=81
set autoread

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" ycm config
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf=0
"set completeopt=longest,menu
"let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"let g:ycm_seed_identifiers_with_syntax=1
"let g:ycm_min_num_of_chars_for_completion=2
"let g:ycm_auto_trigger = 1
"let g:ycm_autoclose_preview_window_after_completion=1
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" vim-go config
"let g:go_doc_keywordprg_enabled=0
"let g:go_highlight_functions = 1
""let g:go_highlight_function_parameters = 1
"let g:go_highlight_function_calls = 1
""let g:go_highlight_types = 1
""let g:go_highlight_fields = 1
""let g:go_highlight_build_constraints = 1
""let g:go_highlight_variable_declarations = 1
""let g:go_highlight_variable_assignments = 1
"let g:go_auto_sameids = 0
"let g:go_def_reuse_buffer=1
""let g:go_updatetime = 300
"let g:go_fmt_command = 'gofmt'
"let g:go_imports_mode = 'goimports'
"au FileType go nmap <leader>D <Plug>(go-def-vertical)
"au FileType go nmap <leader>d <Plug>(go-def)
"au FileType go nmap <leader>i <Plug>(go-implements)
"au FileType go nmap <leader>c <Plug>(go-callers)
"au FileType go nmap <leader>r <Plug>(go-rename)
"au FileType go nmap <leader>C <Plug>(go-callees)
"au FileType go nmap <leader>R <Plug>(go-referrers)
"au FileType go nmap <leader>f :GoFillStruct<CR>
"let g:go_snippet_engine = "ultisnips"

" NERD tree
nnoremap <F2> :NERDTreeToggle<CR>

" gruvbox config
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="soft"

"set background=dark
"let g:everforest_background = 'hard'
"colorscheme everforest
"let g:lightline = {'colorscheme' : 'everforest'}


" gtags
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
"reference
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"definition
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

let g:Lf_ShortcutF = '<c-p>'
noremap <c-n> :LeaderfMru<cr>
noremap <leader>ff :LeaderfFunction!<cr>
noremap <leader>fb :LeaderfBuffer<cr>
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WindowPosition = 'popup'
let g:Lf_previewInPopup = 1
let g:Lf_ShowDevIcons = 0

" rg
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg ")<CR>

" Register ccls C++ lanuage server.
"if executable('ccls')
   "au User lsp_setup call lsp#register_server({
      "\ 'name': 'ccls',
      "\ 'cmd': {server_info->['ccls']},
      "\ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      "\ 'initialization_options': {'cache': {'directory': expand('~/.cache/ccls') }},
      "\ 'allowlist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      "\ })
"endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gk <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    "" refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    "" call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"


