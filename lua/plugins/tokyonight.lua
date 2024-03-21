return {
    'folke/tokyonight.nvim',
    priority = 8000,
    config = function()
        require('tokyonight').setup({
            lualine_bold = true,
        })
        vim.cmd.colorscheme 'tokyonight-night'
        vim.cmd.hi 'Comment gui=none'
    end
}
