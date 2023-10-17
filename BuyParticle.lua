ShopMod2 = require(script.Parent.ShopModule2)

function game.ReplicatedStorage.ForShop2.OnServerInvoke(player, objective, ...)
	local t = {...}
	
	pcall (function ()
		if objective == "Buy this" then
			--print("-Objective is 'Buy This'-")
			local item = game.ReplicatedStorage.PARTICLES:FindFirstChild(t[1])
			if item then
				--'if' checks if desired item exists
				if not player.ParticleInventory:FindFirstChild(item.Name) then
					--print("-Item has not been bought before-")
					if item.ItemInfo.Worth.Value == "Reds" then
						
						if player.leaderstats.Reds.Value >= item.ItemInfo.Price.Value then
						print("-Now making purchase(Reds)...-")
						player.leaderstats.Reds.Value = player.leaderstats.Reds.Value - item.ItemInfo.Price.Value
						
						local theBool = Instance.new("BoolValue", player.ParticleInventory)
						theBool.Name = item.Name
						theBool.Value = false
						end
						
					elseif item.ItemInfo.Worth.Value == "Greens" then
						
						if player.leaderstats.Greens.Value >= item.ItemInfo.Price.Value then
						print("-Now making purchase(Greens)...-")
						player.leaderstats.Greens.Value = player.leaderstats.Greens.Value - item.ItemInfo.Price.Value
						
						local theBool = Instance.new("BoolValue", player.ParticleInventory)
						theBool.Name = item.Name
						theBool.Value = false
						end
						
					end
				end
			end
		elseif objective == "Equip this" then
			--print("-Objective is 'Equip This'-")			
			local item = game.ReplicatedStorage.PARTICLES:FindFirstChild(t[1])
			if item then
			--Checks if desired item exists
				if player.ParticleInventory:FindFirstChild(item.Name) then
					
					player.ParticleInventory[item.Name].Value = true					
					ShopMod2:EquipParticle(player, t[1])
					player.ParticleInventory[item.Name].Value = true
				end
			end
		elseif objective == "Unequip this" then
				ShopMod2:RemoveAllParticles(player)
				end
			end)
	return ""
end