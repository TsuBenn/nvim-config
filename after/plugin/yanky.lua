require("yanky").setup()

vim.keymap.set({'n','x'}, '<c-d>', ':Telescope yank_history<CR>')
