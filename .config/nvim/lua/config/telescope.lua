require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
        width = 0.9,
      },
    },
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {
      '.git/.*',
      'yarn.lock',
      'package-lock.json',
      'node_modules',
    },
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = function(opts, path)
      local tail = require'telescope.utils'.path_tail(path)
      return string.format("%s (%s)", tail, path)
    end,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
      }
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "ivy",
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
          -- Replace current quickfix with selected Telescope entries(or all entries)
          ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
          -- Add entries to current quickfix (selected or all entries)
          ["<C-a>"] = require("telescope.actions").smart_add_to_qflist,
          ["<Tab>"] = require("telescope.actions").toggle_selection,
          -- ["<C-w>l"] = actions.preview_switch_window_right,
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          ["<C-u>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-d>"] = require("telescope.actions").preview_scrolling_down,
          -- Replace current quickfix with selected Telescope entries(or all entries)
          ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
          -- Add entries to current quickfix (selected or all entries)
          ["<C-a>"] = require("telescope.actions").smart_add_to_qflist,
          ["<Tab>"] = require("telescope.actions").toggle_selection,
          -- ["<C-w>l"] = actions.preview_switch_window_right,
        },
      }
    },
    find_files = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      auto_quoting = true,
    },
    file_browser = {
      -- theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  }
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

 vim.api.nvim_exec([[
   command! Files call luaeval('require("telescope.builtin").find_files()')
 ]], false)

vim.api.nvim_exec([[
  command! Buffers call luaeval('require("telescope.builtin").buffers()')
]], false)

require('telescope').load_extension('live_grep_args')

vim.api.nvim_exec([[
  command! Rg call luaeval('require("telescope").extensions.live_grep_args.live_grep_args()')
]], false)


-- require("telescope").load_extension('file_browser')
-- vim.api.nvim_exec([[
--   command! E call luaeval("require('telescope').extensions.file_browser.file_browser({path = vim.fn.expand('%:p:h')})")
-- ]], false)

