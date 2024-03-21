-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- local augroup = vim.api.nvim_create_augroup
-- local CayGroup = augroup('Cay', {})
-- vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
--   group = CayGroup,
--   pattern = '*',
--   command = [[%s/\s\+$//e]],
-- })

vim.cmd([[let $BASH_ENV=expand("~/.bash_aliases")]])
