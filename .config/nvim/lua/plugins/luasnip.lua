return {
  "L3MON4D3/LuaSnip",
  keys = function()
    local luasnip = require("luasnip")
    local supermaven = require("supermaven-nvim")

    return {
      {
        "<Tab>",
        function()
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif supermaven.has_suggestion() then
            supermaven.accept_suggestion()
          else
            -- If neither LuaSnip nor Supermaven can use <Tab>, pass it through
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end,
        mode = { "i", "s" },
        silent = true,
      },
      {
        "<S-Tab>",
        function()
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            -- If LuaSnip can't jump backwards, pass the key through
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
          end
        end,
        mode = { "i", "s" },
        silent = true,
      },
    }
  end,
}
