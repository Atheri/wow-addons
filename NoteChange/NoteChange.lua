name_list = {"Runior"}

local LoginFrame = CreateFrame("Frame")
LoginFrame:RegisterEvent("CHAT_MSG_SYSTEM")

LoginFrame:SetScript("OnEvent", 
function(self, event, ...)
	local some_var = ...
	local name = some_var:match( "^.*%[(.*)%].* has come online")
	if name then
		for i, char_name in ipairs(name_list) do
			if name == char_name then
				local msg = "The realm welcomes Her Royal Highness, Dutchess of the Kirin Tor, The Venerable Runior!"
				SendChatMessage(msg, "GUILD")
				--print(msg)
			end
		end
	end
end)

	--elseif some_var:sub(-8) == "offline." then
	--	print("SOMEONE LOGGED OFF")

