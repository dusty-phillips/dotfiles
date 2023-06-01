-- Bootstrap lazy plugin manager if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.o.background = "light"
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.cursorline = true
vim.o.nohlsearch = true
vim.o.inccommand = "split"
vim.o.updatetime = 50
vim.o.undofile = true
vim.o.splitright = true
vim.o.nobackup = true
vim.o.nowritebackup = true
vim.o.shortmess = "acIF"
vim.o.cmdheight = 2
vim.o.noshowcmd = true
vim.o.noshowmode = true
vim.o.signcolumn = 'yes'
vim.o.completeopt = "menuone,noselect"
vim.o.foldlevel = 20
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.wildmenu = true
vim.o.wildmode = "longest:list,full"
vim.o.expandtab = true
vim.o.sw = 2

vim.g.camelcasemotion_key = '\\'
vim.g.mapleader = " "

require("lazy").setup({
    {
        "marko-cerovac/material.nvim",
        priority=1000,
        config = function()
            require("material").setup({
              contrast = {
                non_current_windows = true,
              },
              colored_cursor = false,
              disable = {
                  colored_cursor = true
              }
            })
            vim.g.material_style = "lighter"
            vim.cmd("colorscheme material")
        end
    },
    {
        "folke/which-key.nvim", config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            local wk = require('which-key')
            wk.setup {
                operators = {
                    gc = 'Comments',
                    sa = "Add Surround",
                    sd = 'Remove Surround',
                    sr = 'Replace Surround'
                },
            }

            -- Windows
            local ss = require('smart-splits')
            wk.register({
                ["\\"] = {'<C-w>', "Window commands", noremap=false},
                ['<A-Left>'] = {ss.move_cursor_left, 'Switch to Left Window (Kitty)'},
                ['<A-Right>'] = {ss.move_cursor_right, 'Switch to Right Window (Kitty)'},
                ['<A-j>'] = {ss.move_cursor_down, 'Switch to Below Window (Kitty)'},
                ['<A-k>'] = {ss.move_cursor_up, 'Switch to Above Window (Kitty)'},
                ['<Space><Left>'] = {ss.resize_left, 'Resize Left'},
                ['<Space><Right>'] = {ss.resize_right, 'Resize Right'},
                ['<Space>j'] = {ss.resize_down, 'Resize Down'},
                ['<Space>k'] = {ss.resize_up, 'Resize Up'},
                ['\\<Left>'] = {ss.swap_buf_left, 'Swap With Left Buffer'},
                ['\\<Right>'] = {ss.swap_buf_right, 'Swap With Right Buffer'},
                ['\\j'] = {ss.swap_buf_down, 'Swap With Below Buffer'},
                ['\\k'] = {ss.swap_buf_up, 'Swap With Above Buffer'},
                ['<CR>d'] = {"<cmd>%bd|e#|bd#<cr>", 'Close Other Buffers'},
                ['\\c'] = {"<cmd>Sayonara!<cr>", "Close Buffer"},
                ['\\q'] = {"<cmd>Sayonara<cr>", "Close Window"},
                ['\\Q'] = {"<cmd>qa<cr>", "Close All Without Saving"},
                ['\\t'] = {"<cmd>tabnew<cr>", "New Tab"},
            })

            -- Clipboard
            wk.register({
                ["Y"] = {'<cmd>let @*=@"<cr>', "Copy contents of copy register to System Clipboard"},
                ["<leader>y"] = { '"*y', "Copy to System Clipboard" },
                ["<leader>p"] = { '"*p', "Paste from System Clipboard" },
                ["<leader>P"] = { '"*P', "Paste Before from System Clipboard" },
            }, {mode={'n', 'v'}})
            wk.register({
                ["y"] = {"<Plug>(YankyYank)", "Yank text"},
                ["p"] = {'<Plug>(YankyPutAfter)', "Put After cursor location"},
                ["P"] = {'<Plug>(YankyPutBefore)', "Put Before cursor location"},
            }, {mode={'n', 'x'}})
            wk.register({
                ["<C-p>"] = {"<Plug>(YankyCycleForward)", "Cycle through yank ring"},
            }, {mode={'n'}})

            -- Filesystem
            wk.register({
                ["l"] = {"<cmd>Telescope git_files show_untracked=true <cr>", "Show Git Files"},
                ["-"] = {require("oil").open, "List/Edit Directory"},
                ["<C-l>"] = {
                    "<cmd>lua require('telescope.builtin').git_files({git_command={'git', 'ls-files', '--modified', '--exclude-standard'}, show_untracked=true})<cr>",
                    "Show Modified Files"},
                    ["L"] = {"<cmd>Telescope find_files no_ignore=true <cr>", "Show All Files"},
                    ["<leader>f"] = {"<cmd>Telescope live_grep<cr>", "Find in Files"},
                    ["<leader>b"] = {"<cmd>Telescope git_branches show_remote_tracking_branches=false<cr>", "Git Branches"},
                    ["<cr><cr>"] = {"<cmd>Telescope buffers<cr>", "Open Buffers"},
            }, {mode='n'})
            wk.register({
                ["<C-S>"] = { '<cmd>w<cr>', "Save" },
            }, {mode={'i', 'n'}})

            -- Search and Navigation
            wk.register({
                ["h"] = {"<Plug>(leap-forward-to)", "Leap Forward"},
                ["H"] = {"<Plug>(leap-backward-to)", "Leap Backward"},
                ["n"] = {"nzz", "Search Next"},
                ["N"] = {"Nzz", "Search Previous"},
                ["\\w"] = {"<cmd>lua require('spider').motion('w')<cr>", "Word By Case"},
                ["\\e"] = {"<cmd>lua require('spider').motion('e')<cr>", "End By Case"},
                ["\\b"] = {"<cmd>lua require('spider').motion('b')<cr>", "Back Word By Case"},
                ["\\ge"] = {"<cmd>lua require('spider').motion('ge')<cr>", "Back end By Case"},
            }, {mode={'n', 'x', 'o'}})

            -- LSP
            wk.register({
                ["<leader>o"] = {
                    "<cmd>Telescope lsp_document_symbols ignore_symbols=variable<cr>",
                    "Document Symbols"
                },
                ["gr"] = {"<cmd>Telescope lsp_references<cr>", "List References"},
                ["<leader>."] = {vim.lsp.buf.code_action, "Fix"},
                ["K"] = {vim.lsp.buf.hover, "Hover Docs"},
                ["<C-K>"] = {vim.lsp.buf.signature_help, "Signature Help"},
                ["[d"] = {vim.diagnostic.goto_prev, "Previous Diagnostic"},
                ["]d"] = {vim.diagnostic.goto_next, "Next Diagnostic"},
                ["<leader>r"] = {vim.lsp.buf.rename, "Rename Symbol"},
            })

            -- Insert tricks
            wk.register({
                ["<M-.>"] = {"<C-x><C-o>", "Trigger Completion"},
                [";"] = {"<C-o>", "Trigger Normal Mode"},
                [";<Space>"] = {";<Space>", "Don't trigger normal mode"},
                [";<CR>"] = {";<CR>", "Don't trigger normal mode"},
                [";;"] = {";", "Don't trigger normal mode"},
            }, {mode='i'})

            -- Source Control
            wk.register({
                ["]h"] = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk,"},
                ["[h"] = {"<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk"},
                ["<leader>ha"] = {"<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer"},
                ["<leader>hs"] = {"<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk"},
                ["<leader>hp"] = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
                ["<leader>hr"] = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
                ["<leader>hd"] = {"<cmd>Gitsigns diffthis<cr>", "Diff This"},
                ["<leader>hv"] = {"<cmd>Gitsigns select_hunk<cr>", "Select Hunk"},
            })


            -- Misc
            wk.register({
                ["ga."] = {'<cmd>TextCaseOpenTelescope<cr>', "Text Case"},
            }, {mode={'n', 'v'}})
            wk.register({
                ["gas"] = {"<cmd>lua require('textcase').current_word('to_snake_case')<cr>", "Snake Case"}
            }, {mode={'n', 'v'}})
            wk.register({
                ["ai"] = {"<Cmd>lua require('various-textobjs').indentation(false, true)<CR>", "Select context-aware indent (outer)"},
                ["aI"] = {"<Cmd>lua require('various-textobjs').indentation(false, false)<CR>", "Select context-aware indent (outer, line-wise)"},
                ["ii"] = {"<Cmd>lua require('various-textobjs').indentation(true, true)<CR>", "Select context-aware indent (inner, partial range)"},
                ["iI"] = {"<Cmd>lua require('various-textobjs').indentation(true, false)<CR>", "Select context-aware indent (inner, entire range)"},
                ["ae"] = {"<Cmd>lua require('various-textobjs').entireBuffer(false)<CR>", "Select entire buffer"},
            }, {mode={'x', 'o'}})
            wk.register({
                ["sw"] = {"saiw", "Add Surround To Word", noremap=false},
                ["]q"] = {"<cmd>cnext<cr>", "Quick Fix Next"},
                ["[q"] = {"<cmd>cprev<cr>", "Quick Fix Previous"},
                ["<leader>u"] = {require('undotree').toggle, "Undo Tree"}
            })

            end
        },

        {'nvim-lua/plenary.nvim'},
        {
            'nvim-telescope/telescope.nvim', config = function()
                require('telescope').setup {
                    pickers = {
                        buffers = {
                            mappings = {
                                n = {
                                    ["dd"] = "delete_buffer",
                                }
                            }
                        }
                    }
                }
            end
        },
        {'nvim-telescope/telescope-symbols.nvim'},

        { "nvim-tree/nvim-web-devicons", lazy = true },
        {
            "nvim-lualine/lualine.nvim", config = function()
                require('lualine').setup {
                    -- options = {theme = 'papercolor_light'},
                    -- options = {theme = 'onelight'},
                    sections = {
                        lualine_a = {{'mode', fmt = function(str) return str:sub(1,1) end }},
                        lualine_b = {},
                        lualine_c = {{'filename', path=1, symbols = { modified='⭑'}}},
                        lualine_x = {"filetype"},
                        lualine_y = {'diagnostics'},
                    },
                    winbar = {
                        lualine_c = {"navic"}
                    }
                }
            end
        },

        {"tpope/vim-repeat"},
        {
            "ggandor/leap.nvim",
            config = function ()
                vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {bg='#2222a2', fg="#eeeeee", bold=true})
                vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {bg='#3333a3', fg="#dddddd", bold=true})
                vim.api.nvim_set_hl(0, 'LeapLabelSelected', {bg='#ff0000'})

            end
    },
        {"ggandor/flit.nvim", config = true},
        {"ggandor/leap-spooky.nvim", config = true},

        { 'mrjones2014/smart-splits.nvim', build = './kitty/install-kittens.bash' },

        { 'stevearc/oil.nvim', config = function()
            require('oil').setup({
                keymaps = {
                    ["<C-v>"] = "actions.select_vsplit",
                    ["<C-n>"] = "actions.select_split",
                    ["<C-h>"] = false,
                    ["<C-s>"] = false,
                },
            })
        end},

        {
            'williamboman/mason.nvim',
            build = ":MasonUpdate",
            config = true
        },
        {
            'williamboman/mason-lspconfig.nvim',
            dependencies = {"williamboman/mason.nvim"},
            config = function()
                require("mason-lspconfig").setup {
                    automatic_installation = true
                }
            end
        },
        {
            'neovim/nvim-lspconfig',
            dependencies = {"williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim"},
            config = function()
                require("lspconfig").pyright.setup{}
                require("lspconfig").tsserver.setup{}
                require("lspconfig").lua_ls.setup{}
            end
        },
        {
            'jay-babu/mason-null-ls.nvim',
            dependencies = {"williamboman/mason.nvim"},
            config = function()
                require("mason-null-ls").setup{
                    automatic_installation = true
                }
            end
        },
        {
            'jose-elias-alvarez/null-ls.nvim',
            config = function()
                local null_ls = require("null-ls")
                null_ls.setup {
                    sources = {
                        null_ls.builtins.formatting.black,
                        null_ls.builtins.formatting.reorder_python_imports,
                        null_ls.builtins.formatting.prettier,
                        null_ls.builtins.code_actions.gitsigns
                    }
                }
                vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({filter = function(client) return client.name == "null-ls" end})]]

            end
        },

        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
                require('nvim-treesitter.configs').setup {
                    ensure_installed = {"c", "lua", "vim", "query", "python", "typescript"},
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
            end
        },
        {
            "SmiteshP/nvim-navic",
            dependencies = {"neovim/nvim-lspconfig"},
            config = function()
                require("nvim-navic").setup({
                    lsp = {auto_attach=true},
                    highlight = true,
                    separator = "  "
                })
            end
        },

        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup {
                    word_diff = true,
                    current_line_blame = true,
                    current_line_blame_opts = {
                        delay = 200,
                    },
                }
                vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', {fg='#9999bb'})
                vim.api.nvim_set_hl(0, 'GitSignsAddInline', {bg='#aaddbb'})
                vim.api.nvim_set_hl(0, 'GitSignsChangeInline', {bg='#ccccdd'})
                vim.api.nvim_set_hl(0, 'GitSignsDeleteInline', {bg='#ddaaaa'})

            end
        },
        {'rhysd/conflict-marker.vim'},
        {'kiyoon/treesitter-indent-object.nvim'},

        {'tpope/vim-sensible'},
        {'chrisgrieser/nvim-various-textobjs'},
        {'chrisgrieser/nvim-spider'},
        {
            'gbprod/yanky.nvim',
            config=function()
                require('yanky').setup({
                    preserve_cursor_position = {enabled = true},
                    highlight = {
                        on_put = true,
                        on_yank=true,
                        timer=800
                    }
                })
                require('telescope').load_extension('yank_history')

            end
        },
        {'inko-lang/inko.vim'},
        {'ethanholz/nvim-lastplace', config=true},
        {'mhinz/vim-sayonara'},
        {'luukvbaal/stabilize.nvim', config=true},
        {'nmac427/guess-indent.nvim', config=true},
        {'norcalli/nvim-colorizer.lua', config=true},
        {
            'johmsalas/text-case.nvim',
            config = function()
                require('textcase').setup {}
                require('telescope').load_extension('textcase')
            end
        },
        {'winston0410/cmd-parser.nvim', config=true},
        {'winston0410/range-highlight.nvim', config=true},
        {'echasnovski/mini.surround', version = false, config = true },
        {'echasnovski/mini.comment', version = false, config = true },
        {'echasnovski/mini.pairs', version = false, config = true },
        {'echasnovski/mini.indentscope', version = false, config = true },
        {'echasnovski/mini.cursorword', version = false, config = true },

        {'jiaoshijie/undotree', config = true},

        {
            'smjonas/live-command.nvim',
            config = function()
                require('live-command').setup {
                    commands = {
                        Norm = {cmd = "norm"},
                        Global = {cmd = "global"},
                    }
                }
            end
        },

        {'inko-lang/inko.vim'},
        {'rescript-lang/vim-rescript'}
    },

    {
        lazy = true
    })




