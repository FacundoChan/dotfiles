local M = {}

local wk = require("which-key")

local function set_keymaps()
  wk.register({
    t = { "<cmd>FloatermToggle<cr>", "FloatermToggle" },
    -- t = { "<cmd>FloatermNew<cr>", "FloatermNew" },
    -- T = { "<cmd>FloatermHide<cr>", "FloatermHide" },
  }, {
    prefix = "<leader>",
  })
end

function M.setup()
  set_keymaps()
end

return M
