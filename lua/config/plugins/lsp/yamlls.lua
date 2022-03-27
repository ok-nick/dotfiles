return function(server, options)
	options.settings = {
		yaml = {
			schemaStore = {
				-- installs all available schemas
				enable = true,
			},
		},
	}

	server:setup(options)
end
