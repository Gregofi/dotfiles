local Plugin = {'stevearc/oil.nvim'}

Plugin.dependencies = { 'nvim-tree/nvim-web-devicons' }

Plugin.opts = {
    default_file_explorer = true,
    columns = {
        "icon",
    },
}

return Plugin