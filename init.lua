-- Add Lazy.nvim bootstrap code to your init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("tsubenn")

vim.lsp.config("qmlls", require("lsp.qmlls"))
vim.lsp.enable("qmlls")

vim.lsp.config("lua_ls", require("lsp.lua_ls"))
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", require("lsp.clangd"))
vim.lsp.enable("clangd")
