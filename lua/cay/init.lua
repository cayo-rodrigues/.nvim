require("cay.set")
require("cay.remap")

vim.o.background = "dark"
vim.cmd("colorscheme nightfox")

local augroup = vim.api.nvim_create_augroup
local CayGroup = augroup('Cay', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = CayGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
