return {
	{
		"alexpasmantier/pymple.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- optional (nicer ui)
			"stevearc/dressing.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		build = ":PympleBuild",
		config = function()
			require("pymple").setup()
		end,
	},
}
