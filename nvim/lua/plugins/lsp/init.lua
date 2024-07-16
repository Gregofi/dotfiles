local LspZero = {
    'VonHeikemen/lsp-zero.nvim'
}

LspZero.opts = {
    branch = "v4.x",
}

-- ===== Mason =====

local Mason = {'williamboman/mason.nvim'}
local MasonLspConfig = {'williamboman/mason-lspconfig.nvim'}

return {
    LspZero,

    Mason,
    MasonLspConfig,

    "neovim/nvim-lspconfig",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
}
