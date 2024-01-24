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

        local on_alias_exit = function(_, code, _)
            print('Job exited with code ' .. code)
        end

        vim.keymap.set("n", "<leader>gp", function()
            vim.fn.jobstart("gpush", {
                on_exit = on_alias_exit,
            })
        end)

        vim.keymap.set("n", "<leader>gP", function()
            vim.fn.jobstart("gpull", {
                on_exit = on_alias_exit,
            })
        end)
    end,
})
