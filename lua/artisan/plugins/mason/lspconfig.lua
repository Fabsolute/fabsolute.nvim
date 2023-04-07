local mason_lspconfig = require('mason-lspconfig')

mason_lspconfig.setup({
    ensure_installed = {},
    automatic_installation = {
        exclude = {},
    },
})

local cmp_installed, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

local capabilities = {}

if cmp_installed then
    capabilities = cmp_nvim_lsp.default_capabilities()
end


mason_lspconfig.setup_handlers {
    function(server_name)
        local extra_config_exists, extra_config = pcall(require, "artisan.plugins.mason." .. server_name)
        local config = { capabilities = capabilities }
        if extra_config_exists then
            for k,v in pairs(extra_config) do
                config[k] = v
            end
        end

        require('lspconfig')[server_name].setup(config)
    end
}
