-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("nvterm").setup()
vim.keymap.set("t", "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end, {})
vim.keymap.set("t", "<A-h>", function()
  require("nvterm.terminal").toggle("horizontal")
end, {})
vim.keymap.set("t", "<A-v>", function()
  require("nvterm.terminal").toggle("vertical")
end, {})
vim.keymap.set("n", "<A-i>", function()
  require("nvterm.terminal").toggle("float")
end, {})
vim.keymap.set("n", "<A-h>", function()
  require("nvterm.terminal").toggle("horizontal")
end, {})
vim.keymap.set("n", "<A-v>", function()
  require("nvterm.terminal").toggle("vertical")
end, {})
