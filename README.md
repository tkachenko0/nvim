# Noevim RC

This is my personal Neovim setup, heavily inspired by [ThePrimeagen's](https://github.com/ThePrimeagen/neovimrc) configuration.

Part of my [Dotfiles repo](https://github.com/tkachenko0/dotfiles).

This is my personal Neovim setup, heavily inspired by [ThePrimeagen's](https://github.com/ThePrimeagen/neovimrc) configuration.

A fast, modular Neovim configuration powered by lazy.nvim. Features full TypeScript development support with Prettier and ESLint integration, git status with Gitsigns, environment variable hiding with Cloak, advanced search with Telescope, powerful syntax highlighting with Treesitter, diagnostics with Trouble, session management with Undotree, fast navigation with Harpoon, and more.

Here’s the refactored and expanded list of features, grouped by category and clearly labeled for readability:

## Features

### Core Development Tools

- **LSP** support for intelligent code completion, diagnostics, and refactoring.
- **Telescope** for powerful fuzzy finding and live grep.
- **Treesitter** for advanced syntax highlighting and code understanding.
- **Undotree** for visual undo history and session management.
- **Trouble** for managing LSP diagnostics, references, and quickfixes.

### 🛠Language & Framework Support

- **TypeScript / JavaScript** with full Prettier + ESLint integration
- **Python** support with `pyright`, `isort`, and `black`
- **Angular** development support with relevant LSP and formatting
- **LSP** tooling is configured for smooth integration across multiple languages

### Linters & Formatters

- **ESLint** for JavaScript/TypeScript linting
- **Prettier** for consistent formatting (JS/TS/HTML/CSS)
- **Black** and **isort** for Python formatting
- **Diffview** to visualize git diffs within Neovim

### Git & Secrets

- **Gitsigns** for inline git status and blame
- **Diffview** for reviewing diffs and history
- **Cloak** to hide sensitive environment variables in `.env` files

## Inspirations

- [ThePrimeagen's Neovim Config](https://github.com/ThePrimeagen/neovimrc)
