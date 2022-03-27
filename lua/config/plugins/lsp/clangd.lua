return function(server, options)
	options.settings = {
		cmd = {
			"clangd",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
		},
	}

	server:setup(options)
end
