-- Global diagnostic configuration
vim.diagnostic.config({
    virtual_text = {
        prefix = "▲",
        spacing = 4,
        source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

-- Custom sign definitions
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

-- on_attach function
local on_attach = function(_, bufnr)
    -- Keymaps
    local bufmap = function(keys, func)
        vim.keymap.set("n", keys, func, { buffer = bufnr })
    end

    bufmap("<leader>r", vim.lsp.buf.rename)
    bufmap("<leader>a", vim.lsp.buf.code_action)
    bufmap("gd", vim.lsp.buf.definition)
    bufmap("gD", vim.lsp.buf.declaration)
    bufmap("gI", vim.lsp.buf.implementation)
    bufmap("<leader>D", vim.lsp.buf.type_definition)
    bufmap("gr", require("telescope.builtin").lsp_references)
    bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
    bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)
    bufmap("K", vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
        vim.lsp.buf.format()
    end, {})
end

-- Set up servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    },
})

require("lspconfig").nixd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "nixd" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})

require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
        cmd = { "rust-analyzer" },
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = true,
            },
            cargo = {
                allFeatures = true,
                allTargets = false,
            },
        },
    },
})

require("lspconfig").gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
