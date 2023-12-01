require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'volar', 'tailwindcss', 'eslint' }
})

local on_attach = function(_, _)
  vim.api.nvim_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.api.nvim_set_keymap('n', '<ALT><ENTER>', vim.lsp.code_action {})

  vim.api.nvim_set_keymap('n', 'gd', vim.lsp.buf.definition, {})
  vim.api.nvim_set_keymap('n', 'gi', vim.lsp.buf.implementation, {})
  vim.api.nvim_set_keymap('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.api.nvim_set_keymap('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()


require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').volar.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('lspconfig').eslint.setup {
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
 capabilities = capabilities

 }

