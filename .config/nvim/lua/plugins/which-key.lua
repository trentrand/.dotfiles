return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      triggers_blacklist = {
        n = { "v" },
        v = { "v" },
      },
    })
  end,
}
