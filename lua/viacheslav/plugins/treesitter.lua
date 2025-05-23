return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "tsx",
                "lua",
                "rust",
                "jsdoc",
                "bash",
                "html",
                "json",
                "yaml",
                "markdown",
                "markdown_inline",
                "css",
                'python',
                'regex',
                'terraform',
                'sql',
                'dockerfile',
                'toml',
                'java',
                'go',
                'gitignore',
                'markdown',
                'markdown_inline',
                'bash',
                'css',
                'html',
            },
            sync_install = false,
            auto_install = true,
            indent = {
                enable = true
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            fold = { enable = true }
        })
    end
}
