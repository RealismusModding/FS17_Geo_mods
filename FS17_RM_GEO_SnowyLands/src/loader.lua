----------------------------------------------------------------------------------------------------
-- LOADER SCRIPT
----------------------------------------------------------------------------------------------------
-- Purpose:  Loads the mod
-- Authors:  Rahkiin
--
-- Copyright (c) Realismus Modding, 2017
----------------------------------------------------------------------------------------------------

local geoMod = {}

function geoMod:setup()
    g_seasons.environment.calculateVisualSeason = Utils.overwrittenFunction(g_seasons.environment.calculateVisualSeason, geoMod.calculateVisualSeason)

    -- Run the visual season listeners
    g_seasons.environment:callListeners()

    g_seasons.snow.mode = g_seasons.snow.MODE_ON
end

function geoMod:calculateVisualSeason(superFunc)
    superFunc(self)

    return g_seasons.environment.SEASON_WINTER
end

Mission00.loadMission00Finished = Utils.appendedFunction(Mission00.loadMission00Finished, geoMod.setup)
