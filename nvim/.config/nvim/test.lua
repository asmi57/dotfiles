for _, client in pairs(vim.lsp.get_clients()) do
	vim.print(client.settings)
end
