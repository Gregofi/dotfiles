require('nvim-treesitter.configs').setup {
  ensure_installed = { "cpp", "javascript", "typescript",
  		       "c", "lua", "vim", "vimdoc", "query", "latex" },

  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
  },
}
