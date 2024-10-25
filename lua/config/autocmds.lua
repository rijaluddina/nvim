-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--- filetype ---
vim.filetype.add({
  extension = {
    blade = "blade",
  },
  filename = {
    ["tsconfig.json"] = "json",
    [".yamlfmt"] = "yaml",
    ["composer.lock"] = "json",
    ["artisan"] = "blade",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "sh",
    [".*%.blade%.php"] = "blade",
  },
})
