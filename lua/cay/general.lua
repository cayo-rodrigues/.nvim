-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40
    })
  end,
  group = highlight_group,
  pattern = '*',
})

local augroup = vim.api.nvim_create_augroup
local CayGroup = augroup('Cay', {})
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = CayGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.cmd([[let $BASH_ENV=expand("~/.bash_aliases")]])
