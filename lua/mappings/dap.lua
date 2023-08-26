-- TODO: Configure terminal or nvim remapping to support Ctrl+F8, Shift-F8 and Alt-F8
vim.keymap.set('n', '<F8>', ':lua require("dap").eval()<CR>', { desc = "Evaluate symbol under cursor", silent = true })
vim.keymap.set('n', '<F9>', ':lua require("dap").continue()<CR>', { desc = "Toggle breakpoint", silent = true })
vim.keymap.set('n', '<F7>', ':lua require("dap").step_over()<CR>', { desc = "Step over", silent = true })
vim.keymap.set('n', '<F6>', ':lua require("dap").step_into()<CR>', { desc = "Step into", silent = true })
vim.keymap.set('n', '<F10>', ':lua require("dap").step_out()<CR>', { desc = "Step out", silent = true })
vim.keymap.set('n', '<F5>', ':lua require("dap").toggle_breakpoint()<CR>',
  { desc = "Toggle breakpoint", silent = true })
vim.keymap.set('n', '<F12>', ':lua require("dapui").toggle()<CR>', { desc = "Toggle debugger UI", silent = true })
vim.keymap.set('n', '<leader>dt', ':lua require("dap-go").debug_test()<CR>',
  { desc = "Debug test under cursor", silent = true })
vim.keymap.set('n', '<leader>dh', ':lua require("dapui").eval()<CR>',
  { desc = "Show current variable while debugging", silent = true })
