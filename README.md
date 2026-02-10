# 🌌 Midnight Neon Pine

A high-visibility, "Super-Theme" configuration for Neovim. This is a bespoke hybrid that merges the legendary eye-comfort of **Night Owl**, the neon energy of **Tokyo Night**, and the dreamy sophistication of **Rosé Pine**.

Unlike standard themes, `Midnight Neon Pine` is semantically engineered to separate "Control" (Keywords) from "Data" (Variables/Types) using a tri-color palette logic.

## ✨ Philosophy

- **The Foundation:** Built on the authentic `#011627` background from **Night Owl**.
- **The Glow:** Functions and constants use the iconic **Night Owl** Purples (`#c792ea`) and Seafoams (`#7fdbca`).
- **The Logic:** Keywords use **Rosé Pine's** warm pinks (`#ff7eb6`) to distinguish control flow from data.
- **The Punch:** Strings and properties use **Tokyo Night’s** high-luminance green and sky blue.

## 📸 Interface Preview



## 📦 Installation (LazyVim / lazy.nvim)

Simply create `lua/plugins/theme.lua` and paste the following. This configuration skins the `rose-pine` engine into the `Midnight Neon Pine` hybrid.

```lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  opts = {
    variant = "main",
    dark_variant = "main",
    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },

    -- Full Palette Override for UI Consistency
    palette = {
      main = {
        base = "#011627",    -- Night Owl Background
        surface = "#011f35", -- Night Owl Sidebar
        overlay = "#0b2942", -- Floating Windows/Selection
        muted = "#637777",   -- Night Owl Comments
        subtle = "#82aaff",  -- Night Owl Punctuation
        rose = "#ff7eb6",    -- Rosé Pine Keywords
        pine = "#7fdbca",    -- Night Owl Seafoam
        foam = "#7dcfff",    -- Tokyo Sky Blue
        iris = "#c792ea",    -- Night Owl Purple
        leaf = "#c3e88d",    -- Tokyo Leaf Green
        love = "#ff5189",    -- Neon Pink
        gold = "#ecc48d",    -- Night Owl Gold
      },
    },

    -- UI Group Mapping
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
      git_add = "leaf",
      git_change = "foam",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",
    },

    -- Syntax & Tree-sitter Refinements
    highlight_groups = {
      Visual = { bg = "#2d4f67", inherit = false },
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
      CursorLine = { bg = "#022a44" },
      StatusLine = { fg = "subtle", bg = "overlay" },
      TelescopeNormal = { bg = "surface" },
      TelescopeBorder = { fg = "overlay", bg = "surface" },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}
