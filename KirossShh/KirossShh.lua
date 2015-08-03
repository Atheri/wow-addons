kiross_chars = {"Kiross"}

chat_table = {
	["CHAT_MSG_CHANNEL"] = "CHANNEL",
	["CHAT_MSG_GUILD"] = "GUILD",
	["CHAT_MSG_PARTY"] = "PARTY",
    ["CHAT_MSG_PARTY_LEADER"] = "PARTY",	
	["CHAT_MSG_SAY"] = "SAY",
	["CHAT_MSG_YELL"] = "YELL",
	["CHAT_MSG_EMOTE"] = "EMOTE",
	["CHAT_MSG_INSTANCE_CHAT"] = "INSTANCE_CHAT",
    ["CHAT_MSG_INSTANCE_CHAT_LEADER"] = "INSTANCE_CHAT",
	["CHAT_MSG_TEXT_EMOTE"] = "EMOTE",
    ["CHAT_MSG_RAID_LEADER"] = "RAID",
    ["CHAT_MSG_RAID"] = "RAID",
    ["CHAT_MSG_RAID_WARNING"] = "RAID"
}

local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_CHANNEL")
frame:RegisterEvent("CHAT_MSG_GUILD")
frame:RegisterEvent("CHAT_MSG_PARTY")
frame:RegisterEvent("CHAT_MSG_PARTY_LEADER")
frame:RegisterEvent("CHAT_MSG_SAY")
frame:RegisterEvent("CHAT_MSG_YELL")
frame:RegisterEvent("CHAT_MSG_EMOTE")
frame:RegisterEvent("CHAT_MSG_INSTANCE_CHAT")
frame:RegisterEvent("CHAT_MSG_INSTANCE_CHAT_LEADER")
frame:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
frame:RegisterEvent("CHAT_MSG_RAID")
frame:RegisterEvent("CHAT_MSG_RAID_LEADER")
frame:RegisterEvent("CHAT_MSG_RAID_WARNING")

KirossShh_disable = false

frame:SetScript("OnEvent", 
function(self, event, message, sender, _, _, _, _, _, chan_num, chan_name, ...)
    if KirossShh_disable == true then
        return
    end
    
    -- Remove the realm name from sender name
	local index = string.find(sender, "-")
	name = sender
	if index ~= nil then
		name = string.sub(sender, 0, index-1)
	end
	
    for i, t_name in ipairs(kiross_chars) do
        if name == t_name then
            -- Message to send
            local text
        
            if chat_table[event] == "EMOTE" then
                DoEmote("SILENCE", name)
            else
                text = t_name .. " Shhh"
        
                SendChatMessage(text, chat_table[event], nil, chan_num)
                print(event)
                print(chan_num, chan_name, name, message)
            end
        end
    end
end)

--[[
CHANNEL x
DND
EMOTE x
GUILD x
INSTANCE_CHAT x
OFFICER
PARTY x
RAID x
RAID_WARNING
SAY x
WHISPER
YELL x
--]]

