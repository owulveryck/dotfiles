return {
    {
        "dhruvasagar/vim-table-mode",
        ft = "markdown",
        config = function()
            vim.g.table_mode_map_prefix = "<Leader>t"
        end,
    },
}
