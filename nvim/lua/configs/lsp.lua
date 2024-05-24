-- I would like to have these guys in the plugin folder,
-- but setting them up proves difficult.
local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'rust_analyzer',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,

        clangd = function()
            require('lspconfig').clangd.setup({
                cmd = {
                    "clangd",
                    "--offset-encoding=utf-16",
                }
            })
        end
    },
})