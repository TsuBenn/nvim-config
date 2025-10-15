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
vim.keymap.set('n', "<leader>R", vim.lsp.buf.rename)
vim.keymap.set('n', "<leader>C", vim.lsp.buf.code_action)
vim.keymap.set('n', "<leader>r", vim.lsp.buf.references)
vim.keymap.set('n', "<leader>D", vim.lsp.buf.document_symbol)
