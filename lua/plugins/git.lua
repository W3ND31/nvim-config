return {
	{
		"f-person/git-blame.nvim",
		version = "*",
    lazy = true,
		event = "VeryLazy",
		opts = {
			enabled = false,
			message_template = "<author> • <summary> • <date> • <<sha>>",
			date_format = "%d-%m-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	},
	{ "akinsho/git-conflict.nvim", version = "*", config = true },
}
