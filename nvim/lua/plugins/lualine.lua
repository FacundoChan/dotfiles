return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("config.plugins.lualine").setup()
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
