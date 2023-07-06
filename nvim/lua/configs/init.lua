-- Disable these because of NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("configs.set")
require("configs.remap")

require("configs.packer")
require("configs.treesitter")
require("configs.nvimtree")
require("configs.lualine")
