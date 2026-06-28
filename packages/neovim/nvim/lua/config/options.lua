-- This is mosty taken from mini.basics
local o = vim.o
local g = vim.g
local opt = vim.opt


-- General
o.undofile    = true                     -- Enable persistent undo (see also `:h undodir`)
o.clipboard   = "unnamedplus"            -- use global keyboard

o.backup      = false                    -- Don't store backup while overwriting the file
o.writebackup = false                    -- Don't store backup while overwriting the file
o.wildmenu    = false                    -- use blink cmp instead
o.wildchar    = vim.fn.char2nr('<C-t>')  -- use blink cmp instead
o.swapfile    = false                    -- my sworn ennemy


-- Appearance
o.termguicolors = true          -- Enable gui colors
o.breakindent   = true          -- Indent wrapped lines to match line start
o.cursorline    = true          -- Highlight current line
o.cursorlineopt = "number"
o.number        = true          -- Show line numbers
o.numberwidth   = 4             -- size of gutter for line numbers
o.splitbelow    = true          -- Horizontal splits will be below
o.splitright    = true          -- Vertical splits will be to the right

o.ruler         = false         -- Don't show cursor position in command line
o.showmode      = false         -- Don't show mode in command line
o.wrap          = false         -- Display long lines as just one line

o.signcolumn    = 'yes'         -- Always show sign column (otherwise it will shift text)
o.updatetime    = 250           -- Faster CursorHold (LSP document highlight, etc.)
opt.fillchars   = { eob = " " } -- Don't show `~` outside of buffer

opt.shortmess:append "sI"       -- disable nvim intro

-- indenting
o.expandtab                = true                       -- tabs to spaces
o.shiftwidth               = 2                          -- nb of spaces for indenting
o.tabstop                  = 2                          -- size of tabs in spaces
o.softtabstop              = 2
o.smarttab                 = true
opt.smartindent            = true

-- Editing
o.incsearch     = true                        -- Show search results while typing
o.infercase     = true                        -- Infer letter cases for a richer built-in keyword completion
o.ignorecase    = true -- ignore case in search
o.smartcase     = true -- but enable if used
o.hlsearch      = true -- do not clear highlight

o.completeopt   = 'menuone,noinsert,noselect' -- Customize completions
o.virtualedit   = 'block'                     -- Allow going past the end of line in visual block mode
o.formatoptions = 'qjl1'                      -- Don't autoformat comments
o.inccommand    = 'split'                     -- Live preview of :substitute results
o.confirm       = true                        -- Ask to save instead of erroring on :q with changes
o.splitkeep     = 'screen'                    -- Keep text on screen stable when opening splits

-- Spell
opt.spelllang = { "en", "fr" }

-- Visual
o.scrolloff  = 8
o.mouse      = "a"
o.laststatus = 3   -- status line everywhere

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  callback = function() vim.hl.on_yank() end,
})

-- Neovide
if vim.g.neovide then
  vim.g.neovide_scale_factor = 0.9
  vim.g.neovide_hide_mouse_when_typing = true
end
