local lsp = vim.lsp
local diagnostic = vim.diagnostic

local function symbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

symbol("Error", "")
symbol("Info", "")
symbol("Hint", "")
symbol("Warn", "")

diagnostic.config({
    virtual_text = {
        prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = false,
})

lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
    border = "single",
})
lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
    border = "single",
})

