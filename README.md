# Neovim Configuration

[![Made with ÔØñ´©Å in Neovim](https://img.shields.io/badge/Made%20with-%E2%9D%A4%EF%B8%8F%20in%20Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

This is my personal Neovim setup, heavily inspired by [ThePrimeagen's](https://github.com/ThePrimeagen/neovimrc) configuration.

A fast, modular Neovim configuration powered by lazy.nvim. Features full TypeScript development support with Prettier and ESLint integration, git status with Gitsigns, environment variable hiding with Cloak, advanced search with Telescope, powerful syntax highlighting with Treesitter, diagnostics with Trouble, session management with Undotree, fast navigation with Harpoon, and more.

![image](https://github.com/user-attachments/assets/5f1fb7a1-b763-476b-8b59-a0e6986d4371)

## Structure

```
├── init.lua
├── lazy-lock.json
├── lua/
│   └── theprimeagen/
│       ├── init.lua
│       ├── lazy/
│       │   ├── autopairs.rc.lua
│       │   ├── cloak.lua
│       │   ├── colors.lua
│       │   ├── conform.lua
│       │   ├── filetree.lua
│       │   ├── fugitive.lua
│       │   ├── gitsigns.lua
│       │   ├── harpoon.lua
│       │   ├── init.lua
│       │   ├── lsp.lua
│       │   ├── lualine.rc.lua
│       │   ├── telescope.lua
│       │   ├── treesitter.lua
│       │   ├── trouble.lua
│       │   └── undotree.lua
│       ├── lazy_init.lua
│       ├── remap.lua
│       └── set.lua
└── README.md
```

---

## Prerequisites

Make sure you have the following installed:

- **ripgrep** (for Telescope search, etc.)
  ```bash
  sudo apt install ripgrep
  ```

- **gcc** (needed for building certain plugins; install if not already available)
  ```bash
  sudo apt install gcc
  ```

- **Node.js** (some LSP servers and plugins require Node)
  
- **luarocks** (for managing Lua packages)
  ```bash
  sudo apt install luarocks
  ```

---

## Setup

1. Install [Neovim 0.9+](https://github.com/neovim/neovim/wiki/Installing-Neovim) if you don't have it already.

2. Clone this repository into your Neovim config directory:
   ```bash
   git clone <this-repo-url> ~/.config/nvim
   ```

3. Open Neovim and it will automatically install plugins using [lazy.nvim](https://github.com/folke/lazy.nvim).

4. Enjoy your new Neovim setup!

---

## Notes

- First-time setup might take a bit to install all plugins.
- If you encounter any missing language servers, you can install them easily with tools like [mason.nvim](https://github.com/williamboman/mason.nvim) (already configured if you explore the LSP settings).

---

## Inspirations

- [ThePrimeagen's Neovim Config](https://github.com/ThePrimeagen/neovimrc)
