local Utils = require("utils")

---@class RulersAppearanceConfig
local M = {}

---@param opts {
---   rulers: integer[],
---}
function M.setup(opts)
   vim.opt.colorcolumn = Utils.or_default(opts.rulers, {})
end

return M
