
function SetUpFunction()
  " to be called after :PlugInstall
  TSInstall python typescript javascript vim
  LspInstall pyright tsserver vimls
  COQdeps
  UpdateRemotePlugins
endfunction
:command SetupEnv call SetUpFunction()

let g:kitty_navigator_no_mappings = 1

" accepting and rejecting git changes
let g:conflict_marker_begin = '^<<<<<<.*$'
let g:conflict_marker_common_ancestors = '^|||||.*$'
let g:conflict_marker_separator = '^=====*$'
let g:conflict_marker_end = '^>>>>>.*$'



let mapleader=" "

set termguicolors
set background=light
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
set cmdheight=2
set noshowcmd
set noshowmode
set signcolumn=yes
set completeopt=menuone,noselect
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set wildmenu
set wildmode=longest:list,full


" Settings Keybindings ('V to open)
nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <leader>vp :so $MYVIMRC <bar> PlugClean <bar> PlugInstall  :so $MYVIMRC <bar> :PlugUpdate <CR>
nnoremap <leader>vu :PlugUpdate<CR>

" Filesystem Keybindings
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>
nnoremap <D-s> :w<CR>
inoremap <D-s> <C-o>:w<CR>
nnoremap l <cmd>Telescope git_files show_untracked=true <CR>
nnoremap L <cmd>Telescope find_files no_ignore=true <CR>
nnoremap <leader>f <cmd>Telescope live_grep<CR>
nnoremap <leader>F <cmd>Telescope grep_string<CR>
nnoremap <leader>j <cmd>Telescope jumplist<CR>
nnoremap <leader>k <cmd>Telescope keymaps<CR>
nnoremap <leader>b <cmd>Telescope git_branches<CR>
nnoremap <leader>m <cmd>Telescope marks<CR>
nnoremap <CR><CR> <cmd>Telescope buffers<CR>
augroup dirbuf
  autocmd!
  nnoremap ~ :Dirbuf ~<CR>
  nnoremap <leader><Left> <cmd>execute 'lua  require"dirbuf".jump_history(-'v:count1')'<CR>
  nnoremap <leader><Right> <cmd>execute 'lua  require"dirbuf".jump_history('v:count1')'<CR>
augroup END

" Misc keybindings
nnoremap <leader>u :UndotreeToggle<CR>
nmap sw saiw

" ; to run a single command in normal mode
inoremap <M-.> <C-x><C-o>
inoremap ; <C-o>
inoremap ;<Space> ;<Space>
inoremap ;<CR> ;<CR>
inoremap ;; ;

" indent-navigation
let g:vindent_motion_more_prev = '[=' " jump to prev line with more indent.
let g:vindent_motion_more_next = ']=' " jump to next line with more indent.
let g:vindent_motion_less_prev = '[-' " jump to prev line with less indent.
let g:vindent_motion_less_next = ']-' " jump to next line with less indent.
let g:vindent_motion_diff_prev = '[;' " jump to prev line with different indent.
let g:vindent_motion_diff_next = '];' " jump to next line with different indent.
let g:vindent_motion_XX_ss     = '[p' " jump to start of the current block scope.
let g:vindent_motion_XX_se     = ']p' " jump to end   of the current block scope.
let g:vindent_object_XX_ii     = 'ii' " select current block.
let g:vindent_object_XX_ai     = 'ai' " select current block + one extra line  at beginning.
let g:vindent_object_XX_aI     = 'aI' " select current block + two extra lines at beginning and end.

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
nnoremap <silent> <A-Left> :KittyNavigateLeft<cr>
nnoremap <silent> <A-j> :KittyNavigateDown<cr>
nnoremap <silent> <A-k> :KittyNavigateUp<cr>
nnoremap <silent> <A-Right> :KittyNavigateRight<cr>

" Search
nnoremap n nzz
nnoremap N Nzz
nmap h <Plug>Lightspeed_s
nmap H <Plug>Lightspeed_S
xmap h <Plug>Lightspeed_x
xmap H <Plug>Lightspeed_H
omap h <Plug>Lightspeed_x
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
nnoremap <leader>. <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-K> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>r <cmd>lua vim.lsp.buf.rename()<CR>

