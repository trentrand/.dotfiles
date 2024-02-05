-- Telescope configuration
local actions = require("telescope.actions")

-- Setup Telescope
require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        -- Additional mappings as needed
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        -- Additional mappings as needed
      },
    },
    path_display = { "smart" },
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.99,
      height = 0.9,
    },
  },
  pickers = {
    live_grep = {
      layout_config = {
        width = 0.99,
      },
    },
    find_files = {
      layout_config = {
        width = 0.99,
      },
    },
    buffers = {
      layout_config = {
        width = 0.99,
      },
    },
    -- Add other pickers here as needed
  },
  -- Additional configurations as needed
})

-- Custom commands to open Telescope pickers
vim.api.nvim_exec(
  [[
  command! Files Telescope find_files
  command! Buffers Telescope buffers
  command! Rg Telescope live_grep
]],
  false
)
