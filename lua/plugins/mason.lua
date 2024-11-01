return {
  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = {
      ensure_installed = {
        'bash-language-server',
        -- "clj-kondo",

        'lua-language-server',
        'markdown-toc',
        'markdownlint-cli2',
        'marksman',
        'shellcheck',
        'shfmt',
        'stylua',
      },
    },
  },
}
