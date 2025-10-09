local colors = {
    fg        = "#f0e6e2",
    bg_ui     = "#3a2929",
    bg_ui_bright = "#6a5151", -- brighter active statusline
    comment   = "#b89a92",

    red       = "#e8837a",
    orange    = "#f59b75",
    yellow    = "#f2c97d",
    brown     = "#a27868",
    rose      = "#e7a1a1",
    teal      = "#89aaa2",
}

-- Normal
vim.api.nvim_set_hl(0, "Normal",        { fg = colors.fg, bg = "none" })
vim.api.nvim_set_hl(0, "Comment",       { fg = colors.comment, italic = true })

-- Cursorline
vim.api.nvim_set_hl(0, "CursorLine",    { bg = "#302424" })
vim.api.nvim_set_hl(0, "CursorLineNr",  { fg = colors.yellow, bold = true })

-- Visual
vim.api.nvim_set_hl(0, "Visual",        { fg = "#ffffff",  bg = "#567782" })
vim.api.nvim_set_hl(0, "VisualNOS",     { bg = "#567782" })
vim.api.nvim_set_hl(0, "MatchParen",    { fg = "#ffffff", bg = "#567782", bold = true })

-- Statusline
vim.api.nvim_set_hl(0, "StatusLine",    { fg = colors.fg, bg = colors.bg_ui_bright, bold = true })
vim.api.nvim_set_hl(0, "StatusLineNC",  { fg = colors.comment, bg = colors.bg_ui })

-- Tabline
vim.api.nvim_set_hl(0, "TabLine",       { fg = colors.comment, bg = colors.bg_ui })
vim.api.nvim_set_hl(0, "TabLineSel",    { fg = colors.fg, bg = colors.bg_ui_bright})
vim.api.nvim_set_hl(0, "TabLineFill",   { bg = colors.bg_ui })

-- Search
vim.api.nvim_set_hl(0, "Search",        { fg = colors.bg_ui, bg = colors.yellow, bold = true })

-- Syntax
vim.api.nvim_set_hl(0, "String",        { fg = colors.orange })
vim.api.nvim_set_hl(0, "Function",      { fg = colors.rose })
vim.api.nvim_set_hl(0, "Keyword",       { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, "Type",          { fg = colors.yellow })
vim.api.nvim_set_hl(0, "Constant",      { fg = colors.brown })
vim.api.nvim_set_hl(0, "Identifier",    { fg = colors.teal })

-- Popup
vim.api.nvim_set_hl(0, "Pmenu",         { fg = colors.fg, bg = colors.bg_ui })
vim.api.nvim_set_hl(0, "PmenuSel",      { fg = colors.bg_ui, bg = colors.red, bold = true })

-- NETRW (Hu Tao palette)
vim.api.nvim_set_hl(0, "Directory",     { fg = colors.orange, bold = true }) -- dirs
vim.api.nvim_set_hl(0, "netrwDir",      { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, "netrwClassify", { fg = colors.yellow })
vim.api.nvim_set_hl(0, "netrwSymlink",  { fg = colors.teal, italic = true })
vim.api.nvim_set_hl(0, "netrwExe",      { fg = colors.red, bold = true })    -- executables
vim.api.nvim_set_hl(0, "netrwPlain",    { fg = colors.fg })

vim.api.nvim_set_hl(0, "IblIndent", { fg = "#30292c"})

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#6b5261" }) -- regular lines


-- Background and Border of the Completion Menu (Pmenu/CmpNormal)
vim.api.nvim_set_hl(0, "CmpNormal", { fg = colors.fg, bg = colors.bg_ui })
vim.api.nvim_set_hl(0, "CmpBorder", { fg = colors.bg_ui_bright, bg = colors.bg_ui })
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.fg, bg = "#151515" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#000000" , bg = colors.rose , bold = true }) -- Selected Item
-- The Abbreviation/Text of the completion item
vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = colors.fg, bg = "NONE" })

-- The part of the abbreviation that *matches* your input
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = colors.red, bg = "NONE", bold = true })
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


