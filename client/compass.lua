local compass = Config.compass
local streetName = Config.streetName


Citizen.CreateThread( function()
	if compass.position.centered then
		compass.position.x = compass.position.x - compass.width / 2
	end
	
	while true do
		Wait(0)
		if compass.show then
		
		local pxDegree = compass.width / compass.fov
		local playerHeadingDegrees = 0
		
		if compass.followGameplayCam then
			-- Converts [-180, 180] to [0, 360] where E = 90 and W = 270
			local camRot = Citizen.InvokeNative( 0x837765A25378F0BB, 0, Citizen.ResultAsVector() )
			playerHeadingDegrees = 360.0 - ((camRot.z + 360.0) % 360.0)
		else
			-- Converts E = 270 to E = 90
			playerHeadingDegrees = 360.0 - GetEntityHeading( GetPlayerPed( -1 ) )
		end
		
		local tickDegree = playerHeadingDegrees - compass.fov / 2
		local tickDegreeRemainder = compass.ticksBetweenCardinals - (tickDegree % compass.ticksBetweenCardinals)
		local tickPosition = compass.position.x + tickDegreeRemainder * pxDegree
		local azimuthDegree = playerHeadingDegrees
		
		tickDegree = tickDegree + tickDegreeRemainder

		-- Draw Azimuth Degrees
		if compass.degree.show then
			drawText( math.floor(azimuthDegree+0.5), compass.degree.position.x, compass.position.y + compass.degree.textOffset, {
				size = compass.degree.textSize,
				colour = compass.degree.textColour,
				outline = true,
				centered = true
				})
		end
		
		while tickPosition < compass.position.x + compass.width do

			if (tickDegree % 90.0) == 0 then

				-- Draw cardinal
				if compass.cardinal.tickShow then
					DrawRect( tickPosition, compass.position.y, compass.cardinal.tickSize.w, compass.cardinal.tickSize.h, compass.cardinal.tickColour.r, compass.cardinal.tickColour.g, compass.cardinal.tickColour.b, compass.cardinal.tickColour.a )
				end
				
				drawText( degreesToIntercardinalDirection( tickDegree ), tickPosition, compass.position.y + compass.cardinal.textOffset, {
					size = compass.cardinal.textSize,
					colour = compass.cardinal.textColour,
					outline = true,
					centered = true
				})
			elseif (tickDegree % 45.0) == 0 and compass.intercardinal.show then
				-- Draw intercardinal
				if compass.intercardinal.tickShow then
					DrawRect( tickPosition, compass.position.y, compass.intercardinal.tickSize.w, compass.intercardinal.tickSize.h, compass.intercardinal.tickColour.r, compass.intercardinal.tickColour.g, compass.intercardinal.tickColour.b, compass.intercardinal.tickColour.a )
				end
				
				if compass.intercardinal.textShow then
					drawText( degreesToIntercardinalDirection( tickDegree ), tickPosition, compass.position.y + compass.intercardinal.textOffset, {
						size = compass.intercardinal.textSize,
						colour = compass.intercardinal.textColour,
						outline = true,
						centered = true
					})
				end
			else
				-- Draw tick
				DrawRect( tickPosition, compass.position.y, compass.tickSize.w, compass.tickSize.h, compass.tickColour.r, compass.tickColour.g, compass.tickColour.b, compass.tickColour.a )
			end
			
			-- Advance to the next tick
			tickDegree = tickDegree + compass.ticksBetweenCardinals
			tickPosition = tickPosition + pxDegree * compass.ticksBetweenCardinals
		end

		end
	end
end)

RegisterNetEvent("c2k_compass:client:togglecompass", function()
	if compass.show == false then
		compass.show = true
	elseif compass.show == true then
		compass.show = false
	end
end)