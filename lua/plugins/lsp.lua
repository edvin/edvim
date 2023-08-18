return {
  {
    'kosayoda/nvim-lightbulb',
    config = function()
      require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require "lspconfig"
      local util = require "lspconfig/util"
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local on_attach = function(client, bufnr)
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
      end

      local border = "rounded"

      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
        init_options = {
          usePlaceholders = true,
        }
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        handlers = handlers,
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
            },
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.jsonls.setup {
        handlers = handlers,
      }

      lspconfig.svelte.setup {
        handlers = handlers,
      }

      lspconfig.tsserver.setup {
        handlers = handlers,
      }

      lspconfig.tailwindcss.setup {
        handlers = handlers,
      }

      lspconfig.html.setup {
        handlers = handlers,
        settings = {
          html = {
            format = {
              templating = true,
              wrapLineLength = 150,
              wrapAttributes = 'auto',
            }
          }
        }
      }

      lspconfig.sqlls.setup {
        handlers = handlers,
      }
    end
  },
  -- Comment out with gcc/gcb etc
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  },

}
