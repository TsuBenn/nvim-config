require("yanky").setup()

vim.keymap.set({'n','x'}, 'wv', ':Telescope yank_history<CR>')
