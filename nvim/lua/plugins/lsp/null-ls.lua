local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		-- formatting
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.fixjson,
		-- diagnostics
		diagnostics.flake8,
        diagnostics.eslint_d.with({ -- js/ts linter
        -- only enable eslint if root has .eslintrc.js (not in youtube nvim video)
                condition = function(utils)
                return utils.root_has_file(".eslintrc.js") -- change file extension if you use something else
            end,
        }),
		-- code actions
		-- hover
	},
})
