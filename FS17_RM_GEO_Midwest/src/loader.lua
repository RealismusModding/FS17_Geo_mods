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
    g_seasons:registerXMLDirectory("snowylands", geoMod.modDir .. "data/")
end

function geoMod:setup()
    g_seasons.environment.calculateVisualSeason = Utils.overwrittenFunction(g_seasons.environment.calculateVisualSeason, geoMod.calculateVisualSeason)
    g_seasons.environment.latestVisualSeason = g_seasons.environment.SEASON_WINTER

    for _, listener in ipairs(g_seasons.environment.visualSeasonChangeListeners) do
        listener:visualSeasonChanged(newVisuals)
    end

    g_seasons.snow.mode = g_seasons.snow.MODE_ON
end

function geoMod:calculateVisualSeason(superFunc)
    superFunc(self)

    return g_seasons.environment.SEASON_WINTER
end

Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, geoMod.setup)
