vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Cay_Fugitive = vim.api.nvim_create_augroup("Cay_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Cay_Fugitive,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        vim.keymap.set("n", "<leader>p", function()
            local current_branch = vim.cmd.Git("rev-parse --abbrev-ref HEAD"):gsub("\n", "")
            vim.cmd.Git("push origin " .. current_branch)
        end)
    end,
})
