return {
    "garymjr/nvim-snippets",
    event = "InsertEnter",
    opts = function(_, o)
        o.extended_filetypes = {
            cue = { "cue" },
            typescript = { "javascript", "tsdoc" },
            javascript = { "jsdoc" },
            html = { "css", "javascript" },
            lua = { "luadoc" },
            python = { "python-docstring" },
            java = { "javadoc", "java-testing" },
            sh = { "shelldoc" },
            php = { "phpdoc" },
            ruby = { "rdoc" },
            quarto = { "markdown" },
            rmarkdown = { "markdown" },
        }
        -- location used to find `package.json` or snippets with valid file/folder structure
        o.search_paths = { vim.fn.stdpath("config") .. "/snippets" }
    end,
    keys = {
        {
            "<Tab>",
            function()
                if vim.snippet.active({ direction = 1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(1)
                    end)
                    return
                end
                return "<Tab>"
            end,
            expr = true,
            silent = true,
            mode = "i",
        },
        {
            "<Tab>",
            function()
                vim.schedule(function()
                    vim.snippet.jump(1)
                end)
            end,
            expr = true,
            silent = true,
            mode = "s",
        },
        {
            "<S-Tab>",
            function()
                if vim.snippet.active({ direction = -1 }) then
                    vim.schedule(function()
                        vim.snippet.jump(-1)
                    end)
                    return
                end
                return "<S-Tab>"
            end,
            expr = true,
            silent = true,
            mode = { "i", "s" },
        },
    },
}
