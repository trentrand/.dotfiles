-- Custom commands to open pickers
vim.api.nvim_exec(
  [[
    command! Files lua require('fzf-lua').files()
    command! Buffers lua require('fzf-lua').buffers()
    command! Rg lua require('fzf-lua').live_grep()
  ]],
  false
)

vim.api.nvim_set_keymap("n", "<C-p>", ":lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local actions = require("fzf-lua").actions
    require("fzf-lua").setup({
      -- lua pattern matching syntax
      file_ignore_patterns = {
        "fixtures/.*",
        "__snapshots__/.*",
        "common/.*",
        "scripts%-compressed/.*",
        "styles%-compressed/.*",
        "sqs%-i18n%-translations/.*",
      },
      fzf_opts = {
        ["--keep-right"] = "",
      },
      previewers = {
        builtin = {
          title_fnamemodify = function(s)
            return s
          end,
        },
      },
      path_shorten = true,
      winopts = {
        height = 1.00,
        width = 1.00,
        row = 0.05,
        col = 0.05,
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      actions = {
        files = {
          ["default"] = actions.file_edit_or_qf,
          ["ctrl-x"] = actions.file_split,
          ["ctrl-v"] = actions.file_vsplit,
          ["ctrl-t"] = actions.file_tabedit,
          ["alt-q"] = actions.file_sel_to_qf,
          ["alt-l"] = actions.file_sel_to_ll,
        },
        buffers = {
          ["default"] = actions.buf_edit,
          ["ctrl-x"] = actions.buf_split,
          ["ctrl-v"] = actions.buf_vsplit,
          ["ctrl-t"] = actions.buf_tabedit,
          ["ctrl-q"] = actions.buf_sel_to_qf,
        },
      },
    })
  end,
}
