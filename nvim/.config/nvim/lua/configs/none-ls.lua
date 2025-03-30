local diag = require("null-ls").builtins.diagnostics
-- local fmt = require("null-ls").builtins.formatting

return {
    sources = {
        diag.mypy,
        diag.checkmake,
        -- diagnostics.ruff,
    },
}
--
-- local null_ls = require "null-ls"
-- local formatting = null_ls.builtins.formatting -- for formatters
-- local diagnostics = null_ls.builtins.diagnostics -- for linters
--
-- require("mason-null-ls").setup {
--     ensure_installed = {
--         "checkmake",
--         "prettier", -- ts/js fmt
--         "stylua", -- lua fmt
--         "eslint_d", -- ts/js lint
--         "shfmt", -- bash lint
--         "ruff",
--         "rustfmt",
--     },
--     -- auto-install configured formatters & linters (with null-ls)
--     automatic_installation = true,
-- }
--
-- local sources = {
--     diagnostics.checkmake,
--     formatting.prettier.with { filetypes = { "html", "json", "yaml", "markdown" } },
--     formatting.stylua,
--     formatting.shfmt.with { args = { "-i", "4" } },
--     formatting.terraform_fmt,
--     require "none-ls.formatting.ruff",
--     require "none-ls.formatting.ruff_format",
-- }
--
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require("null-ls").setup {
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--         if client.supports_method "textDocument/formatting" then
--             vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
--                     vim.lsp.buf.format { async = false }
--                     -- vim.lsp.buf.formatting_sync()
--                 end,
--             })
--         end
--     end,
-- }
