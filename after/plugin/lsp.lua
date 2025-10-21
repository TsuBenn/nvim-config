-- LSP + Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
    },
    automatic_installation = true,
})

require("lspconfig").opts = {
	servers = {
		clangd = {
			mason = false,
		},
	},
}

-- Optional: LSPSaga for better UI
require("lspsaga").setup({})

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {
        enabled = true,
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
