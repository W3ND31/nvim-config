return {
	"aznhe21/actions-preview.nvim",
	config = function ()
		vim.keymap.set({ "n", "v" }, "<leader>ca", require("actions-preview").code_actions, { desc = "Code Action" })
	end
}
