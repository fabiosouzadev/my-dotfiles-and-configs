return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opts = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local cmp = require("cmp")
            return {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "cmp_tabnine" },
                }),
                experimental = {
                    ghost_text = {
                        hl_group = "LspCodeLens",
                    },
                },
            }
        end,
        dependencies = {
            "cmp-nvim-lsp",
            "cmp-buffer",
            "cmp-path",
            "cmp_luasnip",
            "cmp-treesitter",
            "copilot.vim"
        },

    },
    { "hrsh7th/cmp-nvim-lsp", lazy = true},
    { "hrsh7th/cmp-buffer", lazy = true},
    { "hrsh7th/cmp-path", lazy = true},
    { "saadparwaiz1/cmp_luasnip", lazy = true},
    { "ray-x/cmp-treesitter", lazy = true},
    { "github/copilot.vim",lazy = true},
    {
        'tzachar/cmp-tabnine',
        build='./install.sh',
        requires = 'nvim-cmp',
        lazy = true,
    },
    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        config = function()
            require("luasnip.loaders.from_lua").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
        dependencies = { "friendly-snippets" },
    },
    {
        "rafamadriz/friendly-snippets",
        lazy = true,
    },
}
