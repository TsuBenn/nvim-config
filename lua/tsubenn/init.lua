require('tsubenn.set')
require("lazy").setup("tsubenn.lazy",{
    ui = {
        border = "rounded",
        backdrop = 100,
    }

})

vim.cmd("colorscheme hutao")
require('tsubenn.tabline')
require('tsubenn.keymap')
