vim.o.foldmethod = "expr"
vim.o.foldlevel = 99          -- Keep folds open by default
vim.o.foldenable = true       -- Enable folding
vim.o.foldcolumn = "0"        -- Show a fold column

-- Normal mode mappings
vim.keymap.set('n', '<leader>w', 'za', { desc = "Toggle fold" })
vim.keymap.set('n', '<leader>s', 'za', { desc = "Toggle fold" })
vim.keymap.set('n', '<leader>o', 'zO', { desc = "Open all folds recursively" })
vim.keymap.set('n', '<leader>c', 'zC', { desc = "Close all folds recursively" })
vim.keymap.set('n', '<leader>S', 'zR', { desc = "Open all folds" })
vim.keymap.set('n', '<leader>W', 'zM', { desc = "Close all folds" })

-- Visual mode: create fold from selection
vim.keymap.set('v', '<leader>f', 'zf', { desc = "Create fold" })

local function fold_virt_text(result, s, lnum, coloff)
    if not coloff then
        coloff = 0
    end
    local text = ""
    local hl
    for i = 1, #s do
        local char = s:sub(i, i)
        local hls = vim.treesitter.get_captures_at_pos(0, lnum, coloff + i - 1)
        local _hl = hls[#hls]
        if _hl then
            local new_hl = "@" .. _hl.capture
            if new_hl ~= hl then
                table.insert(result, { text, hl })
                text = ""
                hl = nil
            end
            text = text .. char
            hl = new_hl
        else
            text = text .. char
        end
    end
    table.insert(result, { text, hl })
end

function _G.custom_foldtext()
    local start = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
    local num_lines = vim.v.foldend - vim.v.foldstart + 1
    local end_str = vim.fn.getline(vim.v.foldend).." ("..num_lines.." lines)"
    local end_ = vim.trim(end_str)
    local result = {}
    fold_virt_text(result, start, vim.v.foldstart - 1)
    table.insert(result, { " ... ", "Delimiter" })
    fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
    return result
end

vim.opt.foldtext = "v:lua.custom_foldtext()"

vim.opt.fillchars = {
    fold = ' ',
    foldopen = '󰍝',
    foldclose = '󰍟',
    foldsep = ' ',
}
