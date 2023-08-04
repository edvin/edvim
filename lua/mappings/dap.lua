vim.keymap.set('n', '<F5>', ':lua require("dap").continue()<CR>', { desc = "Toggle breakpoint", silent = true })
vim.keymap.set('n', '<F9>', ':lua require("dap").toggle_breakpoint()<CR>', { desc = "Toggle breakpoint", silent = true })
