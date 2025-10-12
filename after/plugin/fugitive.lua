vim.keymap.set("n", "wG", vim.cmd.Git)

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local git_cmds = {
    { "add .                │ Add all files", ":Git add ." },
    { "add %                │ Add current file", ":Git add %" },
    { "add . and commit     │ Add all files and Commit", ':!git add . && git commit'},
    { "commit               │ Commit", ':Git commit'},
    { "push                 │ Push", ":Git push -u origin main" },
    { "pull                 │ Pull", ":Git pull" },
    { "diff split           │ Diff (split)", ":Gdiffsplit" },
    { "blame                │ Blame", ":Git blame" },
    { "fetch && reset       │ Sync with Github Repo", ":!git fetch origin %% git reset --hard origin/main" },
}

local function prompt_user(prompt_text, callback)
    pickers
        .new({}, {
            prompt_title = prompt_text,
            prompt_prefix = '> git ',
            layout_config = {
                width = 0.6,
                height = 0,
            },
            finder = finders.new_table({
                results = {},
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(_, map)
                map("i", "<CR>", function(prompt_bufnr)
                    local input = action_state.get_current_line()
                    actions.close(prompt_bufnr)
                    callback(input)
                end)
                map("n", "<CR>", function(prompt_bufnr)
                    local input = action_state.get_current_line()
                    actions.close(prompt_bufnr)
                    callback(input)
                end)
                return true
            end,
        })
        :find()
end


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
                actions.close(prompt_bufnr)
                if selection.value[2] ~= ":Git commit" and selection.value[2] ~= ":!git add . && git commit" then
                    vim.cmd(selection.value[2])
                else
                    prompt_user("Commit message:", function(msg)
                        if msg and #msg > 0 then
                            vim.cmd(selection.value[2] .. ' -m "' .. msg .. '"')
                        else
                            print("Commit cancelled.")
                        end
                    end)
                end
            end
            map("i", "<CR>", execute)
            map("n", "<CR>", execute)
            return true
        end,
    }):find()
end

vim.keymap.set("n", "G", git_menu_telescope, { desc = "Git menu (Telescope)" })


