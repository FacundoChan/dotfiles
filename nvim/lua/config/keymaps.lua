-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {}) -- auto-save.nvim

-- luasnip
local ls = require("luasnip")
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set("i", "<c-u>", require("luasnip.extras.select_choice"))

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "<leader>S", "<cmd>w<cr>", { desc = "Save file" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "v<g")
vim.keymap.set("n", ">", "v>g")

-- jk -> esc
vim.keymap.set("i", "jk", "<esc>")

-- chatGPT
vim.keymap.set("n", "<leader>C", ":ChatGPT<CR>", {})

-- change '$' and '^'
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")

-- tabular
vim.keymap.set("v", "<leader>t", ":Tabularize /", { desc = "Tabularize" })

-- Debug
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate debugger" })
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", { desc = "Continue debugger" })
vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
vim.keymap.set("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step into" })
vim.keymap.set("n", "K", "<cmd>lua require'dapui'.eval()<cr>", { desc = "Dap - eval" })
