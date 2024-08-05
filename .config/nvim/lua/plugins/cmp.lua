return {
  "hrsh7th/nvim-cmp",
  dependencies = { "supermaven-inc/supermaven-nvim" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    table.insert(opts.sources, { name = "supermaven" })
  end,
}
