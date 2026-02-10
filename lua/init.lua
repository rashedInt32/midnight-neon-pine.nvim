return {
	"rose-pine/neovim",
	name = "midnight-neon-pine",
	lazy = false,
	priority = 1000,
	opts = {
		variant = "main",
		dark_variant = "main",
		styles = {
			bold = true,
			italic = true,
			transparency = false, -- Locked for brand consistency
		},

		-- 1. THE PALETTE: This colors the WHOLE UI (Sidebars, Status, Tabs)
		palette = {
			main = {
				base = "#011627", -- Night Owl Background
				surface = "#011f35", -- Night Owl Sidebar
				overlay = "#0b2942", -- Floating Windows/Selection

				muted = "#637777", -- Night Owl Comments
				subtle = "#82aaff", -- Night Owl Punctuation

				rose = "#ff7eb6", -- Rosé Pine Keywords
				pine = "#7fdbca", -- Night Owl Seafoam
				foam = "#7dcfff", -- Tokyo Sky Blue
				iris = "#c792ea", -- Night Owl Purple
				leaf = "#c3e88d", -- Tokyo Leaf Green
				love = "#ff5189", -- Neon Pink
				gold = "#ecc48d", -- Night Owl Gold
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
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd("colorscheme rose-pine")

		-- Check for transparency toggle
		if opts.styles.transparency then
			local hl = vim.api.nvim_set_hl
			hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
		end
	end,
}
