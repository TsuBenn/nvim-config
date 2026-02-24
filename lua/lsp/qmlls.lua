return {
    cmd = { "/usr/lib/qt6/bin/qmlls" },
    filetypes = { "qml" },
    root_markers = { ".git" },
    settings = {
        Qml = {
            importPaths = { "/usr/lib/qt6/qml" },
            lint = false,
        },
    },
}
