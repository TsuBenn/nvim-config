vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

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
    local end_str = vim.fn.getline(vim.v.foldend)
    local end_ = vim.trim(end_str)
    local result = {}
    fold_virt_text(result, start, vim.v.foldstart - 1)
    table.insert(result, { " ... ", "Delimiter" })
    fold_virt_text(result, end_, vim.v.foldend - 1, #(end_str:match("^(%s+)") or ""))
    fold_virt_text(result, " ("..num_lines.." lines)", vim.v.foldend)
    return result
end

vim.opt.foldtext = "v:lua.custom_foldtext()"

vim.opt.fillchars = {
    fold = ' ',
    foldopen = '󰍝',
    foldclose = '󰍟',
    foldsep = ' ',
}

require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end,
    open_fold_hl_timeout = 150,
    close_fold_kinds_for_ft = {
        default = {'imports', 'comment'},
        json = {'array'},
        c = {'comment', 'region'}
    },
    close_fold_current_line_for_ft = {
        default = true,
        c = false
    },
    preview = {
        win_config = {
            border = {'', '─', '', '', '', '─', '', ''},
            winhighlight = 'Normal:Folded',
            winblend = 0
        },
        mappings = {
            scrollU = '<C-i>',
            scrollD = '<C-k>',
            jumpTop = 'I',
            jumpBot = 'K'
        }
    },
})

vim.keymap.set('n', '<leader>S', require('ufo').openAllFolds)
vim.keymap.set('n', '<leader>W', require('ufo').closeAllFolds)
vim.keymap.set('n', '<leader>s', "za")
vim.keymap.set('n', '<leader>w', "za")
vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
vim.keymap.set('n', '<leader>o', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
    end
end)
