---@diagnostic disable-next-line: param-type-mismatch
if vim.fn.argc() == 0 or vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
   vim.api.nvim_create_autocmd("QuitPre", {
     desc = "Keep Neovim open after closing the last buffer",
     callback = function()
       local only_tab = #vim.api.nvim_list_tabpages() == 1
       local only_window = #vim.api.nvim_tabpage_list_wins(0) == 1

       if only_tab and only_window then
         vim.cmd("tabnew")
         vim.cmd("tabprevious")
       end
     end,
   })
end
