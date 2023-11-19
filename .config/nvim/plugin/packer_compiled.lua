-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/trand/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/trand/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/trand/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/trand/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/trand/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim¶\3\1\0\a\0\22\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0003\1\4\0006\2\5\0009\2\6\2+\3\2\0=\3\a\2\18\2\1\0'\4\b\0'\5\t\0\18\6\0\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0\18\6\0\0B\2\4\1\18\2\1\0'\4\f\0'\5\r\0\18\6\0\0B\2\4\1\18\2\1\0'\4\14\0'\5\15\0\18\6\0\0B\2\4\1\18\2\1\0'\4\16\0'\5\17\0\18\6\0\0B\2\4\1\18\2\1\0'\4\18\0'\5\19\0\18\6\0\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0\18\6\0\0B\2\4\1K\0\1\0\f:bp<CR>\agp\f:bn<CR>\agn\30:TmuxNavigatePrevious<CR>\n<C-\\>\27:TmuxNavigateRight<CR>\n<C-l>\24:TmuxNavigateUp<CR>\n<C-k>\26:TmuxNavigateDown<CR>\n<C-j>\26:TmuxNavigateLeft<CR>\n<C-h>\31tmux_navigator_no_mappings\6g\bvim\0\1\0\2\fnoremap\2\vsilent\2\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/Navigator.nvim",
    url = "https://github.com/numToStr/Navigator.nvim"
  },
  ["beacon.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0,highlight Beacon guibg=black ctermbg=25\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["cairo.vim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cairo.vim",
    url = "https://github.com/miguelmota/cairo.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-npm"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-npm",
    url = "https://github.com/David-Kunz/cmp-npm"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  everforest = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\n“\2\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\17special_keys\1\0\6\15next_match\f<enter>\beol\f<space>\18repeat_search\f<enter>\15prev_group\n<tab>\15next_group\f<space>\15prev_match\n<tab>\22character_classes\1\0\3\19case_sensitive\1\24highlight_unlabeled\1\28highlight_ahead_of_time\2\nsetup\tleap\frequire\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nÑ\2\0\0\a\0\15\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0004\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\b\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\b\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\n\4>\4\5\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\v\0049\4\f\4>\4\6\3=\3\14\2B\0\2\1K\0\1\0\fsources\1\0\0\nspell\15completion\fgitlint\17code_actions\reslint_d\vstylua\15formatting\veslint\16diagnostics\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "require('config/cmp')" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n[\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\15config/lsp\nsetup\23nvim-lsp-installer\frequire\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvim-tetris",
    url = "https://github.com/alec-gibson/nvim-tetris"
  },
  ["nvim-treesitter"] = {
    config = { "require('config/treesitter')" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  nvimesweeper = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/nvimesweeper",
    url = "https://github.com/seandewar/nvimesweeper"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["paper.vim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/paper.vim",
    url = "https://git.sr.ht/~swalladge/paper.vim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('config/telescope')" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\n‘\2\0\0\a\0\f\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\1K\0\1\0\27:GitGutterPrevHunk<CR>\a[n\27:GitGutterNextHunk<CR>\a]n\a[\\':GitGutterLineHighlightsToggle<CR>\a]\\\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-vinegar.git"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-vinegar.git",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-workspace"] = {
    config = { "\27LJ\2\n©\3\0\0\2\0\f\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\0\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\t\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\2\0\0\14gitcommit\30workspace_autosave_ignore#workspace_autosave_untrailtabs%workspace_autosave_untrailspaces\30workspace_autosave_always#workspace_persist_undo_history&workspace_session_disable_on_args(/Users/trand/.config/nvim/sessions/ workspace_session_directory\25workspace_autocreate\6g\bvim\0" },
    loaded = true,
    path = "/Users/trand/.local/share/nvim/site/pack/packer/start/vim-workspace",
    url = "https://github.com/thaerkh/vim-workspace"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config/telescope')
time([[Config for telescope.nvim]], false)
-- Config for: Navigator.nvim
time([[Config for Navigator.nvim]], true)
try_loadstring("\27LJ\2\n=\2\0\4\0\4\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0G\3\0\0A\0\1\1K\0\1\0\6n\20nvim_set_keymap\bapi\bvim¶\3\1\0\a\0\22\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0003\1\4\0006\2\5\0009\2\6\2+\3\2\0=\3\a\2\18\2\1\0'\4\b\0'\5\t\0\18\6\0\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0\18\6\0\0B\2\4\1\18\2\1\0'\4\f\0'\5\r\0\18\6\0\0B\2\4\1\18\2\1\0'\4\14\0'\5\15\0\18\6\0\0B\2\4\1\18\2\1\0'\4\16\0'\5\17\0\18\6\0\0B\2\4\1\18\2\1\0'\4\18\0'\5\19\0\18\6\0\0B\2\4\1\18\2\1\0'\4\20\0'\5\21\0\18\6\0\0B\2\4\1K\0\1\0\f:bp<CR>\agp\f:bn<CR>\agn\30:TmuxNavigatePrevious<CR>\n<C-\\>\27:TmuxNavigateRight<CR>\n<C-l>\24:TmuxNavigateUp<CR>\n<C-k>\26:TmuxNavigateDown<CR>\n<C-j>\26:TmuxNavigateLeft<CR>\n<C-h>\31tmux_navigator_no_mappings\6g\bvim\0\1\0\2\fnoremap\2\vsilent\2\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time([[Config for Navigator.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config/treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('config/cmp')
time([[Config for nvim-cmp]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\n“\2\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\17special_keys\1\0\6\15next_match\f<enter>\beol\f<space>\18repeat_search\f<enter>\15prev_group\n<tab>\15next_group\f<space>\15prev_match\n<tab>\22character_classes\1\0\3\19case_sensitive\1\24highlight_unlabeled\1\28highlight_ahead_of_time\2\nsetup\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: beacon.nvim
time([[Config for beacon.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0,highlight Beacon guibg=black ctermbg=25\bcmd\bvim\0", "config", "beacon.nvim")
time([[Config for beacon.nvim]], false)
-- Config for: vim-workspace
time([[Config for vim-workspace]], true)
try_loadstring("\27LJ\2\n©\3\0\0\2\0\f\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\0\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\t\0006\0\0\0009\0\1\0005\1\v\0=\1\n\0K\0\1\0\1\2\0\0\14gitcommit\30workspace_autosave_ignore#workspace_autosave_untrailtabs%workspace_autosave_untrailspaces\30workspace_autosave_always#workspace_persist_undo_history&workspace_session_disable_on_args(/Users/trand/.config/nvim/sessions/ workspace_session_directory\25workspace_autocreate\6g\bvim\0", "config", "vim-workspace")
time([[Config for vim-workspace]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nÑ\2\0\0\a\0\15\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0004\3\a\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\a\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\6\0049\4\b\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\t\0049\4\b\4>\4\4\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\n\4>\4\5\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\v\0049\4\f\4>\4\6\3=\3\14\2B\0\2\1K\0\1\0\fsources\1\0\0\nspell\15completion\fgitlint\17code_actions\reslint_d\vstylua\15formatting\veslint\16diagnostics\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n[\0\0\3\0\4\0\n6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\1K\0\1\0\15config/lsp\nsetup\23nvim-lsp-installer\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\n‘\2\0\0\a\0\f\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\1K\0\1\0\27:GitGutterPrevHunk<CR>\a[n\27:GitGutterNextHunk<CR>\a]n\a[\\':GitGutterLineHighlightsToggle<CR>\a]\\\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
