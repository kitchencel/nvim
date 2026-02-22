local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000
    },

    { "EdenEast/nightfox.nvim" },

    {
        'nvim-telescope/telescope.nvim', branch = "master",
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    {
	"nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    {"nvim-treesitter/nvim-treesitter-context"},

    {"mbbill/undotree"},

    {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},
        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
    },

    -- autotag and autoclose
    {"windwp/nvim-ts-autotag"},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'numToStr/Comment.nvim',
        opts = {}
    },

    { 'wakatime/vim-wakatime', lazy = false },
    {'xiyaowong/transparent.nvim', lazy = false},
    {"yuukiflow/Arduino-Nvim", dependencies = {"nvim-telescope/telescope.nvim", "neovim/nvim-lspconfig", },
	    config = function()
		    -- Load Arduino plugin for .ino files
		    vim.api.nvim_create_autocmd("FileType", {
			    pattern = "arduino",
			    callback = function()
				    require("Arduino-Nvim")
			    end,
		    })
	    end,
    }


})
