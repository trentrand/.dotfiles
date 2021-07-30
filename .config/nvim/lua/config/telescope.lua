require('telescope').setup{
  defaults = {
    find_command = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

vim.api.nvim_exec([[
  command! Files call luaeval('require("telescope.builtin").find_files()')
]], false)

vim.api.nvim_exec([[
  command! Buffers call luaeval('require("telescope.builtin").buffers()')
]], false)

vim.api.nvim_exec([[
  command! Rg call luaeval('require("telescope.builtin").live_grep()')
]], false)
