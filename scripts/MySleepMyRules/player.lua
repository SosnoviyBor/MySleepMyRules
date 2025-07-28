local storage = require("openmw.storage")
local self = require("openmw.self")
local core = require("openmw.core")
local ui = require("openmw.ui")
local I = require("openmw.interfaces")

require("scripts.MySleepMyRules.utils")

local section = storage.playerSection("GeneralMySleepMyRules")
local l10n = core.l10n("MySleepMyRules")


local function forbidRest(message)
    I.UI.setMode(nil)
    ui.showMessage(message)
end


local function playerActivatedABed()
    -- check for nearby bed + player's head position + reach idk
    -- check if player activated a bed script?
    return false
end


local function playerIsInSafety()
    return true
end


local function getCellType(cell)
    local cellType

    if cell.isExterior or cell:hasTag("QuasiExterior") then
        cellType = EXTERIOR
    else
        cellType = INTERIOR
    end

    -- check if its Mournhold
    if section:get("isMournholdInterior") then
        for _, mournholdCellName in pairs(SplitString(l10n("mournholdFakeInteriorCellNames"), ", ")) do
            if cell.name == mournholdCellName then
                cellType = EXTERIOR
                break
            end
        end
    end

    return cellType
end


local function cellIsWhitelisted(cell, cellType)
    local whitelist = section:get(cellType .. "Whitelist")
    if whitelist ~= nil then
        for _, whitelistCellName in pairs(whitelist) do
            if cell.name == whitelistCellName then
                return true
            end
        end
    end
    return false
end


local function cellIsBlacklisted(cell, cellType)
    local blacklist = section:get(cellType .. "Blacklist")
    if blacklist ~= nil then
        for _, blacklistCellName in pairs(blacklist) do
            if cell.name == blacklistCellName then
                forbidRest(l10n("messageBlacklist"))
                return true
            end
        end
    end
    return false
end


local function interiorHasEnemies(cell)
    return false
end


local function UiModeChanged(data)
    if data.newMode == "Rest" and section:get("modEnabled") then
        if section:get("bedsAreSafe") and playerActivatedABed() then return end

        local cell = self.cell

        if not playerIsInSafety() then
            forbidRest("scary")
            return
        end

        local cellType = getCellType(cell)

        if cellIsWhitelisted(cell, cellType) then return end
        if cellIsBlacklisted(cell, cellType) then
            forbidRest(l10n("messageBlacklist"))
            return
        end

        if cellType == INTERIOR then
            if not section:get("interiorRest") then
                forbidRest(l10n("messageInteriorForbidden"))
                return
            end

            if not section:get("interiorWithEnemiesRest") and interiorHasEnemies(cell) then
                forbidRest("enemies")
                return
            end

            return
        end

        if cellType == EXTERIOR then
            if not section:get("exteriorRest") then
                forbidRest(l10n("messageExteriorForbidden"))
                return
            end

            -- TODOOOOO
            if not section:get("badWeatherRest") and core.weather.getWeather() ~= "Clear" then
                forbidRest(l10n("messageBadWeather"))
                return
            end

            if not section:get("allowIllegalRest") and cell:hasTag("NoSleep") then
                forbidRest(l10n("messageIllegalRestingPlace"))
                return
            end

            return
        end
    end
end


return {
    engineHandlers = {
        onLoad = function()
            -- required for core.weather
            if core.API_REVISION < 83 then
                ui.showMessage(
                    l10n("messageOutdatedLuaAPI"),
                    { showInDualogue = true }
                )
            end
        end
    },
    eventHandlers = {
        UiModeChanged = UiModeChanged,
    }
}
