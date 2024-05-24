local Plugin = {'nvim-treesitter/nvim-treesitter'}

Plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

Plugin.opts = {
    ensure_installed = { "cpp", "javascript", "typescript",
  	                     "c", "lua", "vim", "vimdoc", "query", "latex" },
  sync_install = false,
  -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
  },
}

function Plugin.config()
    vim.cmd(":TSUpdate")
end

return Plugin