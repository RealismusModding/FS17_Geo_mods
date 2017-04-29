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
geoMod.latitude = 65.4

function g_rm_seasons_load(seasons)
    -- Load data from data/ folder
    g_seasons:registerXMLDirectory("northernsweden", geoMod.modDir .. "data/")
end

function geoMod.daylightLoad(daylight)
    daylight.latitude = geoMod.latitude
end

function geoMod:loadMap()
    -- Overwrite load function to replace latitude in any savegame
    g_seasons.daylight.load = Utils.appendedFunction(g_seasons.daylight.load, geoMod.daylightLoad)
end

FSBaseMission.loadMap = Utils.prependedFunction(FSBaseMission.loadMap, geoMod.loadMap)
