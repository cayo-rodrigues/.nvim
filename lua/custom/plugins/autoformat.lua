return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        if vim.bo.filetype == 'templ' then
          local bufnr = vim.api.nvim_get_current_buf()
          local filename = vim.api.nvim_buf_get_name(bufnr)
          local cmd = 'templ fmt ' .. vim.fn.shellescape(filename)

          vim.fn.jobstart(cmd, {
            on_exit = function()
              -- Reload the buffer only if it's still the current buffer
              if vim.api.nvim_get_current_buf() == bufnr then
                vim.cmd 'e!'
              end
            end,
          })
        else
          require('conform').format { async = true, lsp_format = 'fallback' }
        end
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    },
  },
}
