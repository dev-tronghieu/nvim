local lsp = require('lsp-zero').preset({ "recommended" })

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'gopls',
    'eslint',
    'html',
    'cssls',
    'svelte',
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').gopls.setup {
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
    cmd = { "gopls", "serve" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = require('lspconfig/util').root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
        },
    },
}
require('lspconfig').html.setup{}
require('lspconfig').cssls.setup{}
require('lspconfig').svelte.setup{}

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')

cmp.setup({
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})
