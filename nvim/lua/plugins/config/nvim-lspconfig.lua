-- https://dev.to/vonheikemen/neovim-lsp-setup-nvim-lspconfig-nvim-cmp-4k8e
require('mason').setup()
local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup()

local lspconfig = require('lspconfig')

-- hide inline diagnostic info
vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {border = 'rounded', source = 'always', header = '', prefix = ''}
})

local lsp_defaults = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities()),
    on_attach = function(client, bufnr)
        vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
    end
}

lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util
                                                        .default_config,
                                                    lsp_defaults)
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    lspconfig[server.name].setup {}
end

lspconfig.pyright.setup {}

vim.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    desc = 'LSP actions',
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- display hover info about the symbol under the cursor
        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

        -- jump to definition
        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

        -- jump to declaration
        bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

        -- list all implementations for symbol under the cursor
        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

        -- jump to definition of the type symbol
        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

        -- list all refs
        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

        -- display function signature
        bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

        -- rename all references
        bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

        -- select a code action available
        bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
        bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

        -- show diagnostics in floating window
        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

        -- move to previous diagnostic
        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

        -- move to next diagnostic
        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
    end
})

local sign = function(opts)
    vim.fn.sign_define(opts.name,
                       {texthl = opts.name, text = opts.text, numhl = ''})
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = 'ℹ️'})

for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    if server == 'sumneko_lsp' then
        lspconfig[server].setup {
            settings = {
                Lua = {
                    diagnostics = {globals = {'vim'}},
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true)
                    }
                }
            }
        }
    else
        lspconfig[server].setup {}
    end
end
