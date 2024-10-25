return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
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
                "markdown-toc",
                "markdownlint-cli2",
                "marksman",
                "shellcheck",
                "shfmt",
                "stylua",
            },
        },
    },
}
