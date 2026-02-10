# 🌌 Midnight Neon Pine

A bespoke "Super-Theme" for Neovim that merges the legendary eye-comfort of **Night Owl**, the neon energy of **Tokyo Night**, and the dreamy sophistication of **Rosé Pine**.

This theme was engineered for developers who want the deep-sea depth of a navy background without sacrificing the vibrant, high-contrast syntax highlighting required for modern TypeScript and web development.

## ✨ The Hybrid Philosophy

* **The Foundation:** Built on the authentic `#011627` background from Sarah Drasner's **Night Owl**.
* **The Neons:** Functions and constants use the iconic **Night Owl** Purples and Seafoams.
* **The Logic:** Keywords and access modifiers use **Rosé Pine's** signature pinks to separate "control flow" from "data."
* **The Punch:** Strings and variables utilize **Tokyo Night’s** high-luminance greens and cyans to cut through the navy canvas.

## 📸 Preview

> [!TIP]
> This theme is optimized for fonts with strong italic support (like JetBrains Mono, Dank Mono, or Operator Mono) to highlight access modifiers like `public`, `private`, and `readonly`.

## 📦 Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  {
    "rose-pine/neovim",
    name = "midnight-neon-pine",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "main",
      styles = {
        bold = true,
        italic = true,
        transparency = false, -- Set to true to use your terminal's background
      },
      palette = {
        main = {
          base = "#011627",
          surface = "#011f35",
          overlay = "#0b2942",
          muted = "#637777",
          subtle = "#82aaff",
          iris = "#c792ea",
          pine = "#7fdbca",
          foam = "#7dcfff",
          leaf = "#c3e88d",
          rose = "#ff7eb6",
          love = "#ff5189",
          gold = "#ecc48d",
        },
      },
      highlight_groups = {
        Visual = { bg = "#2d4f67", inherit = false },
        CursorLine = { bg = "#022a44" },
        ["@keyword.modifier"] = { fg = "#ff7eb6", italic = true },
        ["@function"] = { fg = "#c792ea" },
        ["@type"] = { fg = "#ecc48d" },
        ["@type.definition"] = { fg = "#ecc48d", bold = true },
        ["@string"] = { fg = "#c3e88d" },
        ["@variable.member"] = { fg = "#7dcfff" },
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
      vim.cmd("colorscheme rose-pine")

      -- Transparency Support
      if opts.styles.transparency then
        local hl = vim.api.nvim_set_hl
        hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
        hl(0, "NormalFloat", { bg = "#011f35" })
      end
    end,
  },
}
