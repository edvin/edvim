return {
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    -- Load plugin on keymaps, but they are defined inside the config function
    keys = {
      { "<c-\\>",     desc = "Toggle terminal" },
      { "<leader>lg", desc = "Lazygit" },
    },
    version = "*",

    config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-\>]],
        auto_scroll = true,
        direction = 'float',
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end
        },

      })

      -- Toggle Lazygit
      function LazygitToggle()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true })

        lazygit:toggle()
      end

      vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua LazygitToggle()<CR>",
        { noremap = true, silent = true, desc = "Lazygit" })
    end
  }
}
