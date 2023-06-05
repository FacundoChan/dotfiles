return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0, -- default: 1000
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
}
