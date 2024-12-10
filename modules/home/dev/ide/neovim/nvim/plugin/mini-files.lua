-- toogle dotfiles key
local show_dotfiles = true
local filter_show = function(fs_entry) return true end
local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, '.') end

local toggle_dotfiles = function()
  show_dotfiles = not show_dotfiles

  local new_filter = show_dotfiles and filter_show or filter_hide
  MiniFiles.refresh({ content = { filter = new_filter } })
end

-- set cwd
local files_set_cwd = function(path)
    local cur_entry_path = MiniFiles.get_fs_entry().path
    local cur_directory = vim.fs.dirname(cur_entry_path)
    vim.fn.chdir(cur_directory)
end

-- show preview
local files_show_preview = false
local files_toggle_preview = function()
    files_show_preview = not files_show_preview

    MiniFiles.refresh({ windows = { preview = files_show_preview } })
    MiniFiles.trim_right()
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "Toggle dotfiles"; })
    vim.keymap.set("n", "g~", files_set_cwd, { buffer = buf_id, desc = "Set cwd" })
    vim.keymap.set("n", "gp", files_toggle_preview, { buffer = buf_id, desc = "Toggle preview" })
  end,
})

-- Open files keybind
vim.keymap.set("n", "<leader>e", function()
  -- Open directory of current file (in last used state) focused on the file
  MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
end, { desc = "Open Files from cfd"})

vim.keymap.set("n", "<leader>E", function()
  -- Open directory of current file (in last used state) focused on the file
  MiniFiles.open(nil, false)
end, { desc = "Open Files from cwd"})


-- mini.files config
require("mini.files").setup({
  options = {
    use_as_default_explorer = true,
  },
  mappings = {
    go_in = "L",
    go_in_plus = "l",
  },
})
