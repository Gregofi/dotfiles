vim.opt.signcolumn = 'yes'

require('mason').setup({})
if os.getenv('NIX_NEOVIM') ~= '1' then
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
else
    -- from here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    local servers = {
        rust_analyzer = {},
        ts_ls = {},
        clangd = {},
    }
    
    for k, v in pairs(servers) do
        require("lspconfig")[k].setup(v)
    end
end

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})

vim.api.nvim_create_autocmd('LspAttach', {
    desc = "LSP actions",
    callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({async = true}) end, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    end
})
