return {
  {
    -- "Pocco81/DAPInstall.nvim",
    "ravenxrz/DAPInstall.nvim",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-install").setup()
    end,
    cmd = {
      "DIInstall",
      "DIUninstall",
      "DIList",
    },
  },
  {
    "mfussenegger/nvim-dap",
    -- dependencies = {
    --   "Pocco81/DAPInstall.nvim",
    -- },
    config = function()
      require("config.plugins.nvim-dap").setup()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("config.plugins.nvim-dap-ui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enable_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        show_stop_reason = true,
        commented = false,
        all_frames = false,
      })
    end,
  },
  -- dap-python
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("config.plugins.dap-python").setup()
    end,
    ft = { "python" },
  },
  -- dap-go
  {
    "leoluz/nvim-dap-go",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("config.plugins.dap-go").setup()
    end,
    ft = { "go" },
  },
}
