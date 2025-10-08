vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("TEMP") .. "\\.vim\\undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 0
vim.g.netrw_sort_by = "exten"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.winborder = "rounded"

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('hightlight-yank', {clear = true}),
    callback = function() 
        vim.highlight.on_yank()
    end
})


