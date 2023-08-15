return {
  {
    "mfussenegger/nvim-dap"
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason-nvim-dap").setup {
        ensure_installed = { "delve" }
      }
    end
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "folke/neodev.nvim"
    },
    config = function()
      require("dapui").setup()

      -- Enable type checking for nvim-dap-ui to get type checking, documentation and autocompletion for all API functions
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require('dap-go').setup {
        delve = {
          path = "dlv",
          initialize_timeout_sec = 20,
          port = "${port}",
          args = {},
          build_flags = "",
        }
      }
    end
  },
}
