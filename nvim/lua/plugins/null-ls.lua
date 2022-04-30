local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        -- Lua
        null_ls.builtins.formatting.stylua, -- lua
        -- Git
        null_ls.builtins.code_actions.gitsigns,
        --  Prettier
        null_ls.builtins.formatting.prettierd, --mais rapido
        -- Eslint
        null_ls.builtins.code_actions.eslint_d, -- mais rápido
        null_ls.builtins.diagnostics.eslint_d, 
        null_ls.builtins.formatting.eslint_d,

        -- Editorconfig
        null_ls.builtins.diagnostics.editorconfig_checker, -- { "editorconfig"}
        
        -- Yaml
        --null_ls.builtins.diagnostics.yamllint,

        -- CSS,
        null_ls.builtins.diagnostics.stylelint,
        null_ls.builtins.formatting.stylelint,
        null_ls.builtins.diagnostics.stylint,
        null_ls.builtins.formatting.rustywind, -- CLI for organizing Tailwind CSS classes.
        
        --Markdown
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.diagnostics.alex,
        null_ls.builtins.formatting.terrafmt, --terraform

        -- dart
        null_ls.builtins.formatting.dart_format,

        -- other
        null_ls.builtins.formatting.clang_format, -- { "c", "cpp", "cs", "java" }
        -- null_ls.builtins.diagnostics.semgrep, -- { "typescript", "typescriptreact", "ruby", "python", "java", "go" }
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
