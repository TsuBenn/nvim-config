--[[ require('fzf-lua').setup({
    keymap = {
        -- These mappings apply inside the FZF window
        builtin = {
            -- Normal mode
            ["<C-x>"] = "split",              -- open in horizontal split
            ["<C-v>"] = "vsplit",             -- open in vertical split
            ["<C-t>"] = "tabedit",            -- open in new tab
            ["<C-l>"] = "preview-page-down",  -- scroll preview down
            ["<C-j>"] = "preview-page-up",    -- scroll preview up
        },
    },


    fzf_opts = {
        ["--layout"] = "reverse",
    },

    files = {
        -- Customize specifically for find_files picker
        keymap = {
            builtin = {
                ["<C-r>"] = "toggle-preview",   -- toggle preview on/off
                ["<C-h>"] = "toggle-hidden",    -- show hidden files
            },
        },
    },

    fzf_colors = {
        true,   -- inherit fzf colors that aren't specified below from
        -- the auto-generated theme similar to `fzf_colors=true`
        ["fg"]          = { "fg", "CursorLine" },
        ["bg"]          = { "bg", "Normal" },
        ["hl"]          = { "fg", "Comment" },
        ["fg+"]         = { "fg", "Normal", "underline" },
        ["bg+"]         = { "bg", { "CursorLine", "Normal" } },
        ["hl+"]         = { "fg", "Statement" },
        ["info"]        = { "fg", "PreProc" },
        ["prompt"]      = { "fg", "Conditional" },
        ["pointer"]     = { "fg", "Exception" },
        ["marker"]      = { "fg", "Keyword" },
        ["spinner"]     = { "fg", "Label" },
        ["header"]      = { "fg", "Comment" },
        ["gutter"]      = "-1",
    },

    winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = 'rounded',
        preview = {
            layout = 'horizontal',
            vertical = 'down:50%'
        },
    },

})

local fzf = require('fzf-lua')
vim.keymap.set('n', 'wf', fzf.files)
vim.keymap.set('n', 'wr', fzf.oldfiles)
vim.keymap.set('n', 'wt', fzf.tabs)
vim.keymap.set('n', 'wg', fzf.git_files)
vim.keymap.set('n', 'ws', fzf.live_grep)
vim.keymap.set('n', 'wb', fzf.buffers) ]]--
