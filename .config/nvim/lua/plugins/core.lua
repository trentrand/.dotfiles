-- Theme settings
vim.g.everforest_background = "soft" -- hard, medium, soft
vim.opt.background = "dark" -- light, dark

return {
  { "sainnhe/everforest" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
