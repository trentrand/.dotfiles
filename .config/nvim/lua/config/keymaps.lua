-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.api.nvim_set_keymap("n", "<C-s>", ":w<cr>", { noremap = true, silent = true })

-- Trouble keybindings
vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>Trouble lsp_references<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>Trouble document_diagnostics<cr>", { noremap = true, silent = true })

-- Misc keybindings
vim.api.nvim_set_keymap("n", "<F2>", ":set invpaste<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<F2>", "<C-O>:set invpaste<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<F2>", "<C-C>:set invpaste<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F5>", ":Gitsigns prev_hunk<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F6>", ":Gitsigns next_hunk<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<F7>", ":TroubleToggle<CR>", { noremap = true, silent = true })
