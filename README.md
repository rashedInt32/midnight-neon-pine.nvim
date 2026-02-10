# 🌌 Midnight Neon Pine

A bespoke "Super-Theme" configuration for Neovim. This is a high-performance hybrid that merges the deep-sea comfort of **Night Owl**, the neon energy of **Tokyo Night**, and the dreamy sophistication of **Rosé Pine**.

This isn't a new plugin to maintain—it's a **Configuration Recipe** that skins the `rose-pine` engine into a high-contrast masterpiece.

## ✨ Why this hybrid?

- **The Foundation:** Locked to the authentic `#011627` background from **Night Owl**.
- **The Glow:** Functions and methods use the iconic **Night Owl** Purple (`#c792ea`).
- **The Logic:** Access modifiers (`public`, `private`) use **Rosé Pine's** pinks to separate "Control" from "Data."
- **The Recess:** Comments use the specific **Night Owl** Slate-Teal (`#637777`) so they don't distract from your code.

## 🚀 Installation (LazyVim / lazy.nvim)

Simply create or overwrite `~/.config/nvim/lua/plugins/theme.lua` with the following block:

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
      transparency = false, -- Locked for Night Owl brand consistency
    },

    -- Full Palette Override for UI Consistency
    palette = {
      main = {
        base = "#011627",    -- Night Owl Background
        surface = "#011f35", -- Sidebar/Panel Background
        overlay = "#0b2942", -- Floating Windows
        muted = "#637777",   -- Night Owl Slate Comments
        subtle = "#82aaff",  -- Night Owl Punctuation
        rose = "#ff7eb6",    -- Rosé Pink (Keywords)
        pine = "#7fdbca",    -- Night Owl Seafoam (Constants)
        foam = "#7dcfff",    -- Tokyo Sky (Variables)
        iris = "#c792ea",    -- Night Owl Purple (Functions)
        leaf = "#c3e88d",    -- Tokyo Green (Strings)
        love = "#ff5189",    -- Neon Pink (Errors)
        gold = "#ecc48d",    -- Night Owl Gold (Types)
      },
    },

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

    highlight_groups = {
      -- 1. THE COMMENT FIX (Recedes into background)
      ["@comment"] = { fg = "#637777", italic = true },
      ["Comment"] = { fg = "#637777", italic = true },
      ["@lsp.type.comment"] = { fg = "#637777" },

      -- 2. SYNTAX REFINEMENTS
      Visual = { bg = "#2d4f67", inherit = false },
      ["@keyword.modifier"] = { fg = "rose", italic = true },
      ["@function"] = { fg = "iris" },
      ["@type"] = { fg = "gold" },
      ["@type.definition"] = { fg = "gold", bold = true },
      ["@string"] = { fg = "leaf" },
      ["@variable.member"] = { fg = "foam" },
      ["@property"] = { fg = "foam" },
      ["@constant"] = { fg = "pine" },
      ["@boolean"] = { fg = "pine" },

      -- 3. UI ACCENTS
      CursorLine = { bg = "#022a44" },
      LineNr = { fg = "#3b4261" },
      CursorLineNr = { fg = "subtle", bold = true },

      -- Better Floating Windows
      NormalFloat = { bg = "surface" },
      FloatBorder = { fg = "overlay", bg = "surface" },
    },
  },
  config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}
