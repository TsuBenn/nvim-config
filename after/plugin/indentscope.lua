require('mini.indentscope').setup({
  -- Character used to draw the guide line
  symbol = "│",

  -- Options for behavior
  options = {
    -- Whether to try to place indent scope border at buffer edge
    try_as_border = true,
  },

  -- Draw options
  draw = {
    delay = 20,            -- animation delay in ms
    animation = require('mini.indentscope').gen_animation.linear({duration = 10}),
  },

  mappings = {
      -- Textobjects
      object_scope = '',
      object_scope_with_border = '',

      -- Motions (jump to respective border line; if not present - body line)
      goto_top = '',
      goto_bottom = '',
  },
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "alpha",        -- dashboard
        "help",
        "lazy",         -- Lazy.nvim
        "mason",
        "NvimTree",
        "Trouble",
        "dashboard",
        "neo-tree",
        "toggleterm",
    },
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})
