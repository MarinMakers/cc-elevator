rednet.open("back")
delay 			= .5
cable 			= "bottom"
elevatorID 		= 43
serverID 		= 35
chestY			= 67
reactorY 		= 37

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
	local senderId, desiredLevel, protocol = rednet.receive("elevator")
	rednet.send(elevatorID, "getGPS", "elevator_gps")
	print("Waiting for gps response:")
	local elevatorID, currentLevel = rednet.receive("elevator_gps",5)
	print(currentLevel)
	print(string.format("Moving to %s", desiredLevel))
	sleep(3)
	
	levels = currentLevel - desiredLevel
	if levels > 0 then
		print("moving down!")
		for i = 1,levels do
			moveDown()
		end
	elseif levels < 0 then
		levels = math.abs(levels)
		print("moving up!")
		for i = 1,levels do
			moveUp()
		end
	elseif levels == 0 then
		print("Already on that level!")
	end
end