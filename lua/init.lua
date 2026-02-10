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
			transparency = false, -- Defaults to solid Night Owl blue for the "Brand" look
		},

		palette = {
			main = {
				-- THE NIGHT OWL CANVAS
				base = "#011627",
				surface = "#011f35",
				overlay = "#0b2942",

				-- SYNTAX: The Best of Three Worlds
				muted = "#637777", -- Night Owl Gray-Teal (Comments)
				subtle = "#82aaff", -- Night Owl Sky Blue (Punctuation)

				-- Night Owl "Glow" Colors
				iris = "#c792ea", -- Authentic Night Owl Purple (Functions)
				pine = "#7fdbca", -- Authentic Night Owl Seafoam (Booleans/Tags)

				-- Tokyo Night "Neon" Colors
				foam = "#7dcfff", -- Tokyo Sky (Variables/Properties)
				leaf = "#c3e88d", -- Tokyo Green (Strings)

				-- Rosé Pine "Vibe" Colors
				rose = "#ff7eb6", -- Rosé Pink (Keywords/Modifiers)
				love = "#ff5189", -- Neon Pink (Errors)
				gold = "#ecc48d", -- Night Owl Yellow-Gold (Types)
			},
		},

		highlight_groups = {
			-- 1. ACCESS MODIFIERS (Rose Pink + Italics)
			["@keyword.modifier"] = { fg = "#ff7eb6", italic = true },
			["@keyword.function"] = { fg = "#ff7eb6" },

			-- 2. THE PURPLE GLOW (Functions & Methods)
			["@function"] = { fg = "#c792ea" },
			["@method"] = { fg = "#c792ea" },
			["@function.builtin"] = { fg = "#c792ea", italic = true },

			-- 3. THE "CYAN" ELEMENTS
			["@constant"] = { fg = "#7fdbca" },
			["@boolean"] = { fg = "#7fdbca" },
			["@tag"] = { fg = "#7fdbca" },

			-- 4. TYPES & INTERFACES (The Honey Gold)
			["@type"] = { fg = "#ecc48d" },
			["@type.definition"] = { fg = "#ecc48d", bold = true },

			-- 5. UI ELEMENTS
			Visual = { bg = "#2d4f67", inherit = false },
			CursorLine = { bg = "#022a44" },
			Search = { bg = "#7dcfff", fg = "#011627" },
		},
	},
	config = function(_, opts)
		require("rose-pine").setup(opts)
		vim.cmd("colorscheme rose-pine")

		-- Ensure transparency toggle works for the user
		if opts.styles.transparency then
			local hl = vim.api.nvim_set_hl
			hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
			hl(0, "NormalFloat", { bg = "#011f35" }) -- Keep floats solid for legibility
		end
	end,
}
