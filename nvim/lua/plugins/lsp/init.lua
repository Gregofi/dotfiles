local LSPConfig = {
    'VonHeikemen/lsp-zero.nvim'
}

LSPConfig.opts = {
    branch = "v3.x",
}

-- ===== Mason =====

local Mason = {'williamboman/mason.nvim'}
local MasonLspConfig = {'williamboman/mason-lspconfig.nvim'}

return {
    LSPConfig,

    Mason,
    MasonLspConfig,

    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
}