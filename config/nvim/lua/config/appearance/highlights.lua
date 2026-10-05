local Utils = require("utils")

---@class HighlightsApperanceConfig
local M = {}

---@param opts {
---   legacy_syntax_highlighting: boolean,
---   highlight_overrides: table<string, integer | string>,
---}
function M.setup(opts)
   local syntax

   if (Utils.or_default(opts.legacy_syntax_highlighting, false)) then
      syntax = "on"
   else
      syntax = "off"
   end
   vim.cmd("syntax " .. syntax)

   for key, value in pairs(Utils.or_default(opts.highlight_overrides, {})) do
      vim.api.nvim_set_hl(0, key, value)
   end
end

return M
