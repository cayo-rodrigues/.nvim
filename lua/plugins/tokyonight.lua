return {
    'folke/tokyonight.nvim',
    priority = 8000,
    config = function()
        require('tokyonight').setup({
            lualine_bold = true,
            on_colors = function(colors)
                colors.bg = "#222230"
                colors.bg_statusline = "#1e1e2e"
                colors.fg_gutter = "#444b6a"
            end
        })
        vim.cmd.colorscheme 'tokyonight'
    end
}
