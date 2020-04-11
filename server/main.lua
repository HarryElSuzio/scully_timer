-- Created by Scully#5775

ESX = nil
local cooldown = false

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('Scully:CanStartRobbery', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
	if cooldown == false then
	    cb(true)
	else
	    cb(false)
		xPlayer.ahowNotification(Config.Timer.alertmessage)
	end
end)

RegisterServerEvent("Scully:StartTimer")
AddEventHandler("Scully:StartTimer", function()
    cooldown = true
    SetTimeout((Config.Timer.cooldown*60)*1000, function()
		cooldown = false
		TimerHasEnded()
	end)
end)

RegisterServerEvent("Scully:StartCustomTimer")
AddEventHandler("Scully:StartCustomTimer", function(cooldown)
    cooldown = true
    SetTimeout((cooldown*60)*1000, function()
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

AddEventHandler('onResourceStart', function(resource)
	if resource ~= 'scully_timer' then	
	    return
	end
    print('^2GLOBAL BANK TIMER HAS BEEN STARTED')
end)