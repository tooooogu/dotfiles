" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

"------------------
" Syntax and indent
"------------------

syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

" vim can autodetect this based on $TERM (e.g. 'xterm-256color')
" but it can be set to force 256 colors
" set t_Co=256
if has('gui_running')
    set background=light
else
    set background=dark
endif

filetype plugin indent on " enable file type detection(specific indent and plugin)
set autoindent
" To indent the current line, or a visual block:
" ctrl-t, ctrl-d -indent current line forward, backwards (insert mode)
" visual > or < - indent block by sw (repeat with . )

" To stop indenting when pasting with the mouse, add this to your .vimrc:
" set pastetoggle=<f5>

"---------------------
" Basic editing config
"---------------------

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set scrolloff=5 " show lines above and below cursor (when possible)

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu

"--------------------
" Misc configurations
"--------------------

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"---------------------
" ALE
"---------------------

let g:ale_enabled = 1
" For quick startup
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
let g:ale_float_preview=1
let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier'],
    \   'css': ['prettier'],
    \   'html': ['prettier'],
    \   'markdown': ['prettier'],
    \   'json': ['prettier'],
    \   'yaml': ['prettier'],
    \}

" ALE offers some commands with <Plug> keybinds for moving between warnings and errors quickly. You can map the keys [a and ]a to moving between errors for example:
nmap <silent> [a <Plug>(ale_previous_wrap)
nmap <silent> ]a <Plug>(ale_next_wrap)

"---------------------
" Lightline
"---------------------
" --INSERT-- is unncessary because of lightline
set noshowmode
