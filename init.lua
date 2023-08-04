local opt = vim.opt
local g = vim.g

-- Disable netrw since we replace it with nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Support folder local additional configuration through .exrc or .nvim.lua
vim.o.exrc = true

-- Disable highlight on search
vim.o.hlsearch = false

-- Space as leader
g.mapleader = " "
g.maplocalleader = " "

-- Relative linenumbers
opt.number = true
opt.relativenumber = true

-- Enable if you want to share clipboard with host os
--opt.clipboard = "unnamedplus"

opt.cursorline = true

-- Disable wrapping
vim.wo.wrap = false

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- Add borders to diagnostics window
vim.diagnostic.config {
  virtual_text = true, -- Show errors in virtual text
  float = { border = "rounded" },
  title = nil
}

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- Organize imports on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})

-- Autoformat on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})

-- Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Update EdVim
local update_edvim = function()
  local on_exit = function(obj)
    vim.schedule(function()
      vim.notify(obj.stdout, vim.log.levels.INFO, { title = "EdVim" })
    end)
  end

  vim.system({ "git", "pull" }, { cwd = vim.fn.stdpath "config" }, on_exit)
end

vim.api.nvim_create_user_command('UpdateEdVim', update_edvim, {})

-- Load plugins
require("lazy").setup({
  defaults = { lazy = false },
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = true,
    notify = true,
    frequency = 3600,
  }
})

-- Load key mappings
require("mappings")
