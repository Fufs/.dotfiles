---@module "lazy.types"
---@type LazySpec
return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy = false,
      build = ':TSUpdate',
      config = function()
         vim.api.nvim_create_autocmd('User', {
            pattern = 'TSUpdate',
            callback = function()
               local parsers = require('nvim-treesitter.parsers')

               parsers.tmux = {
                  install_info = {
                     url = "https://github.com/Freed-Wu/tree-sitter-tmux",
                     branch = "main",
                     revision = "26c21424955a719bfdbb3f595265a5322200c261",
                     queries = "queries",
                  },
                  tier = 2,
               }

               parsers.ghostty = {
                  install_info = {
                     url = "https://github.com/bezhermoso/tree-sitter-ghostty",
                     revision = "a2075c3761a41449bb4faf69794c902dfef6d70e",
                     queries = "queries/ghostty",
                  },
                  tier = 2,
               }
            end
         })


         vim.api.nvim_create_autocmd('FileType', {
            pattern = "*",
            callback = function(args)
               local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

               if lang ~= nil and vim.treesitter.language.add(lang) then
                  vim.treesitter.start(args.buf, lang)
               end
            end,
         })
      end
   },
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      init = function()
         -- Disable entire built-in ftplugin mappings to avoid conflicts.
         -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
         vim.g.no_plugin_maps = true

         -- Or, disable per filetype (add as you like)
         -- vim.g.no_python_maps = true
         -- vim.g.no_ruby_maps = true
         -- vim.g.no_rust_maps = true
         -- vim.g.no_go_maps = true
      end,
      config = function()
         -- put your config here
      end,
   },
   {
        "hiphish/rainbow-delimiters.nvim",
        lazy = false,
        config = function()
            require('rainbow-delimiters.setup').setup({
                strategy = {
                    [''] = 'rainbow-delimiters.strategy.global',
                },
                query = {
                    [''] = 'rainbow-delimiters'
                },
                priority = {
                    [''] = 110,
                },
                highlight = {
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterViolet',
                    'RainbowDelimiterBlue',
                },
            })
        end
   },
   {
        "mason-org/mason.nvim",
        opts = {}
   },
   {
        "neovim/nvim-lspconfig",
        opts = {},
        config = function()
        end
   },
   {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
   },
   {
       "folke/lazydev.nvim",
       ft = "lua", -- only load on lua files
       opts = {
           library = {
              -- See the configuration section for more details
              -- Load luvit types when the `vim.uv` word is found
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
           },
       },
   },
   {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
        }
   },
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
         "nvim-tree/nvim-web-devicons", -- optional, but recommended
      },
      lazy = false, -- neo-tree will lazily load itself
      config = function()
         local command = require("neo-tree.command")
         local function close()
            command.execute({ action = "close" })
         end

         require("neo-tree").setup({
            event_handlers = {
               {
                  event = "file_open_requested",
                  handler = close
               },
            },
            window = {
               mappings = {
                  ["<Esc>"] = close,
                  ["<C-b>"] = close,
                  ---@param state neotree.StateWithTree
                  ---@param selected_nodes neotree.SelectedNodes
                  ["T"] = function (state, selected_nodes)
                     -- Opens the file in a new tab but doesn't focus it
                     if selected_nodes == nil then
                        local curr_tab = vim.fn.tabpagenr()
                        state.commands.open_tabnew(state)
                        vim.cmd("tabnext " .. curr_tab)
                        command.execute({ show = true })
                     end
                  end
               }
            }
         })
      end,
   },
   {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
   },
   {
        "OXY2DEV/markview.nvim",
        lazy = false,

        -- Completion for `blink.cmp`
        -- dependencies = { "saghen/blink.cmp" },
        -- opts = {
        --     preview = {
        --        enable = false,
        --     }
        -- }
   },
   {
       "kylechui/nvim-surround",
       version = "^4.0.0", -- Use for stability; omit to use `main` branch for the latest features
       event = "VeryLazy",
       -- Optional: See `:h nvim-surround.configuration` and `:h nvim-surround.setup` for details
       -- config = function()
       --     require("nvim-surround").setup({
       --         -- Put your configuration here
       --     })
       -- end
   },
   {
       "gmr458/vscode_modern_theme.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vscode_modern").setup({
                cursorline = true,
                transparent_background = false,
                nvim_tree_darker = true,
            })
            vim.cmd.colorscheme("vscode_modern")

            -- Additional overrides
            vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
            vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#1f1f1f", ctermbg = 8 })
            vim.api.nvim_set_hl(0, "TodoTag", { fg = "#ffffff", bg = "#ffbd2a" })
            vim.api.nvim_set_hl(0, "FixmeTag", { fg = "#ffffff", bg = "#f06292" })
            vim.api.nvim_set_hl(0, "NoteTag", { fg = "#ffffff", bg = "#0078d4" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#75beff", bg = "#1f1f1f" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#cca700", bg = "#1f1f1f" })
            vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#f85149", bg = "#1f1f1f" })
            vim.api.nvim_set_hl(0, "NoteTag", { fg = "#ffffff", bg = "#0078d4" })
            vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#d00000", ctermbg = 1 })
            -- FIXME: vim.api.nvim_set_hl(0, "Cursor", { blend = 100 })
            vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#1f1f1f" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterBlue", { ctermfg=4, fg="#569cd6" })
            vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { ctermfg=13, fg="#c586c0" })
        end,
   },
   {
        "sudormrfbin/cheatsheet.nvim",
        dependencies = {
            {"nvim-telescope/telescope.nvim"},
            {"nvim-lua/popup.nvim"},
            {"nvim-lua/plenary.nvim"},
        }
   },
   {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
   },
   {
      "rmagatti/auto-session",
      lazy = false,

      ---enables autocomplete for opts
      ---@module "auto-session"
      ---@type AutoSession.Config
      opts = {
         suppressed_dirs = { "~/", "~/Work", "~/Projects", "~/Downloads", "/" },
         -- log_level = 'debug',
       },
   },
}
