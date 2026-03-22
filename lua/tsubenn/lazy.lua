return {
    -- Treesitter with build command
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            -- Your treesitter config here, or it will load from after/plugins
        end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Other plugins (they'll automatically load config from after/plugins)
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'lukas-reineke/indent-blankline.nvim',
    'echasnovski/mini.indentscope',
    'goolord/alpha-nvim',
    'lewis6991/gitsigns.nvim',
    'sindrets/diffview.nvim',
    "gbprod/yanky.nvim",
    "junegunn/vim-easy-align",
    'kevinhwang91/nvim-ufo','kevinhwang91/promise-async',

    {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim", build = ":MasonUpdate" },
        { "williamboman/mason-lspconfig.nvim" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "saadparwaiz1/cmp_luasnip" },
        { "L3MON4D3/LuaSnip" },
        { "rafamadriz/friendly-snippets" },

        -- Snippet Completion Formatting
        { "onsails/lspkind.nvim" },

        -- UI Enhancements
        { "nvimdev/lspsaga.nvim", config = true },
        { "nvim-lua/plenary.nvim" }, -- required by lspsaga
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            heading = {
                sign = false,
                icons = { "", "## ", "### ", "#### ", "##### ", "###### " }, -- no icons, just clean text
                border = false,
                backgrounds = {
                    "RenderMarkdownH1Bg",
                    "RenderMarkdownH2Bg",
                    "RenderMarkdownH3Bg",
                    "RenderMarkdownH4Bg",
                    "RenderMarkdownH5Bg",
                    "RenderMarkdownH6Bg",
                },

            },
            code = {
                sign = false,
                style = "full",
                border = "none",
                highlight = "RenderMarkdownCode", -- subtle background only
            },
            bullet = {
                icons = { "•" }, -- simple bullet like glow
            },
            callout = {
                note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
                tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
                warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
                caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
            }
        }
    }

}
