local cmd = vim.cmd   -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn     -- to call Vim functions e.g. fn.bufnr()
local g = vim.g       -- a table to access global variables
local opt = vim.o     -- to set global options
local winopt = vim.wo -- to set window options
local bufopt = vim.bo -- to set buffer options

-- Theme
opt.termguicolors = true
opt.guifont = 'Fira_Code'

-- Inside? Turn on these!
-- opt.background = 'dark'
-- cmd 'colorscheme everforest'

-- Outside? Turn on these!
opt.background = 'light'
-- TODO: only use if exists
cmd 'colorscheme paper'

require 'plugins'

-- General
opt.autoread = true                -- Auto-reload files changes by a background process
opt.backspace = 'indent,eol,start' -- Allow backspacing over autoindent, line breaks and start of insert
opt.clipboard = 'unnamed'          -- Yank and paste with the system keyboard
opt.mouse = 'a'                    -- Enable mouse for all modes
winopt.spell = true                -- Enable spell-checking

-- History
opt.history=200       -- Increase cleanup threshold for <Up> Ex Command and `/` buffer search auto-complete
opt.undolevels = 1000 -- Number of undo levels
opt.wildmenu = true   -- Enable <C-d> navigable history list rather than <tab> cycling through individual entries
opt.wildmode = 'full' -- Complete the next full match

-- Indentation (the great debate of tabs vs. spaces)
cmd 'filetype indent on'
opt.expandtab = true   -- Use 2 spaces instead of tabs
opt.smartindent = true -- Enable smart-indent
opt.smarttab = true    -- Enable smart-tabs
opt.shiftwidth = 2     -- Number of auto-indent spaces
opt.softtabstop = 2    -- Number of spaces per Tab
opt.tabstop = 2        -- Use 2 spaces instead of tabs

opt.fixeol = false    -- Prevent save from adding newline at end of file

-- Language Support
cmd 'filetype plugin on'   -- Load language-specific plugins when a particular filetype is created or loaded
cmd 'syntax on'            -- Enable syntax highlighting
bufopt.suffixesadd = '.js' -- When using the gf command, it will attempt to navigate to <filename>.js
vim.api.nvim_exec([[
	autocmd BufRead,BufNewFile *.sol set filetype=solidity
]], false)

-- Line Width
bufopt.textwidth = 120  -- Line wrap (number of characters)
-- winopt.wrap = true      -- Wrap display of long lines without affecting buffer contents
-- opt.showbreak = '+++ '  -- Markup to print before wrapped lines

-- Rulers
winopt.number = true         -- Show line numbers
winopt.relativenumber = true -- Format line numbers relative to current line

function sequence(from,to)
    local range = {}
    for i=from,to do
        table.insert(range, i)
    end
    return range
end
local columnSuggested = '80,'
local columnOutOfBounds = table.concat(sequence(120, 256), ',')

opt.ruler = true                                       -- Show row and column ruler information
opt.colorcolumn = columnSuggested .. columnOutOfBounds -- Highlight column 80 and >120

-- Search
opt.ignorecase = true -- Default search behavior is case-insensitive
opt.incsearch = true  -- Highlight search results as term is being written
opt.hlsearch = true   -- Highlight all search results
opt.showmatch = true  -- Highlight matching brace
opt.smartcase = true  -- Search behavior becomes case-sensitive if term contains upper-case character

-- File explorer
g.netrw_list_hide = '.DS_Store,*/.undodir/*'
