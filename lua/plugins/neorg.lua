return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "V9.2.0", -- Pin Neorg to the latest stable release
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
          ["core.syntax"] = {},
          ["core.ui.calendar"] = {},
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.integrations.nvim-cmp"] = {},
          -- ["core.concealer"] = { config = { icon_preset = "diamond" } },
          -- ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.looking-glass"] = {},
          -- ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
          ["core.export"] = {},
          ["core.export.markdown"] = { config = { extensions = "all" } },
          ["core.summary"] = {},
          ["core.tangle"] = { config = { report_on_empty = false } },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Notlar",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
}
