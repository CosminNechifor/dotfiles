" .vimrc / init.vim
" The following vim/neovim configuration works for both Vim and NeoVim

" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qall qall
 
    set autoread " detect when a file is changed

    " === TAB/Space settings === "
    " Insert spaces when TAB is pressed.
    set expandtab

    command! MakeTags ! ctags -R --exclude=.git --exclude=node_modules --exclude=package.json --exclude=./build > tags


    " set number relativenumber
    set history=1000 " change history to 1000
    set textwidth=120
    set relativenumber

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif

    set backspace=indent,eol,start " make backspace behave in a sane manner
    set clipboard=unnamed

    if has('mouse')
        set mouse=a
    endif

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    set magic " Set magic on, for regex

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" Appearance {{{
    set number " show line numbers
	set nowrap
    set showbreak=… " show ellipsis at breaking
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical
    set laststatus=2 " show the satus line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    " set cursorline
    " set cursorcolumn
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink

    " Tab control
    set noexpandtab " insert tabs rather than spaces for <Tab>
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set showbreak=↪

    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    Plug 'Yggdroot/indentLine'



    " LightLine {{{
        Plug 'itchyny/lightline.vim'
        Plug 'nicknisi/vim-base16-lightline'
        let g:lightline = {
        \   'colorscheme': 'base16',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \               [ 'gitbranch' ],
        \               [ 'readonly', 'filetype', 'filename' ]],
        \       'right': [ [ 'percent' ], [ 'lineinfo' ],
        \               [ 'fileformat', 'fileencoding' ],
        \               [ 'linter_errors', 'linter_warnings' ]]
        \   },
        \   'component_expand': {
        \       'linter': 'LightlineLinter',
        \       'linter_warnings': 'LightlineLinterWarnings',
        \       'linter_errors': 'LightlineLinterErrors',
        \       'linter_ok': 'LightlineLinterOk'
        \   },
        \   'component_type': {
        \       'readonly': 'error',
        \       'linter_warnings': 'warning',
        \       'linter_errors': 'error'
        \   },
        \   'component_function': {
        \       'fileencoding': 'LightlineFileEncoding',
        \       'filename': 'LightlineFileName',
        \       'fileformat': 'LightlineFileFormat',
        \       'filetype': 'LightlineFileType',
        \       'gitbranch': 'LightlineGitBranch'
        \   },
        \   'tabline': {
        \       'left': [ [ 'tabs' ] ],
        \       'right': [ [ 'close' ] ]
        \   },
        \   'tab': {
        \       'active': [ 'filename', 'modified' ],
        \       'inactive': [ 'filename', 'modified' ],
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '', 'right': '' }
        \ }
        " \   'separator': { 'left': '▓▒░', 'right': '░▒▓' },
        " \   'subseparator': { 'left': '▒', 'right': '░' }

        function! LightlineFileName() abort
            let filename = winwidth(0) > 70 ? expand('%') : expand('%:t')
            if filename =~ 'NERD_tree'
                return ''
            endif
            let modified = &modified ? ' +' : ''
            return fnamemodify(filename, ":~:.") . modified
        endfunction

        function! LightlineFileEncoding()
            " only show the file encoding if it's not 'utf-8'
            return &fileencoding == 'utf-8' ? '' : &fileencoding
        endfunction

        function! LightlineFileFormat()
            " only show the file format if it's not 'unix'
            let format = &fileformat == 'unix' ? '' : &fileformat
            return winwidth(0) > 70 ? format : ''
        endfunction

        function! LightlineFileType()
            return WebDevIconsGetFileTypeSymbol()
        endfunction

        function! LightlineLinter() abort
            let l:counts = ale#statusline#Count(bufnr(''))
            return l:counts.total == 0 ? '' : printf('×%d', l:counts.total)
        endfunction

        function! LightlineLinterWarnings() abort
            let l:counts = ale#statusline#Count(bufnr(''))
            let l:all_errors = l:counts.error + l:counts.style_error
            let l:all_non_errors = l:counts.total - l:all_errors
            return l:counts.total == 0 ? '' : '⚠ ' . printf('%d', all_non_errors)
        endfunction

        function! LightlineLinterErrors() abort
            let l:counts = ale#statusline#Count(bufnr(''))
            let l:all_errors = l:counts.error + l:counts.style_error
            return l:counts.total == 0 ? '' : '✖ ' . printf('%d', all_errors)
        endfunction

        function! LightlineLinterOk() abort
            let l:counts = ale#statusline#Count(bufnr(''))
            return l:counts.total == 0 ? 'OK' : ''
        endfunction

        function! LightlineGitBranch()
            return "\uE725" . (exists('*fugitive#head') ? fugitive#head() : '')
        endfunction

        function! LightlineUpdate()
            call lightline#update()
        endfunction

        augroup alestatus
            autocmd User ALELintPost call LightlineUpdate()
        augroup end
    " }}}
" }}}

" General Mappings {{{
    " set a map leader for more key combos
    let mapleader = ','

    " remap esc
    inoremap jk <esc>

    " shortcut to save
    " nmap <leader>, :w<cr>
    vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>

    " control s to save something
    nmap <c-s> :w<CR>
    imap <c-s> <Esc>:w<CR>a

    " set paste toggle
    set pastetoggle=<leader>v

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
    " edit gitconfig
    map <leader>eg :e! ~/.gitconfig<cr>

    " clear highlighted search
    noremap <space> :set hlsearch! hlsearch?<cr>

    " activate spell-checking alternatives
    nmap ;s :set invspell spelllang=en<cr>

    " markdown to html
    nmap <leader>md :%!markdown --html4tags <cr>

    " remove extra whitespace
    nmap <leader><space> :%s/\s\+$<cr>
    nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

    inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

    nmap <leader>l :set list!<cr>

    " Textmate style indentation
    vmap <leader>[ <gv
    vmap <leader>] >gv
    nmap <leader>[ <<
    nmap <leader>] >>

    " switch between current and last buffer
    nmap <leader>. <c-^>

    " enable . command in visual mode
    vnoremap . :normal .<cr>

    map <silent> <C-h> :call functions#WinMove('h')<cr>
    map <silent> <C-j> :call functions#WinMove('j')<cr>
    map <silent> <C-k> :call functions#WinMove('k')<cr>
    map <silent> <C-l> :call functions#WinMove('l')<cr>

    map <C-w> :q<cr>
	
    " move line mappings
    " ∆ is <A-j> on macOS
    " ˚ is <A-k> on macOS
    nnoremap ∆ :m .+1<cr>==
    nnoremap ˚ :m .-2<cr>==
    inoremap ∆ <Esc>:m .+1<cr>==gi
    inoremap ˚ <Esc>:m .-2<cr>==gi
    vnoremap ∆ :m '>+1<cr>gv=gv
    vnoremap ˚ :m '<-2<cr>gv=gv

    vnoremap $( <esc>`>a)<esc>`<i(<esc>
    vnoremap $[ <esc>`>a]<esc>`<i[<esc>
    vnoremap ${ <esc>`>a}<esc>`<i{<esc>
    vnoremap $" <esc>`>a"<esc>`<i"<esc>
    vnoremap $' <esc>`>a'<esc>`<i'<esc>
    vnoremap $\ <esc>`>o*/<esc>`<O/*<esc>
    vnoremap $< <esc>`>a><esc>`<i<<esc>

    " toggle cursor line
    nnoremap <leader>i :set cursorline!<cr>

    " scroll the viewport faster
    nnoremap <C-d> 13gj<C-e>
    nnoremap <C-u> 13gk<C-y>

    " moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

    " helpers for dealing with other people's code
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nmap \s :set ts=4 sts=4 sw=4 et<cr>

    nnoremap <silent> <leader>u :call functions#HtmlUnEscape()<cr>

    command! Rm call functions#Delete()
    command! RM call functions#Delete() <Bar> q!
" }}}

" AutoGroups {{{
    " file type specific settings
    augroup configgroup
        autocmd!

        " automatically resize panes on resize
        autocmd VimResized * exe 'normal! \<c-w>='
        autocmd BufWritePost .vimrc,.vimrc.local,init.vim source %
        autocmd BufWritePost .vimrc.local source %
        " save all files on focus lost, ignoring warnings about untitled buffers
        autocmd FocusLost * silent! wa

        " make quickfix windows take all the lower section of the screen
        " when there are multiple windows open
        autocmd FileType qf wincmd J
        autocmd FileType qf nmap <buffer> q :q<cr>
    augroup END
" }}}

" General Functionality {{{
    " better terminal integration
    " substitute, search, and abbreviate multiple variants of a word
    Plug 'tpope/vim-abolish'

    " search inside files using ripgrep. This plugin provides an Ack command.
    Plug 'wincent/ferret'

    " insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'

    " easy commenting motions
    Plug 'tpope/vim-commentary'

    " mappings which are simply short normal mode aliases for commonly used ex commands
    Plug 'tpope/vim-unimpaired'

    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

    " enables repeating other supported plugins with the . command
    Plug 'tpope/vim-repeat'

    " .editorconfig support
    Plug 'editorconfig/editorconfig-vim'

    " netrw helper
    Plug 'tpope/vim-vinegar'

    " single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'AndrewRadev/splitjoin.vim'

    " extended % matching
    Plug 'vim-scripts/matchit.zip'

    " add end, endif, etc. automatically
    Plug 'tpope/vim-endwise'

    " detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'
    
    " Startify: Fancy startup screen for vim {{{
        Plug 'mhinz/vim-startify'

        " Don't change to directory when selecting a file
        let g:startify_files_number = 5
        let g:startify_change_to_dir = 0
        let g:startify_custom_header = [ ]
        let g:startify_relative_path = 1
        let g:startify_use_env = 1

        function! s:list_commits()
            let git = 'git -C ' . getcwd()
            let commits = systemlist(git . ' log --oneline | head -n5')
            let git = 'G' . git[1:]
            return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
        endfunction

        " Custom startup list, only show MRU from current directory/project
        let g:startify_lists = [
        \  { 'type': 'dir',       'header': [ 'Files '. getcwd() ] },
        \  { 'type': function('s:list_commits'), 'header': [ 'Recent Commits' ] },
        \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
        \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
        \  { 'type': 'commands',  'header': [ 'Commands' ]       },
        \ ]

        let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

        let g:startify_bookmarks = [
            \ { 'c': '~/code/dotfiles/config/nvim/init.vim' },
            \ { 'z': '~/code/dotfiles/zsh/zshrc.symlink' }
        \ ]

        autocmd User Startified setlocal cursorline
    " }}}

    " Open selection in carbon.now.sh
    Plug 'kristijanhusak/vim-carbon-now-sh'

    " Close buffers but keep splits
    Plug 'moll/vim-bbye'

    " NERDTree {{{
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <A-1> :call ToggleNerdTree()<cr>
        " find the current file in nerdtree without needing to reload the tdrawer
        nmap <silent> <leader>y :NERDTreeFind<cr>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
    " }}}

    " FZF {{{
        Plug '/usr/local/opt/fzf'
        Plug 'junegunn/fzf.vim'
        let g:fzf_layout = { 'down': '~40%' }

        if isdirectory(".git")
            " if in a git project, use :GFiles
            nmap <silent> <C-p> :GitFiles --cached --others --exclude-standard<cr>
        else
            " otherwise, use :FZF
            nmap <silent> <C-p> :FZF<cr>
        endif


        nmap <silent> <leader>s :GFiles?<cr>
        nmap <silent> <leader>b :Buffers<cr>
	      nmap <silent> <leader>r :BTags<cr>
        nmap <silent> <leader>rr :Semshi rename<CR>
        " nmap <silent> <C-p> :FZF<cr>
        nmap <leader><tab> <plug>(fzf-maps-n)
        xmap <leader><tab> <plug>(fzf-maps-x)
        omap <leader><tab> <plug>(fzf-maps-o)

        " Insert mode completion
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-j> <plug>(fzf-complete-file-ag)
        imap <c-x><c-l> <plug>(fzf-complete-line)

        nnoremap <silent> <Leader>C :call fzf#run({
        \   'source':
        \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
        \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
        \   'sink':    'colo',
        \   'options': '+m',
        \   'left':    30
        \ })<CR>

        command! FZFMru call fzf#run({
        \  'source':  v:oldfiles,
        \  'sink':    'e',
        \  'options': '-m -x +s',
        \  'down':    '40%'})

        " -Tjs - for js files
        command! -bang -nargs=* Find call fzf#vim#grep(
            \ 'rg -tpy --column --line-number --no-heading --follow --color=always '.<q-args>, 1,
            \ <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)
        command! -bang -nargs=? -complete=dir GitFiles
            \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

        " Command for git grep
        " - fzf#vim#grep(command, with_column, [options], [fullscreen])
        command! -bang -nargs=* GGrep
        \ call fzf#vim#grep(
        \   'git grep --line-number '.shellescape(<q-args>), 0,
        \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

        " Override Colors command. You can safely do this in your .vimrc as fzf.vim
        " will not override existing commands.
        command! -bang Colors
        \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

        " Augmenting Ag command using fzf#vim#with_preview function
        "   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
        "     * For syntax-highlighting, Ruby and any of the following tools are required:
        "       - Bat: https://github.com/sharkdp/bat
        "       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
        "       - CodeRay: http://coderay.rubychan.de/
        "       - Rouge: https://github.com/jneen/rouge
        "
        "   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
        "   :Ag! - Start fzf in fullscreen and display the preview window above
        command! -bang -nargs=* Ag
        \ call fzf#vim#ag(<q-args>,
        \                 <bang>0 ? fzf#vim#with_preview('up:60%')
        \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
        \                 <bang>0)

        " Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
        command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)

        " Likewise, Files command with preview window
        command! -bang -nargs=? -complete=dir Files
        \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

    " }}}

    " signify {{{
        " Plug 'airblade/vim-gitgutter'
        Plug 'mhinz/vim-signify'
        let g:signify_vcs_list = [ 'git' ]
        let g:signify_sign_add               = '+'
        let g:signify_sign_delete            = '_'
        let g:signify_sign_delete_first_line = '‾'
        let g:signify_sign_change = '!'
    " }}}

    " vim-fugitive {{{
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb' " hub extension for fugitive
        Plug 'junegunn/gv.vim'
        Plug 'sodapopcan/vim-twiggy'
        Plug 'christoomey/vim-conflicted'
        nmap <silent> <leader>gs :Gstatus<cr>
        nmap <leader>ge :Gedit<cr>
        nmap <silent><leader>gr :Gread<cr>
        nmap <silent><leader>gb :Gblame<cr>
    " }}}
" }}}

" Language-Specific Configuration {{{
    " html / templates {{{
        " emmet support for vim - easily create markdup wth CSS-like syntax
        Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript.jsx']}
        let g:user_emmet_settings = {
        \  'javascript.jsx': {
        \      'extends': 'jsx',
        \  },
        \}

        " match tags in html, similar to paren support
        Plug 'gregsexton/MatchTag', { 'for': 'html' }

        " html5 support
        Plug 'othree/html5.vim', { 'for': 'html' }

        " mustache support
        Plug 'mustache/vim-mustache-handlebars'

        " pug / jade support
        Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
    " }}}

    " JavaScript {{{
        Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
        Plug 'moll/vim-node', { 'for': 'javascript' }
        Plug 'pangloss/vim-javascript'
        Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript'] }
        Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
    " }}}

    " Styles {{{
        Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] }
        Plug 'groenewege/vim-less', { 'for': 'less' }
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
        " Plug 'gko/vim-coloresque'
        Plug 'stephenway/postcss.vim', { 'for': 'css' }
    " }}}

    " JSON {{{
        Plug 'elzr/vim-json', { 'for': 'json' }
        let g:vim_json_syntax_conceal = 0
    " }}}

    Plug 'ekalinin/Dockerfile.vim'
" }}}
  
    " if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " else
    "   Plug 'Shougo/deoplete.nvim'
    "   Plug 'roxma/nvim-yarp'
    "   Plug 'roxma/vim-hug-neovim-rpc'
    " endif
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_completion_start_length = 2
    " let g:deoplete#enable_smart_case = 1

    " Latest changs
    let g:deoplete#enable_ignore_case = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#enable_camel_case = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#max_abbr_width = 0
    let g:deoplete#max_menu_width = 0
    let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
    let g:tern_request_timeout = 1
    let g:tern_request_timeout = 6000
    let g:tern#command = ["tern"]
    let g:tern#arguments = [" — persistent"]

    " this depends on deoplete
    Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<c-n>"

    Plug 'mileszs/ack.vim'
    let g:ackpreview=1
    if executable('ag')
        let g:ackprg = 'ag --nogroup --nocolor --column'
    endif

    nmap <C-S-F> :Rg <CR>
    noremap <Leader>f :Ag <CR>
	
    xnoremap < <gv
    xnoremap > >gv

	  set tabstop=2 shiftwidth=2 expandtab
	
    " Semantic highlighting in Python
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    
    " calling Neomake will check if eslint is repsected
    Plug 'neomake/neomake', { 'on': 'Neomake' }
    let g:neomake_javascript_enabled_makers = ['eslint']

    " Latest changes might be experimental
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
    Plug 'carlitux/deoplete-ternjs'

    Plug 'ludovicchabant/vim-gutentags'

    Plug 'Rigellute/rigel'
    Plug 'itchyny/lightline.vim'

call plug#end()





	
" Colorscheme and final setup {{{
    " colorscheme
    set termguicolors
    syntax enable
    colorscheme rigel

    " enable flow support
    let g:javascript_plugin_flow = 1

    " make the highlighting of tabs and other non-text less annoying
    highlight SpecialKey ctermfg=19 guifg=#333333
    highlight NonText ctermfg=19 guifg=#333333

    " avtivate lightline
    let g:rigel_lightline = 1
    let g:lightline = { 'colorscheme': 'rigel' }
    let g:indentLine_color_gui = '#152238'

    " indentLine
    let g:indentLine_char_list = ['|']

    " make comments and HTML attributes italic
    highlight Comment cterm=italic term=italic gui=italic
    highlight htmlArg cterm=italic term=italic gui=italic
    highlight xmlAttrib cterm=italic term=italic gui=italic
    " highlight Type cterm=italic term=italic gui=italic
    highlight Normal ctermbg=none
    " fix cursor
    highlight! link MatchParen StatusLine 
" }}}



" vim:set foldmethod=marker foldlevel=0
