---@param method string
---@param fn fun(client:vim.lsp.Client, buffer)
local function on_supports_method(method, fn)
    M._supports_method[method] = M._supports_method[method] or setmetatable({}, { __mode = "k" })
    return vim.api.nvim_create_autocmd("User", {
        pattern = "LspSupportsMethod",
        callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            local buffer = args.data.buffer ---@type number
            if client and method == args.data.method then
                return fn(client, buffer)
            end
        end,
    })
end
local M = {}
---@alias LspWord {from:{[1]:number, [2]:number}, to:{[1]:number, [2]:number}} 1-0 indexed
M.words = {}
M.words.enabled = false
M.words.ns = vim.api.nvim_create_namespace("vim_lsp_references")

---@return LspWord[] words, number? current
function M.words.get()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local current, ret = nil, {} ---@type number?, LspWord[]
    for _, extmark in ipairs(vim.api.nvim_buf_get_extmarks(0, M.words.ns, 0, -1, { details = true })) do
        local w = {
            from = { extmark[2] + 1, extmark[3] },
            to = { extmark[4].end_row + 1, extmark[4].end_col },
        }
        ret[#ret + 1] = w
        if cursor[1] >= w.from[1] and cursor[1] <= w.to[1] and cursor[2] >= w.from[2] and cursor[2] <= w.to[2] then
            current = #ret
        end
    end
    return ret, current
end

---@param count number
---@param cycle? boolean
function M.words.jump(count, cycle)
    local words, idx = M.words.get()
    if not idx then
        return
    end
    idx = idx + count
    if cycle then
        idx = (idx - 1) % #words + 1
    end
    local target = words[idx]
    if target then
        vim.api.nvim_win_set_cursor(0, target.from)
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason.nvim",
        { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    keys = {
        { "<leader>cl", "<cmd>LspInfo<cr>",          desc = "Lsp Info" },
        { "gd",         vim.lsp.buf.definition,      desc = "Goto Definition",            has = "definition" },
        { "gr",         vim.lsp.buf.references,      desc = "References",                 nowait = true },
        { "gI",         vim.lsp.buf.implementation,  desc = "Goto Implementation" },
        { "gy",         vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        { "gD",         vim.lsp.buf.declaration,     desc = "Goto Declaration" },
        { "K",          vim.lsp.buf.hover,           desc = "Hover" },
        { "gK",         vim.lsp.buf.signature_help,  desc = "Signature Help",             has = "signatureHelp" },
        { "<c-k>",      vim.lsp.buf.signature_help,  mode = "i",                          desc = "Signature Help", has = "signatureHelp" },
        { "<leader>ca", vim.lsp.buf.code_action,     desc = "Code Action",                mode = { "n", "v" },     has = "codeAction" },
        { "<leader>cc", vim.lsp.codelens.run,        desc = "Run Codelens",               mode = { "n", "v" },     has = "codeLens" },
        { "<leader>cC", vim.lsp.codelens.refresh,    desc = "Refresh & Display Codelens", mode = { "n" },          has = "codeLens" },
        { "<leader>cr", vim.lsp.buf.rename,          desc = "Rename",                     has = "rename" },
        {
            "]]",
            function() M.words.jump(vim.v.count1) end,
            has = "documentHighlight",
            desc = "Next Reference",
            cond = function() return M.words.enabled end
        },
        {
            "[[",
            function() M.words.jump(-vim.v.count1) end,
            has = "documentHighlight",
            desc = "Prev Reference",
            cond = function() return M.words.enabled end
        },
        {
            "<a-n>",
            function() M.words.jump(vim.v.count1, true) end,
            has = "documentHighlight",
            desc = "Next Reference",
            cond = function() return M.words.enabled end
        },
        {
            "<a-p>",
            function() M.words.jump(-vim.v.count1, true) end,
            has = "documentHighlight",
            desc = "Prev Reference",
            cond = function() return M.words.enabled end
        },
    },
    opts = function()
        ---@class PluginLspOpts
        local icons = {
            diagnostics = {
                Error = " ",
                Warn  = " ",
                Hint  = " ",
                Info  = " ",
            }
        }
        local ret = {
            -- options for vim.diagnostic.config()
            ---@type vim.diagnostic.Opts
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                severity_sort = true,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
                        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
                        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
                        [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
                    },
                },
            },
            -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the inlay hints.
            inlay_hints = {
                enabled = true,
                exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
            },
            -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
            -- Be aware that you also will need to properly configure your LSP server to
            -- provide the code lenses.
            codelens = {
                enabled = false,
            },
            -- Enable lsp cursor word highlighting
            document_highlight = {
                enabled = true,
            },
            -- add any global capabilities here
            capabilities = {
                workspace = {
                    fileOperations = {
                        didRename = true,
                        willRename = true,
                    },
                },
            },
            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overridden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = {
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    -- Use this to add any additional keymaps
                    -- for specific lsp servers
                    -- ---@type LazyKeysSpec[]
                    -- keys = {},
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            codeLens = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            doc = {
                                privateName = { "^_" },
                            },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                        },
                    },
                },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with typescript.nvim
                -- tsserver = function(_, opts)
                --   require("typescript").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        }
        return ret
    end,
    ---@param opts PluginLspOpts
    config = function(_, opts)
        -- diagnostics signs
        if vim.fn.has("nvim-0.10.0") == 0 then
            if type(opts.diagnostics.signs) ~= "boolean" then
                for severity, icon in pairs(opts.diagnostics.signs.text) do
                    local name = vim.diagnostic.severity[severity]:lower():gsub("^%l", string.upper)
                    name = "DiagnosticSign" .. name
                    vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
                end
            end
        end

        if vim.fn.has("nvim-0.10") == 1 then
            -- inlay hints
            if opts.inlay_hints.enabled then
                LazyVim.lsp.on_supports_method("textDocument/inlayHint", function(client, buffer)
                    if
                        vim.api.nvim_buf_is_valid(buffer)
                        and vim.bo[buffer].buftype == ""
                        and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
                    then
                        vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
                    end
                end)
            end

            -- code lens
            if opts.codelens.enabled and vim.lsp.codelens then
                on_supports_method("textDocument/codeLens", function(client, buffer)
                    vim.lsp.codelens.refresh()
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = buffer,
                        callback = vim.lsp.codelens.refresh,
                    })
                end)
            end
        end

        if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
            opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
                or function(diagnostic)
                    local icons = LazyVim.config.icons.diagnostics
                    for d, icon in pairs(icons) do
                        if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
                            return icon
                        end
                    end
                end
        end

        vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        local servers = opts.servers
        local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            has_cmp and cmp_nvim_lsp.default_capabilities() or {},
            opts.capabilities or {}
        )

        local function setup(server)
            local server_opts = vim.tbl_deep_extend("force", {
                capabilities = vim.deepcopy(capabilities),
            }, servers[server] or {})
            if server_opts.enabled == false then
                return
            end

            if opts.setup[server] then
                if opts.setup[server](server, server_opts) then
                    return
                end
            elseif opts.setup["*"] then
                if opts.setup["*"](server, server_opts) then
                    return
                end
            end
            require("lspconfig")[server].setup(server_opts)
        end

        -- get all the servers that are available through mason-lspconfig
        local have_mason, mlsp = pcall(require, "mason-lspconfig")
        local all_mslp_servers = {}
        if have_mason then
            all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
        end

        local ensure_installed = {} ---@type string[]
        for server, server_opts in pairs(servers) do
            if server_opts then
                server_opts = server_opts == true and {} or server_opts
                if server_opts.enabled ~= false then
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end
        end
    end,
}
