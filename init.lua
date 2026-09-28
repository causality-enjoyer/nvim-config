vim.g.python3_host_prog = "/usr/bin/python3"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.autocmd")

-- Global (cross-filetype) keymaps. Contextual/filetype-local keymaps live
-- next to the plugin that owns them, under lua/keymaps/ft/*.lua, and are
-- loaded lazily via FileType autocmds registered in config.contextual.
require("keymaps.global")
require("config.contextual")

require("config.lazy")
