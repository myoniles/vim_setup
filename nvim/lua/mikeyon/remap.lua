local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
map("", "<Space>", "<Nop>", silent)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--vim.keymap.set("n", "<leader>N", vim.cmd.Ex)

-- I like these for easy buffer and tab movement
vim.keymap.set("n", "]b", vim.cmd.bn)
vim.keymap.set("n", "[b", vim.cmd.bp)
vim.keymap.set("n", "]t", vim.cmd.tabn)
vim.keymap.set("n", "[t", vim.cmd.tabp)

-- This is probably a crime but idc I need layers
-- I am genuinely sad that they do not have 'sh' as a command
-- ":sh" made the disconnect a lot cleaner...
-- This feels like breaking something
-- vim.keymap.set("n", "<C-c>", ":term<CR>")
vim.api.nvim_create_autocmd("TermOpen", {pattern = '*', callback = function()
    vim.opt_local.nu = false
    vim.opt_local.relativenumber = false
end
})

-- Move with blocks in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep J at linestart
vim.keymap.set("n", "J", "mzJ`z")

-- leader p to paste without writing copy buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- No EX mode
vim.keymap.set("n", "Q", "<nop>")

-- format
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

-- TODO toggle spelling
