"let g:python_host_prog='/Users/dustyphillips/.pyenv/versions/3.9.4/bin/python'
"let g:python3_host_prog='/Users/dustyphillips/.pyenv/versions/3.9.4/bin/python'
"let g:node_host_prog='/usr/local/bin/neovim-node-host'

function SetUpFunction()
  " to be called after :PlugInstall
  TSInstall python typescript javascript vim lua
  COQdeps
  " CHADdeps
  UpdateRemotePlugins
endfunction
:command SetupEnv call SetUpFunction()

let g:neoformat_try_node_exe = 1

" coq for lsp aware autocomplete
let g:coq_settings = {
      \ 'display.pum.fast_close': v:false,
      \ 'auto_start': 'shut-up',
      \ 'keymap.jump_to_mark': v:null,
      \ 'clients.snippets.warn': [],
      \'clients.buffers.enabled': v:false,
      \'clients.tags.enabled': v:false
      \}
" let g:kitty_navigator_no_mappings = 1

" status line
let g:bubbly_palette = #{
      \   background: "#13121a",
      \   foreground: "#c5cdd9",
      \   black: "#3e4249",
      \   red: "#ec7279",
      \   green: "#a0c980",
      \   yellow: "#deb974",
      \   blue: "#6cb6eb",
      \   purple: "#d38aea",
      \   cyan: "#5dbbc1",
      \   white: "#c5cdd9",
      \   lightgrey: "#57595e",
      \   darkgrey: "#404247",
      \ }
let g:bubbly_tags = #{
      \  mode:  #{
      \   command: "C",
      \   insert: "I",
      \   normal: "N",
      \   replace: "R",
      \   terminal: "T",
      \   visual: "V",
      \   visualblock: "VB",
      \  },
      \}

" accepting and rejecting git changes
let g:conflict_marker_begin = '^<<<<<<.*$'
let g:conflict_marker_common_ancestors = '^|||||.*$'
let g:conflict_marker_separator = '^=====*$'
let g:conflict_marker_end = '^>>>>>.*$'
let g:merginal_windowSize = 60


let mapleader=" "

set termguicolors
set background=dark
set mouse=a
set cursorline
set nohlsearch
set inccommand=split " highlight :%s calls
set updatetime=50 " Make git gutter and completions show up faster (use Kitty to keep up)
set undofile " persistent undo
set splitright
set nobackup
set nowritebackup
set shortmess=acIF
set cmdheight=3
set noshowcmd
set noshowmode
set signcolumn=yes
set completeopt=menuone,noselect
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" Settings Keybindings ('V to open)
nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <leader>vp :so $MYVIMRC <bar> PlugClean <bar> PlugInstall  :so $MYVIMRC <bar> :PlugUpdate <CR>
nnoremap <leader>vu :PlugUpdate<CR>

" Filesystem Keybindings
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>
nnoremap <D-s> :w<CR>
inoremap <D-s> <C-o>:w<CR>
nnoremap l <cmd>Telescope git_files<cr>
nnoremap L <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<CR>
nnoremap <leader>F <cmd>Telescope grep_string<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>k <cmd>Telescope keymaps<CR>
" nnoremap <CR><CR> <cmd>CHADopen<CR>
nnoremap <leader><space> <cmd>Telescope file_browser<CR>

" Misc keybindings
nnoremap <leader>u :UndotreeToggle<CR>
cnoremap <expr> <up> wildmenumode() ? "\<left>" : "\<up>"
cnoremap <expr> <down> wildmenumode() ? "\<right>" : "\<down>"
cnoremap <expr> <left> wildmenumode() ? "\<up>" : "\<left>"
cnoremap <expr> <right> wildmenumode() ? " \<bs>\<C-Z>" : "\<right>"
nmap sw saiw

" ; to run a single command in normal mode
inoremap ; <C-o>
inoremap ;<Space> ;<Space>
inoremap ;<CR> ;<CR>
inoremap ;; ;

" clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y
nnoremap <leader>p "*p
vnoremap <leader>p "*p
nnoremap <leader>P "*P
vnoremap <leader>P "*P
nnoremap <leader>" <cmd>Telescope registers<CR>
inoremap <C-r> <cmd>Telescope registers<CR>
"move last register to system clipboard
nnoremap Y :let @*=@"<CR>

" Window keymapping
nnoremap \ <C-w>
nnoremap \c :Sayonara!<CR>
nnoremap \q :Sayonara<CR>
nnoremap \Q :qa<CR>
nnoremap \t :tabnew<CR>
"\n is already :new
nnoremap \N :vnew<CR>
nnoremap \1 <C-w>1w
nnoremap \2 <C-w>2w
nnoremap \3 <C-w>3w
nnoremap \4 <C-w>4w
nnoremap \5 <C-w>5w
nnoremap \6 <C-w>6w
nnoremap \7 <C-w>7w
nnoremap \8 <C-w>8w
" Seamless navigation between kitty and vim windows
" nnoremap <silent> <A-Left> :KittyNavigateLeft<cr>
" nnoremap <silent> <A-j> :KittyNavigateDown<cr>
" nnoremap <silent> <A-k> :KittyNavigateUp<cr>
" nnoremap <silent> <A-x> :KittyNavigateRight<cr>
" nnoremap <silent> <A-Right> :KittyNavigateRight<cr>
:tnoremap ; <C-\><C-n>
:tnoremap ;<Space> ;<Space>
:tnoremap ;c <cmd>close<CR>
nnoremap <CR><CR> <cmd>Telescope buffers<CR>
nnoremap <CR><Space> <cmd>let $CODESPACE_VSCODE_FOLDER = trim(system('pwd'))<CR><cmd>term<CR>
nnoremap <CR>g <cmd>let $CODESPACE_VSCODE_FOLDER = trim(system('pwd'))<CR><cmd>term lazygit<CR>
autocmd TermOpen * startinsert
autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Search
nmap h <Plug>Lightspeed_s
nmap H <Plug>Lightspeed_S
xmap h <Plug>Lightspeed_x
xmap H <Plug>Lightspeed_H
omap h <Plug>Lightspeed_x
omap H <Plug>Lightspeed_H
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)
nmap g/ <Plug>(incsearch-stay)
let g:camelcasemotion_key = '\'

