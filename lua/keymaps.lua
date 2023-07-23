-- define common options
local opts = {
    noremap = true, -- non-recursive
    silent = true, -- do not show message
}

local map = vim.keymap.set

-----------------
-- Normal mode --
-----------------
map({ "n", "v" }, "<leader>v", [["+p]], { desc = "paste AFTER from clipboard" })
map({ "n", "v" }, "<leader>V", [["+P]], { desc = "paste BEFORE from clipboard" })
map({ "n", "v" }, "<leader>s", [["*p]], { desc = "paste AFTER from primary" })
map({ "n", "v" }, "<leader>S", [["*P]], { desc = "paste BEFORE from primary" })
map({ "n", "v" }, "<leader>p", [["0p]], { desc = "paste AFTER  from yank (reg:0)" })
map({ "n", "v" }, "<leader>P", [["0P]], { desc = "paste BEFORE from yank (reg:0)" })

-- Hint: see `:h vim.map.set()`
-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- for nvim-tree
-- default leader key: \
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-----------------
-- Visual mode --
-----------------