" quickfix
nnoremap ]q <cmd>cnext<CR>
nnoremap [q <cmd>cprev<CR>

" git
nnoremap ]h <cmd>Gitsigns next_hunk<CR>
nnoremap [h <cmd>Gitsigns prev_hunk<CR>
nnoremap <leader>ha <cmd>Gitsigns stage_buffer<CR>
nnoremap <leader>hs <cmd>Gitsigns stage_hunk<CR>
nnoremap <leader>hp <cmd>Gitsigns preview_hunk<CR>
nnoremap <leader>hr <cmd>Gitsigns reset_hunk<CR>
nnoremap <leader>hd <cmd>Gitsigns diffthis<CR>
nnoremap <leader>hv <cmd>Gitsigns select_hunk<CR>
" These are set by plugin vim-gh-line
" <leader>gh open line on github
" <leader>gb open blame on github
" <leader>go open repo on github

" autoformat on save
augroup fmt
  autocmd! 
  autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()


" Install plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'savq/melange'

" Dependencies
Plug 'nvim-lua/plenary.nvim' " For Lua everything
Plug 'kana/vim-textobj-user' " For textobj-entire and possibly indent-object
Plug 'tpope/vim-repeat'       " For lightspeed
Plug 'antoinemadec/FixCursorHold.nvim'

" Language support
Plug 'cstrahan/vim-capnp'
Plug 'gleam-lang/gleam.vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'rescript-lang/vim-rescript' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'kosayoda/nvim-lightbulb'

" Editing
Plug 'tpope/vim-sensible'
Plug 'b3nj5m1n/kommentary'
Plug 'tpope/vim-abolish'
Plug 'nmac427/guess-indent.nvim'
Plug 'kana/vim-textobj-entire' 
Plug 'machakann/vim-sandwich'
Plug 'jessekelighine/vindent.vim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'gbprod/yanky.nvim'

" Search and navigation
Plug 'ggandor/lightspeed.nvim'
Plug 'haya14busa/incsearch.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'chentoast/marks.nvim'
Plug 'knubie/vim-kitty-navigator'
Plug 'smjonas/live-command.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'rhysd/committia.vim'
Plug 'ruanyl/vim-gh-line'

" Visual
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
Plug 'luukvbaal/stabilize.nvim'
Plug 'romgrk/nvim-treesitter-context'

" IDE
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'elihunter173/dirbuf.nvim'
Plug 'farmergreg/vim-lastplace'
Plug 'simrat39/symbols-outline.nvim'
Plug 'mbbill/undotree'

call plug#end()




lua <<EOF


require('colorizer').setup()
require('stabilize').setup()
require('dirbuf').setup{}
require('guess-indent').setup {}
require('nvim-lightbulb').setup({autocmd = {enabled=true}})

require('yanky').setup({})
vim.api.nvim_set_keymap("n", "p", "<Plug>(YankyPutAfter)", {})
vim.api.nvim_set_keymap("n", "P", "<Plug>(YankyPutBefore)", {})
vim.api.nvim_set_keymap("x", "p", "<Plug>(YankyPutAfter)", {})
vim.api.nvim_set_keymap("x", "P", "<Plug>(YankyPutBefore)", {})
vim.api.nvim_set_keymap("n", "gp", "<Plug>(YankyGPutAfter)", {})
vim.api.nvim_set_keymap("n", "gP", "<Plug>(YankyGPutBefore)", {})
vim.api.nvim_set_keymap("x", "gp", "<Plug>(YankyGPutAfter)", {})
vim.api.nvim_set_keymap("x", "gP", "<Plug>(YankyGPutBefore)", {})
vim.api.nvim_set_keymap("n", "<c-p>", "<Plug>(YankyCycleForward)", {})
vim.api.nvim_set_keymap("n", "<c-n>", "<Plug>(YankyCycleBackward)", {})



require('lualine').setup {
    sections = {
        lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end }},
        lualine_b = {'branch',},
        lualine_c = {{'filename', path=1, symbols = { modified='⭑'}}},
        lualine_x = {"filetype"},
        lualine_y = {'diagnostics'},
    },
}


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

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach=function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            if client.name == "tsserver" then
                client.resolved_capabilities.document_formatting=false
            end
        end,
    }
    server:setup(opts)
end)



local null_ls = require("null-ls")
local command_resolver = require("null-ls.helpers.command_resolver")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier.with({
            dynamic_command = function(params)
                return command_resolver.from_yarn_pnp(params)
                    or command_resolver.from_node_modules(params)
                    or vim.fn.executable(params.command) == 1 and params.command
            end,
        }),
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

require('live-command').setup {
  commands = {
    Norm = {cmd = "norm" },
    Global = {cmd = "global"},
  }
}

vim.g.symbols_outline= {
  symbol_blacklist = {'Variable', 'Parameter'}
}

vim.cmd([[autocmd CursorHold   * :silent! lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorHoldI  * :silent! lua vim.lsp.buf.document_highlight()]])
vim.cmd([[autocmd CursorMoved  * lua vim.lsp.buf.clear_references()]])
vim.cmd([[autocmd CursorMovedI * lua vim.lsp.buf.clear_references()]])

EOF

colorscheme melange

highlight LspReferenceText guibg=#ffd3c6
highlight LspReferenceRead guibg=#ffd3c6
highlight LspReferenceWrite guibg=#ffd3c6

highlight ConflictMarkerBegin guibg=#9fc3a6
highlight ConflictMarkerOurs guibg=#eed0a9
highlight ConflictMarkerCommonAncestorsHunk guibg=#eacff8
highlight ConflictMarkerTheirs guibg=#a4dfe9
highlight ConflictMarkerEnd guibg=#9fc3a6

highlight GitSignsCurrentLineBlame guifg=#c6c5f4 blend=nocombine

highlight IndentBlanklineIndent1 guifg=#eddded
highlight IndentBlanklineIndent2 guifg=#dddded
highlight Normal guibg=NONE ctermbg=NONE




