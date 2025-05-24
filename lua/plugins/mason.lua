return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "clojure_lsp",
        "bashls",
        "ast_grep",
        "vimls",
        "eslint",
        "cssls",
        "html",
        "bashls",
        "jsonls",
        "gh_actions_ls",

      },
      handlers = {
        function(server_name)
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

          local servers = {
            lua_ls = {
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace",
                  },
                  diagnostics = { disable = { "missing-fields" } },
                },
              },
            },
          }

          local server = servers[server_name] or {}
          server.capabilities = capabilities

          require("lspconfig")[server_name].setup(server)
        end,
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        cmd = { "Mason", "MasonInstall" },
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
        keys = {
          { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" },
        },
      },
      {
        "neovim/nvim-lspconfig",
        lazy = false,
      },
    }
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    },
    config = function()
      require("lint").linters_by_ft = {
        clojure = { "clj-kondo" },
        lua = { "luacheck" },
        sh = { "shellcheck" },
        zsh = { "shellcheck" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        html = { "htmlhint" },
        json = { "jsonlint" },
        css = { "stylelint" },
        yaml = { "yamllint" },
      }
    end,
  },
  {
    "W3ND31/mason-nvim-lint",
    opts = {
      automatic_installation = true,
    },
  },
}
