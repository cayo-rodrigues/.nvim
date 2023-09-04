vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use "nvim-telescope/telescope-media-files.nvim"

    -- themes
    use "EdenEast/nightfox.nvim" -- Packer
    -- themes

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects'
        },
        run = ':TSUpdate'
    }
    use('nvim-treesitter/playground')
    use('nvim-treesitter/nvim-treesitter-context');
    use('theprimeagen/harpoon')
    use('ThePrimeagen/vim-be-good')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('ThePrimeagen/vim-with-me')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }

    use { 'mhartington/formatter.nvim' }

    use 'nvim-lualine/lualine.nvim'
    use 'tpope/vim-sleuth'

    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'
    use 'nvim-tree/nvim-web-devicons'

    use "terrortylor/nvim-comment"

    use 'm4xshen/autoclose.nvim'

    use 'windwp/nvim-ts-autotag'

    use 'norcalli/nvim-colorizer.lua'
    use 'prettier/vim-prettier'
    use {
        'laytan/tailwind-sorter.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
        run = 'cd formatter && npm i && npm run build',
    }
end)
