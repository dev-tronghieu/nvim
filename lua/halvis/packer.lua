-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('mbbill/undotree')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 100
        end,
    }

    use({ 'Wansmer/treesj', requires = { 'nvim-treesitter' } })

    use('f-person/git-blame.nvim')

    use { "akinsho/toggleterm.nvim", tag = '*', config = function() require("toggleterm").setup() end }

    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

    use { "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup() end }

    use { 'numToStr/Comment.nvim' }

    use { 'lewis6991/gitsigns.nvim' }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use "sindrets/diffview.nvim"

    use "github/copilot.vim"

    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    })

    use('mg979/vim-visual-multi')

    use('jose-elias-alvarez/null-ls.nvim')

    use { 'MunifTanjim/prettier.nvim' }

    use { 'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }
end)
