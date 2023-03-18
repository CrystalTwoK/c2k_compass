local framework = Config.framework

if framework == 'ESX' then

    ESX = nil

    CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Wait(0)
        end  
    end)
elseif framework == 'QB' then

    QBCore = exports['qb-core']:GetCoreObject()
end

local compass = Config.compass

if framework == 'QB' then
    QBCore.Functions.CreateUseableItem("compass", function(source)
        local xPlayer = QBCore.Functions.GetPlayer(source)

        if compass.useItem == true then
            if xPlayer.Functions.GetItemByName("compass") ~= nil then
                TriggerClientEvent("c2k_compass:client:togglecompass", source)
            end
        end
    end)
end

if framework == 'ESX' then
    ESX.RegisterUsableItem('bread', function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if compass.useItem == true then
            if xPlayer.getInventoryItem("compass") ~= nil then
            TriggerClientEvent("c2k_compass:client:togglecompass", source)
            end
        end
    end)
end

AddEventHandler('onResourceStart', function()
    if framework == 'QB' or framework == 'ESX' then
        print("C2K_COMPASS CORRECTLY RUNNING ON ".."["..framework..']')
    else
        print("WARNING: SELECT A SUPPORTED FRAMEWORK! SELECT QB OR ESX TO MAKE THE RESOURCE WORK")
        print("WARNING: SELECT A SUPPORTED FRAMEWORK! SELECT QB OR ESX TO MAKE THE RESOURCE WORK")
        print("WARNING: SELECT A SUPPORTED FRAMEWORK! SELECT QB OR ESX TO MAKE THE RESOURCE WORK")
        print("WARNING: SELECT A SUPPORTED FRAMEWORK! SELECT QB OR ESX TO MAKE THE RESOURCE WORK")
    end
end)
