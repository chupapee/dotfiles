vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- file-browser
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", opts)

-- save changes
keymap.set("n", "<C-s>", ":w<Return>", opts)

-- close window
keymap.set('n', '<C-q>', ':q<Return>')
keymap.set('n', '<C-q>a', ':wqa<Return>')

-- select all
keymap.set('n', '<C-a>', "gg<S-v>G")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- delete a word backwards
-- keyman.set('n', 'dw', 'vb_d')

-- jumplist
keymap.set('n', '<C-m>', '<C-i>', opts)

-- new tab
keymap.set('n', 'te', ':tabedit', opts)
keymap.set('n', '<tab>', ':tabNext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabPrev<Return>', opts)

-- split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- diagnostics
keymap.set('n', '<C-j>', function()
	vim.diagnostic.goto_next()
end, opts)
