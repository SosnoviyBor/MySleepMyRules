local I = require('openmw.interfaces')

I.Settings.registerPage {
    key = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'page_name',
    description = 'page_description',
}

I.Settings.registerGroup {
    key = 'GeneralMySleepMyRules',
    page = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'general_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'modEnabled',
            name = 'modEnabled_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'enemyDistance',
            name = 'enemyDistance_name',
            description = 'enemyDistance_description',
            renderer = 'number',
            default = 1,
            argument = {
                min = 0,
                integer = true,
            },
        },
        {
            key = 'isMournholdInterior',
            name = 'isMournholdInterior_name',
            description = 'isMournholdInterior_description',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'bedsAreSafe',
            name = 'bedsAreSafe_name',
            description = 'bedsAreSafe_description',
            renderer = 'checkbox',
            default = true,
        },
    },
}

I.Settings.registerGroup {
    key = 'ConditionsInteriorsMySleepMyRules',
    page = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'conditionsInteriors_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'interiorRest',
            name = 'interiorRest_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            -- TODO
            -- disable if 'interiorRest' iis No
            key = 'interiorWithEnemiesRest',
            name = 'interiorWithEnemiesRest_name',
            description = 'interiorWithEnemiesRest_description',
            renderer = 'checkbox',
            default = true,
        },
        {
            -- TODO
            -- Figure out how to set default values from l10n
            -- Figure out how to make multiline text input
            key = 'interiorWhitelist',
            name = 'interiorWhitelist_name',
            description = 'interiorWhitelist_description',
            renderer = 'textLine',
            default = '',
        },
        {
            key = 'interiorBlacklist',
            name = 'interiorBlacklist_name',
            description = 'interiorBlacklist_description',
            renderer = 'textLine',
            default = '',
        },
    },
}

I.Settings.registerGroup {
    key = 'ConditionsExteriorsMySleepMyRules',
    page = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'conditionsExteriors_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'exteriorRest',
            name = 'exteriorRest_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            -- TODO
            -- disable if 'exteriorRest' iis No
            key = 'badWeatherRest',
            name = 'badWeatherRest_name',
            description = 'badWeatherRest_description',
            renderer = 'checkbox',
            default = true,
        },
        {
            -- TODO
            -- disable if 'exteriorRest' iis No
            key = 'allowIllegalRest',
            name = 'allowIllegalRest_name',
            description = 'allowIllegalRest_description',
            renderer = 'checkbox',
            default = true,
        },
        {
            -- TODO
            -- Figure out how to set default values from l10n
            -- Figure out how to make multiline text input
            key = 'exteriorWhitelist',
            name = 'exteriorWhitelist_name',
            description = 'exteriorWhitelist_description',
            renderer = 'textLine',
            default = '',
        },
        {
            key = 'exteriorBlacklist',
            name = 'exteriorBlacklist_name',
            description = 'exteriorBlacklist_description',
            renderer = 'textLine',
            default = '',
        },
    },
}

I.Settings.registerGroup {
    key = 'ResourcesSleepMySleepMyRules',
    page = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'resourcesSleep_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'restoreHealthSleep',
            name = 'restoreHealthSleep_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'restoreMagickaSleep',
            name = 'restoreMagickaSleep_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'restoreFatigueSleep',
            name = 'restoreFatigueSleep_name',
            renderer = 'checkbox',
            default = true,
        },
    },
}

I.Settings.registerGroup {
    key = 'ResourcesRestMySleepMyRules',
    page = 'MySleepMyRules',
    l10n = 'MySleepMyRules_HUDSettings',
    name = 'resourcesRest_group_name',
    permanentStorage = true,
    settings = {
        {
            key = 'restoreHealthRest',
            name = 'restoreHealthRest_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'restoreMagickaRest',
            name = 'restoreMagickaRest_name',
            renderer = 'checkbox',
            default = true,
        },
        {
            key = 'restoreFatigueRest',
            name = 'restoreFatigueRest_name',
            renderer = 'checkbox',
            default = true,
        },
    },
}