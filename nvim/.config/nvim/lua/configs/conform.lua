return {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettier" },
        html = { "prettier" },
        python = { "ruff_format", "ruff_fix" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt" },
        sh = { "shfmt", prepend_args = { "-i", "4" } },
    },

    format_on_save = {
        -- These options are passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
