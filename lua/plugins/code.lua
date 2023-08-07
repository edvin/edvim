return {
  { "onsails/lspkind-nvim", },
  { 'hrsh7th/cmp-buffer', },
  { 'hrsh7th/cmp-cmdline', },
  { 'hrsh7th/cmp-path', },
  { 'hrsh7th/cmp-nvim-lua', },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'saadparwaiz1/cmp_luasnip' },
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
      -- <Ctrl-K> for expanding,
      -- <Ctrl-L> for jumping forward
      -- <Ctrl-J> for jumping backward
      -- <Ctrl-E> for changing the active choice
      --
      local ls = require('luasnip')

      vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
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

      local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
      end

      local is_blank_line = function()
        return vim.api.nvim_get_current_line():match("^%s*"):len() == 0
      end

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
        mapping = {
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        --   ['<Tab>'] = function(fallback)
        --     if is_blank_line() then
        --       fallback()
        --     elseif vim.fn.pumvisible() == 1 then
        --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
        --     elseif luasnip.expand_or_jumpable() then
        --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        --     elseif not check_backspace() then
        --       cmp.mapping.complete()(fallback)
        --     else
        --       fallback()
        --     end
        --   end,
        --   ['<S-Tab>'] = function(fallback)
        --     if vim.fn.pumvisible() == 1 then
        --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
        --     elseif luasnip.jumpable(-1) then
        --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
        --     else
        --       fallback()
        --     end
        --   end,
        -- },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' }
        }, {
          { name = 'buffer' },
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
