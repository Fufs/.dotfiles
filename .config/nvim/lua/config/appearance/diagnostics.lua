vim.diagnostic.config({
   virtual_text = {
      prefix = function(diagnostic, i, total)
         local prefix = ""

         if i == 1 then
            prefix = prefix .. " "
         end

         prefix = prefix .. "■ "

         -- if i == total then
         --    prefix = prefix .. " "
         -- end

         return prefix
      end,
      suffix = " ",
      virt_text_pos = "eol",
   }
})
