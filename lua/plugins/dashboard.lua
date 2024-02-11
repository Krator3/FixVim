local function default_header()
	return {
		"",
		"",
		"",

		"███████╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗",
		"██╔════╝██║╚██╗██╔╝██║   ██║██║████╗ ████║",
		"█████╗  ██║ ╚███╔╝ ╚██╗ ██╔╝██║██╔████╔██║",
		"██╔══╝  ██║ ██╔██╗  ╚████╔╝ ██║██║╚██╔╝██║",
		"██║     ██║██╔╝╚██╗  ╚██╔╝  ██║██║ ╚═╝ ██║",
		"╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝     ╚═╝",

		"",
		"",
		"",
	}
end
require("dashboard").setup{
	theme = "doom",
	config = {
		header = default_header(),
		center = {

			{
				icon = "󰙅 ",
				icon_hl = "Title",
				desc = "Open tree",
				desc_hl = "String",
				-- key = "",
				key_hl = "Number",
				action = ":Neotree float",
			},

			{
				icon = " ",
				icon_hl = "Title",
				desc = "New file",
				desc_hl = "String",
				-- key = "",
				key_hl = "Number",
				action = ":ene",
			},

			{
				icon = "🗲 ",
				icon_hl = "Title",
				desc = "Lazy",
				desc_hl = "String",
				-- key = "",
				key_hl = "Number",
				action = ":Lazy",
			},

			{
				icon = "⏻ ",
				icon_hl = "Title",
				desc = "Quit Neovim",
				desc_hl = "String",
				-- key = "",
				key_hl = "Number",
				action = ":q",
			},

		},
	},
}
