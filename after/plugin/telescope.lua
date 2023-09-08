local builtin = require('telescope.builtin')
local telescope = require('telescope')
local themes = require('telescope.themes')

local function find_hidden_files()
  builtin.find_files({ hidden = true, no_ignore = true })
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>hf', find_hidden_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { silent = true })
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  extensions = {
    file_browser = {
      grouped = true,
      select_buffer = true,
      prompt_path = true,
      hidden = { file_browser = true }
    }
  }
}

telescope.load_extension "file_browser"
telescope.load_extension "media_files"

vim.keymap.set('n', '<leader>sb', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer', silent = true })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]resume' })

vim.keymap.set('n', '<leader>mf', ":Telescope media_files<CR>", { desc = '[M]edia [F]iles' })
vim.keymap.set('n', '<leader>ex', ":Telescope file_browser<CR>", { desc = 'File [Ex]plorer from nvim root' })
vim.keymap.set("n", "<space>ec", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { desc = 'File [Ex]plorer on [C]urrent directory', noremap = true })
