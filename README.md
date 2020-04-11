**Global Robbery Timer**                
	  
	  
es_extended is required for this script to work correctly, I will not assist you with integrating this into your robberies you can find notes next to everything within the config to help you.	  
	  

To use this with your bank robbery script you must use the following:

    ESX.TriggerServerCallback('Scully:CanStartRobbery', function(CanRob)
	    if CanRob then
		    -- start robbery
	    end
    end)

To start the global timer you can do it in one of two ways, you can use the default timer which you can set in the config.lua or you can use a custom timer.

*Default timer client sided:

    TriggerServerEvent("Scully:StartTimer")
   
*Default timer server sided:

    TriggerEvent("Scully:StartTimer")
    
*Custom timer client sided:

    TriggerServerEvent("Scully:StartCustomTimer", 20) -- 20 is an example you can set this to any number. (in minutes)
   
*Custom timer server sided:

    TriggerEvent("Scully:StartCustomTimer", 20) -- 20 is an example you can set this to any number. (in minutes)
    
To reset the timer you can use:

*Client sided
    
    TriggerServerEvent("Scully:ResetTimer")
    
*Server sided
    
    TriggerEvent("Scully:ResetTimer")
