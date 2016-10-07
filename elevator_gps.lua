rednet.open("back")
print("Starting gps")
while true do
	local ID, message, protocol = rednet.receive("elevator_gps")
	if message == "getGPS" then
		print("Request received!")
		local x, y, z = gps.locate()
		rednet.send(ID, y, "elevator_gps")
		print(string.format("currnet level is %d"), y)
	else
		print("unknown command!")
		sleep(3)
		term.clear()
		term.setCursorPos(1,1)
	end
end
