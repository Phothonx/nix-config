require("mini.icons").setup()
require("mini.indentscope").setup({
  draw = {
    animation = require("mini.indentscope").gen_animation.none(),
    delay = 50,
  },
  options = {
    try_as_border = true,
  },
})
require("mini.trailspace").setup()
require("mini.diff").setup()