" lsp
nnoremap <leader>o <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>O <cmd>SymbolsOutline<CR>
nnoremap gw <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap gr <cmd>Telescope lsp_references<CR>
nnoremap gd <cmd>Telescope lsp_definitions<CR>
nnoremap gx <cmd>Telescope lsp_document_diagnostics<CR>
nnoremap gX <cmd>Telescope lsp_workspace_diagnostics<CR>
nnoremap <leader>. <cmd>Telescope lsp_code_actions<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-K> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>

" quickfix
nnoremap ]q <cmd>cnext<CR>
nnoremap [q <cmd>cprev<CR>

" autoformat on save
augroup fmt
  autocmd! 
  " autocmd BufWritePre * undojoin | Neoformat
  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()


" Install plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'glepnir/zephyr-nvim'   " Color scheme

" Dependencies
Plug 'nvim-lua/plenary.nvim' " For Lua everything
Plug 'kana/vim-textobj-user' " For textobj-entire and possibly indent-object
Plug 'tpope/vim-repeat'       " For lightspeed

" Language support
Plug 'rescript-lang/vim-rescript' 
Plug 'numirias/semshi', {'do': 'UpdateRemotePlugins'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Editing
Plug 'tpope/vim-sensible'
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'kana/vim-textobj-entire' 
Plug 'machakann/vim-sandwich'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug '0styx0/abbreinder.nvim'

" Search and navigation
Plug 'ggandor/lightspeed.nvim'
Plug 'haya14busa/incsearch.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'chentau/marks.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/committia.vim'
Plug 'ruanyl/vim-gh-line'

" Visual
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'datwaft/bubbly.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
Plug 'jaxbot/semantic-highlight.vim'
Plug 'luukvbaal/stabilize.nvim'
Plug 'romgrk/nvim-treesitter-context'

" IDE
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'farmergreg/vim-lastplace'
Plug 'simrat39/symbols-outline.nvim'

" Apps
" Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'mbbill/undotree'
" Plug 'knubie/vim-kitty-navigator', {'do': 'cp ./*.py ~/.config/kitty/'}

call plug#end()

colorscheme zephyr

hi Normal guibg=NONE ctermbg=NONE

lua <<EOF
require 'colorizer'.setup()

require("stabilize").setup()

require'nvim-treesitter.configs'.setup {
  highlight = {enable = true},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil, 
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = false,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      }
    }
  }
}

local actions = require('telescope.actions')
local action_state = require "telescope.actions.state"
local fb_utils = require "telescope._extensions.file_browser.utils"
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme="ivy",
      mappings = {
        ["i"] = {
          ["<C-c>"] = function(prompt_bufnr)
            -- Copy of fb_actions.change_cwd, but local to current tab
            local current_picker = action_state.get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            local entry_path = action_state.get_selected_entry().Path
            finder.path = entry_path:is_dir() and entry_path:absolute() or entry_path:parent():absolute()
            finder.cwd = finder.path
            vim.cmd("tcd " .. finder.path)

            actions.close(prompt_bufnr)
            print(string.format("[telescope] Changed tab working directory to %s", finder.path))
          end
        }
      }
    }
  }
}
require('telescope').load_extension('file_browser')

lsp = require "lspconfig"
coq = require "coq"
lsp.pyright.setup(coq.lsp_ensure_capabilities())
lsp.rescriptls.setup(coq.lsp_ensure_capabilities{cmd={'node', '/Users/dustyphillips/.config/nvim/plugged/vim-rescript/server/out/server.js', '--stdio'}})
lsp.tsserver.setup(coq.lsp_ensure_capabilities({on_attach=function(client) client.resolved_capabilities.document_formatting=false end,}))
lsp.vimls.setup(coq.lsp_ensure_capabilities())

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.black,
        require("null-ls").builtins.formatting.prettier,
    },
})

require('gitsigns').setup {
  word_diff = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
  },
}

require('marks').setup {}


require('indent_blankline').setup {
  char="│",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
}
require'treesitter-context'.setup{
    enable = true, 
    throttle = true, 
    max_lines = 0, 
    patterns = { 
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
    },
}

vim.g.symbols_outline= {
  symbol_blacklist = {'Variable', 'Parameter'}
  }

vim.cmd([[autocmd CursorHold   * :silent! lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorHoldI  * :silent! lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]])
vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]])


EOF

highlight LspReferenceText guibg=#2f7366
highlight LspReferenceRead guibg=#2f7366
highlight LspReferenceWrite guibg=#2f7366

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

highlight GitSignsCurrentLineBlame guifg=#665588 blend=nocombine

highlight IndentBlanklineIndent1 guifg=#444455 guibg=#1f1f1f blend=nocombine
highlight IndentBlanklineIndent2 guifg=#444455 guibg=#1a1a1a blend=nocombine
