return {
  -- Core theme configuration
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_mode = true, -- Force the plugin to strip backgrounds natively
    },
  },
  -- Configure LazyVim to prioritize loading gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
