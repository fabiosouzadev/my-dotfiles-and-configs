-- install plugins
local opts = require("core.bootstrap").lazy_config()
require("lazy").setup("plugins", opts)