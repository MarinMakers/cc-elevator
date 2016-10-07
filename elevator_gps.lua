rednet.open("back")
print("Starting gps")
while true do
	print("Waiting for input...")
	local ID, message, protocol = rednet.receive("elevator_gps")
	term.clear()
	term.setCursorPos(1,1)
	if message == "getGPS" then
		print("Request received!")
		local x, y, z = gps.locate()
		rednet.send(ID, y, "elevator_gps")
		sleep(3)
	else
		print("unknown command!")
		sleep(3)
	end
end