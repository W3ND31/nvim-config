---@diagnostic disable: undefined-global
return {
  {
    'akinsho/toggleterm.nvim',
    -- version = "*",
    lazy = false,
    opts = {
      open_mapping = [[<c-/>]],
      size = 30
    },
    keys = {
      {
        "<leader>gg",
        function()
          LazygitToggle()
        end,
        desc = "Lazygit"
      },
      {
        "<C-t>",
        function()
          FloatToggle()
        end,
        mode = { "n", "t" },
        desc = "Float Terminal"
      },
      {
        "<C-n>",
        "<Cmd>TermNew<CR>",
        mode = { "n", "t" },
        desc = "New Terminal"
      }
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)
      local Terminal = require('toggleterm.terminal').Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        display_name = "Lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })

      function LazygitToggle()
        lazygit:toggle()
      end

      local float = Terminal:new({
        direction = "float",
        hidden = true
      })

      function FloatToggle()
        float:toggle()
      end
    end
  }
}
