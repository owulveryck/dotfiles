return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = false,
        config = function()
            require("codecompanion").setup({
                adapters = {
                    litellm = function()
                        return require("codecompanion.adapters").extend("openai", {
                            name = "litellm", -- Give this adapter a different name to differentiate it from the default ollama adapter
                            url = "http://localhost:4000/v1/chat/completions",
                            env = {
                                api_key = "sk-1234",
                            },
                            num_ctx = {
                                default = 4096,
                            },
                            schema = {
                                model = {
                                    default = "gemini-1.5-pro",
                                },
                            },
                        })
                    end,
                },
                strategies = {
                    -- Change the default chat adapter
                    chat = {
                        adapter = "litellm",
                    },
                    inline = {
                        adapter = "litellm",
                    },
                    agent = {
                        adapter = "litellm",
                    },
                },
                opts = {
                    -- Set debug logging
                    log_level = "DEBUG",
                },
            })
        end,
        init = function() end,
    },
}
