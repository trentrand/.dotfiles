-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- General settings
vim.log.level = "warn"
vim.wo.spell = true
vim.g.netrw_list_hide = ".DS_Store,*/.undodir/*"

-- Indentation
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- Line width and wrapping
vim.bo.textwidth = 120
vim.opt.textwidth = 120
vim.wo.wrap = true

-- Numbering and rulers
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.ruler = true
local function sequence(from, to)
  local range = {}
  for i = from, to do
    table.insert(range, i)
  end
  return range
end
vim.opt.colorcolumn = "80," .. table.concat({ unpack(sequence(120, 256)) }, ",")

-- Search settings
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.smartcase = true
