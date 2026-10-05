local Utils = require("utils")

require("config.behaviour.indents")

local function gcc()
   vim.api.nvim_feedkeys("gcc", "m", false)
end

local function gc()
   vim.api.nvim_feedkeys("gc", "m", false)
end


require("config.behaviour.keybinds").setup({
   leader = ",",
   localleader = "\\",
   binds = {
      -- Normal
      { mode = "n", lhs = "<Space>", rhs = "i<Space><Esc>l" },
      { mode = "n", lhs = "<S-Space>", rhs = "i<Space><Esc>" },
      { mode = "n", lhs = "<BS>", rhs = "X" },
      { mode = "n", lhs = "<Enter>", rhs = "o<Esc>" },
      { mode = "n", lhs = "<S-Enter>", rhs = "O<Esc>j" },
      { mode = "n", lhs = "<Tab>", rhs = ">>" },
      { mode = "n", lhs = "<S-Tab>", rhs = "<<" },
      { mode = "n", lhs = "<C-b>", rhs = function() vim.cmd(":Neotree") end },
      ---- Tab jumps
      { mode = "n", lhs = "<C-1>", rhs = "1gt" },
      { mode = "n", lhs = "<C-2>", rhs = "2gt" },
      { mode = "n", lhs = "<C-3>", rhs = "3gt" },
      { mode = "n", lhs = "<C-4>", rhs = "4gt" },
      { mode = "n", lhs = "<C-5>", rhs = "5gt" },
      { mode = "n", lhs = "<C-6>", rhs = "6gt" },
      { mode = "n", lhs = "<C-7>", rhs = "7gt" },
      { mode = "n", lhs = "<C-8>", rhs = "8gt" },
      { mode = "n", lhs = "<C-9>", rhs = "9gt" },
      { mode = "n", lhs = "<C-0>", rhs = "10gt" },

      -- Visual
      { mode = "v", lhs = "<Tab>", rhs = ">gv" },
      { mode = "v", lhs = "<S-Tab>", rhs = "<gv" },
      ---- Selecting with Shift
      { mode = "n", lhs = { "<S-Left>", "H" }, rhs = "vh" },
      { mode = "n", lhs = { "<S-Down>", "J" }, rhs = "vj" },
      { mode = "n", lhs = { "<S-Up>", "K"  }, rhs = "vk" },
      { mode = "n", lhs = { "<S-Right>", "L" }, rhs = "vl" },
      { mode = "i", lhs = "<S-Left>", rhs = "<Left><C-o>v" },
      { mode = "i", lhs = "<S-Down>", rhs = "<C-o>vj" },
      { mode = "i", lhs = "<S-Up>", rhs = "<Left><C-o>vk" },
      { mode = "i", lhs = "<S-Right>", rhs = "<C-o>v" },
      { mode = "v", lhs = { "<S-Left>", "H" }, rhs = "h" },
      { mode = "v", lhs = { "<S-Down>", "J" }, rhs = "j" },
      { mode = "v", lhs = { "<S-Up>", "K" }, rhs = "k" },
      { mode = "v", lhs = { "<S-Right>", "L" }, rhs = "l" },
      -- Insert
      { mode = "i", lhs = "<S-Tab>", rhs = "<C-d>" },
      -- LSP
      { mode = "n", lhs = "<C-k>", rhs = vim.lsp.buf.hover },
      { mode = "n", lhs = "<C-_>", rhs = gcc, { remap = true } },
      { mode = "v", lhs = "<C-_>", rhs = gc, { remap = true } },
   },
})
require("config.behaviour.workspace")
