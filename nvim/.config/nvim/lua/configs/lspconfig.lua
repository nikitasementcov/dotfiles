-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "eslint", "ts_ls", "clangd" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

local function on_attach(client, bufnr)
  local buf_map = function(bufnr, mode, lhs, rhs, opts)
    opts = vim.tbl_extend("keep", opts or {}, {
      noremap = true,
      silent = true,
    })
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end

  -- Rename symbol
  buf_map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")

  -- Organize imports
  buf_map(bufnr, "n", "<leader>oi", "<cmd>TSLspOrganize<CR>")

  -- Rename file and update imports
  buf_map(bufnr, "n", "<leader>rf", "<cmd>TSLspRenameFile<CR>")

  -- Add missing imports
  buf_map(bufnr, "n", "<leader>mi", "<cmd>TSLspImportAll<CR>")
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- local function rename_file()
--   local source_file, target_file
--
--   vim.ui.input({
--     prompt = "Source : ",
--     completion = "file",
--     default = vim.api.nvim_buf_get_name(0),
--   }, function(input)
--     source_file = input
--   end)
--   vim.ui.input({
--     prompt = "Target : ",
--     completion = "file",
--     default = source_file,
--   }, function(input)
--     target_file = input
--   end)
--
--   local params = {
--     command = "_typescript.applyRenameFile",
--     arguments = {
--       {
--         sourceUri = source_file,
--         targetUri = target_file,
--       },
--     },
--     title = "",
--   }
--
--   vim.lsp.util.rename(source_file, target_file)
--   vim.lsp.buf.execute_command(params)
-- end
--
-- require("lspconfig").ts_ls.setup {
--   commands = {
--     RenameFile = {
--       rename_file,
--       description = "Rename File",
--     },
--   },
-- }

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
