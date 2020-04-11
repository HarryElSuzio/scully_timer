**Global Robbery Timer**                
	  
	  
es_extended is required for this script to work correctly, I will not assist you with integrating this into your robberies you can find notes next to everything within the script which I recommend you read.	  
	  

To use this with your bank robbery script you must use the following:

    ESX.TriggerServerCallback('Scully:CanStartRobbery', function(CanRob)
	    if CanRob then
		    -- start robbery
	    end
    end)
