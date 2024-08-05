-- Telescope configuration
local actions = require("telescope.actions")
local telescope = require("telescope")

function ShowLastGitChangeDate()
  local filename = vim.fn.expand("%") -- Gets the current file name
  local cmd = "git log -1 --format=%cd -- " .. filename
  local handle = io.popen(cmd)
  if handle ~= nil then
    local result = handle:read("*a")
    handle:close()
    print("Last Changed: " .. result)
  end
end

-- Custom commands to open Telescope pickers
-- vim.api.nvim_exec(
--   [[
--     command! Files Telescope find_files
--     command! Buffers Telescope buffers
--     command! Rg Telescope live_grep
--   ]],
--   false
-- )

return {
  "nvim-telescope/telescope.nvim",
  requires = {
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["H"] = function()
              require("plenary.job")
                :new({
                  command = "git",
                  args = { "log", "-1", "--format=%cd", vim.fn.expand("%") },
                  on_exit = function(j)
                    print("Last Changed: " .. j:result()[1])
                  end,
                })
                :sync()
            end,
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
      },
    })
  end,
}
