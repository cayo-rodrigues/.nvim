-- [[ Setting options ]]

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

vim.o.tabstop = 4

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

-- [[ Keymaps ]]

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })

vim.cmd [[let $BASH_ENV=expand("~/.bash_aliases")]]

-- Personal keymaps

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlited line Down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlited line Up' })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen when using <C-d>' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen when using <C-u>' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Center screen when using J' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center screen when using n' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center screen when using N' })

vim.keymap.set('x', '<leader>p', '"_dP')

vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>Y', '"+Y')

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')

-- replace stuff
vim.keymap.set('n', '<leader>R', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
vim.keymap.set('n', '<leader>r', '/\\<<C-r><C-w>\\><CR>Ncgn')
vim.keymap.set('v', '<leader>r', '"zy/<C-R>z<CR>Ncgn') -- `z` is just an arbitrary register

-- wrap stuff
vim.keymap.set('v', '(', [[c(<C-r>")<Esc>]])
vim.keymap.set('v', '<leader>[', [[c[<C-r>"]<Esc>]])
vim.keymap.set('v', '<leader>{', [[c{<C-r>"}<Esc>]])
vim.keymap.set('v', '<leader><', [[c<<C-r>"><Esc>]])
vim.keymap.set('v', ')', [[c[<C-r>"]()<Esc>]])
vim.keymap.set('v', '"', [[c"<C-r>""<Esc>]])
vim.keymap.set('v', "'", [[c'<C-r>"'<Esc>]])

-- format python file with black
vim.cmd 'autocmd FileType python nnoremap <leader>l :!black %<CR><CR>'

vim.api.nvim_create_augroup('JSLogKeymap', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'JSLogKeymap',
  pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  callback = function()
    vim.keymap.set('v', '<leader>ll', "yoconsole.log('[LOG] <Esc>pa:', <Esc>pa)<Esc>")
    vim.keymap.set('n', '<leader>liw', "yiwoconsole.log('[LOG] <Esc>pa:', <Esc>pa)<Esc>")
    vim.keymap.set('n', '<leader>law', "yawoconsole.log('[LOG] <Esc>pa:', <Esc>pa)<Esc>")
  end,
})

vim.api.nvim_create_augroup('GoLogKeymap', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = 'GoLogKeymap',
  pattern = { 'go' },
  callback = function()
    vim.keymap.set('v', '<leader>ll', "yofmt.Printf('[LOG] <Esc>pa: %v\\n', <Esc>pa)<Esc>")
    vim.keymap.set('n', '<leader>liw', "yiwofmt.Printf('[LOG] <Esc>pa: %v\\n', <Esc>pa)<Esc>")
    vim.keymap.set('n', '<leader>law', "yawofmt.Printf('[LOG] <Esc>pa: %v\\n', <Esc>pa)<Esc>")
  end,
})

vim.keymap.set('n', '<leader>cdo', ':silent! cdo %s//g<Left><Left>', {
  desc = 'Replace all matching patterns from quickfix list (you can make a quickfix list based on telescope results with <C-q>)',
})

vim.keymap.set('n', '<leader>cn', ':cnext<CR>', { desc = 'Go to next quickfix list item' })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>', { desc = 'Go to prev quickfix list item' })

vim.keymap.set('n', '<leader>.', ":echo substitute(expand('%:p'), substitute(system('git rev-parse --show-toplevel'), '\\n', '', 'g'), '', '')<CR>", {
  desc = 'Show current file path from git root',
})

vim.keymap.set('n', '<leader>,', ":echo expand('%:p:.')<CR>", {
  desc = 'Show current file path from nvim root',
})

-- vim.keymap.set("n", "<leader>z", ":ZenMode<CR>:TransparentEnable<CR>", { desc = "Toggle Zen Mode" })
vim.keymap.set('n', '<leader>z', ':ZenMode<CR>', { desc = 'Toggle Zen Mode' })

vim.keymap.set('v', '>', '>gv', { desc = 'Keep visual mode when indenting right' })
vim.keymap.set('v', '<', '<gv', { desc = 'Keep visual mode when indenting left' })

vim.keymap.set('n', '[[', function()
  require('treesitter-context').go_to_context(vim.v.count1)
end, { silent = true })

-- [[ Autocommands ]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  { 'NMAC427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns',

  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
-- LSP Plugins
