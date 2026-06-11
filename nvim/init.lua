vim.g.mapleader = ' '
--vim.cmd('packadd! nohlsearch')

vim.pack.add({
  -- Quickstart configs for LSP
  { src = 'https://github.com/neovim/nvim-lspconfig', name = "nvim-lspconfig"},
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
  -- -- Fuzzy picker
  -- 'https://github.com/ibhagwan/fzf-lua',
  -- -- Autocompletion
  -- 'https://github.com/nvim-mini/mini.completion',
  -- -- Enhanced quickfix/loclist
  -- 'https://github.com/stevearc/quicker.nvim',
  -- -- Git integration
  -- 'https://github.com/lewis6991/gitsigns.nvim',
})

-- require('fzf-lua').setup { fzf_colors = true }
-- require('mini.completion').setup {}
-- require('quicker').setup {}
-- require('gitsigns').setup {}
require("catppuccin").setup({
    flavour = "mocha"
})

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lang")

vim.cmd.colorscheme "catppuccin-nvim"
