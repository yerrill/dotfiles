-- See `:h vim.o`
-- NOTE: You can change these vim.opt.ons as you wish!
-- For more vim.opt.ons, you can see `:h option-list`
-- To see documentation for an vim.opt.on, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- UI
vim.opt.number         = true           -- absolute line numbers
vim.opt.relativenumber = true           -- relative line numbers
vim.opt.signcolumn     = "yes"          -- always show sign column
vim.opt.cursorline     = true           -- highlight current line
vim.opt.termguicolors  = true           -- true-colour support
vim.opt.scrolloff      = 8              -- keep 8 lines above/below cursor
vim.opt.sidescrolloff  = 8
vim.opt.wrap           = false          -- no soft wrap
--vim.opt.colorcolumn    = "88"           -- Python PEP 8 + black default
vim.opt.showmode       = false          -- mode shown by lualine instead
vim.opt.cmdheight      = 1
vim.opt.pumheight      = 12             -- max completion items
vim.opt.list           = true           -- Show <tab> and trailing spaces.

-- Indentation
vim.opt.expandtab      = true           -- spaces, not tabs
vim.opt.tabstop        = 4
vim.opt.shiftwidth     = 4
vim.opt.softtabstop    = 4
vim.opt.smartindent    = true
vim.opt.shiftround     = true

-- Search
vim.opt.ignorecase     = true
vim.opt.smartcase      = true           -- case-sensitive when uppercase used
vim.opt.hlsearch       = true
vim.opt.incsearch      = true

-- Files
vim.opt.undofile       = true           -- persistent undo
vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.updatetime     = 200            -- faster CursorHold / diagnostics
vim.opt.timeoutlen     = 300

-- Splits
vim.opt.splitbelow     = true
vim.opt.splitright     = true

-- Clipboard
vim.opt.clipboard      = "unnamedplus"  -- use system clipboard

-- Completion
vim.opt.completeopt    = { "menu", "menuone", "noselect" }

-- Folding (handled by nvim-ufo)
vim.opt.foldlevel      = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable     = true

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.opt.confirm = true
