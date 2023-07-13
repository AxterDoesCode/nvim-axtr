return{
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
            return require "plugins.configs.treesitter"
        end,
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context"
        }
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'VonHeikemen/lsp-zero.nvim',
        lazy = false,
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
                build = ":MasonUpdate",
                opts = function()
                    return require "plugins.configs.mason"
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        },
        config = function()
            require("plugins.configs.lsp-zero")
        end,
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
            { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git files" },
            { "<leader>ps",function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, desc = "Git files" },
            { "<leader>vh", "<cmd>Telescope help_tags<cr>", desc = "Vim help tags" },
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons'},
        config = function()
            require("lualine").setup()
        end,
    },
    {
        "folke/trouble.nvim",
        cmd = {"Trouble", "TroubleToggle"},
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end,
        keys = {
            {"<leader>xq", "<cmd>TroubleToggle quickfix<cr>", silent = true, noremap = true},
        }
    },
    {
        "theprimeagen/harpoon",
        lazy = false,
        keys = {
            { "<leader>a",function() require("harpoon.mark").add_file() end, desc = "Add file to harpoon" },
            { "<C-e>",function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle harpoon menu" },
            { "<C-h>",function() require("harpoon.ui").nav_file(1) end, desc = "Go to harpoon file 1" },
            { "<C-t>",function() require("harpoon.ui").nav_file(2) end, desc = "Go to harpoon file 2" },
            { "<C-n>",function() require("harpoon.ui").nav_file(3) end, desc = "Go to harpoon file 3" },
            { "<C-s>",function() require("harpoon.ui").nav_file(4) end, desc = "Go to harpoon file 4" },
        },
    },
    {
        "mbbill/undotree",
        cmd = {"Undotree", "UndotreeToggle"},
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
        },
    },
    {
        "folke/zen-mode.nvim",
        lazy = false,
        keys = {
            { "<leader>zz",function() require("zen-mode").toggle({
                window = {
                    width = 90,
                    options = { }
                },
            })
                vim.wo.wrap = false
                vim.wo.number = true
                vim.wo.rnu = true
            end, desc = "Toggle Zen-mode" },
            { "<leader>zZ",function() require("zen-mode").toggle({
                window = {
                    width = 80,
                    options = { }
                },
            })
                vim.wo.wrap = false
                vim.wo.number = false
                vim.wo.rnu = false
                vim.opt.colorcolumn = "0"
            end, desc = "Toggle Zen-mode" },
        }
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
        keys = {
            {"<leader>gs", "<cmd>Git<cr>", desc = "Check Git status"},
        }
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
}


