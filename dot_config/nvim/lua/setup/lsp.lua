local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

mason.setup()

mason_lspconfig.setup({
	ensure_installed = { "sumneko_lua", "rust_analyzer", "gopls", "grammarly", "html", "json" }
})

mason_lspconfig.setup_handlers({
	-- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
	function (server_name)
		lspconfig[server_name].setup {}
	end,
})


lspconfig['rust_analyzer'].setup{
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {}
	}
}
