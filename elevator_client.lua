rednet.open("back")
delay 			= .5
cable 			= "bottom"
elevatorID 		= 
serverID 		= 
chestY			= 69
reactorY 		= 39

function moveUp()
	redstone.setBundledOutput(cable, colors.orange)
	sleep(delay)
	redstone.setBundledOutput(cable, 0)
	sleep(delay)
end

function moveDown()
	redstone.setBundledOutput(cable, colors.white)
	sleep(delay)
	redstone.setBundledOutput(cable, 0)
	sleep(delay)
end

while true do
	term.clear()
	term.setCursorPos(1,1)
	print("Waiting for input")
	local senderId, desiredLevel, elevator = rednet.receive()
	currentLevel = rednet.send(elevatorID, getGPS, elevator)
	print(string.format("Moving to %s", desiredLevel))
	sleep(3)
	if currentLevel == chest then
		if desiredLevel == reactor then
			for i=1,30 do
				moveDown()
			end
		elseif desiredLevel ==chest then
			print("Elevator already on that level!")
		else 
			print("Unknown level!")
		end
	elseif currentLevel == reactor then
		if desiredLevel == chest then
			for i=1,30 do
				moveUp()
			end
		elseif desiredLevel == reactor then
			print("Elevator already on that level!")
		else
			print("Unknown level!")
		end
	end
	term.clear()
	term.setCursorPos(1,1)
end