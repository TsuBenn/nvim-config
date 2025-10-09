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

local function set_cmp_highlights(colors)
    -- Background and Border of the Completion Menu (Pmenu/CmpNormal)
    vim.api.nvim_set_hl(0, "CmpNormal", { fg = colors.fg, bg = colors.bg_ui })
    vim.api.nvim_set_hl(0, "CmpBorder", { fg = colors.bg_ui_bright, bg = colors.bg_ui })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = "#111111" })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#111111" , bg = colors.rose , bold = true }) -- Selected Item

    -- The Abbreviation/Text of the completion item
    vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.fg, bg = "NONE" })

    -- The part of the abbreviation that *matches* your input
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.yellow, bg = "NONE", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = colors.orange, bg = "NONE" })

    -- The documentation/details window (CmpDoc)
    vim.api.nvim_set_hl(0, "CmpDoc", { fg = colors.fg, bg = colors.bg_ui })
    vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = colors.bg_ui_bright, bg = colors.bg_ui })

    -- The Item Kinds (Function, Variable, Keyword etc.)
    vim.api.nvim_set_hl(0, "CmpItemKind", { fg = colors.comment, bg = "NONE" }) -- Default Kind Text/Icon

    -- Specific Kinds (You can map these to your different color names)
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = colors.teal, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = colors.teal, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = colors.rose, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = colors.red, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = colors.fg, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = colors.orange, bg = "NONE" })
    vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = colors.brown, bg = "NONE" })
end

-- Your original color table
local colors = {
    fg = "#f0e6e2",
    bg_ui = "#3a2929",
    bg_ui_bright = "#6a5151", -- brighter active statusline
    comment = "#b89a92",

    red = "#e8837a",
    orange = "#f59b75",
    yellow = "#f2c97d",
    brown = "#a27868",
    rose = "#e7a1a1",
    teal = "#89aaa2",
}

set_cmp_highlights(colors)
