vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use({
        --'ibhagwan/fzf-lua',
        'nvim-telescope/telescope.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/playground',
        'theprimeagen/harpoon',
        'mbbill/undotree',
        'tpope/vim-fugitive',
        'lukas-reineke/indent-blankline.nvim',
        'echasnovski/mini.indentscope',
        'goolord/alpha-nvim',
        'lewis6991/gitsigns.nvim',
        'sindrets/diffview.nvim',
    })

end)
