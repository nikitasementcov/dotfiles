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
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- Extend the default options with custom settings
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        prompt_prefix = "🔍 ",
        path_display = { "smart" },
      })
      opts.pickers = {
        live_grep = {
          file_ignore_patterns = { "node_modules", ".git" },
          additional_args = function(_)
            return { "--hidden" }
          end,
        },
        find_files = {
          file_ignore_patterns = { "node_modules", ".git" },
          hidden = true,
        },
      }
      return opts
    end,
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
  -- {
  --   "stevearc/oil.nvim",
  --   ---@module 'oil'
  --   ---@type oil.SetupOpts
  --   opts = {},
  --   -- Optional dependencies
  --   dependencies = { { "echasnovski/mini.icons", opts = {} } },
  --   -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  -- },
  -- {
  --   "antosha417/nvim-lsp-file-operations",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-tree.lua",
  --   },
  --   config = function()
  --     require("lsp-file-operations").setup()
  --   end,
  -- },
}
