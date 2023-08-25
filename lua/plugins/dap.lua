return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = ' ﳁ', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = ' ', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = ' ', texthl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = ' ', texthl = 'DapStopped' })

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#ff0000' })
    end
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
