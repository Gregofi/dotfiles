local chat = require('CopilotChat')

vim.keymap.set("n", "<leader>cc", function() chat.open() end, opts)
