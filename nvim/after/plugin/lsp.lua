local lsp = require('lsp-zero')

lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', '<leader>cs', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

  }
})


require'lspconfig'.kotlin_language_server.setup{
    settings= {
        { kotlin = {compiler = {jvm = {target = "17"} } }
        }
    }
}
