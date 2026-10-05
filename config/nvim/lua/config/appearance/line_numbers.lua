local Utils = require("utils")

---@class LineNumbersAppearanceConfig
local M = {}

---@param opts {
---   show_line_numbers: boolean,
---   use_relative_numbers: boolean,
---   line_number_cols: integer,
---}
function M.setup(opts)
   vim.opt.number = Utils.or_default(opts.show_line_numbers, true)
   vim.opt.relativenumber = Utils.or_default(opts.use_relative_numbers, true)
   vim.opt.numberwidth = Utils.or_default(opts.line_number_cols, 4)
end

return M
