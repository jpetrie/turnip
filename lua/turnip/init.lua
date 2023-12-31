local turnip = {}

local palette = {
  light = {
    foreground = "#000000",
    background = "#ffffff",

    annotation = "#9c9c9c",
    annotation_faint = "#e4e4e4",

    purple_pale = "#ddd0f1",
    purple_dull = "#875ba5",
    purple_deep = "#533993",

    plum = "#9e3793",
    lavender = "#eee8f8",

    leaf = "#345420",
    sprout = "#7b9e7e",
    loam = "#4e3e2d",

    red_faint = "#ffebec",
    green_faint = "#e8ffe8",
    blue_faint = "#dad6ff",

    -- UI Elements
    ui_cursor = "#949494",
    ui_cursor_guide = "#f8f8f8",
    ui_selection = "#dadada",
    ui_line_number = "#a8a8a8",
    ui_error = "#870000",
    ui_warning = "#d75f00",
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
    foreground = "#a9a9a9",
    background = "#181818",

    annotation = "#3c3c3c",
    annotation_faint = "#202020",

    purple_pale = "#ddd0f1",
    purple_dull = "#6b4b9b",
    purple_deep = "#533993",

    plum = "#a13176",
    lavender = "#eee8f8",

    leaf = "#448b18",
    sprout = "#7b9e7e",
    loam = "#4e3e2d",

    red_faint = "#320000",
    green_faint = "#e8ffe8",
    blue_faint = "#dad6ff",

    -- UI Elements
    ui_cursor = "#626262",
    ui_cursor_guide = "#1c1c1c",
    ui_selection = "#3a3a3a",
    ui_line_number = "#4e4e4e",
    ui_error = "#870000",
    ui_warning = "#d75f00",
    ui_statusline_fg_active = "#dadada",
    ui_statusline_fg_inactive = "#626262",
    ui_statusline_bg = "#070707",
    ui_tabline_active = "#262626",
    ui_tabline_inactive = "#1c1c1c",
    ui_tabline_well = "#121212",
    ui_menu = "#e0e0e0",
    ui_menu_selected = "#c0c0c0",
    ui_scrollbar_well = "#d2d2d2",
    ui_scrollbar_thumb = "#bbbbbb",
  },
}

local function remap(key, definition, attributes)
  local theme = vim.opt.background:get()
  if definition[key] ~= nil then
    local value = palette[theme][definition[key]]
    attributes[key] = value
  end
end

