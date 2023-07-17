vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	--use 'williamboman/mason.nvim'
        --use 'williamboman/mason-lspconfig.nvim'

        --use 'neovim/nvim-lspconfig'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- themes
	-- use { 'ellisonleao/gruvbox.nvim' }
	-- use 'AlexvZyl/nordic.nvim'
	-- use 'folke/tokyonight.nvim'
	-- use({ 'rose-pine/neovim', as = 'rose-pine' })
	use "EdenEast/nightfox.nvim" -- Packer
	-- use 'Mofiqul/dracula.nvim'
	-- use 'gbprod/nord.nvim'
	-- use { 'embark-theme/vim', as = 'embark' }
	-- themes

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
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
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}

    use {
        'lewis6991/gitsigns.nvim',
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }
    use 'sindrets/diffview.nvim'
    use 'nvim-tree/nvim-web-devicons'

    use "terrortylor/nvim-comment"

    use 'm4xshen/autoclose.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'windwp/nvim-ts-autotag'

    -- use 'xiyaowong/transparent.nvim'
end)
