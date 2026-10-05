local M = {}

---@generic T : any
---@param value? T
---@param default T
function M.or_default(value, default)
   if value == nil then
      return default
   end

   return value
end

-- https://github.com/lettertwo/config/blob/0b56ed8f5b0e8c1186ca29cbf8623ed64976568e/nvim/lua/util/init.lua#L19
function M.close_floats()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == "win" then
      vim.api.nvim_win_close(win, false)
    end
  end
end

return M
