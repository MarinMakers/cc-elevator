args 	= {...}
args[1]	= desiredLevel		--floor to sent elevator to
ID 		= 38				--receiving computer ID
rednet.open("back")
rednet.send(ID, desiredLevel, elevator)
print(string.format("Sending elevator to %s floor.", desiredLevel))
sleep(3)
term.clear()
term.setCursorPos(1,1)