vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

function _G.custom_foldtext()
    local startline = vim.fn.getline(vim.v.foldstart):match("^%s*(.-)%s*$")
    local numline = vim.v.foldend - vim.v.foldstart + 1
    local endline = vim.fn.getline(vim.v.foldend):match("^%s*(.-)%s*$")
    return {{startline, "@keyword"}, {" ... ", "Delimiter"}, {endline, "@keyword"}, {" ("..numline.." lines)", "FoldLineCount"}}
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