function turnip.apply()
  vim.cmd("highlight clear")
  vim.g.colors_name = "turnip"

  local groups = {
    -- Built-In
    ColorColumn = {bg = "red_faint"},
    Conceal = {fg = "annotation_faint"},
    CurSearch = {bg = "purple_pale"},
    Cursor = {bg = "ui_cursor"},
    lCursor = {bg = "ui_cursor"},
    CursorIM = {bg = "ui_cursor"},
    CursorColumn = {bg = "ui_cursor_guide"},
    CursorLine = {bg = "ui_cursor_guide"},
    Directory = {fg = "loam"},
    DiffAdd = {bg = "green_faint"},
    DiffChange = {bg = "lavender"},
    DiffDelete = {fg = "red_faint", bg = "red_faint"},
    DiffText = {bg = "blue_faint"},
    EndOfBuffer = {fg = "background"},
    TermCursor = {bg = "ui_cursor"},
    TermCursorNC = {bg = "ui_cursor"},
    ErrorMsg = {fg = "ui_error"},
    WinSeparator = {fg = "ui_border"},
    Folded = {fg = "sprout"},
    FoldColumn = {fg = "sprout"},
    SignColumn = {bg = "background"},
    IncSearch = {bg = "purple_pale"},
    Substitute = {bg = "purple_pale"},
    LineNr = {fg = "ui_line_number"},
    LineNrAbove = {fg = "ui_line_number"},
    LineNrBelow = {fg = "ui_line_number"},
    CursorLineNr = {fg = "ui_line_number", bg = "ui_cursor_guide", bold = true},
    CursorLineFold = {fg = "sprout", bg = "ui_cursor_guide"},
    CursorLineSign = {bg = "ui_cursor_guide"},
    MatchParen = {bg = "lavender"},
    ModeMsg = {fg = "annotation"},
    MsgArea = {fg = "foreground"},
    MsgSeparator = {fg = "ui_border"},
    MoreMsg = {fg = "leaf"},
    NonText = {fg = "annotation_faint"},
    Normal = {fg = "foreground", bg = "background"},
    NormalFloat = {fg = "foreground", bg = "background"},
    NormalNC = {fg = "foreground", bg = "background"},
    Pmenu = {bg = "ui_menu"},
    PmenuSel = {bg = "ui_menu_selected"},
    PmenuSbar = {bg = "ui_scrollbar_well"},
    PmenuThumb = {bg = "ui_scrollbar_thumb"},
    Question = {fg = "leaf"},
    QuickFixLine = {bg = "purple_pale"},
    Search = {bg = "lavender"},
    SpecialKey = {fg = "annotation_faint"},
    SpellBad = {bg = "red_faint"},
    SpellCap = {bg = "red_faint"},
    SpellLocal = {bg = "red_faint"},
    SpellRare = {bg = "red_faint"},
    StatusLine = {fg = "ui_statusline_fg_active", bg = "ui_statusline_bg"},
    StatusLineNC = {fg = "ui_statusline_fg_inactive", bg = "ui_statusline_bg"},
    TabLine = {bg = "ui_tabline_inactive"},
    TabLineFill = {bg = "ui_tabline_well"},
    TabLineSel = {bg = "ui_tabline_active"},
    Title = {fg = "loam"},
    Visual = {bg = "ui_selection"},
    VisualNOS = {bg = "ui_selection"},
    WarningMsg = {fg = "ui_warning"},
    Whitespace = {fg = "annotation_faint"},
    WildMenu = {},
    WinBar = {fg = "ui_statusline_fg_active", bg = "ui_statusline_bg"},
    WinBarNC = {fg = "ui_statusline_fg_inactive", bg = "ui_statusline_bg"},

    -- Diagnostics
    DiagnosticError = {fg = "ui_error"},
    DiagnosticUnderlineError = {fg = "ui_error", underline = true},
    DiagnosticWarn = {fg = "ui_warning"},
    DiagnosticUnderlineWarn = {fg = "ui_warning", underline = true},
    DiagnosticInfo = {fg = "annotation"},
    DiagnosticUnderlineInfo = {fg = "annotation", underline = true},
    DiagnosticHint = {fg = "annotation"},
    DiagnosticUnderlineHint = {fg = "annotation", underline = true},
    DiagnosticOk = {fg = "leaf"},
    DiagnosticUnderlineOk = {fg = "leaf", underline = true},
    DiagnosticDeprecated = {sp = "ui_error", strikethrough = true},
    DiagnosticUnnecessary = {fg = "ui_warning", italic = true},

    -- Syntax Elements
    Comment = {fg = "leaf"},
    Conditional = {fg = "plum"},
    Constant = {fg = "purple_dull"},
    Delimiter = {fg = "foreground"},
    Function = {fg = "foreground"},
    Identifier = {fg = "foreground"},
    Keyword = {fg = "plum"},
    Number = {fg = "purple_dull"},
    Operator = {fg = "foreground"},
    PreProc = {fg = "loam"},
    Repeat = {fg = "plum"},
    Special = {fg = "foreground"},
    Statement = {fg = "foreground"},
    StorageClass = {fg = "plum"},
    String = {fg = "purple_dull"},
    Type = {fg = "purple_deep"},
  }

  for group, definition in pairs(groups) do
    local attributes = vim.deepcopy(definition)
    remap("fg", definition, attributes)
    remap("bg", definition, attributes)
    remap("sp", definition, attributes)
    vim.api.nvim_set_hl(0, group, attributes)
  end
end

return turnip

