return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    -- keymaps in mappings config
  },

  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
      },
      indent = {
        enable = true,
        -- disable = {
        --   "python"
        -- },
      },
    },
  },
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.formatter"
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("typescript").setup {
        disable_commands = false, -- Prevents the plugin from creating Vim commands
        debug = false, -- Enable debug logging for commands
        server = { -- Pass options to lspconfig's setup method
          on_attach = function(client, bufnr)
            local opts = { noremap = true, silent = true }

            -- Rename symbol
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)

            -- Organize imports
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)

            -- Rename file and update imports
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)

            -- Add missing imports
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>mi", ":TypescriptAddMissingImports<CR>", opts)

            -- Remove unused imports
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts)

            -- Additional keybindings can be added here
          end,
          capabilities = require("cmp_nvim_lsp").default_capabilities(),
        },
      }
    end,
  },
}
