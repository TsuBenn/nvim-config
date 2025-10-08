local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
vim.keymap.set('n', 'wf', builtin.find_files)
vim.keymap.set('n', 'wr', builtin.oldfiles)
vim.keymap.set('n', 'ws', builtin.live_grep)
vim.keymap.set('n', 'wg', builtin.git_files)

require('telescope').setup{
    defaults = {
        mappings = {
            i = { -- insert mode
                ["<C-k>"] = actions.move_selection_next,
                ["<C-i>"] = actions.move_selection_previous,
                ["<C-i>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close,
            },
            n = { -- normal mode
                ["q"] = actions.close,
                ["dd"] = actions.delete_buffer,
            },
        },
        prompt_prefix = " Search: ",
        selection_caret = "❯ ",
        entry_prefix = "  ",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
            width = 0.9,
            height = 0.9,
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.6,
            },
            vertical = {
                mirror = false,
                preview_height = 0.5,
            },
        },

        border = true,

        preview = {
            hide_on_startup = false, -- keep preview visible
        },

        pickers = {
            find_files = {
                hidden = true,
                previewer = true,
                theme = "dropdown",
            },
            live_grep = {
                previewer = true,
            },
            buffers = {
                sort_mru = true,
                previewer = true,
                mappings = {
                    i = { ["<C-d>"] = actions.delete_buffer },
                    n = { ["dd"] = actions.delete_buffer },
                },
            },
        },

        extensions = {
            fzf = {
                fuzzy = true,                   -- Enable fuzzy search
                override_generic_sorter = true, -- Override the default sorter
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },

    }
}
