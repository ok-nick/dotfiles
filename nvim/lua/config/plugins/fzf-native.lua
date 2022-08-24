return {
	"nvim-telescope/telescope-fzf-native.nvim",
	requires = "telescope.nvim",
	run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'",
	after = "telescope.nvim",
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
