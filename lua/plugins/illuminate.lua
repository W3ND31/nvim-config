return {
	"RRethy/vim-illuminate",
	opts = {
		delay = 100,
	},
	config = function(_, opts)
		require("illuminate").configure(opts)
	end,
}
