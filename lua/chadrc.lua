-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "doomchad",
}

M.ui = {
  hl_override = {
    TabuflineSelected = {fg="blue", bg = "yellow"},
    Tabufline = {bg = "darkgray"}
  }

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

-- M.ui = {
--   theme = "bmo", -- your current theme
--
--   hl_override = {
--     -- Tabufline (buffer tabs) highlights
--     TblineFill = {
--       bg = "#1e2030", -- Background color behind tabs
--     },
--
--     -- Inactive buffer tabs
--     TbLineBufOff = {
--       fg = "#6c7d9c", -- Text color for inactive tabs
--       bg = "#2a2e3a", -- Background for inactive tabs
--     },
--
--     -- Active buffer tab
--     TbLineBufOn = {
--       fg = "#ffffff",     -- Text color for active tab
--       bg = "#7aa2f7",     -- Background for active tab
--       bold = true,
--     },
--
--     -- Close button on inactive tabs
--     TbLineBufOffClose = {
--       fg = "#6c7d9c",
--       bg = "#2a2e3a",
--     },
--
--     -- Close button on active tab
--     TbLineBufOnClose = {
--       fg = "#ffffff",
--       bg = "#7aa2f7",
--     },
--
--     -- Modified file indicators
--     TbLineBufOffModified = {
--       fg = "#e0af68",
--       bg = "#2a2e3a",
--     },
--
--     TbLineBufOnModified = {
--       fg = "#e0af68",
--       bg = "#7aa2f7",
--     },
--   },
--
--   -- You can also add hl_add for completely new highlight groups if needed
--   hl_add = {
--     -- Any additional highlight groups
--   },
-- }
