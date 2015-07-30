name_table = {
            ["Telch"] = "druid",
            ["Telchor"] = "shaman", 
            ["Dandelo"] = "mage", 
            ["Dandelock"] = "lock", 
            ["Heyoh"] = "death knight", 
            ["Flagg"] = "warrior",
            ["Manjello"] = "paladin"}

local LoginFrame = CreateFrame("Frame")
LoginFrame:RegisterEvent("CHAT_MSG_SYSTEM")

LoginFrame:SetScript("OnEvent", 
function(self, event, ...)
    local some_var = ...
    local name = some_var:match( "^.*%[(.*)%].* has come online")
    if name then
        for char_name, class in pairs(name_table) do
            if name == char_name then
                if name == "Dandelo" then
                    local msg = "False alarm, telch's main is still " .. class
                    SendChatMessage(msg, "GUILD")
                    break
                else
                    local msg = "Ohay, telch is on his " .. class .. " how's the main switch going?"
                    SendChatMessage(msg, "GUILD")
                end
            end
        end
    end
end)

    --elseif some_var:sub(-8) == "offline." then
    --  print("SOMEONE LOGGED OFF")

