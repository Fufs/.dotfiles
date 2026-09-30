require("config.appearance.codetags")
require("config.appearance.cursor").setup({
   highlight_line = false,
   highlight_column = false,
})
require("config.appearance.diagnostics")
require("config.appearance.highlights").setup({
   legacy_syntax_highlighting = false
})
require("config.appearance.line_numbers").setup({
   show_line_numbers = true,
   use_relative_numbers = true,
   line_number_cols = 4,
})
require("config.appearance.ruler").setup({
   rulers = { 80, 100, 105 },
})
require("config.appearance.special_characters")
require("config.appearance.trailing_spaces")
