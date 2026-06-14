-- Format Router
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("BlackFormat", { clear = true }),
    -- pattern = "*.py",
    callback = function(args)
        supported = {
            ["python"] = python_format,
        }

        if supported[vim.bo.filetype] then
            supported[vim.bo.filetype](args)
        end
    end,
})

-- Python
vim.lsp.enable "pyright"
vim.keymap.set("n", "<leader>pr", "<cmd>! python %<CR>", { desc = "Run Python file" })

function python_format(args)
    -- Run black on the saved file
    vim.fn.system({ "black", "--quiet", args.file })
    -- Reload the buffer to pick up black's changes
    vim.api.nvim_buf_call(args.buf, function()
        vim.cmd("silent! edit")
    end)
end


-- Lua
vim.lsp.enable "lua_ls"
