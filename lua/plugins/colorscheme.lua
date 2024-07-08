return {
	{ -- tokyonight
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = true,
		opts = { style = "moon" },
	},

	
	{ -- catpuccin
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		opts = {},
		config = function()
			require("catppuccin").setup({
				color_overrides = {
					all = {
						text = "#F4CDE9",
						subtext1 = "#DEBAD4",
						subtext0 = "#C8A6BE",
						overlay2 = "#B293A8",
						overlay1 = "#9C7F92",
						overlay0 = "#866C7D",
						surface2 = "#705867",
						surface1 = "#5A4551",
						surface0 = "#44313B",

						base = "#352939",
						mantle = "#211924",
						crust = "#1a1016",
					},
				},
			})
			vim.cmd("colorscheme catppuccin")
		end,
	},
}
