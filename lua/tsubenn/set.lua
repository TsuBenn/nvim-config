vim.opt.cursorline = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false

local handle = io.popen("uname -s")
local os_name = handle:read("*a")
handle:close()

if os_name then
    os_name = os_name:gsub("%s+", "") -- Remove any trailing whitespace
else
    os_name = "Unknown"
end

if os_name == "Linux" then
    vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
else
    vim.opt.undodir = "C:\\.undodir"
end

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

vim.g.mapleader = " "
