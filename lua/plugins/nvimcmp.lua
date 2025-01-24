
return {
  {
    "williamboman/mason.nvim", -- Mason for managing LSP servers, linters, and formatters
    config = function()
      require("mason").setup()
    end,
  },
  {
    "onsails/lspkind.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim", -- Integration between Mason and LSPconfig
    dependencies = {
      "neovim/nvim-lspconfig", -- LSP configuration
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" }, -- Automatically install clangd (or any other LSP servers you want)
        automatic_installation = true,
      })

      -- Automatically set up LSP servers with nvim-lspconfig
      local lspconfig = require("lspconfig")
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- Default handler for all servers
          lspconfig[server_name].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Enable nvim-cmp support
          })
        end,
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP completions
      "hrsh7th/cmp-buffer",   -- Buffer completions
      "hrsh7th/cmp-path",     -- Path completions
      "hrsh7th/cmp-cmdline",  -- Command-line completions
      "L3MON4D3/LuaSnip",     -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require('lspkind')
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
          ["<Tab>"] = cmp.mapping.select_next_item(), -- Navigate completions
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "luasnip" }, -- Snippet completions
        }, {
          { name = "buffer" }, -- Buffer completions
          { name = "path" }, -- Path completions
        }),
	  window = {
	    completion = cmp.config.window.bordered(),
	    documentation = cmp.config.window.bordered({
            	-- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
		}),
	  },
   	  formatting = {
   	      format = lspkind.cmp_format(),
   	    },
      })

      -- Set up completion for command-line mode
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
        },
      })
    end,
  },
}
