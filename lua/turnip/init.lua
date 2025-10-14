local M = {}

local palette = {
  light = {
    -- Basic
    foreground = "#000000",
    background = "#ffffff",

    -- Elements
    red_faint = "#ffebec",

    purple_bold = "#9b238f",
    purple_rich = "#532c8e",
    purple_dull = "#7a5296",

    blue_dust = "#1974b5",
    blue_faint = "#dad6ff",

    green_rich = "#3a7216",
    green_pale = "#6da372",
    green_faint = "#e8ffe8",

    gold_pale = "#ffe39e",

    orange_pale = "#fcc18d",
    orange_faint = "#ffe9d6",
    brown_bold = "#643820",

    grey_slate = "#605953",
    grey_faint = "#b5b0ba",

    -- Interface
    ui_cursor = "#949494",
    ui_cursor_guide = "#f8f8f8",
    ui_selection = "#d1d1d1",
    ui_invisible = "#e5e5e5",
    ui_success = "#2a6b02",
    ui_warning = "#b56117",
    ui_error = "#c62411",
    ui_line_number = "#a8a8a8",
    ui_color_column = "#fbfbfb",
    ui_statusline_fg_active = "#1c1c1c",
    ui_statusline_fg_inactive = "#949494",
    ui_statusline_bg = "#f0f0f0",
    ui_tabline_active = "#d0d0d0",
    ui_tabline_inactive = "#e4e4e4",
    ui_tabline_well = "#f0f0f0",
    ui_menu = "#e0e0e0",
    ui_menu_selected = "#c0c0c0",
    ui_scrollbar_well = "#d2d2d2",
    ui_scrollbar_thumb = "#bbbbbb",
    ui_border = "#626262",
  },
  dark = {
    foreground = "#afafaf",
    background = "#0c0c0c",

    -- Elements
    red_faint = "#ffebec",

    purple_bold = "#962a8b",
    purple_rich = "#683aad",
    purple_dull = "#8d5daf",

    blue_dust = "#23628e",
    blue_faint = "#dad6ff",

    green_rich = "#3e6b22",
    green_pale = "#6da372",
    green_faint = "#e8ffe8",

    gold_pale = "#664d0e",

    orange_pale = "#fcc18d",
    orange_faint = "#ffe9d6",
    brown_bold = "#72442b",

    grey_slate = "#605953",
    grey_faint = "#b5b0ba",

    -- Interface
    ui_cursor = "#626262",
    ui_cursor_guide = "#1c1c1c",
    ui_selection = "#3a3a3a",
    ui_invisible = "#202020",
    ui_success = "#2a6b02",
    ui_warning = "#b56117",
    ui_error = "#c62411",
    ui_line_number = "#4e4e4e",
    ui_color_column = "#0f0f0f",
    ui_statusline_fg_active = "#dadada",
    ui_statusline_fg_inactive = "#626262",
    ui_statusline_bg = "#070707",
    ui_tabline_active = "#262626",
    ui_tabline_inactive = "#1c1c1c",
    ui_tabline_well = "#121212",
    ui_menu = "#090909",
    ui_menu_selected = "#1a1a1a",
    ui_scrollbar_well = "#121212",
    ui_scrollbar_thumb = "#090909",
    ui_border = "#626262",
  },
}

local function remap(key, definition, attributes)
  local theme = vim.opt.background:get()
  if definition[key] ~= nil then
    local value = palette[theme][definition[key]]
    attributes[key] = value
  end
end

