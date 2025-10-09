require('tsubenn.set')
vim.cmd("colorscheme hutao")
require("lazy").setup("tsubenn.lazy",{
    ui = {
        border = "rounded",
        backdrop = 100,
    }

})

require('tsubenn.tabline')
require('tsubenn.keymap')
