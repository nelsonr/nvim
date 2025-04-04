-- Util to set keybindings
local function bind(mode, keybinding, cmd)
  vim.keymap.set(mode, keybinding, cmd, { noremap = true, silent = true })
end

-- Use Ctrl+S to save like a normal person
bind("n", "<C-s>", ":w<CR>")

-- Use "\" key to toggle file explorer
bind("n", "\\", ":NvimTreeFindFileToggle<CR>")

-- Open fuzzy finder
bind("n", "<C-p>", ":Files<CR>")
bind("n", "<C-ç>", ":Rg<CR>")
bind("n", "<leader>b", ":Buffers<CR>")

-- Use Tab to navigate between buffers
bind("n", "<Tab>", ":bnext<CR>")
bind("n", "<S-Tab>", ":bprev<CR>")

-- Use Y to copy whole line
bind("n", "Y", "yy")

-- Use U to redo
bind("n", "U", "<C-r>")

-- Use Ctrl+w to close buffer
bind("n", "<C-w>", ":bd<CR>")

-- Create and manage splits
bind("n", "<leader>ss", ":split<CR>")
bind("n", "<leader>sv", ":vsplit<CR>")

-- Move between splits
-- Ctrl+h: Move left
-- Ctrl+j: Move down
-- Ctrl+k: Move up
-- Ctrl+l: Move right
bind("n", "<C-h>", "<C-w>h")
bind("n", "<C-j>", "<C-w>j")
bind("n", "<C-k>", "<C-w>k")
bind("n", "<C-l>", "<C-w>l")

-- Use Escape to hide search results
bind("n", "<Esc>", ":noh<CR>")

-- Use m to move between matching pairs
bind("n", "m", "%")
bind("v", "m", "%")

-- Remap keybindings for Command mode
bind("c", "<C-k>", "<C-p>")
bind("c", "<C-j>", "<C-n>")

-- Open Neovim config
bind("n", "<leader>co", ":OpenConfig<CR>")
