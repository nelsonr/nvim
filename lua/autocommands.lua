local cmd = vim.api.nvim_create_user_command
local autocmd = vim.api.nvim_create_autocmd

-- Setup keybindings for when viewing help docs
autocmd({ "FileType" }, {
  pattern = { "help" },
  callback = function(opts)
    -- Use Escape to close documentation
    -- vim.keymap.set("n", "<Esc>", ":q<CR>", { silent = true, buffer = opts.buf })

    -- Use "gd" to navigate Tags in documentation
    vim.keymap.set("n", "gd", "<C-]>", { silent = true, buffer = opts.buf })
  end,
})

-- Create command to close all other buffers
cmd('CloseOtherBuffers', function()
  pcall(function() vim.cmd("exec '%bd|e#|bd#'") end)
end, { desc = "Close all other buffers." })

-- Open Neovim config
cmd('OpenConfig', function()
  pcall(function() vim.cmd("exec 'e ~/.config/nvim/'") end)
end, { desc = "Open Neovim config." })

-- Reload Neovim config
cmd('ReloadConfig', function()
  pcall(function()
    print "Config reloaded!"
    vim.cmd("exec 'so ~/.config/nvim/init.lua'")
  end)
end, { desc = "Reload Neovim config." })

-- Trim trailing white space
cmd('TrimWhiteSpace', function()
  pcall(function()
    vim.cmd("exec '%s/\\s\\+$//e'")
  end)
end, { desc = "Trim trailing whit space" })
