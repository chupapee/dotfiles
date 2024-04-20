local main = {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    event = 'InsertEnter',
}

main.config = function()
    require("nvim-lsp-installer").setup({})

    local lsp = require 'lspconfig'

    lsp.tsserver.setup {}

    lsp.eslint.setup {}

    lsp.tailwindcss.setup {}

    lsp.html.setup {}

    lsp.cssls.setup {}
    lsp.cssmodules_ls.setup {}

    lsp.graphql.setup {}

    lsp.dockerls.setup {}

    lsp.emmet_ls.setup {}

    lsp.lua_ls.setup {}

    -- Vue
    lsp.volar.setup {}

    -- Python
    lsp.pyright.setup {}
end

return main
