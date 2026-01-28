return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = true,

    custom_highlights = function(cp)
      return {
        StatusLine = { bg = "none" },
        StatusLineNC = { bg = "none" },
      }
    end,
  },
}
