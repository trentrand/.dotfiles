return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      svelte = { "prettier" },
    },
    formatters = {
      prettier = {
        exe = "prettier",
        args = function(self, ctx)
          local filename = ctx.filename
          local filetype = vim.bo[ctx.buf].filetype
          return {
            "--stdin-filepath",
            filename,
            "--parser",
            filetype == "svelte" and "svelte" or "typescript",
            "--plugin",
            "prettier-plugin-svelte",
            "--single-quote",
            "--print-width",
            "120",
          }
        end,
        stdin = true,
        cwd = function(self, ctx)
          return vim.fn.fnamemodify(ctx.filename, ":h")
        end,
      },
    },
  },
}
