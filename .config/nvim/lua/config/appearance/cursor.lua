local Utils = require("utils")

---@class CursorAppearanceConfig
local M = {}

---@param opts {
---   highlight_line?: boolean,
---   highlight_column?: boolean,
---}
function M.setup(opts)
   vim.opt.cursorline = Utils.or_default(opts.highlight_line, false)
   vim.opt.cursorcolumn = Utils.or_default(opts.highlight_column, false)
end

return M
