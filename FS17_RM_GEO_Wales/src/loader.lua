----------------------------------------------------------------------------------------------------
-- LOADER SCRIPT
----------------------------------------------------------------------------------------------------
-- Purpose:  Loads the mod
-- Authors:  Rahkiin
--
-- Copyright (c) Realismus Modding, 2017
----------------------------------------------------------------------------------------------------

local modDir = g_currentModDirectory
local latitude = 65.4

function g_rm_seasons_load(seasons)
    -- Overwrite load function to replace latitude in any savegame
    g_seasons.environment.load = Utils.appendedFunction(g_seasons.environment.load, function (self) self.latitude = latitude; print("Hello World from load function!") end)

    -- Load data from data/ folder
    g_seasons:registerXMLDirectory("northernsweden", modDir .. "data/")
end
