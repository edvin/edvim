local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find in help" })
vim.keymap.set('n', '<leader>fs', function()
  builtin.lsp_document_symbols {
    fname_width = 35,
    symbol_width = 50
  }
end, { desc = "Document symbols" })
vim.keymap.set('n', '<leader>fw', function()
  builtin.lsp_dynamic_workspace_symbols {
    fname_width = 35,
    symbol_width = 50
  }
end, { desc = "Workspace symbols" })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "Fuzzy search current buffer" })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = "Find existing buffers" })
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = "Find recently open files" })
