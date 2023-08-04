require("mappings/telescope")
require("mappings/lspconfig")
require("mappings/dap")

-- Arrow keys resizes windows
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = "Resize window right" })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')

-- Open nvim tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = "Toggle file explorer" })

-- Close buffer
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = "Close current buffer" })

-- Cycle through buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<s-Tab>', ':bprev<CR>', { desc = "Previous buffer" })

-- Organize imports
vim.keymap.set('n', '<leader>ci',
  function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end, { desc = "Organize imports" })
