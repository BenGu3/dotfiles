local leader = "<leader>"

-- buffer management
vim.keymap.set("n", leader .. "bn", "<cmd>enew<cr>", { desc = "[B]uffer [N]ew" })
vim.keymap.set("n", leader .. "bd", "<cmd>bdelete<cr>", { desc = "[B]uffer [D]elete" })
vim.keymap.set("n", leader .. "bh", "<cmd>leftabove vnew<cr>", { desc = "[B]uffer Left" })
vim.keymap.set("n", leader .. "bl", "<cmd>rightbelow vnew<cr>", { desc = "[B]uffer Right" })
vim.keymap.set("n", leader .. "bj", "<cmd>rightbelow new<cr>", { desc = "[B]uffer Down" })
vim.keymap.set("n", leader .. "bk", "<cmd>leftabove new<cr>", { desc = "[B]uffer Up" })
