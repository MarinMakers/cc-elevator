clientID = 38
rednet.open("back")
function sendElevator(desiredLevel)
	rednet.send(clientID, desiredLevel, "elevator")
	print(string.format("Sending elevator to %s floor.", desiredLevel))
	term.clear()
	term.setCursorPos(1,1)
end