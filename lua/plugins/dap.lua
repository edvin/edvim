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
    "leoluz/nvim-dap-go",
    config = function()
      require('dap-go').setup {
        dap_configurations = {
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          }
        },
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
