require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls"
  }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})

  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

  vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, {})

  vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, {})

  vim.keymap.set("n", "<space>f", function()
    vim.lsp.buf.format { async = true }
  end, {})
end

require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
