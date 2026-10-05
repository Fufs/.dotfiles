local function custom_tab_label(i)
   local buf_list = vim.fn.tabpagebuflist(i)
   local win_nr = vim.fn.tabpagewinnr(i)
   local buf_name = vim.fn.bufname(buf_list[win_nr])

   local title
   if buf_name == "" then
      title = "untitled"
   else
      local rel_path = vim.split(buf_name, "/")
      local path_depth = #rel_path
      local filename = rel_path[path_depth]
      local parent_dir
      if path_depth == 1 then
         parent_dir = "."
      else
         parent_dir = rel_path[path_depth - 1]
      end

      title = parent_dir .. "/" .. filename
   end

   return i .. " " .. title

end

local function custom_tab_line()
      local num_tabpages = vim.fn.tabpagenr("$")
      local curr_tabpage = vim.fn.tabpagenr()
      local s = ''
      for i = 1, num_tabpages, 1 do

         if i == curr_tabpage then
            if i > 1 then
               s = s .. "|"
            end
            s = s .. '%#TabLineSel#'
         else
            s = s .. '%#TabLine#'
            if i > 1 then
               s = s .. "|"
            end
         end

         -- set the tabpage number (for mouse clicks)
         s = s .. '%' .. i .. 'T'

         -- the label is made by MyTabLabel()
         s = s .. " " .. custom_tab_label(i) .. " "

         -- if i ~= num_tabpages then
         --    s = s .. "|"
         -- end
      end

	  -- after the last tabpage fill with TabLineFill and reset tabpage nr
	  s = s .. '%#TabLineFill#%T'

	  -- right-align the label to close the current tabpage
	  if vim.fn.tabpagenr('$') > 1 then
	    s = s .. '%=%#TabLine#%999Xclose'
	  end

	  return s
end

local M = {}

function M.setup(opts)
   _G.custom_tab_label = custom_tab_label
   _G.custom_tab_line = custom_tab_line
   vim.opt.showtabline = 2 -- always
   vim.opt.tabline = "%!v:lua.custom_tab_line()"

end

return M
