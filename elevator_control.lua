--requires elevator_server to be present!
os.loadAPI("callElevator")

function CUI(m) --declare function
n=1 --declare selected option
while true do --start a loop for the 'go to step#2' part
term.clear() term.setCursorPos(1,2) --clear the sceen and position the cursor
for i=1, #m, 1 do --traverse the table of options
	if i==n then 
		print(i, " ["..m[i].."]") else print(i, " ", m[i]) end --print them
	end
	a, b= os.pullEvent("key") --wait for keypress
	if b==200 and n>1 then 
		n=n-1 end --arrow up pressed, one option up
	if b==208 and n<=l then 
		n=n+1 end --arrow down pressed, one option down
	if b==28 then 
		break end --enter pressed, break the loop
	end
	term.clear() term.setCursorPos(1,1) --clear screen
	return n --return the value
end

local options={
"option1",
"option2",
"option3"
}
local n=CUI(options)
print(n)