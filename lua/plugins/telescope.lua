return { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    opts = {
        extensions = {
            ['ui-select'] = {
                require('telescope.themes').get_dropdown(),
            },
        },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        { -- If encountering errors, see telescope-fzf-native README for installation instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    keys = {
        {
            "<leader>,",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
        },
        -- { "<leader>/",       LazyVim.pick("live_grep"),            desc = "Grep (Root Dir)" },
        { "<leader>:",       "<cmd>Telescope command_history<cr>", desc = "Command History" },
        -- { "<leader><space>", LazyVim.pick("files"),                desc = "Find Files (Root Dir)" },
        -- find
        {
            "<leader>fb",
            "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Buffers"
        },
        -- {
        --     "<leader>fc",
        --     LazyVim.pick.config_files(),
        --     desc = "Find Config File"
        -- },
        -- {
        --     "<leader>ff",
        --     LazyVim.pick("files"),
        --     desc = "Find Files (Root Dir)"
        -- },
        -- {
        --     "<leader>fF",
        --     LazyVim.pick("files", { root = false }),
        --     desc = "Find Files (cwd)"
        -- },
        {
            "<leader>fg",
            "<cmd>Telescope git_files<cr>",
            desc = "Find Files (git-files)"
        },
        {
            "<leader>fr",
            "<cmd>Telescope oldfiles<cr>",
            desc = "Recent"
        },
        -- {
        --     "<leader>fR",
        --     LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }),
        --     desc = "Recent (cwd)"
        -- },
        -- git
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<CR>",
            desc = "Commits"
        },
        {
            "<leader>gs",
            "<cmd>Telescope git_status<CR>",
            desc = "Status"
        },
        -- search
        {
            '<leader>s"',
            "<cmd>Telescope registers<cr>",
            desc = "Registers"
        },
        {
            "<leader>sa",
            "<cmd>Telescope autocommands<cr>",
            desc = "Auto Commands"
        },
        {
            "<leader>sb",
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            desc = "Buffer"
        },
        {
            "<leader>sc",
            "<cmd>Telescope command_history<cr>",
            desc = "Command History"
        },
        {
            "<leader>sC",
            "<cmd>Telescope commands<cr>",
            desc = "Commands"
        },
        {
            "<leader>sd",
            "<cmd>Telescope diagnostics bufnr=0<cr>",
            desc = "Document Diagnostics"
        },
        {
            "<leader>sD",
            "<cmd>Telescope diagnostics<cr>",
            desc = "Workspace Diagnostics"
        },
        -- {
        --     "<leader>sg",
        --     LazyVim.pick("live_grep"),
        --     desc = "Grep (Root Dir)"
        -- },
        -- {
        --     "<leader>sG",
        --     LazyVim.pick("live_grep", { root = false }),
        --     desc = "Grep (cwd)"
        -- },
        {
            "<leader>sh",
            "<cmd>Telescope help_tags<cr>",
            desc = "Help Pages"
        },
        {
            "<leader>sH",
            "<cmd>Telescope highlights<cr>",
            desc = "Search Highlight Groups"
        },
        {
            "<leader>sj",
            "<cmd>Telescope jumplist<cr>",
            desc = "Jumplist"
        },
        {
            "<leader>sk",
            "<cmd>Telescope keymaps<cr>",
            desc = "Key Maps"
        },
        {
            "<leader>sl",
            "<cmd>Telescope loclist<cr>",
            desc = "Location List"
        },
        {
            "<leader>sM",
            "<cmd>Telescope man_pages<cr>",
            desc = "Man Pages"
        },
        {
            "<leader>sm",
            "<cmd>Telescope marks<cr>",
            desc = "Jump to Mark"
        },
        {
            "<leader>so",
            "<cmd>Telescope vim_options<cr>",
            desc = "Options"
        },
        {
            "<leader>sR",
            "<cmd>Telescope resume<cr>",
            desc = "Resume"
        },
        {
            "<leader>sq",
            "<cmd>Telescope quickfix<cr>",
            desc = "Quickfix List"
        },
        -- {
        --     "<leader>sw",
        --     LazyVim.pick("grep_string", { word_match = "-w" }),
        --     desc = "Word (Root Dir)"
        -- },
        -- {
        --     "<leader>sW",
        --     LazyVim.pick("grep_string", { root = false, word_match = "-w" }),
        --     desc = "Word (cwd)"
        -- },
        -- {
        --     "<leader>sw",
        --     LazyVim.pick("grep_string"),
        --     mode = "v",
        --     desc = "Selection (Root Dir)"
        -- },
        -- {
        --     "<leader>sW",
        --     LazyVim.pick("grep_string", { root = false }),
        --     mode = "v",
        --     desc = "Selection (cwd)"
        -- },
        -- {
        --     "<leader>uC",
        --     LazyVim.pick("colorscheme", { enable_preview = true }),
        --     desc = "Colorscheme with Preview"
        -- },
        -- {
        --     "<leader>ss",
        --     function()
        --         require("telescope.builtin").lsp_document_symbols({
        --             symbols = LazyVim.config.get_kind_filter(),
        --         })
        --     end,
        --     desc = "Goto Symbol",
        -- },
        -- {
        --     "<leader>sS",
        --     function()
        --         require("telescope.builtin").lsp_dynamic_workspace_symbols({
        --             symbols = LazyVim.config.get_kind_filter(),
        --         })
        --     end,
        --     desc = "Goto Symbol (Workspace)",
        -- },
    },
    config = function()
        require('telescope').setup {
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch existing [b]uffers' })
        vim.keymap.set('n', '<leader>scb', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[S]earch in [c]urrent [b]uffer' })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        vim.keymap.set('n', '<leader>s/', function()
            builtin.live_grep {
                grep_open_files = true,
                prompt_title = 'Live Grep in Open Files',
            }
        end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        vim.keymap.set('n', '<leader>sn', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })
    end,
}
