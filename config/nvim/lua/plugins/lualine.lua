return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- no arrows, no separators
    opts.options.section_separators = { left = "", right = "" }
    opts.options.component_separators = { left = "", right = "" }
    opts.options.globalstatus = true

    local cp = require("catppuccin.palettes").get_palette()

    opts.theme = {
      normal = {
        a = { fg = cp.base, bg = cp.lavender, gui = "bold" },
        b = { fg = cp.text, bg = cp.surface0 },
        c = { fg = cp.text, bg = cp.surface0 },
      },
      insert = {
        a = { fg = cp.base, bg = cp.green, gui = "bold" },
        b = { fg = cp.text, bg = cp.surface0 },
        c = { fg = cp.text, bg = cp.surface0 },
      },
      visual = {
        a = { fg = cp.base, bg = cp.mauve, gui = "bold" },
        b = { fg = cp.text, bg = cp.surface0 },
        c = { fg = cp.text, bg = cp.surface0 },
      },
      replace = {
        a = { fg = cp.base, bg = cp.red, gui = "bold" },
        b = { fg = cp.text, bg = cp.surface0 },
        c = { fg = cp.text, bg = cp.surface0 },
      },
      inactive = {
        a = { fg = cp.subtext1, bg = cp.surface0 },
        b = { fg = cp.subtext1, bg = cp.surface0 },
        c = { fg = cp.subtext1, bg = cp.surface0 },
      },
    }
  end,
}
