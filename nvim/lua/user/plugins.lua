local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", lock = true, commit = "afab89594f4f702dc3368769c95b782dbdaeaf0a" } -- Have packer manage itself
  use { "nvim-lua/popup.nvim", lock = true, commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" } -- An implementation of the Popup API from vim in Neovim
  use { "nvim-lua/plenary.nvim", lock = true, commit = "31807eef4ed574854b8a53ae40ea3292033a78ea" } -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim", lock = true, commit = "a78dbbe5bcf8d01292b26d06f569f06835f70b0a" }
  use { "EdenEast/nightfox.nvim", lock = true, commit = "d05dd8f11328d66af3e3c05816410a0b2fc2acb0" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", lock = true, commit = "706371f1300e7c0acb98b346f80dad2dd9b5f679" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", lock = true, commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" } -- buffer completions
  use { "hrsh7th/cmp-path", lock = true, commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "hrsh7th/cmp-cmdline", lock = true, commit = "9c0e331fe78cab7ede1c051c065ee2fc3cf9432e" } -- cmdline completions
  use { "saadparwaiz1/cmp_luasnip", lock = true, commit = "9de941bcbda508d0a45d28ae366bb3f08db2e3" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", lock = true, commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" } -- lsp completion
  use { "hrsh7th/cmp-nvim-lua", lock = true, commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" } -- for help in editing the config

  -- snippets
  use { "L3MON4D3/LuaSnip", lock = true, commit = "c599c560ed26f04f5bdb7e4498b632dc16fb9209" } --snippet engine
  use { "rafamadriz/friendly-snippets", lock = true, commit = "7339def34e46237eb7c9a893cb7d42dcb90e05e6" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", lock = true, commit = "6e047f11861bfb6ec28a6ad0138a8f0a62bb8806" } -- enable LSP
  use { "williamboman/nvim-lsp-installer", lock = true, commit = "6b76bcec15e9d7c01a10a1e03dd6c62d20ca3af5" } -- simple to use language server installer

  -- Telescope
  use { "nvim-telescope/telescope.nvim", lock = true, commit = "4725867ec66b9a0f5e5ad95a1fd94c2f97fa2d2c" }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lock = true, commit = "7e410054235ea84c817fc2b93f8df359ba6545eb",
  }
  use { "p00f/nvim-ts-rainbow", lock = true, commit = "d16220f825c0521586499fac340b8a5c8b7117b0" }

  -- autopairs
  use { "windwp/nvim-autopairs", lock = true, commit = "ca89ab9e7e42aa9279f1cdad15398d6e18ccee86" }

  -- comments
  use { "numToStr/Comment.nvim", lock = true, commit = "fe9bbdbcd2f1b85cc8fccead68122873d94f8397" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", lock = true, commit = "7d0b001cd6ec2adc25b8d81496c5ef3bd188f781" }

  --gitsigns
  use { "lewis6991/gitsigns.nvim", lock = true, commit = "9c3ca027661136a618c82275427746e481c84a4e" }

  --nvim-tree
  use { "kyazdani42/nvim-web-devicons", lock = true, commit = "2d02a56189e2bde11edd4712fea16f08a6656944" }
  use { "kyazdani42/nvim-tree.lua", lock = true, commit = "261a5c380c000e23c4a23dcd55b984c856cdb113" }

  --bufferline
  use { "akinsho/bufferline.nvim", lock = true, commit = "2e5d92efacf40d488c4647a9e3e5100357b184cf" }
  use { "moll/vim-bbye", lock = true, commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
