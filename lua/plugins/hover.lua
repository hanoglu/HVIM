
return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup({
            init = function()
                require("hover.providers.lsp") -- Enable LSP-based hover
            end,
            preview_opts = {
                border = "rounded", -- Customize the border style
            },
        })

        -- vim.keymap.set("n", "K", require("hover").hover, { desc = "Hover" })
        -- List of filetypes where auto-hover should be enabled
        local hover_filetypes = {
            "cpp",
            "c",
            "sh",
            "java",
            "py",
        }

        -- Automatically trigger hover on CursorHold for specific filetypes
        -- vim.api.nvim_create_autocmd("CursorHold", {
        --     callback = function()
        --         local filetype = vim.bo.filetype
        --         if vim.tbl_contains(hover_filetypes, filetype) then
        --             require("hover").hover()
        --         end
        --     end,
        -- })

        -- Optional: Set a delay for CursorHold (default is 4000ms)
        vim.o.updatetime = 500 -- Set to 500ms (adjust as needed)
    end,
}
