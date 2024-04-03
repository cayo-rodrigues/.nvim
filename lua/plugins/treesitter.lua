-- [[ Configure Treesitter ]]
return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            ignore_whitespace = false,
        },

        autotag = { enable = true },

        indent = { enable = true },

        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },

        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']f'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']F'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[f'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[F'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['sa'] = '@parameter.inner',
                },
                swap_previous = {
                    ['sA'] = '@parameter.inner',
                },
            },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
