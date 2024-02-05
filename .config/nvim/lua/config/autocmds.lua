-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Highlight trailing whitespace
vim.api.nvim_exec(
  [[
  augroup Whitespace
    autocmd!
    autocmd BufEnter,BufWinEnter,InsertLeave,TextChanged,WinEnter * if &ft != 'alpha' | match ExtraWhitespace /\s\+$/ | endif
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  augroup END
]],
  false
)
