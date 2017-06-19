----------------------------------------------------------------------------------------------------
-- LOADER SCRIPT
----------------------------------------------------------------------------------------------------
-- Purpose:  Loads the mod
-- Authors:  Rahkiin
--
-- Copyright (c) Realismus Modding, 2017
----------------------------------------------------------------------------------------------------

local geoMod = {}
geoMod.modDir = g_currentModDirectory

function g_rm_seasons_load(seasons)
    -- Load data from data/ folder
    g_seasons:registerXMLDirectory("antarctica", geoMod.modDir .. "data/")
end
