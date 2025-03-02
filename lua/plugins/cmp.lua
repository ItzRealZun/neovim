return  {
	'hrsh7th/nvim-cmp',
    dependencies = {
        "neovim/nvim-lspconfig",
	    'hrsh7th/cmp-nvim-lsp',
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-cmdline'
    },
	config = function()
        local cmp = require'cmp'
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'buffer' }
            })
        })
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        require('lspconfig')['pyright'].setup {
            capabilities = capabilities
        }

        require('lspconfig')['ruff'].setup {
            capabilities = capabilities
        }

        require('lspconfig')['clangd'].setup {
            capabilities = capabilities
        }

        require('lspconfig')['bashls'].setup {
	        capabilities = capabilities
        }

        require('lspconfig')['dockerls'].setup {
            capabilities = capabilities
        }

        require('lspconfig')['cmake'].setup {
            capabilities = capabilities
        }
    end
}
