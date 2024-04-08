local navbuddy = require("nvim-navbuddy")
local actions = require("nvim-navbuddy.actions")

navbuddy.setup {
	icons = {
		File = ' ',
		Module = ' ',
		Namespace = ' ',
		Package = ' ',
		Class = ' ',
		Method = ' ',
		Property = ' ',
		Field = ' ',
		Constructor = ' ',
		Enum = ' ',
		Interface = ' ',
		Function = ' ',
		Variable = ' ',
		Constant = ' ',
		String = ' ',
		Number = ' ',
		Boolean = ' ',
		Array = ' ',
		Object = ' ',
		Key = ' ',
		Null = ' ',
		EnumMember = ' ',
		Struct = ' ',
		Event = ' ',
		Operator = ' ',
		TypeParameter = ' ',
	},
	mappings = {
		["o"] = actions.parent(),
		["m"] = actions.children(),
	},
	source_buffer = {
		follow_node = true, -- Keep the current node in focus on the source buffer
		highlight = true, -- Highlight the currently focused node
		reorient = "smart", -- "smart", "top", "mid" or "none"
		scrolloff = nil -- scrolloff value when navbuddy is open
	}
}
