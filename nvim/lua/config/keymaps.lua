-- General
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better movement 
vim.keymap.set("n", "j", "gj", { desc = "Down (visual line)" })
vim.keymap.set("n", "k", "gk", { desc = "Up (visual line)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down + centre" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up + centre" })
vim.keymap.set("n", "n", "nzz", { desc = "Next match + centre" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev match + centre" })

-- Window splits
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equal split sizes" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h', { desc = "Move to left split" })
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j', { desc = "Move to lower split" })
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k', { desc = "Move to upper split" })
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l', { desc = "Move to right split" })
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h', { desc = "Move to left split" })
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j', { desc = "Move to lower split" })
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k', { desc = "Move to upper split" })
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l', { desc = "Move to right split" })

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Buffers
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
-- vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- Indentation in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Move lines up/down
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
-- vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==",  { desc = "Move line down" })
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==",  { desc = "Move line up" })

-- Telescope
-- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>",   { desc = "Find files" })
-- vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",    { desc = "Live grep" })
-- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",      { desc = "Buffers" })
-- vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",    { desc = "Help tags" })
-- vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",     { desc = "Recent files" })
-- vim.keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Document symbols" })

-- File explorer (neo-tree)
-- vim.keymap.set("n", "<leader>e",  "<cmd>Neotree toggle<CR>", { desc = "Toggle file tree" })
-- vim.keymap.set("n", "<leader>o",  "<cmd>Neotree focus<CR>",  { desc = "Focus file tree" })

-- LSP (set in on_attach, but global fallbacks)
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

vim.keymap.set('n', ']d', function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = 'Jump to next diagnostic' })

vim.keymap.set('n', '[d', function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = 'Jump to previous diagnostic' })
