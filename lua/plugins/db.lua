return {
  {
    "tpope/vim-dadbod",
    config = function()
      local function db_completion()
        require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
      end

      vim.g.db_ui_save_location = (os.getenv "XDG_DATA_HOME" or vim.fn.expand "$HOME/.local/share") .. "/db_ui"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_execute_on_save = 0

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
        },
        command = [[setlocal omnifunc=vim_dadbod_completion#omni]],

      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "sql",
        },
        callback = function()
          vim.schedule(db_completion)
        end,
      })
    end
  },
  {
    "kristijanhusak/vim-dadbod-ui",
  },
  {
    "kristijanhusak/vim-dadbod-completion"
  }
}
