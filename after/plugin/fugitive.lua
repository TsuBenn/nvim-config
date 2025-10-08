vim.keymap.set("n", "wG", vim.cmd.Git)

local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local git_cmds = {
    { "add .           | Add all files", ":Git add ." },
    { "add %           | Add current file", ":Git add %" },
    { "commit          | Commit", ':Git commit'},
    { "push            | Push", ":Git push -u origin main" },
    { "pull            | Pull", ":Git pull" },
    { "diff split      | Diff (split)", ":Gdiffsplit" },
    { "blame           | Blame", ":Git blame" },
}

local function git_menu_telescope()
    pickers.new({}, {
        layout_config = {
            width = 0.6,                -- 40% of total width
            height = 0.3,               -- 50% of total height
        },
        prompt_title = " Git Menu",
        finder = finders.new_table {
            results = git_cmds,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = entry[1],
                    ordinal = entry[1],
                }
            end,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
            local execute = function(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                if selection.value[2] ~= ":Git commit" then
                    actions.close(prompt_bufnr)
                    vim.cmd(selection.value[2])
                end
            end
            map("i", "<CR>", execute)
            map("n", "<CR>", execute)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "G", git_menu_telescope, { desc = "Git menu (Telescope)" })


