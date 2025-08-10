return {
  {
    "echasnovski/mini.comment",
    opts = {
      mappings = {
        comment = "<leader>/",
        comment_line = "<leader>/",
        textobject = "gc",
      },
    },
    keys = {
      -- remap visual mode as a command to preserve original behavior with `gc` keys
      {
        "<leader>/",
        function()
          local start_line = vim.fn.line("v")
          local end_line = vim.fn.line(".")
          require("mini.comment").toggle_lines(start_line, end_line)
        end,
        mode = "x",
        desc = "Toggle comment (visual)",
      },
    },
  },
}
