local maxFuelLevel = turtle.getFuelLimit()

function fuel_mantaiment()
	fuelLevel = turtle.getFuelLevel()

	actualFuel = fuelLevel / maxFuelLevel
	actualFuel = actualFuel * 100

	print("Fuel left (%):", actualFuel)

	if fuelLevel == 0 then
		print("Refuel nedeed...")

		while turtle.getFuelLevel() == 0 do
			turtle.refuel()
		end

		print("Sucesfully refuel!")
	end
end

function tunnel_from_left()
	turtle.dig()
	turtle.forward()
	turtle.turnRight()

	local i = 3
	while i > 0 do
		turtle.digUp()
		turtle.digDown()

		if i > 1 then
			turtle.dig()
			turtle.forward()
		end
		fuel_mantaiment()
		i = i - 1
	end
end

function tunnel_from_right( ... )
	turtle.dig()
	turtle.forward()
	turtle.turnLeft()

	local i = 3
	while i > 0 do
		turtle.digUp()
		turtle.digDown()

		if i > 1 then
			turtle.dig()
			turtle.forward()
		end
		fuel_mantaiment()
		i = i - 1
	end
end

function dig_tunnel( ... ):
	fuel_mantaiment()
	tunnel_from_left()
	turtle.turnLeft()
	tunnel_from_right()
end