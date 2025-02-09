require("mini.icons").setup()
require("mini.trailspace").setup()
require("mini.pick").setup()
require("mini.statusline").setup()

require("config.plugins.mini.diff")
require("config.plugins.mini.files")
require("config.plugins.mini.pairs")

require('mini.misc').setup()
MiniMisc.setup_auto_root()
