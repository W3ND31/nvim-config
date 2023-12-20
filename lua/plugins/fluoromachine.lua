return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        brightness = 0.12,
        theme = "fluoromachine",
      })

      vim.cmd.colorscheme("fluoromachine")
    end,
  },
}
