return {
  -- Icons used by winbar and possibly other plugins to display file type icons etc
  {
    "nvim-tree/nvim-web-devicons"
  },
  -- Statusline
  {
    "feline-nvim/feline.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
      local ctp_feline = require('plugins.configs.feline')
      ctp_feline.setup({})

      require("feline").setup({
        components = ctp_feline.get()
      })
    end
  },
  -- Make buffers appear as "tabs"
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependences = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant"
        }
      })
    end
  },
  -- Make buffers tab local
  {
    "backdround/tabscope.nvim",
    config = function()
      require("tabscope").setup({})
    end
  },
  -- LSP textDocument/documentSymbol provider used by barbecue
  {
    "SmiteshP/nvim-navic"
  },
  -- Statusline/winbar that uses LSP to show current code context
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependences = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("barbecue").setup()
    end
  },
  -- Keymapping popup visualization
  {
    "folke/which-key.nvim",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
    }
  },
  {
    "MunifTanjim/nui.nvim",
  },
  {
    "rcarriga/nvim-notify",
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end
  },
}
