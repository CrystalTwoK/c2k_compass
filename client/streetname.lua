local streetName = Config.streetName
local compass = Config.compass

Citizen.CreateThread( function()
	local lastStreetA = 0
	local lastStreetB = 0
	local lastStreetName = {}
	
	while true do
		Wait(0)
		if compass.show and streetName.show then
		
		local playerPos = GetEntityCoords( GetPlayerPed( -1 ), true )
		local streetA, streetB = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, playerPos.x, playerPos.y, playerPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
		local street = {}
		
		if not ((streetA == lastStreetA or streetA == lastStreetB) and (streetB == lastStreetA or streetB == lastStreetB)) then
			lastStreetA = streetA
			lastStreetB = streetB
		end
		
		if lastStreetA ~= 0 then
			table.insert( street, GetStreetNameFromHashKey( lastStreetA ) )
		end
		
		if lastStreetB ~= 0 then
			table.insert( street, GetStreetNameFromHashKey( lastStreetB ) )
		end
		
		drawText( table.concat( street, " & " ), streetName.position.x, streetName.position.y, {
			size = streetName.textSize,
			colour = streetName.textColour,
			outline = true,
			centered = streetName.position.centered
		})
		end
	end
end)