require("mason").setup()

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "eslint",
    "html",
    "cssls"
  },
  handlers = {
    function(server)
      lspconfig[server].setup({})
    end,
    ["lua_ls"] = function()
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim"
              }
            }
          }
        }
      })
    end,
    ["tsserver"] = function()
      lspconfig.tsserver.setup({
        settings = {
          completions = {
            completeFunctionCalls = true
          }
        }
      })
    end
  }
})

local lsp_cmds = vim.api.nvim_create_augroup("lsp_cmds", {clear = true})

vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_cmds,
  desc = "LSP actions",
  callback = function()
    local bind = function(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, {buffer = true})
    end

    bind("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
    bind("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
    bind("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
    bind("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
    bind("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
    bind("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
    bind("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
    bind("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
    bind({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")
    bind("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
    bind("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
    bind("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
    bind("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
  end
})

