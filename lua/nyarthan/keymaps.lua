local toggleterm = require('nyarthan.toggleterm')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local key = U.make_key({ noremap = true, silent = true })

key('', '<space>', '<nop>')

-- Insert Mode
key('i', '<c-h>', '<left>')
key('i', '<c-j>', '<down>')
key('i', '<c-k>', '<up>')
key('i', '<c-l>', '<right>')

-- Split navigation
key('n', '<c-h>', '<c-w>h')
key('n', '<c-j>', '<c-w>j')
key('n', '<c-k>', '<c-w>k')
key('n', '<c-l>', '<c-w>l')

-- Tree
key('n', '<leader>e', U.make_cmd('NvimTreeToggle'))

-- Resize with arrows
key('n', '<c-up>', U.make_cmd('resize +2'))
key('n', '<c-down>', U.make_cmd('resize -2'))
key('n', '<c-left>', U.make_cmd('vertical resize -2'))
key('n', '<c-right>', U.make_cmd('vertical resize +2'))

-- buffers
key('n', '<s-l>', U.make_cmd('bnext'))
key('n', '<s-h>', U.make_cmd('bprevious'))
key('n', '<c-w>', U.make_cmd('Bdelete'))

-- Visual Mode
key('v', '<', '<gv')
key('v', '>', '>gv')

key('v', '<a-j>', U.make_cmd('m .+1<cr>=='))
key('v', '<a-k>', U.make_cmd('m .-1<cr>=='))
key('v', 'p', '"_nP')

-- Visual Blocke Mode
key('x', 'J', U.make_cmd("move '>+1<CR>gv-gv"))
key('x', 'K', U.make_cmd("move '>-2<CR>gv-gv"))
key('x', '<a-j>', U.make_cmd("move '>+1<CR>gv-gv"))
key('x', '<a-k>', U.make_cmd("move '<-2<CR>gv-gv"))

-- Telescope
key('n', '<leader>f', U.make_cmd('Telescope find_files'))
key('n', '<c-t>', U.make_cmd('Telescope live_grep'))
key(
  'n',
  '<leader>gB',
  require('telescope').extensions.git_worktree.create_git_worktree
)
key(
  'n',
  '<leader>gb',
  require('telescope').extensions.git_worktree.git_worktrees
)

-- NvimTree
key('n', '<leader>r', U.make_cmd('NvimTreeRefresh'))

-- bufferline
key('n', '<leader>bp', U.make_cmd('BufferLinePick'))

key('n', '<leader>rr', U.make_cmd('luafile %'))

key('n', '<leader>p', U.make_cmd('"_dP'))

local set_keys = {}

set_keys.trouble = function()
  key('n', '<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>')
  key('n', '<leader>xd', '<cmd>Trouble document_diagnostics<cr>')
  key('n', '<leader>xl', '<cmd>Trouble loclist<cr>')
  key('n', '<leader>xq', '<cmd>Trouble quickfix<cr>')
end

set_keys.lsp = function(bufnr)
  local opts = { buffer = bufnr }
  local _key = U.make_key(opts)

  _key('n', 'gd', vim.lsp.buf.definition)
  _key('n', 'gD', vim.lsp.buf.declaration)
  _key('n', 'K', vim.lsp.buf.hover)
  _key('n', '<C-k>', vim.lsp.buf.signature_help)
  _key('n', 'gi', vim.lsp.buf.implementation)
  _key('n', 'gf', vim.lsp.buf.formatting)
  _key('n', 'gR', U.make_cmd('Trouble lsp_references'))
  _key('n', 'gD', U.make_cmd('Trouble lsp_definitions'))
  _key('n', 'gT', U.make_cmd('Trouble lsp_type_definitions'))
  _key('n', 'gr', vim.lsp.buf.rename)
  _key('n', 'gnd', vim.diagnostic.goto_next)
  _key('n', 'gNd', vim.diagnostic.goto_prev)
  _key('n', 'gl', vim.diagnostic.open_float)
  _key(
    'n',
    'ga',
    U.bind(
      require('telescope').extensions.code_actions.code_actions,
      require('telescope.themes').get_cursor({})
    )
  )
  -- _key("n", "ga", vim.lsp.buf.code_action)
end

key('n', '<c-\\>', toggleterm.toggleDefault)
key('n', '<c-s-\\>', toggleterm.toggleLazygit)

return { set_keys = set_keys }
