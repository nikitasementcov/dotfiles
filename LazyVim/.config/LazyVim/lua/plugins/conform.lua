return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", "oxfmt", stop_after_first = true },
        javascriptreact = { "prettier", "oxfmt", stop_after_first = true },
        typescript = { "prettier", "oxfmt", stop_after_first = true },
        typescriptreact = { "prettier", "oxfmt", stop_after_first = true },
        vue = { "prettier", "oxfmt", stop_after_first = true },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        json = { "prettier", "oxfmt", stop_after_first = true },
        jsonc = { "prettier", "oxfmt", stop_after_first = true },
        yaml = { "prettier" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
      },
    },
  },
}
