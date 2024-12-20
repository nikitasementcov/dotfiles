require "nvchad.mappings"

local map = vim.keymap.set

-- General mappings

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Enter command mode
map("n", ";", ":", { desc = "enter command mode", nowait = true })

-- Close buffer
map("n", "<leader>q", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "Close buffer" })

-- Save file (overwrite nvchad 'w' letter mapping)
map("n", "<leader>w", "<cmd> w <CR>", { desc = "Save file" })

-- Diagnostics (overwrite nvchad 'q' letter mapping)
map("n", "<leader>Q", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })

-- LSP Code Actions
map("n", "<leader>la", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP code action" })

-- LSP formatting (overwrite formatting)
map("n", "<leader>fM", function()
  vim.lsp.buf.format { async = true }
end, { desc = "Format (LSP)" })

-- Formatting
map("n", "<leader>fm", ":FormatWrite<CR>", { desc = "Format and write" })
map("n", "<leader>f,", ":%s/\\r//g<CR>", { desc = "Remove Win linebreaks (CR)" })

-- Splits
map("n", "|", "<cmd>:vsplit <CR>", { desc = "Vertical Split" })

-- Resize splits
map("n", "<C-w>h", ":vertical resize -5<CR>", { desc = "Resize window left" })
map("n", "<C-w>l", ":vertical resize +5<CR>", { desc = "Resize window right" })
map("n", "<C-w>k", ":resize -5<CR>", { desc = "Resize window up" })
map("n", "<C-w>j", ":resize +5<CR>", { desc = "Resize window down" })

-- navigation to tmux splits
map("n", "<c-l>", "<cmd>:TmuxNavigateRight<cr>", { desc = "Tmux Right" })
map("n", "<c-h>", "<cmd>:TmuxNavigateLeft<cr>", { desc = "Tmux Left" })
map("n", "<c-k>", "<cmd>:TmuxNavigateUp<cr>", { desc = "Tmux Up" })
map("n", "<c-j>", "<cmd>:TmuxNavigateDown<cr>", { desc = "Tmux Down" })

-- Visual mode mappings
map("v", ">", ">gv", { desc = "indent" })

-- Neotest mappings

-- Run nearest test
map("n", "<leader>tt", function()
  require("neotest").run.run()
end, { desc = "Run nearest test" })

-- Run file test
map("n", "<leader>tf", function()
  require("neotest").run.run(vim.fn.expand "%")
end, { desc = "Run file test" })

-- Test output
map("n", "<leader>to", ":Neotest output<CR>", { desc = "Test output" })

-- Test summary
map("n", "<leader>ts", ":Neotest summary<CR>", { desc = "Test summary" })

-- LSP workspace mappings

-- Add workspace folder
map("n", "<leader>Wa", function()
  vim.lsp.buf.add_workspace_folder()
end, { desc = "Add workspace folder" })

-- Remove workspace folder
map("n", "<leader>Wr", function()
  vim.lsp.buf.remove_workspace_folder()
end, { desc = "Remove workspace folder" })

-- List workspace folders
map("n", "<leader>Wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })

-- Which-key mappings

-- Which-key all keymaps
map("n", "<leader>WK", function()
  vim.cmd "WhichKey"
end, { desc = "Which-key all keymaps" })

-- Which-key query lookup
map("n", "<leader>Wk", function()
  local input = vim.fn.input "WhichKey: "
  vim.cmd("WhichKey " .. input)
end, { desc = "Which-key query lookup" })

-- NvimTree mapping
map("n", "<leader>o", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })

-- NvTerm mappings

-- Toggle floating term
map({ "n", "t" }, "<F7>", function()
  require("nvterm.terminal").toggle "float"
end, { desc = "Toggle floating term" })

-- Toggle horizontal term
map({ "n", "t" }, "<C-\\>", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal term" })
map({ "n", "t" }, "<leader>th", function()
  require("nvterm.terminal").toggle "horizontal"
end, { desc = "Toggle horizontal term" })

-- Toggle vertical term
map({ "n", "t" }, "<C-|>", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical term" })
map({ "n", "t" }, "<leader>tv", function()
  require("nvterm.terminal").toggle "vertical"
end, { desc = "Toggle vertical term" })

-- Oil
-- map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope
map("n", "<leader>ft", function()
  require("nvchad.themes").open()
end, { desc = "Find theme" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map("n", "<leader>fF", "<cmd>Telescope find_files follow=true no_ignore=true<CR>", { desc = "Find all files" })
