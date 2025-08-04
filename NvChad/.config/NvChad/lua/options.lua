require "nvchad.options"

local o = vim.o

o.scrolloff = 5

-- Set the number of spaces that a <Tab> counts for
o.tabstop = 4

-- Set the number of spaces to use for each step of (auto)indent
o.shiftwidth = 4

-- o.fileformats = "unix,dos"

-- Enable automatic indentation
o.autoindent = true
o.smartindent = true

-- Show line numbers
o.number = true
-- Enable relative line numbers
o.relativenumber = true

-- Highlight the current line
o.cursorline = true
o.cursorlineopt = "both" -- enable cursorline

-- Ignore case in search patterns
o.ignorecase = true

-- Override ignorecase if search pattern contains uppercase letters
o.smartcase = true

-- Enable line wrapping
o.wrap = true

-- Show matching parentheses
o.showmatch = true

-- Undo
o.undofile = true
o.undolevels = 1000
o.undoreload = 10000

-- Enable clipboard support (use system clipboard)
o.clipboard = "unnamedplus"

-- Set the status line to always be visible
o.laststatus = 2

-- Enable a better display for messages
o.cmdheight = 2

-- Reduce delay for key mappings
o.timeoutlen = 300

-- Enable spell checking (optional)
o.spell = true

-- Disable swap files (optional: can prevent recovery)
-- set noswapfile

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- Enable backup files (optional: for safety)
-- set backup
-- set backupdir=~/.vim/backups

-- Set encoding
-- set encoding=utf-8

-- Enable line breaking at word boundaries
-- set linebreak

-- Allow hidden buffers (switching buffers without saving)
-- set hidden
