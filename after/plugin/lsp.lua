-- LSP + Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "jsonls",
        "html",
        "cssls",
    },
    automatic_installation = true,
})

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<ESC>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
        }),
    },
    window = {
        completion = {
            side_padding = 1,
            border = false,
        }
    }
})

vim.keymap.set('n', "<leader>d", vim.lsp.buf.definition)
vim.keymap.set('n', "<leader>h", vim.lsp.buf.hover)
vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set('n', "<leader>r", vim.lsp.buf.references)
vim.keymap.set('n', "<leader>ds", vim.lsp.buf.document_symbol)



-- Optional: LSPSaga for better UI
--require("lspsaga").setup({})

local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_lines = false,
    virtual_text = {
        prefix = "●",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})


