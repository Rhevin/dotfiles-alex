local plugin = require "telescope"
local actions = require "telescope.actions"

local extensions = {
    "file_browser",
}

plugin.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = true,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "%.git/", "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = {
                ["<D-h>"] = actions.file_split,
                ["<D-n>"] = actions.file_vsplit,
                ["<C-t>"] = actions.preview_scrolling_up,
                ["<C-h>"] = actions.preview_scrolling_down,
                ["q"] = actions.close,
            },
            i = {
                ["<D-h>"] = actions.file_split,
                ["<D-n>"] = actions.file_vsplit,
                ["<C-t>"] = actions.preview_scrolling_up,
                ["<C-h>"] = actions.preview_scrolling_down,
            },
        },
    },
    extensions_list = extensions,
}

pcall(function()
    for _, ext in ipairs(extensions) do
        plugin.load_extension(ext)
    end
end)
