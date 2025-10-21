return {
    cmd = { "qmlls", "--no-warnings" },  -- hide spammy warnings
    settings = {
        Qml = {
            lint = false,  -- disable linting completely (optional)
            importPaths = {
                "/usr/lib/qt6/qml",
                "/usr/lib/qt6/qml/Quickshell"
            },
        },
    },

    on_attach = function(client, bufnr)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        -- Disable diagnostics for .qmltypes files (they're metadata only)
        if filename:match("%.qmltypes$") then
            vim.diagnostic.enable(false, bufnr)
        end
    end,
}
