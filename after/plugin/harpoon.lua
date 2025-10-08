local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "Wa", mark.add_file)
vim.keymap.set("n", "wa", ui.toggle_quick_menu)

vim.keymap.set("n", "w1", function() ui.nav_file(1) end)
vim.keymap.set("n", "w2", function() ui.nav_file(2) end)
vim.keymap.set("n", "w3", function() ui.nav_file(3) end)
vim.keymap.set("n", "w4", function() ui.nav_file(4) end)
vim.keymap.set("n", "w5", function() ui.nav_file(5) end)
vim.keymap.set("n", "w6", function() ui.nav_file(6) end)

