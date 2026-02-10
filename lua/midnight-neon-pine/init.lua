local M = {}

-- We define the configuration inside the plugin itself
M.defaults = {
	variant = "main",
	dark_variant = "main",
	styles = { bold = true, italic = true, transparency = false },
	palette = {
		main = {
			base = "#011627",
			surface = "#011f35",
			overlay = "#0b2942",
			muted = "#637777", -- Authentic Night Owl Comments
			subtle = "#82aaff",
			rose = "#ff7eb6",
			pine = "#7fdbca",
			foam = "#7dcfff",
			iris = "#c792ea",
			leaf = "#c3e88d",
			love = "#ff5189",
			gold = "#ecc48d",
		},
	},
	-- 2. GROUPS: Mapping roles to our specific colors
	groups = {
		border = "overlay",
		link = "iris",
		panel = "surface",

		error = "love",
		hint = "iris",
		info = "foam",
		note = "pine",
		todo = "rose",
		warn = "gold",

		git_add = "leaf", -- Tokyo Green for Git Add
		git_change = "foam", -- Tokyo Blue for Git Change
		git_delete = "love", -- Neon Pink for Git Delete
		git_dirty = "rose",
		git_ignore = "muted",
		git_merge = "iris",
		git_rename = "pine",
		git_stage = "iris",
		git_text = "rose",
		git_untracked = "subtle",
	},

	-- 3. HIGHLIGHT GROUPS: Final Syntax & Tree-sitter Polish
	highlight_groups = {
		-- 1. THE COMMENT FIX
		-- Force comments to use the specific Night Owl Slate
		["@comment"] = { fg = "#637777", italic = true },
		["Comment"] = { fg = "#637777", italic = true },

		-- Special handling for JSDoc/Documentation
		["@lsp.type.comment"] = { fg = "#637777" },
		["@comment.documentation"] = { fg = "#637777" },
		-- Visual Selection Block
		Visual = { bg = "#2d4f67", inherit = false },

		-- Core Syntax
		["@keyword.modifier"] = { fg = "rose", italic = true },
		["@function"] = { fg = "iris" },
		["@function.builtin"] = { fg = "iris", italic = true },
		["@type"] = { fg = "gold" },
		["@type.definition"] = { fg = "gold", bold = true },
		["@string"] = { fg = "leaf" },
		["@variable.member"] = { fg = "foam" },
		["@property"] = { fg = "foam" },
		["@constant"] = { fg = "pine" },
		["@boolean"] = { fg = "pine" },

		-- UI Elements
		CursorLine = { bg = "#022a44" },
		StatusLine = { fg = "subtle", bg = "overlay" },
		TelescopeNormal = { bg = "surface" },
		TelescopeBorder = { fg = "overlay", bg = "surface" },
	},
}

function M.setup(user_opts)
	-- This merges user preferences with your "Midnight Neon Pine" defaults
	local final_opts = vim.tbl_deep_extend("force", M.defaults, user_opts or {})

	-- This tells the rose-pine engine to use YOUR colors
	require("rose-pine").setup(final_opts)

	-- This actually applies the theme
	vim.cmd("colorscheme rose-pine")
end

return M
