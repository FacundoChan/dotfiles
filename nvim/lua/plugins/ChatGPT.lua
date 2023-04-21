return {
  -- Lazy
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.ChatGPT").setup()
      require("chatgpt").setup({ api_key = os.getenv("OPENAI_API_KEY") })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
