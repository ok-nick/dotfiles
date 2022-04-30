return function(server, options)
	-- TODO: not sure about this, it is mentioned in lspconfig docs
	options.capabilities.textDocument.completion.completionItem.snippetSupport = true

	server:setup(options)
end
