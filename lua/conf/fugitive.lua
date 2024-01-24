vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "choose left side of conflict" })
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "choose right side of conflict" })

vim.keymap.set("n", "<leader>gp", ":!gpush", { desc = "git push origin <current-branch-name>" })

vim.keymap.set("n", "<leader>gP", ":!gpull", { desc = "git pull origin <current-branch-name>" })

local CayFugitive = vim.api.nvim_create_augroup("Cay_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = CayFugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end
    end,
})
