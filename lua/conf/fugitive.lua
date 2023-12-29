vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- choose left side of conflict
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
-- choose right side of conflict
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")

local CayFugitive = vim.api.nvim_create_augroup("Cay_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = CayFugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        vim.keymap.set("n", "<leader>p", function()
            local current_branch = vim.cmd.Git("rev-parse --abbrev-ref HEAD")
            vim.cmd.Git("push origin " .. current_branch)
        end)
    end,
})
