local null_ls = require('null-ls')
local builtins = require('null-ls').builtins

null_ls.setup({
  sources = {
    builtins.formatting.stylua,
    builtins.formatting.prettierd,
  },
})
