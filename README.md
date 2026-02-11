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
      transparency = false,
    },

    palette = {
      main = {
        base = "#011627", -- Night Owl Background
        surface = "#011f35",
        overlay = "#0b2942",
        muted = "#637777", -- Night Owl Slate Comments
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

    -- We removed 'border = "overlay"' from here to let Rose Pine decide
    groups = {
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
    },

    highlight_groups = {
      -- 1. THE COMMENT FIX
      ["@comment"] = { fg = "#637777", italic = true },
      ["Comment"] = { fg = "#637777", italic = true },
      ["@lsp.type.comment"] = { fg = "#637777" },

      -- 2. SYNTAX REFINEMENTS
      Visual = { bg = "#1d3b53", inherit = false },
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
      CursorLine = { bg = "#021320" },
      LineNr = { fg = "#3b4261" },
      CursorLineNr = { fg = "subtle", bold = true },

      -- 4. BORDER FIX (VERTICAL SPLITS)
      -- Using Rose Pine's internal 'muted' or 'highlight_med' for splits
      WinSeparator = { fg = "#3b4261", bg = "NONE" },

      -- REMOVED: NormalFloat and FloatBorder overrides to return to defaults
    },
  },
    config = function(_, opts)
    require("rose-pine").setup(opts)
    vim.cmd("colorscheme rose-pine")
  end,
}

## 📸 Screenshots

### Go
<img src="./screenshots/go.png" alt="Go Example" width="100%">

### Python
<img src="./screenshots/py.png" alt="Python Example" width="100%">

### Rust
<img src="./screenshots/rs.png" alt="Rust Example" width="100%">

### TypeScript
<img src="./screenshots/ts.png" alt="TypeScript Example" width="100%">

### React (TSX)
<img src="./screenshots/tsx.png" alt="React TSX Example" width="100%">
