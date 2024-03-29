-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
opt.relativenumber = true

-- set wrap while using pattern shown below
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.md", "*.tex" },
  command = "setlocal wrap",
})

-- keep the diagnostic message in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})
