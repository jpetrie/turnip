-- Clear the package; this lets `:colorscheme turnip` reload and pick up changes to the theme.
package.loaded["turnip"] = nil

require("turnip").apply()
