local Plugin = {'kyazdani42/nvim-tree.lua'}


local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "<leader>tt", api.tree.toggle)
end

Plugin.opts = {
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
    },
   on_attach = on_attach,
}

Plugin.dependencies = {
    {'kyazdani42/nvim-web-devicons'},
}

return Plugin
