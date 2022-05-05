local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	print("Module nvim-lsp-installer not found...")
	return
end

require("lspconfig").tsserver.setup({
	on_attach = function(client, bufnr)
		require("nvim-lsp-ts-utils").setup({
			filter_out_diagnostics_by_code = { 80001 },
		})
		require("nvim-lsp-ts-utils").setup_client(client)
	end,
})

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("user.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("user.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "rust_analyzer" then
		local rust_analyzer_opts = require("user.lsp.settings.rust_analyzer")
		opts = vim.tbl_deep_extend("force", rust_analyzer_opts, opts)
	end

	if server.name == "stylelint_lsp" then
		local stylelint_lsp_opts = require("user.lsp.settings.stylelint_lsp")
		opts = vim.tbl_deep_extend("force", stylelint_lsp_opts, opts)
	end
	server:setup(opts)
end)
