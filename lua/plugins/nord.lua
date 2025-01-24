
return {
  "shaunsingh/nord.nvim",
  priority = 1000, -- Ensures it loads early in Lazy.nvim's sequence
  lazy = false,    -- Load the colorscheme immediately
  config = function()
    vim.schedule(function()
      vim.cmd("colorscheme nord") -- Apply the colorscheme in a deferred manner
    end)
  end,
}
