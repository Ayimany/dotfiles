return {
    'nvim-treesitter/nvim-treesitter',
    name  = 'Treesitter',
    build = ':TSUpdate',
    main  = 'nvim-treesitter.configs',

    dependencies = {
        {
            'nvim-treesitter/nvim-treesitter-refactor',
            name = 'Treesitter Refactor'
        },

        {
            'nvim-treesitter/nvim-treesitter-textobjects',
            name = 'Treesitter TextObjects'
        }
    },

    opts = {
        ensure_installed = {
            'c', 'cpp', 'markdown'
        },

        auto_install = true,

        highlight = {
            enable = true,

            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,

            additional_vim_regex_highlighting = false,
        },

        refactor = {
            highlight_definitions = {
                enable = true,
                clear_on_cursor_move = true
            },

            smart_rename = {
                enable = function()
                    return #vim.lsp.get_clients() == 0
                end,

                keymaps = {
                    smart_rename = '<leader>sr'
                }
            },

            navigation = {
                enable = function()
                    return #vim.lsp.get_clients() == 0
                end,

                keymaps = {
                    goto_definition     = "<leader>sd",
                    list_definitions    = "<leader>sld",
                    goto_next_usage     = "<leader>sun",
                    goto_previous_usage = "<leader>sup",
                }
            }
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true,

                keymaps = {
                    ['ah'] = '@assignment.lhs',
                    ['al'] = '@assignment.rhs',
                    ['if'] = '@function.inner',
                    ['of'] = '@function.outer',
                    ['ib'] = '@block.inner',
                    ['ob'] = '@block.outer',
                    ['iC'] = '@call.inner',
                    ['oC'] = '@call.outer',
                    ['ix'] = '@comment.inner',
                    ['ox'] = '@comment.outer',
                    ['ic'] = '@class.inner',
                    ['oc'] = '@class.outer',
                    ['ii'] = '@conditional.inner',
                    ['oi'] = '@conditional.outer',
                    ['il'] = '@loop.inner',
                    ['ol'] = '@loop.outer',
                    ['ir'] = '@return.inner',
                    ['or'] = '@return.outer',
                    ['ip'] = '@parameter.inner',
                    ['op'] = '@parameter.outer',
                    ['iA'] = '@attribute.inner',
                    ['oA'] = '@attribute.outer',
                    ['s']  = '@statement.outer',
                    ['n']  = '@number.inner'
                },

                selection_modes = {
                }
            },

            swap = {
                enable = true,
                swap_next = {
                    ['<leader>sp'] = '@parameter.inner',
                    ['<leader>sa'] = '@assignment.inner',
                    ['<leader>sb'] = '@block.outer',
                    ['<leader>sf'] = '@function.outer',
                    ['<leader>sF'] = '@function.inner'
                },

                swap_previous = {
                    ['<leader>Sp'] = '@parameter.inner',
                    ['<leader>Sa'] = '@assignment.inner',
                    ['<leader>Sb'] = '@block.outer',
                    ['<leader>Sf'] = '@function.outer',
                    ['<leader>SF'] = '@function.inner'
                }
            },

            move = {
                enable = true,
                set_jumps = true,

                goto_next_start = {
                    ['<leader>ma'] = '@assignment.inner',
                    ['<leader>mA'] = '@attribute.inner',
                    ['<leader>mb'] = '@block.outer',
                    ['<leader>mC'] = '@call.outer',
                    ['<leader>mc'] = '@class.outer',
                    ['<leader>mx'] = '@comment.outer',
                    ['<leader>mi'] = '@conditional.outer',
                    ['<leader>mf'] = '@function.outer',
                    ['<leader>ml'] = '@loop.outer',
                    ['<leader>mn'] = '@number.inner',
                    ['<leader>mr'] = '@return.outer',
                    ['<leader>ms'] = '@statement.outer'
                },

                goto_previous_start = {
                    ['<leader>Ma'] = '@assignment.inner',
                    ['<leader>MA'] = '@attribute.inner',
                    ['<leader>Mb'] = '@block.outer',
                    ['<leader>MC'] = '@call.outer',
                    ['<leader>Mc'] = '@class.outer',
                    ['<leader>Mx'] = '@comment.outer',
                    ['<leader>Mi'] = '@conditional.outer',
                    ['<leader>Mf'] = '@function.outer',
                    ['<leader>Ml'] = '@loop.outer',
                    ['<leader>Mn'] = '@number.inner',
                    ['<leader>Mr'] = '@return.outer',
                    ['<leader>Ms'] = '@statement.outer'
                },
            },

            lsp_interop = {
                enable = true,
                border = 'none',

                peek_definition_code = {
                    ['<leader>cA'] = '@assignment.inner',
                    ['<leader>cF'] = '@function.outer',
                    ['<leader>cC'] = '@class.outer'
                }
            }
        }
    }
}

