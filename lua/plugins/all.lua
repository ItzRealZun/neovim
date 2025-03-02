return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"python", 
                                    "lua", 
                                    "cpp", 
                                    "c", 
                                    "bash", 
                                    "cmake", 
                                    "dockerfile", 
                                    "vim"},
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                }
            })
        end
    },


    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        dependencies = { 
            'nvim-lua/plenary.nvim' 
        },
    },


    {
        "nvim-neo-tree/neo-tree.nvim",
	    branch = "v3.x",
	    dependencies = {
	        "nvim-lua/plenary.nvim",
	        "nvim-tree/nvim-web-devicons",
	        "MunifTanjim/nui.nvim",
	        {
		        "3rd/image.nvim", 
		        opts = {}
	        },
	    },
    },


    {
        "neovim/nvim-lspconfig",
    },


    {
        "petertriho/cmp-git",
        opts = {}
    },


    {
        "williamboman/mason.nvim",
        opts = {}
    },


    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {
            options = {
                separator_style = "slope"
            }
        }
    },


    {
	    "akinsho/toggleterm.nvim",
        opts = {}
    },

    
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        }
    },


    {
        "phaazon/hop.nvim"
    },


    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        opts = {}
    },


    {
        "windwp/nvim-autopairs",
	    event = "InsertEnter",
	    config = true
    },


    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
	            theme = 'doom',
	            config = {
                    header = {
                        '                                                                               ',
                        '                                                                               ',
                        '██╗████████╗███████╗██████╗ ███████╗ █████╗ ██╗     ███████╗██╗   ██╗███╗   ██╗',
                        '██║╚══██╔══╝╚══███╔╝██╔══██╗██╔════╝██╔══██╗██║     ╚══███╔╝██║   ██║████╗  ██║',
                        '██║   ██║     ███╔╝ ██████╔╝█████╗  ███████║██║       ███╔╝ ██║   ██║██╔██╗ ██║',
                        '██║   ██║    ███╔╝  ██╔══██╗██╔══╝  ██╔══██║██║      ███╔╝  ██║   ██║██║╚██╗██║',
                        '██║   ██║   ███████╗██║  ██║███████╗██║  ██║███████╗███████╗╚██████╔╝██║ ╚████║',
                        '╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═══╝',
                        '                                                                               ',
                        '                                                                               ',
                        '                                                                               ',
			            header_hl = 'Title'
	                }, 
	                center = {
		                {
			                icon = '󰙅 ',
                            icon_hl = 'Title',
                            desc = 'Open filesystem   ',
                            desc_hl = 'String',
                            key = 'o',
                            key_hl = 'Number',
                            key_format = ' %s', -- `%s` will be substituted with value of `key`
                            action = ':Neotree float',
                        },
                        {
                            icon = '󰈞 ',
                            icon_hl = 'Title',
                            desc = 'Find files   ',
                            desc_hl = 'String',
                            key = 'f',
                            key_hl = 'Number',
                            key_format = ' %s', -- `%s` will be substituted with value of `key`
                            action = ':Telescope find_files',
                            
                        },
                        {
                            icon = ' ',
                            icon_hl = 'Title',
                            desc = 'Git branches   ',
                            desc_hl = 'String',
                            key = 'g',
                            key_hl = 'Number',
                            key_format = ' %s', -- `%s` will be substituted with value of `key`
                            action = ':Telescope git_branches',
                            
                        }
                    },
  	                footer = {}
	            }
            }
        end,
        dependencies = 'nvim-tree/nvim-web-devicons'
    },


    {
        "RRethy/base16-nvim",
    },
}
