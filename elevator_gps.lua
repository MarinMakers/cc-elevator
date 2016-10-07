rednet.open("back")
print("Starting gps")
while true do
	local ID, message, protocol = rednet.receive("elevator_gps")
	if protocol == elevator then
		if message == getGPS then
			local x, y, z = gps.locate(5, true)
			rednet.send(ID, y, "elevator_gps")
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