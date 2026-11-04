-- Custom functions
function wordwrap()
  -- Enable soft wrapping
  vim.opt.wrap = true
  -- Break lines at word boundaries instead of mid-word
  vim.opt.linebreak = true
  -- Prevent hard wrapping (inserting literal newlines while typing)
  vim.opt.textwidth = 0
  vim.opt.wrapmargin = 0
end
