local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

local b = require("telescope")
b.load_extension('harpoon')

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hp", mark.rm_file)
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hq", ":Telescope harpoon marks<CR>")

vim.keymap.set("n", "]h", function() ui.nav_next() end)
vim.keymap.set("n", "[h", function() ui.nav_next() end)

vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end)

-- TODO SWITCH TO HARPOON TERMINALS
vim.keymap.set("n", "<C-c>", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>ht1", function() term.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>ht2", function() term.gotoTerminal(2) end)
vim.keymap.set("n", "<leader>ht3", function() term.gotoTerminal(3) end)
vim.keymap.set("n", "<leader>ht4", function() term.gotoTerminal(4) end)

-- If you need more than 4 terminals you're screwed anyway - Linus T, probably
