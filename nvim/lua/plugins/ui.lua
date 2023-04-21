return {
  -- fancy notify
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>un",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Delete all Notifications",
      },
    },
    opts = {
      timeout = 3000,
      render = "compact", -- "default"
      stages = "fade", -- fade_in_slide_out
      -- background_colour = "#000000"
    },
  },
}
