return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "choose left side of conflict" })
		vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "choose right side of conflict" })

		vim.keymap.set("n", "<leader>gp", ":!gpush<CR>", { desc = "git push origin <current-branch-name>" })

		vim.keymap.set("n", "<leader>gP", ":!gpull<CR>", { desc = "git pull origin <current-branch-name>" })
	end,
}
