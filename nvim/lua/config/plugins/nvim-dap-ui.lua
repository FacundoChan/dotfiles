local M = {}

local dap = require("dap")
local dapui = require("dapui")

local function set_hlgroups()
  local sign = vim.fn.sign_define

  sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
  sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
  sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
end

local function set_keymaps()
  local wk = require("which-key")
  wk.register({
    d = {
      T = { dapui.toggle, "Toggle Debug UI" },
    },
  }, {
    prefix = "<leader>",
  })
end

local function set_commands()
  vim.api.nvim_create_user_command("DapUIOpen", dapui.open, {})
  vim.api.nvim_create_user_command("DapUIClose", dapui.close, {})
  vim.api.nvim_create_user_command("DapUIToggle", dapui.toggle, {})
end

function M.setup()
  set_commands()
  set_keymaps()
  dapui.setup({
    layouts = {
      {
        elements = {
          { id = "watches", size = 0.25 }, -- 0.20
          { id = "breakpoints", size = 0.25 }, -- 0.20
          { id = "stacks", size = 0.25 },
          { id = "scopes", size = 0.25 }, -- 0.35
        },
        size = 30, -- 40
        position = "left",
      },
      {
        elements = {
          { id = "repl", size = 0.3 }, --0.5
          { id = "console", size = 0.3 }, -- 0.5
        },
        size = 14,
        position = "bottom",
      },
    },
  })

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  set_hlgroups()
end

return M
