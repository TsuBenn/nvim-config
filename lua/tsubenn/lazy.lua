return {
    -- Packer can manage itself (equivalent in Lazy)
    {'wbthomason/packer.nvim', enabled = false}, -- disable packer

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


}
