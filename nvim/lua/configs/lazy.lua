local lazy = {}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

function lazy.install()
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
end

function lazy.setup(plugins)
  -- Use in new neovim installs
  -- lazy.install()
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(plugins, lazy.opts)
end

lazy.opts = {
  install = {
    missing = true,
  },
}

-- take plugins from nvim/lua/plugins
lazy.setup({{import = 'plugins'}})