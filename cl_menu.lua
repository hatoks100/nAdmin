local PlayerData, CurrentActionData, HandcuffTimer, dragStatus, blipsCops, currentTask, spawnedVehicles = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService, isInShopMenu = false, false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged = false
ESX = nil
locksound = false
onDuty = false
local ex = true

Citizen.CreateThread(function()
	while ESX == nil do
		ESX = exports["es_extended"]:getSharedObject()
		Citizen.Wait(0)
	end


	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)


local exemple = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 0}, Title = "Flash Admin" },
	Data = { currentMenu = "interaction" },
	Events = {
		onSelected = function(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
			PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)

			local slide = btn.slidenum

			local btn = btn.name

			local check = btn.unkCheckbox

			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

			local playerPed = PlayerPedId()

			local coords = GetEntityCoords(playerPed)

			if btn == "~g~> Activer le Staff Mode" then
				print("Staff Mode Activer")
				OpenMenu('Administration')
					
				elseif btn == "~r~> Desactiver le Staff Mode" then
					print("Staff Mode Desactiver")
					OpenMenu('interaction')	
				elseif btn == "~s~> Fermer le Menu" then
					CloseMenu(true)	
				elseif btn == "~b~> Spawner de Vehicules" then 
					OpenMenu('Spawner de Vehicules')
				elseif btn == "~y~> Give armes" then 
					OpenMenu('Give armes')
				elseif btn == "~r~> pistolet" then
					ExecuteCommand('giveitem 1 weapon_pistol 1 1')
				elseif btn == "~r~> fusil militaire"  then 
					ExecuteCommand('giveitem 1 weapon_carbinerifle 1 1')
				elseif btn == "~r~> ak47" then
					ExecuteCommand('giveitem 1 weapon_assaultrifle 1 1') 
						elseif btn == "~y~> Spawn Sultan RS" then
						ExecuteCommand('car sultanrs')
					elseif btn == "~r~> navy revolver" then
						ExecuteCommand('giveitem 1 weapon_navyrevolver 1 1')
					elseif btn == "~r~> sniper" then 
						ExecuteCommand('giveitem 1 weapon_heavysniper 1 1')
					elseif btn == "~g~> Spawn STO" then
						ExecuteCommand('car STO')
					end
				end
	
},

	Menu = {
		["interaction"] = {
			b = {
				{name = "~g~> Activer le Staff Mode", ask = ">", askX = true},
				{name = "~s~> Fermer le Menu", ask = ">", askX = true},			
			}
        },
		["Administration"] = {
			b = {
                {name = "~r~> Desactiver le Staff Mode", ask = ">", askX = true},
				{name = "~b~> Spawner de Vehicules", ask = ">", askX = true},
				{name = "~y~> Give armes", ask = ">", askX = true},
				{name = "~g~> Noclip", ask = ">", askX = true},
				
			}
        },
		["Spawner de Vehicules"] = {
			b = {
				{name = "~y~> Spawn Sultan RS", ask = ">", askX = true},
				{name = "~g~> Spawn STO", ask = ">", askX = true},
			}
        },
		["Give armes"] = {
			b = {
			{name = "~r~> pistolet", ask = ">", askX = true},
			{name = "~r~> fusil militaire", ask = ">", askX = true},
			{name = "~r~> ak47", ask = ">", askX = true},
			{name = "~r~> navy revolver", ask = ">", askX = true},
			{name = "~r~> sniper", ask = ">", askX = true},

			}
        },
	}
}


-- ouvrir  le menu avec une touche.
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		if IsControlJustPressed(1,57) then
			CreateMenu(exemple)
		end
	end
end)