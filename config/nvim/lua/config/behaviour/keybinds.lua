local Utils = require("utils")
 
local M = {}

function M.setup(opts)
   opts = Utils.or_default(opts, {})

   vim.g.mapleader = Utils.or_default(opts.leader, " ")
   vim.g.maplocalleader = Utils.or_default(opts.localleader, "\\")

   local binds = Utils.or_default(opts.binds, {})
   local bind_opts = Utils.or_default(binds.opts, {})

   for _, bind in ipairs(binds) do
      local lhs_t = type(bind.lhs)
      if lhs_t == "string" then
         vim.keymap.set(bind.mode, bind.lhs, bind.rhs, bind_opts)
      elseif lhs_t == "table" then
         for _, lhs in ipairs(bind.lhs) do
            vim.keymap.set(bind.mode, lhs, bind.rhs, bind_opts)
         end
      end
   end
end

return M
