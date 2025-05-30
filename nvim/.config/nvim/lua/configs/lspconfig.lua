require("nvchad.configs.lspconfig").defaults() -- load defaults i.e lua_lsp
-- require("mason").setup()
-- require("mason-lspconfig").setup()

-- local node_path = vim.fn.trim(vim.fn.system "asdf which node")

-- vim.lsp.set_log_level "debug"

-- local node_version = vim.fn.trim(vim.fn.system "node -v")

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- local mason_registry = require "mason-registry"
-- local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
-- .. "/node_modules/@vue/language-server"
-- local vue_language_server_path = vim.fn.expand "$MASON/packages" .. "/vue-language-server"
-- local vue_language_server_path = vim.fn.expand "$MASON/packages"
--   .. "/vue-language-server/node_modules/@vue/language-server"
-- local vue_language_server_path = vim.fn.stdpath "data"
--   .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
-- local vue_language_server_path = vim.fn.expand "~"
--   .. "/.asdf/installs/nodejs/"
--   .. string.sub(node_version, 2)
--   .. "/lib/node_modules/@vue/language-server"

lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- init_options = {
  --   plugins = {
  --     {
  --       name = "@vue/typescript-plugin",
  --       location = vue_language_server_path,
  --       languages = { "vue" },
  --     },
  --   },
  -- },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    -- "vue",
  },
}

-- lspconfig.vue_ls.setup {
--   cmd = { node_path, vue_language_server_path, "--stdio" },
--   init_options = {
--     typescript = {
--       tsdk = "/Users/ns/.asdf/installs/nodejs/20.18.1/lib/node_modules/typescript/lib",
--     },
--   },
-- }
-- lspconfig.vue_ls.setup {
--   cmd = { node_path, vue_language_server_path, "--stdio" },
-- }
-- lspconfig.volar.setup {
--   cmd = { node_path, vue_language_server_path, "--stdio" },
--   init_options = {
--     typescript = {
--       tsdk = "/Users/ns/.asdf/installs/nodejs/20.18.1/lib/node_modules/typescript/lib",
--     },
--   },
-- }
-- lspconfig.vuels.setup {}

lspconfig.volar.setup {
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}

lspconfig.emmet_language_server.setup {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
    "less",
    "sass",
    "scss",
    "pug",
    "typescriptreact",
    "typescript",
    "vue",
  },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
}

-- DEFAULT LSP configs:
local servers = { "html", "cssls", "eslint", "clangd" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
