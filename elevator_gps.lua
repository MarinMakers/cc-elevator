rednet.open("back")
while true do
	local ID, message, protocol = rednet.receive()
	if protocol == elevator then
		if message == getGPS then
			local x, y, z = gps.locate(5, true)
			rednet.send(ID, y, elevator)
		else
			print("unknown command!")
			sleep(2)
			term.clear()
			term.setCursorPos(1,1)
		end
	else
		print("unknown protocol!")
		sleep(2)
		term.clear()
		term.setCursorPos(1,1)
	end
end