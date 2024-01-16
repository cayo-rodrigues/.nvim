-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Personal keymaps

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move highlited line Down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move highlited line Up' })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Center screen when using <C-d>' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Center screen when using <C-u>' })
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Center screen when using J' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Center screen when using n' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Center screen when using N' })

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace stuff
vim.keymap.set("n", "<leader>R", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>.", "/\\<<C-r><C-w>\\><CR>Ncgn")
vim.keymap.set("v", "<leader>.", '"zy/<C-R>z<CR>Ncgn') -- `z` is just an arbitrary register

-- wrap stuff
vim.keymap.set("v", "(", [[c(<C-r>")<Esc>]])
vim.keymap.set("v", "<leader>[", [[c[<C-r>"]<Esc>]])
vim.keymap.set("v", "<leader>{", [[c{<C-r>"}<Esc>]])
vim.keymap.set("v", "<leader><", [[c<<C-r>"><Esc>]])
vim.keymap.set("v", ")", [[c[<C-r>"]()<Esc>]])
vim.keymap.set("v", "\"", [[c"<C-r>""<Esc>]])
vim.keymap.set("v", "'", [[c'<C-r>"'<Esc>]])

vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = 'Change focused window Left' })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = 'Change focused window Down' })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = 'Change focused window Up' })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = 'Change focused window Right' })

vim.keymap.set("n", "<M-=>", "<C-w>=", { desc = 'Make all windows the same size' })
vim.keymap.set("n", "<M-o>", "<C-w>o", { desc = 'Close all unfocused windows' })

-- format python file with black
vim.cmd("autocmd FileType python nnoremap <leader>l :!black %<CR><CR>")

vim.keymap.set('n', '<leader>cdo', ':silent! cdo %s//g<Left><Left>',
  {
    desc =
    'Replace all matching patterns from quickfix list (you can make a quickfix list based on telescope results with <C-q>)'
  })

