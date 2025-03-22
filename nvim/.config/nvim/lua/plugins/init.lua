return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("lspconfig").volar.setup {}
    end,
  },
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
      require("nvterm").setup {
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.1,
              col = 0.05,
              width = 0.9,
              height = 0.75,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "vue",
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
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-jest" {
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.json",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
          require "neotest-vitest",
        },
      }
    end,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
    },
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
