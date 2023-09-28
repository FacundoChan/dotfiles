return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { -- optional packages
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "ccppr_vsc" },
        handlers = {},
      })
    end,
  },
}
