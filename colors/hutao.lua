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


function Test()
    print("Hello World")
    print("Hello World")

    function Test2()
        print("Hello World")
        print("Hello World")
        print("Hello World")
        print("Hello World")
        print("Hello World")
    end

    print("Hello World")
    print("Hello World")
    print("Hello World")
end


