local execute = vim.api.nvim_command -- to execute Neovim commands
local cmd = vim.cmd	-- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn	-- to call Vim functions e.g. fn.bufnr()

-- Auto install packer.nvim if necessary
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'

require('packer').startup(function ()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'sainnhe/everforest'
  use 'swalladge/paper.vim'

  -- Language server
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config/lspconfig')]]
  }
  use {
    'kabouzeid/nvim-lspinstall',
    config= [[require('config/lspinstall')]]
  }
  use 'hrsh7th/nvim-compe' -- auto completion
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config= [[require('config/treesitter')]]
  }
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('config/telescope')]]
  }
  use 'scrooloose/nerdtree'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
end)
