-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- ~/.config/nvim/lua/config/options.lua

-- Search and behavior matching my old .vimrc
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 5
vim.opt.mouse = "a"
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = false -- Completely disable relative line numbers

-- Baseline indentation defaults (2 spaces)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Filetype specific indentation overrides (Python/Shell get 4 spaces)
vim.api.nvim_create_augroup("filetype_indent_settings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "filetype_indent_settings",
  pattern = { "python", "sh" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Keep python indent continuation behavior
vim.g.pyindent_open_paren = "shiftwidth()"
vim.g.pyindent_nested_paren = "shiftwidth()"
vim.g.pyindent_continue = "shiftwidth()"

-- Highlight trailing whitespace as an error (Only in coding/text files - Strictly language files only)
vim.api.nvim_create_augroup("trailing_whitespace", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "trailing_whitespace",
  -- Only run on actual programming, markup, and scripting filetypes
  pattern = { "python", "yaml", "terraform", "json", "dockerfile", "sh", "bash", "lua" },
  callback = function()
    vim.fn.matchadd("Error", [[\s\+$]])
  end,
})

-- Set Gruvbox as your explicit theme
vim.g.lazyvim_colorscheme = "gruvbox"
