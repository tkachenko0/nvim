return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            settings = {
                -- save_on_toggle = true,
                sync_on_ui_close = true,
            },
            display = function(list_item)
                local path = list_item.value
                local filename = vim.fn.fnamemodify(path, ":t") -- file.ext
                local dirname = vim.fn.fnamemodify(path, ":p:h:t") -- last directory
                return string.format("%s / %s", dirname, filename)
            end,
        })

        local harpoon_extensions = require("harpoon.extensions")
        harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

        vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end)
        vim.keymap.set("n", "<A-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end,
}
