local M = {}

local palette = {
  light = {
    background = "#ffffff",
    foreground = "#000000",

    leaf = "#448b18",
    purple = "#6b4b9b",
    purple_bright = "#a13176",
    thistle = "#eee8f8",
    thistle_bright = "#ddd0f1",
    dirt = "#4e3e2d",
    sand = "#8f7566",

    red_faint = "#ffebec",
    green_faint = "#e8ffe8",
    blue_faint = "#eae8ff",
    blue_faint_intense = "#dad6ff",
    orange_faint = "#ffeedb",

    -- UI Elements
    ui_error = "#870000",
    ui_warning = "#d75f00",

    -- Grayscale ramp; 0 is closest to the background color.
    gray00 = "#eeeeee",
    gray01 = "#e4e4e4",
    gray02 = "#dadada",
    gray03 = "#d0d0d0",
    gray04 = "#c6c6c6",
    gray05 = "#bcbcbc",
    gray06 = "#b2b2b2",
    gray07 = "#a8a8a8",
    gray08 = "#9e9e9e",
    gray09 = "#949494",
    gray10 = "#8a8a8a",
    gray11 = "#808080",
    gray12 = "#767676",
    gray13 = "#6c6c6c",
    gray14 = "#626262",
    gray15 = "#585858",
    gray16 = "#4e4e4e",
    gray17 = "#444444",
    gray18 = "#3a3a3a",
    gray19 = "#303030",
    gray20 = "#262626",
    gray21 = "#1c1c1c",
    gray22 = "#121212",
    gray23 = "#080808",
  },
  dark = {
    background = "#000000",
    foreground = "#9e9e9e",

    leaf = "#448b18",
    purple = "#6b4b9b",
    purple_bright = "#a13176",
    thistle = "#eee8f8",
    thistle_bright = "#ddd0f1",
    dirt = "#4e3e2d",
    sand = "#8f7566",

    red_faint = "#ffebec",
    green_faint = "#e8ffe8",
    blue_faint = "#eae8ff",
    blue_faint_intense = "#dad6ff",
    orange_faint = "#ffeedb",

    -- UI Elements
    ui_error = "#870000",
    ui_warning = "#d75f00",

    -- Grayscale ramp; 0 is closest to the background color.
    gray23 = "#eeeeee",
    gray22 = "#e4e4e4",
    gray21 = "#dadada",
    gray20 = "#d0d0d0",
    gray19 = "#c6c6c6",
    gray18 = "#bcbcbc",
    gray17 = "#b2b2b2",
    gray16 = "#a8a8a8",
    gray15 = "#9e9e9e",
    gray14 = "#949494",
    gray13 = "#8a8a8a",
    gray12 = "#808080",
    gray11 = "#767676",
    gray10 = "#6c6c6c",
    gray09 = "#626262",
    gray08 = "#585858",
    gray07 = "#4e4e4e",
    gray06 = "#444444",
    gray05 = "#3a3a3a",
    gray04 = "#303030",
    gray03 = "#262626",
    gray02 = "#1c1c1c",
    gray01 = "#121212",
    gray00 = "#080808",
  },
}

local function color(foreground_name, background_name)
  local result = { bold = false }
  local theme = vim.opt.background:get()
  if foreground_name ~= nil and #foreground_name > 0 then
    result.fg = palette[theme][foreground_name]
  end

  if background_name ~= nil and #background_name > 0 then
    result.bg = palette[theme][background_name]
  end

  return result
end

function M.apply()
  vim.cmd("highlight clear")
  vim.g.colors_name = "turnip"

  local groups = {
    -- Built-In
    ColorColumn = color("gray00", "gray00"),
    Conceal = color("gray18", "background"),
    CurSearch = color("", "thistle_bright"),
    Cursor = color("", "gray09"),
    lCursor = color("", "gray15"),
    CursorIM = color("", "gray15"),
    CursorColumn = color("", "gray00"),
    CursorLine = color("", "gray00"),
    Directory = color("dirt"),
    DiffAdd = color("", "green_faint"),
    DiffChange = color("", "blue_faint"),
    DiffDelete = color("red_faint", "red_faint"),
    DiffText = color("", "blue_faint_intense"),
    EndOfBuffer = color("background", "background"),
    TermCursor = color("", "gray15"),
    TermCursorNC = color("", "gray15"),
    ErrorMsg = color("ui_error"),
    WinSeparator = color("gray18", "background"),
    Folded = color("gray15", "gray02"),
    FoldColumn = color("gray15", "background"),
    SignColumn = color("", "background"),
    IncSearch = color("", "thistle_bright"),
    Substitute = color("", "thistle_bright"),
    LineNr = color("gray07", "background"),
    LineNrAbove = color("gray07", "background"),
    LineNrBelow = color("gray07", "background"),
    CursorLineNr = color("gray07", "background"),
    CursorLineFold = color("gray15", "background"),
    CursorLineSign = color("", "background"),
    MatchParen = color("", "thistle"),
    ModeMsg = color("gray11"),
    MsgArea = color("foreground", "background"),
    MsgSeparator = color("gray18", "background"),
    MoreMsg = color("leaf", "background"),
    NonText = color("gray01", "background"),
    Normal = color("foreground", "background"),
    NormalFloat = color("foreground", "background"),
    NormalNC = color("foreground", "background"),
    Pmenu = color("", "gray01"),
    PmenuSel = color("", "gray05"),
    PmenuSbar = color("", "gray09"),
    PmenuThumb = color("", "gray17"),
    Question = color("leaf", "background"),
    QuickFixLine = color("", "thistle_bright"),
    Search = color("", "thistle"),
    SpecialKey = color("gray01", "background"),
    SpellBad = color("", "red_faint"),
    SpellCap = color("", "red_faint"),
    SpellLocal = color("", "red_faint"),
    SpellRare = color("", "red_faint"),
    StatusLine = color("gray21", "gray06"),
    StatusLineNC = color("gray19", "gray02"),
    TabLine = color("", "gray01"),
    TabLineFill = color("", "gray00"),
    TabLineSel = color("", "gray03"),
    Title = color("dirt", "bold"),
    Visual = color("", "gray02"),
    VisualNOS = color("", "gray02"),
    WarningMsg = color("ui_warning"),
    Whitespace = color("gray01", "background"),
    WildMenu = color("", "bold"),
    WinBar = color("gray22", "gray00"),
    WinBarNC = color("gray12", "gray00"),
  
    -- Syntax Elements
    Comment = color("leaf"),
    Conditional = color("purple_bright"),
    Constant = color("sand"),
    Delimiter = color("gray15"),
    Function = color("foreground"),
    Identifier = color("purple"),
    Keyword = color("purple_bright"),
    Number = color("sand"),
    Operator = color("foreground"),
    PreProc = color("dirt"),
    Repeat = color("purple_bright"),
    Special = color("gray20"),
    Statement = color("gray16"),
    StorageClass = color("purple_bright"),
    String = color("sand"),
    Type = color("purple_bright"),
  }

  for group, definition in pairs(groups) do
    vim.api.nvim_set_hl(0, group, definition)
  end
end

return M
