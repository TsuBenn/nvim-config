require("yanky").setup()

vim.keymap.set({'n','i'}, '<c-d>', '<ESC>:Telescope yank_history<CR>')
vim.keymap.set('x', '<c-d>', 'dh:Telescope yank_history<CR>')
