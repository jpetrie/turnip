local M = {}

local palette = {
  light = {
    background = {"#ffffff", 231},
    foreground = {"#000000", 16},

    leaf = {"#448b18", 28},
    purple = {"#6b4b9b", 97},
    purple_bright = {"#a13176", 125},
    thistle = {"#eee8f8", 147},
    thistle_bright = {"#ddd0f1", 140},
    dirt = {"#4e3e2d", 58},
    sand = {"#8f7566", 180},

    red_faint = {"#ffebec", 224},
    green_faint = {"#e8ffe8", 194},
    blue_faint = {"#eae8ff", 189},
    blue_faint_intense = {"#dad6ff", 147},
    orange_faint = {"#ffeedb", 223},

    -- UI Elements
    ui_error = {"#870000", 88},
    ui_warning = {"#d75f00", 166},

    -- Grayscale ramp; 0 is closest to the background color.
    gray00 = {"#eeeeee", 255},
    gray01 = {"#e4e4e4", 254},
    gray02 = {"#dadada", 253},
    gray03 = {"#d0d0d0", 252},
    gray04 = {"#c6c6c6", 251},
    gray05 = {"#bcbcbc", 250},
    gray06 = {"#b2b2b2", 249},
    gray07 = {"#a8a8a8", 248},
    gray08 = {"#9e9e9e", 247},
    gray09 = {"#949494", 246},
    gray10 = {"#8a8a8a", 245},
    gray11 = {"#808080", 244},
    gray12 = {"#767676", 243},
    gray13 = {"#6c6c6c", 242},
    gray14 = {"#626262", 241},
    gray15 = {"#585858", 240},
    gray16 = {"#4e4e4e", 239},
    gray17 = {"#444444", 238},
    gray18 = {"#3a3a3a", 237},
    gray19 = {"#303030", 236},
    gray20 = {"#262626", 235},
    gray21 = {"#1c1c1c", 234},
    gray22 = {"#121212", 233},
    gray23 = {"#080808", 232},
  },
  dark = {
    background = {"#000000", 16},
    foreground = {"#9e9e9e", 247},

    leaf = {"#448b18", 28},
    purple = {"#6b4b9b", 97},
    purple_bright = {"#a13176", 125},
    thistle = {"#eee8f8", 147},
    thistle_bright = {"#ddd0f1", 140},
    dirt = {"#4e3e2d", 58},
    sand = {"#8f7566", 180},

    red_faint = {"#320000", 52},
    green_faint = {"#e8ffe8", 194},
    blue_faint = {"#eae8ff", 189},
    blue_faint_intense = {"#dad6ff", 147},
    orange_faint = {"#ffeedb", 223},

    -- UI Elements
    ui_error = {"#870000", 88},
    ui_warning = {"#d75f00", 166},

    -- Grayscale ramp; 0 is closest to the background color.
    gray23 = {"#eeeeee", 255},
    gray22 = {"#e4e4e4", 254},
    gray21 = {"#dadada", 253},
    gray20 = {"#d0d0d0", 252},
    gray19 = {"#c6c6c6", 251},
    gray18 = {"#bcbcbc", 250},
    gray17 = {"#b2b2b2", 249},
    gray16 = {"#a8a8a8", 248},
    gray15 = {"#9e9e9e", 247},
    gray14 = {"#949494", 246},
    gray13 = {"#8a8a8a", 245},
    gray12 = {"#808080", 244},
    gray11 = {"#767676", 243},
    gray10 = {"#6c6c6c", 242},
    gray09 = {"#626262", 241},
    gray08 = {"#585858", 240},
    gray07 = {"#4e4e4e", 239},
    gray06 = {"#444444", 238},
    gray05 = {"#3a3a3a", 237},
    gray04 = {"#303030", 236},
    gray03 = {"#262626", 235},
    gray02 = {"#1c1c1c", 234},
    gray01 = {"#121212", 233},
    gray00 = {"#080808", 232},
  },
}

local function color(foreground_name, background_name)
  local result = { bold = false }
  local theme = vim.opt.background:get()
  if foreground_name ~= nil and #foreground_name > 0 then
    local value = palette[theme][foreground_name]
    result.fg = value[1]
    result.ctermfg = value[2]
  end

  if background_name ~= nil and #background_name > 0 then
    local value = palette[theme][background_name]
    result.bg = value[1]
    result.ctermbg = value[2]
  end

  return result
end

function M.apply()
  vim.cmd("highlight clear")
  vim.g.colors_name = "turnip"

  local groups = {
    -- Built-In
    ColorColumn = color("", "red_faint"),
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
    Title = color("dirt", ""),
    Visual = color("", "gray02"),
    VisualNOS = color("", "gray02"),
    WarningMsg = color("ui_warning"),
    Whitespace = color("gray01", "background"),
    WildMenu = color("", ""),
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
