return {
  'romgrk/barbar.nvim',
  lazy = false,
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    tabpages = true,
    clickable = true,
    sidebar_filetypes = {
      snacks_picker_list = {
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = {
          text = 'undotree',
          align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
        },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify all three
        Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      }
    }
  },
  keys = {
    { "<Tab>",      "<cmd> BufferNext <CR>",             mode = "n", desc = "Next Tab" },
    { "<S-Tab>",    "<cmd> BufferPrevious <CR>",         mode = "n", desc = "Prev Tab" },

    { "<leader>bq", "<cmd>BufferClose<CR>",              mode = "n", desc = "Quit" },
    { "<leader>br", "<cmd>BufferRestore<CR>",            mode = "n", desc = "Restore" },
    { "<leader>bp", "<cmd>BufferPin<CR>",                mode = "n", desc = "Pin/Unpin" },
    { "<leader>b>", "<cmd>BufferMoveNext<CR>",           mode = "n", desc = "Move Next" },
    { "<leader>b<", "<cmd>BufferMovePrevious<CR>",       mode = "n", desc = "Move Previous" },
    { "<leader>bc", "<cmd>BufferCloseAllButCurrent<CR>", mode = "n", desc = "Close All But Current" },
    { "<C-q>",      "<cmd>BufferClose<CR>",              mode = "n", desc = "Quit Tab" },
  }
}
