return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters = {
                ["markdownlint-cli2"] = {
                    args = { "--config", "/Users/olivier.wulveryck/.markdownlint-cli2.yaml", "--" },
                },
                markdownlint = {
                    args = {
                        "--disable",
                        "MD013",
                        "--config",
                        "/Users/olivier.wulveryck/.markdownlint.jsonc",
                        "--",
                    },
                },
            },
        },
    },
}