M.apply = function()
  vim.cmd("highlight clear")
  vim.g.colors_name = "turnip"

  local groups = {
    -- Basic
    ColorColumn = {bg = "ui_color_column"},
    Conceal = {fg = "ui_invisible"},
    CurSearch = {bg = "orange_pale"},
    Cursor = {bg = "ui_cursor"},
    CursorColumn = {bg = "ui_cursor_guide"},
    CursorIM = {bg = "ui_cursor"},
    CursorLine = {bg = "ui_cursor_guide"},
    CursorLineFold = {fg = "green_pale", bg = "ui_cursor_guide"},
    CursorLineNr = {fg = "ui_line_number", bg = "ui_cursor_guide", bold = true},
    CursorLineSign = {bg = "ui_cursor_guide"},
    DiffAdd = {bg = "green_faint"},
    DiffChange = {bg = "gold_pale"},
    DiffDelete = {fg = "red_faint", bg = "red_faint"},
    DiffText = {bg = "blue_faint"},
    Directory = {fg = "brown_bold"},
    EndOfBuffer = {fg = "background"},
    ErrorMsg = {fg = "ui_error"},
    FoldColumn = {fg = "green_pale"},
    Folded = {fg = "green_pale"},
    IncSearch = {bg = "orange_pale"},
    LineNr = {fg = "ui_line_number"},
    LineNrAbove = {fg = "ui_line_number"},
    LineNrBelow = {fg = "ui_line_number"},
    MatchParen = {bg = "gold_pale"},
    ModeMsg = {fg = "grey_faint"},
    MoreMsg = {fg = "ui_success"},
    MsgArea = {fg = "foreground"},
    MsgSeparator = {fg = "ui_border"},
    NonText = {fg = "ui_invisible"},
    Normal = {fg = "foreground", bg = "background"},
    NormalFloat = {fg = "foreground", bg = "background"},
    NormalNC = {fg = "foreground", bg = "background"},
    Pmenu = {bg = "ui_menu"},
    PmenuSbar = {bg = "ui_scrollbar_well"},
    PmenuSel = {bg = "ui_menu_selected"},
    PmenuThumb = {bg = "ui_scrollbar_thumb"},
    Question = {fg = "ui_success"},
    QuickFixLine = {bg = "orange_pale"},
    Search = {bg = "orange_faint"},
    SignColumn = {bg = "background"},
    SpecialKey = {fg = "ui_invisible"},
    SpellBad = {sp = "ui_error", undercurl = true},
    SpellCap = {sp = "ui_warning", undercurl = true},
    SpellLocal = {sp = "ui_warning", undercurl = true},
    SpellRare = {sp = "ui_warning", undercurl = true},
    StatusLine = {fg = "ui_statusline_fg_active", bg = "ui_statusline_bg"},
    StatusLineNC = {fg = "ui_statusline_fg_inactive", bg = "ui_statusline_bg"},
    Substitute = {bg = "orange_pale"},
    TabLine = {bg = "ui_tabline_inactive"},
    TabLineFill = {bg = "ui_tabline_well"},
    TabLineSel = {bg = "ui_tabline_active"},
    TermCursor = {bg = "ui_cursor"},
    TermCursorNC = {bg = "ui_cursor"},
    Title = {fg = "purple_bold"},
    Todo = {fg = "green_rich", bold = true},
    Underlined = {fg = "blue_dust", underline = true},
    Visual = {bg = "ui_selection"},
    VisualNOS = {bg = "ui_selection"},
    WarningMsg = {fg = "ui_warning"},
    Whitespace = {fg = "ui_invisible"},
    WildMenu = {bg = "ui_menu_selected"},
    WinBar = {fg = "ui_statusline_fg_active", bg = "ui_statusline_bg"},
    WinBarNC = {fg = "ui_statusline_fg_inactive", bg = "ui_statusline_bg"},
    WinSeparator = {fg = "ui_border"},

    -- Diagnostics
    DiagnosticDeprecated = {sp = "ui_error", strikethrough = true},
    DiagnosticError = {fg = "ui_error"},
    DiagnosticHint = {fg = "grey_faint"},
    DiagnosticInfo = {fg = "grey_faint"},
    DiagnosticOk = {fg = "ui_success"},
    DiagnosticUnderlineError = {fg = "ui_error", underline = true},
    DiagnosticUnderlineHint = {fg = "grey_faint", underline = true},
    DiagnosticUnderlineInfo = {fg = "grey_faint", underline = true},
    DiagnosticUnderlineOk = {fg = "ui_success", underline = true},
    DiagnosticUnderlineWarn = {fg = "ui_warning", underline = true},
    DiagnosticUnnecessary = {fg = "ui_warning", italic = true},
    DiagnosticWarn = {fg = "ui_warning"},

    -- Syntax Elements
    Comment = {fg = "green_rich"},
    Conditional = {fg = "purple_bold"},
    Constant = {fg = "purple_dull"},
    Delimiter = {fg = "foreground"},
    Function = {fg = "foreground"},
    Identifier = {fg = "foreground"},
    Keyword = {fg = "purple_bold"},
    Number = {fg = "purple_dull"},
    Operator = {fg = "foreground"},
    PreProc = {fg = "brown_bold"},
    Repeat = {fg = "purple_bold"},
    Special = {fg = "foreground"},
    Statement = {fg = "foreground"},
    StorageClass = {fg = "purple_bold"},
    String = {fg = "grey_slate"},
    Type = {fg = "purple_rich"},

    -- Semantic Tokens
    ["@constant.builtin.cpp"] = {link = "Keyword"},
    ["@lsp.type.macro.cpp"] = {link = "Directory"},
    ["@type.builtin.cpp"] = {link = "Keyword"},
    ["@variable"] = {link = "Foreground"},

    -- vimdoc
    ["@label.vimdoc"] = {fg = "purple_dull"},
    ["@markup.raw.vimdoc"] = {fg = "grey_slate"},
    ["@parameter.vimdoc"] = {fg = "grey_slate"},
    ["@text.literal.block.vimdoc"] = {fg = "brown_bold"},
    ["@text.reference.vimdoc"] = {fg = "blue_dust", underline = true},
  }

  for group, definition in pairs(groups) do
    local attributes = vim.deepcopy(definition)
    remap("fg", definition, attributes)
    remap("bg", definition, attributes)
    remap("sp", definition, attributes)
    vim.api.nvim_set_hl(0, group, attributes)
  end
end

return M

