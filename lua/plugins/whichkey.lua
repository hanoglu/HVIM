return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    delay = 500,
    layout = { align = 'center' },
    preset = "helix",
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },

    --{ "<leader>1", "<cmd>wincmd 1<CR>", desc = "Focus first split" },
    { "<leader>#", "", desc = "Focus #'th Split"},
    { "<leader>1", "1<C-w>w", desc = "which_key_ignore"},
    { "<leader>2", "2<C-w>w", desc = "which_key_ignore"},
    { "<leader>3", "3<C-w>w", desc = "which_key_ignore"},
    { "<leader>4", "4<C-w>w", desc = "which_key_ignore"},
    { "<leader>5", "5<C-w>w", desc = "which_key_ignore"},
    { "<leader>6", "6<C-w>w", desc = "which_key_ignore"},
    { "<leader>7", "7<C-w>w", desc = "which_key_ignore"},
    { "<leader>8", "8<C-w>w", desc = "which_key_ignore"},
    { "<leader>9", "9<C-w>w", desc = "which_key_ignore"},

    { "<leader>b", "", desc = "Buffer Options" },
    { "<leader>bn", "<cmd>bn<CR>", desc = "Next buffer" },
    { "<leader>bp", "<cmd>bp<CR>", desc = "Previous buffer" },
    { "<leader>ba", "<cmd>enew<CR>", desc = "Add new buffer" },
    { "<leader>bd", "<cmd>bdel<CR>", desc = "Delete current buffer" },
    { "<leader>bD", "<cmd>bdel!<CR>", desc = "Force delete current buffer" },

    { "<leader>w", "", desc = "Window Options" },
    { "<leader>wd", "<cmd>q<CR>", desc = "Close window" },
    { "<leader>wh", "<C-w>h", desc = "Window focus left" },
    { "<leader>wj", "<C-w>j", desc = "Window focus down" },
    { "<leader>wk", "<C-w>k", desc = "Window focus up" },
    { "<leader>wl", "<C-w>l", desc = "Window focus right" },
    { "<leader>wv", "<C-w>v", desc = "Split window vertical" },
    { "<leader>ws", "<C-w>s", desc = "Split window horizontal" },

    { "<leader>q", "", desc = "Quit" },
    { "<leader>qq", "<cmd>qa<CR>", desc = "Quit" },
    { "<leader>qQ", "<cmd>qa!<CR>", desc = "Force quit" },

    { "<leader>a", "", desc = "Application Special" },
    { "<leader>as", "<cmd>lua Snacks.dashboard()<CR>", desc = "Startup page" },

    { "<leader>f", "", desc = "File Tree" },
    { "<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    { "<leader>fo", "<cmd>NvimTreeFindFile<CR>", desc = "Open file in file tree" },
    { "<leader>fs", "<cmd>w<CR>", desc = "Open file in file tree" },
    -- { "<leader>ft", "<cmd>NERDTreeToggle<CR>", desc = "Toggle file tree" },
    -- { "<leader>fo", "<cmd>NERDTreeFind<CR>", desc = "Open file in file tree" },

    { "<leader>l", "", desc = "Language Specific" },
    { "<leader>ld", require("hover").hover, desc = "Show variable description" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Show autofix menu" },
    { "<leader>ls", "<cmd>Lspsaga peek_definition<CR>", desc = "Show variable definition source" },
    { "<leader>lr", "<cmd>Lspsaga rename<CR>", desc = "Rename variable/function" },
    { "<leader>lf", "<cmd>Lspsaga finder<CR>", desc = "Find references" },

    -- { "<leader>fo", "<cmd>NvimTreeFindFile<CR>", desc = "Open file in file tree" },



  },
}
