return {
    {
        "williamboman/mason.nvim",
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
            { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            automatic_installation = true,
            ensure_installed = {
                "lua_ls",
                "clojure_lsp",
                "bashls",
                "dartls",
                "ast_grep",
                "vimls",
            },
            handlers = {
                -- The first entry (without a key) will be the default handler
                -- and will be called for each installed server that doesn't have
                -- a dedicated handler.
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
            },
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = {
                "bash-language-server",
                "clj-kondo",
                "clojure-lsp",
                "lua-language-server",
                'vim-language-server',
                'editorconfig-checker',
                'luacheck',
                "shellcheck",
                "shfmt",
                "stylua",
                "ast-grep"
            },
            auto_update = true,
            debounce_hours = 5,
        },
    },
    {
        "neovim/nvim-lspconfig"
    }
}
