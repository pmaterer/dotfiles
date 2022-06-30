local cmp = require('cmp')
local luasnip = require('luasnip')

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local select_opts = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    sources = {
        {name = 'path'}, {name = 'nvim_lsp', keyword_length = 3},
        {name = 'buffer', keyword_length = 3},
        {name = 'luasnip', keyword_length = 2}
    },
    window = {documentation = cmp.config.window.bordered()},
    formatting = {fields = {'menu', 'abbr', 'kind'}},
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        -- scroll text in documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- cancel completion
        ['<C-e>'] = cmp.mapping.abort(),

        -- jump to placeholder in snippet
        ['<C-d>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<C-b>'] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, {'i', 's'}),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, {'i', 's'})
    }
})
