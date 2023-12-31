return {
  { "onsails/lspkind-nvim", },
  { 'hrsh7th/cmp-buffer', },
  { 'hrsh7th/cmp-cmdline', },
  { 'hrsh7th/cmp-path', },
  { 'hrsh7th/cmp-nvim-lua', },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'saadparwaiz1/cmp_luasnip' },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  },
  {
    'L3MON4D3/LuaSnip',
    version = "2.*",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = "~/.config/nvim/snippets/"
      })

      -- Completion keymaps:
      --
      -- <Ctrl-y> for expanding,
      -- <Ctrl-n> for jumping forward
      -- <Ctrl-p> for jumping backward
      -- <Ctrl-e> for changing the active choice
      --
      local ls = require('luasnip')

      vim.keymap.set({ "i" }, "<C-y>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-n>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-p>", function() ls.jump(-1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-e>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
    end
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      "onsails/lspkind-nvim",
      'hrsh7th/cmp-nvim-lua',
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      local luasnip = require('luasnip')
      local lspkind = require('lspkind')
      local cmp = require 'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        formatting = {
          format = lspkind.cmp_format(),
          -- format = require("tailwindcss-colorizer-cmp").formatter
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({
            -- behavior = cmp.ConfirmBehavior.Insert,
            select = true
          })
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'vim-dadbod-completion' },
        })
      })
      -- Set configuration for specific filetype.
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = 'buffer' },
        })
      })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },
}
