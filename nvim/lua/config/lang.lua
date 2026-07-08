-- Format Router
vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Formatter", { clear = true }),
    -- pattern = "*.py",
    callback = function(args)
        supported = {
            ["python"] = python_format,
            ["rust"] = rust_format,
        }

        if supported[vim.bo.filetype] then
            supported[vim.bo.filetype](args)
        end
    end,
})

-- Run / Test Router
vim.keymap.set("n", "<leader>pr", function()
    supported = {
        ["python"] = python_run,
        ["rust"] = rust_run,
    }

    if supported[vim.bo.filetype] then
        vim.cmd(supported[vim.bo.filetype])
    end
end, { desc = "Run file or tests" })

-- Python
vim.lsp.enable "pyright"
python_run = "!python %"

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

-- Rust
vim.lsp.enable "rust_analyzer"
rust_run = "!cargo test"

function rust_format(args)
    -- Run cargo format on project
    vim.fn.system({ "cargo", "fmt" })
    -- Reload the buffer to pick up changes
    vim.api.nvim_buf_call(args.buf, function()
        vim.cmd("silent! edit")
    end)
end
