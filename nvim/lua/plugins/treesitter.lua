local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.main = 'nvim-treesitter.configs'

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.opts = {
    auto_install = true,
    ensure_installed = { "cpp", "javascript", "typescript",
  	                     "c", "lua", "vim", "vimdoc", "go" },
    highlight = {
        enable = true,
    },
}

return Plugin
