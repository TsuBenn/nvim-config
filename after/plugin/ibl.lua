require("ibl").setup({
  indent = {
    char = "│",             -- the character used for the indent line
    tab_char = "│",
  },
  scope = {
      enabled = false
  },
  exclude = {
    filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
  },
})

