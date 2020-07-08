-- Created by Scully#5775 - https://discord.gg/eNtGFS6

ESX = nil
local cooldown = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Scully:CanStartRobbery', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and not cooldown then
	cb(true)
    else
	xPlayer.showNotification(Config.Timer.alertmessage)
	cb(false)
    end
end)

RegisterServerEvent("Scully:StartTimer")
AddEventHandler("Scully:StartTimer", function(cooldowntime)
    local cooldowntimer = Config.Timer.cooldown
    if cooldowntime ~= nil and cooldowntime > 0 then 
	cooldowntimer = cooldowntime 
    end
    cooldown = true
    SetTimeout((cooldowntimer*60000), function()
	cooldown = false
	TimerHasEnded()
    end)
end)

RegisterServerEvent("Scully:ResetTimer")
AddEventHandler("Scully:ResetTimer", function()
    cooldown = false
    TimerHasEnded()
end)

function TimerHasEnded()
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
	local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
	if Config.Timer.endedmessage ~= "" then
            xPlayer.showNotification(Config.Timer.endedmessage)
	end
    end
end
