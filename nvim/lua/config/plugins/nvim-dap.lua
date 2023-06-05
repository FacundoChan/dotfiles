-- NOT DONE YET
local M = {}

local wk = require("which-key")

local function set_keymaps()
  wk.register({
    d = {
      name = "debugger",
      b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Set Breakpoint" },
      B = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
      c = { "<cmd>lua require('dap').continue()<CR>", "Start/Continue" },
      s = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
      n = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
      o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
      u = { "<cmd>lua require('dap').up()<CR>", "Up" },
      d = { "<cmd>lua require('dap').down()<CR>", "Down" },
      q = { "<cmd>lua require('dap').terminate()<CR>", "Terminate" },
    },
  }, {
    prefix = "<leader>",
  })
end

local function config_dapi_and_sign()
  local dap_install = require("dap-install")
  dap_install.setup({
    installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
  })
end

local function config_dapui()
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end

  dap.listeners.after.event_continued["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end

  dap.listeners.before.disconnect["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
  end
end

local function configure_debuggers()
  -- load from json file
  require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "cpp" } })
  -- cpp
  require("config.plugins.dap-cpp")
end

function M.setup()
  set_keymaps()
  config_dapi_and_sign()
  config_dapui()
  configure_debuggers()
end

return M
