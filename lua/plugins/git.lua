return {
	{
		"f-person/git-blame.nvim",
    enabled = false,
		event = "VeryLazy",
		opts = {
			enabled = false,
			message_template = "<author> • <summary> • <date> • <<sha>>",
			date_format = "%d-%m-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
	},
}
