AddHook("OnDraw", "BTK", function()
    local open = ImGui.Begin("BTK HELPER", true)
    if open then
        if ImGui.BeginTabBar("MAIN MENU") then

            if ImGui.BeginTabItem("BTK") then
				ImGui.Text("MAIN MENU")
				if ImGui.Button("BET", ImVec2(100, 100)) then
					if arePositionsSet() then
						hook(2, "action|input\n|text|/tb")
					else
						ProxyOverlay("`4SET POS FIRST!")
					end
				end
                ImGui.SameLine()
                if ImGui.Button("CHECK", ImVec2(100, 100)) then
                    hook(2, "action|input\n|text|/cg")
                end
                ImGui.SameLine()
                if ImGui.Button("WIN", ImVec2(100, 100)) then
                    hook(2, "action|input\n|text|/tg")
                end
                ImGui.Spacing()
				ImGui.Text("HOSTER POSITION")
                if ImGui.Button("SET POS", ImVec2(100, 100)) then
                    autoDetectPositions()
                end
                ImGui.EndTabItem()
            end


            if ImGui.BeginTabItem("WRENCH MODE") then
				ImGui.Text("PULL & CBGL")
                if ImGui.Button("PULL", ImVec2(100, 100)) then
                    hook(2, "action|input\n|text|/pm")
                end
                ImGui.SameLine()
                if ImGui.Button("CBGL", ImVec2(100, 100)) then
                    hook(2, "action|input\n|text|/mm")
                end
                ImGui.EndTabItem()
            end

            if ImGui.BeginTabItem("LOGS") then
                if ImGui.BeginTabBar("Logs_store") then
                    if ImGui.BeginTabItem("Drop & Collect") then
                        ImGui.BeginChild("LogScrollRegion", ImVec2(0, 300), true)

                        -- Print logs in reverse (newest first)
                        for i = #dropTakeList, 1, -1 do
							ImGui.TextWrapped(
								dropTakeList[i]
								:gsub("add_smalltext|", "")  -- Remove the dialog prefix
								:gsub("|\n", "")            -- Remove the trailing pipe and newline
								:gsub("`[%w%p]", "")        -- Remove all color codes (` followed by any letter/number/punctuation)
							)
                        end
                    
                        ImGui.EndChild()
                        ImGui.EndTabItem()
                    end
                    if ImGui.BeginTabItem("BET LOG") then
                        ImGui.BeginChild("LogScrollRegion", ImVec2(0, 300), true)
                        if #BetHistory == 0 then
                            ImGui.Text("No bet history recorded.")
                        else
                            for i = #BetHistory, 1, -1 do
                                local entry = BetHistory[i]
                                local bgl = math.floor(entry.amount / 10000)
                                local remaining = entry.amount % 10000
                                local dl = math.floor(remaining / 100)
                                local wl = remaining % 100
                    
                                ImGui.TextWrapped(string.format("%02d:%02d:%02d - %d BGL %d DL %d WL",
                                    tonumber(os.date("%H", os.time())),
                                    tonumber(os.date("%M", os.time())),
                                    tonumber(os.date("%S", os.time())),
                                    bgl, dl, wl))
								end
							end
							ImGui.EndChild()
							ImGui.EndTabItem()
						end
						ImGui.EndTabBar()
					end
					ImGui.EndTabItem()
				end
	
				-- Dedicated Auto Spam Tab (separate from logs)
				if ImGui.BeginTabItem("AUTO SPAM") then
					ImGui.Text("SPAM CONFIGURATION")
					ImGui.Separator()
					
					-- Spam message input
					local changed
					changed, spam_message = ImGui.InputText("Message", spam_message, 100)
					
					-- Control buttons
					if ImGui.Button("START", ImVec2(120, 40)) then
						if spam_message ~= "" then
							hook(2, "action|input\n|text|/spam " .. spam_message)
							hook(2, "action|input\n|text|/os")
							ProxyOverlay("Started spamming: " .. spam_message)
						else
							ProxyOverlay("Please enter a message first!")
						end
					end
					
					ImGui.SameLine()
					
					if ImGui.Button("STOP", ImVec2(120, 40)) then
						hook(2, "action|input\n|text|/ofs")
						ProxyOverlay("Stopped spamming")
					end
					
					ImGui.EndTabItem()
				end
	
				ImGui.EndTabBar()
			end
		end
		ImGui.End()
	end)






function command()
	cmd = "\nadd_label_with_icon|big|`wAll BTK Command                                                             |left|2480|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wInformation|left|2480|"..
"\nadd_textbox|`w/cmd `w[`9Shows all commands`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wMain Command|left|340|"..
"\nadd_textbox|`w/sdb `w[`9Enabled/disabled blok SDB`w]|"..
"\nadd_textbox|`w/blue `w[`9Convert black to blue gem lock`w]|"..
"\nadd_textbox|`w/black `w[`9Convert blue to black gem lock`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wHoster Command|left|340|"..
"\nadd_textbox|`w/w `7{amount} `w[`9Drop world lock`w]|"..
"\nadd_textbox|`w/dd `7{amount} `w[`9Drop diamond lock`w]|"..
"\nadd_textbox|`w/b `7{amount} `w[`9Drop blue gem lock`w]|"..
"\nadd_textbox|`w/bl `7{amount} `w[`9Drop black gem lock`w]|"..
"\nadd_textbox|`w/setup `w[`9Manual Setup`w]"..
"\nadd_textbox|`w/tax `7{amount} `w[`9Set tax`w]|"..
"\nadd_textbox|`w/tb `w[`9Take Bet`w]|"..
"\nadd_textbox|`w/tg `w[`9Shows Gems and Auto Drop to Winner`w]|"..
"\nadd_textbox|`w/win `w[`9Auto drop to winners`w]|"..
"\nadd_textbox|`w/pm `w[`9Enabled/disabled wrench mode pull`w]|"..
"\nadd_textbox|`w/wlog `w[`9Winner Gems Logs`w]|"..
"\nadd_textbox|`w/dlog `w[`9Show drop/pickup logs`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wBank Command|left|340|"..
"\nadd_textbox|`w/wd `w[`9Withdraw blue gem lock from bank`w]|"..
"\nadd_textbox|`w/depo `wor `w/dp `w[`9Deposit blue gem lock to bank`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wSpam Command|left|340|"..
"\nadd_textbox|`w/spam `w[`9<<Text>>`w]|"..
"\nadd_textbox|`w/os `w[`9Enable auto spam`w]|"..
"\nadd_textbox|`w/ofs `w[`9Disabled auto spam`w]|"..
"\nadd_quick_exit||"..
"\nend_dialog|proxy|Enjoy|"
	SendVariantList({
		[0] = "OnDialogRequest",
		[1] = cmd
	})
end


data = {}
local pull = false
local kick = false
local ban = false
local cbgl = false
local bgems = false
Count = 0
local sdbb = true
local takeleftx
local takelefty
local takerightx
local takerighty
local gemsleftx1
local gemslefty1
local gemsleftx2
local gemslefty2
local gemsleftx3
local gemslefty3
local gemsleftx4
local gemslefty4
local gemsrightx1
local gemsrighty1
local gemsrightx2
local gemsrighty2
local gemsrightx3
local gemsrighty3
local DropMode = false
local putchand = true
local cg1 = 0
local cg2 = 0
local Growid = GetLocal().name
local WinnerLog = {}
local emojiChatEnabled = false
local HostCsn = "" -- For tracking wheel spin mode
local LogSpin = {} -- For tracking spin logs
BetHistory = {} -- Stores all bet logs with timestamps
local CurrentTotalAfterTax = 0 -- Stores current session total
local blockSlaveChat = false
dropTakeList = {} -- Stores drop/pickup logs
local blockSlaveChat = true
local blockSlaveAvatar = true
local taxset = 5


function arePositionsSet()
    return takeleftx and takelefty and takerightx and takerighty and
           gemsleftx1 and gemslefty1 and gemsrightx1 and gemsrighty1
end

function ProxyOverlay(str)
	SendVariantList({
		[0] = "OnTextOverlay",
		[1] = str
	})
end

--- REMOVE SPAMMERSLAVE
AddHook("onvariant", "block_slave", function(var)
    -- Block spammer slave chat messages
    if blockSlaveChat and var[0] == "OnConsoleMessage" then
        if var[1]:find("'s Spammer Slave. ") then
            return true -- Block the message
        end
    end
    
    -- Block spammer slave avatars
    if blockSlaveAvatar and var[0] == "OnSpawn" then
        if var[1]:find("userID|0") or var[1]:find("Spawning...") then
            return true -- Block the avatar spawn
        end
    end
    return false
end)


----REMOVE PARTICLE
function removeparticle(packet)
    if packet.type == 17 or packet.type == 36 then
        return true
    end
return false
end
AddHook("onprocesstankupdatepacket", "Hook99", removeparticle)

-- Add this function with other utility functions
function ShowBetLog()
    local dialogContent = "\nadd_label_with_icon|big|`9Bet Log History|left|7188|"..
                         "\nadd_spacer|small|"
    
    -- Add each historical entry
    if #BetHistory == 0 then
        dialogContent = dialogContent.."\nadd_textbox|`9No bet history recorded|"
    else
        for i = #BetHistory, 1, -1 do -- Show newest first
            local entry = BetHistory[i]
            local bgl = math.floor(entry.amount / 10000)
            local remaining = entry.amount % 10000
            local dl = math.floor(remaining / 100)
            local wl = remaining % 100
            
            dialogContent = dialogContent..
                "\nadd_textbox|`e"..bgl.." BGL `c"..dl.." DL `9"..wl.." WL `0- "..entry.time.."|"
        end
    end
    
    dialogContent = dialogContent..
        "\nadd_spacer|small|"..
        "\nadd_quick_exit||"..
        "\nend_dialog|betlog|Close|"
    
    SendVariantList({
        [0] = "OnDialogRequest",
        [1] = dialogContent
    })
end

-- Add this hook to handle button clicks
AddHook("onvariant", "handle_betlog", function(var)
    if var[0] == "OnDialogRequest" and var[1]:find("dialog_name|betlog") then
        if var[1]:find("buttonClicked|resetcurrent") then
            CurrentTotalAfterTax = 0
            ShowBetLog()
            return true
        elseif var[1]:find("buttonClicked|clearhistory") then
            BetHistory = {}
            ShowBetLog()
            return true
        end
    end
    return false
end)


local emoji = {
    "sigh", "mad", "smile", "tongue", "wow", "no", "shy", "wink", "music", "lol",
    "yes", "love", "megaphone", "heart", "cool", "kiss", "agree", "see-no-evil",
    "dance", "build", "oops", "sleep", "punch", "bheart", "cry", "party", "wl",
    "grow", "gems", "gtoken", "plead", "vend", "bunny", "cactus", "peace", "terror",
    "troll", "halo", "nuke", "pine", "football", "fireworks", "song", "ghost", "evil",
    "pizza", "alien", "clap", "turkey", "gift", "cake", "heartarrow", "shamrock",
    "grin", "ill", "eyes", "weary", "moyai",
}

-- Add this function with other utility functions
local function randomOutput(list)
    local randomIndex = math.random(1, #list)
    return list[randomIndex]
end

function dropTakeLogs()
    local dropTakeDialog = [[
add_label_with_icon|big| `9Drop/Pickup Logs``|left|3524|
add_spacer|small|
text_scaling_string|9999999999
]]
    
    -- Add log entries in reverse order (newest first)
    for i = #dropTakeList, 1, -1 do
        dropTakeDialog = dropTakeDialog..dropTakeList[i]
    end
    
    dropTakeDialog = dropTakeDialog..
		"add_quick_exit||"..
		"add_spacer|small|"..
		"\nend_dialog||Close|"

    SendVariantList({
        [0] = "OnDialogRequest",
        [1] = dropTakeDialog
    })
end

-- Add this hook to modify chat messages with emojis
AddHook("onsendpacket", "emojiChat", function(type, packet)
    if type == 2 and packet:find("action|input\n|text|") then
        args = string.gsub(packet, "action|input\n|text|", "")
        
        -- Check if it's the toggle command
        if args:lower() == "/emoji" then
            emojiChatEnabled = not emojiChatEnabled
            local status = emojiChatEnabled and "`2Enabled" or "`4Disabled"
            SendPacket(2, "action|input\n|text|`9Emoji chat is now "..status.."`9!")
            return true
        end
        
        -- Don't modify commands or if emoji chat is disabled
        if args:sub(1, 1) == "/" or not emojiChatEnabled then
            return false
        end
        
        -- Send message with random emoji (without rainbow colors)
        SendPacket(2, "action|input\ntext|("..randomOutput(emoji)..") ".. args)
        return true
    end
    return false
end)

-- Add this function to log winners
function LogWinner(side, gemsCount, opponentGems)
    local timestamp = os.date("%H:%M on %d/%m")
    local logEntry = {
        side = side,
        gems = gemsCount,
        opponentGems = opponentGems,
        time = timestamp
    }
    table.insert(WinnerLog, logEntry)
end

-- Add this function to display the winner log
function ShowWinnerLog()
    local dialogContent = "\nadd_label_with_icon|big|`9Gems Winner Log|left|112|"..
                         "\nadd_spacer|small|"
    
    if #WinnerLog == 0 then
        dialogContent = dialogContent.."\nadd_textbox|`9No winner logs yet|left|"
    else
        for i, log in ipairs(WinnerLog) do
            dialogContent = dialogContent..
                "\nadd_label_with_icon|small|`2"..log.side.." `wWin `2"..log.gems.." `wVS `4"..log.opponentGems.." `w("..log.time..")|left|112|"
        end
    end
    
    dialogContent = dialogContent..
        "\nadd_spacer|small|"..
        "\nadd_quick_exit||"..
        "\nend_dialog|winnerlog|Close|"
    
    SendVariantList({
        [0] = "OnDialogRequest",
        [1] = dialogContent
    })
end


function removeColorAndSymbols(str)
    cleanedStr = string.gsub(str, "`(%S)", '')
    cleanedStr = string.gsub(cleanedStr, "Dr%.%s*", '')
    cleanedStr = string.gsub(cleanedStr, "%s*%[BOOST%]", '')
    cleanedStr = string.gsub(cleanedStr, "%(%d+%)", '')
    cleanedStr = string.gsub(cleanedStr, "`{2}|(~{2})", '')
    return cleanedStr
end


function pos(px, py)
    local hasil
    if not px and not py then
        hasil = "`2Click This To Set``"
    else
        hasil = "`b[`2X: `9" .. math.floor(px) .. "`w,`2Y: `9" .. math.floor(py) .. "`b]"
    end
    return hasil
end

function bubble(str)
	SendVariantList({
		[0] = "OnTalkBubble",
		[1] = GetLocal().netid,
		[2] = str
	})
end

function wear(id)
	SendPacketRaw(false, {
		type = 10,
		value = id
	})
end

function btk()
    setupbtk = 
    "\nadd_label_with_icon|big|`2Configuration BTK``|left|9438|" ..
    "\nadd_spacer|small|" ..
    "\nadd_label_with_icon|small|`9Position Gems Right:|left|340|" ..
    "\nadd_button|gemsright1|`9Right 1: " .. pos(gemsrightx1, gemsrighty1) .. "|noflags|0|" ..
    "\nadd_button|gemsright2|`9Right 2: " .. pos(gemsrightx2, gemsrighty2) .. "|noflags|0|" ..
    "\nadd_button|gemsright3|`9Right 3: " .. pos(gemsrightx3, gemsrighty3) .. "|noflags|0|" ..
    "\nadd_spacer|small|" ..
    "\nadd_label_with_icon|small|`9Position Gems Left:|left|340|" ..
    "\nadd_button|gemsleft1|`9Left 1: " .. pos(gemsleftx1, gemslefty1) .. "|noflags|0|" ..
    "\nadd_button|gemsleft2|`9Left 2: " .. pos(gemsleftx2, gemslefty2) .. "|noflags|0|" ..
    "\nadd_button|gemsleft3|`9Left 3: " .. pos(gemsleftx3, gemslefty3) .. "|noflags|0|" ..
    "\nadd_spacer|small|" ..
    "\nadd_label_with_icon|small|`9Position Back:|left|12854|" ..
    "\nadd_button|gemsleft4|`9Pos Back: " .. pos(gemsleftx4, gemslefty4) .. "|noflags|0|" ..
    "\nadd_spacer|small|" ..
    "\nadd_label_with_icon|small|`9Position Display For Take Bet:|left|1422|" ..
    "\nadd_button|takeright|`9Right: " .. pos(takerightx, takerighty) .. "|noflags|0|" ..
    "\nadd_button|takeleft|`9Left: " .. pos(takeleftx, takelefty) .. "|noflags|0|" ..
    "\nadd_smalltext|`9Support Transmatter Field``|" ..
    "\nadd_spacer|small|" ..
    "\nadd_quick_exit||" ..
    "\nend_dialog|setupcoy|Cancel|Apply|"
    
    SendVariantList({
        [0] = "OnDialogRequest",
        [1] = setupbtk
    })
end


function GetName(id) 
    for _, player in pairs(GetPlayerList()) do 
        if player.netid == id then 
            return player.name 
        end 
    end 
end




function ProxyLog(str)
	LogToConsole("`w[`2BTK Helper`w] `0" .. str)
end


LogToConsole("`9Script Will Run In `25 `9Seconds")
SendPacket(2, "action|input\n|text|`0Proxy `6BTK `2ON!")
Sleep(1000)


function take()
    tiles = {
        -- Left side positions (main and -1 x)
        {takeleftx, takelefty},
        {takeleftx -1, takelefty},
        
        -- Right side positions (main and +1 x)
        {takerightx, takerighty},
        {takerightx +1, takerighty}
    }
    
    for _, tile in pairs(tiles) do
        for _, obj in pairs(GetObjectList()) do
            if (obj.pos.x) // 32 == tile[1] and (obj.pos.y) // 32 == tile[2] then
                SendPacketRaw(false, {
                    type = 11,
                    value = obj.oid,
                    x = obj.pos.x,
                    y = obj.pos.y,
                })
                table.insert(data, {
                    id = obj.id,
                    count = obj.amount
                })
            end
        end
    end
    Data()
end

function checkBetLeft(x, y)
    local totalWL = 0
    for _, obj in pairs(GetObjectList()) do
        if (obj.pos.x) // 32 == x and (obj.pos.y) // 32 == y then
            if obj.id == 242 then -- World Lock
                totalWL = totalWL + obj.amount
            elseif obj.id == 1796 then -- Diamond Lock
                totalWL = totalWL + obj.amount * 100
            elseif obj.id == 7188 then -- Blue Gem Lock
                totalWL = totalWL + obj.amount * 10000
            elseif obj.id == 11550 then -- Black Gem Lock
                totalWL = totalWL + obj.amount * 1000000
            end
        end
    end
    -- Convert to BGL and DL
    local bgl = math.floor(totalWL / 10000)
    local remainingWL = totalWL % 10000
    local dl = math.floor(remainingWL / 100)
    return bgl, dl, totalWL
end

function checkBetRight(x, y)
    local totalWL = 0
    for _, obj in pairs(GetObjectList()) do
        if (obj.pos.x) // 32 == x and (obj.pos.y) // 32 == y then
            if obj.id == 242 then -- World Lock
                totalWL = totalWL + obj.amount
            elseif obj.id == 1796 then -- Diamond Lock
                totalWL = totalWL + obj.amount * 100
            elseif obj.id == 7188 then -- Blue Gem Lock
                totalWL = totalWL + obj.amount * 10000
            elseif obj.id == 11550 then -- Black Gem Lock
                totalWL = totalWL + obj.amount * 1000000
            end
        end
    end
    -- Convert to BGL and DL
    local bgl = math.floor(totalWL / 10000)
    local remainingWL = totalWL % 10000
    local dl = math.floor(remainingWL / 100)
    return bgl, dl, totalWL
end

function Data()
    Amount = 0
    for _, list in pairs(data) do
        if list.id == 11550 then -- Black Gem Lock
            Amount = Amount + list.count * 1000000
        elseif list.id == 7188 then -- Blue Gem Lock
            Amount = Amount + list.count * 10000
        elseif list.id == 1796 then -- Diamond Lock
            Amount = Amount + list.count * 100
        elseif list.id == 242 then -- World Lock
            Amount = Amount + list.count
        end
    end
    data = {}
end

AddHook("onvariant", "variabel", function(var)
    if var[0]:find("OnConsoleMessage") and var[1]:find("Spam detected!") then
        return true
    end
    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) World Lock") then
        local AmountCollectWL = tonumber(var[1]:match("Collected  `w(%d+) World Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectWL.." `9World Lock")
        return false
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Diamond Lock") then
        local AmountCollectDL = tonumber(var[1]:match("Collected  `w(%d+) Diamond Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectDL.." `1Diamond Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `2Collected `w".. AmountCollectDL .." `1Diamond Lock `9in `2"..GetWorld().name.."|\n")
        return false
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Blue Gem Lock") then
        local AmountCollectBGL = tonumber(var[1]:match("Collected  `w(%d+) Blue Gem Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectBGL.." `eBlue Gem Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `2Collected `w".. AmountCollectBGL .." `eBlue Gem Lock `9in `2"..GetWorld().name.."|\n")
        return false
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Black Gem Lock") then
        local AmountCollectBBGL = tonumber(var[1]:match("Collected  `w(%d+) Black Gem Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectBBGL.." `bBlack Gem Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `2Collected `w".. AmountCollectBBGL .." `bBlack Gem Lock `9in `2"..GetWorld().name.."|\n")
        return false
    end

    return false
end)


function dropright(x, y)
	if math.abs(GetLocal().pos.x // 32 - x) > 8 or math.abs(GetLocal().pos.y // 32 - y) > 8 then
		ProxyOverlay("`9[Not Found]")
		return nil
	end
	if GetTiles(x, y).collidable then
		ProxyOverlay("`9[Not Found]")
		return nil
	end
	SendPacketRaw(false, {
		type = 0,
		x = x * 32,
		y = y * 32,
		state = 32
	})
end

function dropleft(x, y)
	if math.abs(GetLocal().pos.x // 32 - x) > 8 or math.abs(GetLocal().pos.y // 32 - y) > 8 then
		ProxyOverlay("`9[Not Found]")
		return nil
	end
	if GetTiles(x, y).collidable then
		ProxyOverlay("`9[Not Found]")
		return nil
	end
	SendPacketRaw(false, {
		type = 0,
		x = x * 32,
		y = y * 32,
		state = 48
	})
end

tile = {
	pos1 = {
		{
			x = gemsrightx1,
			y = gemsrighty1
		},
		{
			x = gemsrightx2,
			y = gemsrighty2
		},
		{
			x = gemsrightx3,
			y = gemsrighty3
		}
	},
	pos2 = {
		{
			x = gemsleftx1,
			y = gemslefty1
		},
		{
			x = gemsleftx2,
			y = gemslefty2
		},
		{
			x = gemsleftx3,
			y = gemslefty3
		}
	}
}

function takegems()
    -- First collect all gems from both sides
    for _, tiles in pairs(tile.pos1) do -- Right side gems
        for _, obj in pairs(GetObjectList()) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                SendPacketRaw(false, {
                    type = 11,
                    value = obj.oid,
                    x = obj.pos.x,
                    y = obj.pos.y,
                })
                
            end
        end
    end
    
    for _, tiles in pairs(tile.pos2) do -- Left side gems
        for _, obj in pairs(GetObjectList()) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                SendPacketRaw(false, {
                    type = 11,
                    value = obj.oid,
                    x = obj.pos.x,
                    y = obj.pos.y,
                })
                
            end
        end
    end
    
    -- Now count the gems
    Count = 0;
    data = {};
    
    -- Count right side gems
    for _, obj in pairs(GetObjectList()) do
        for _, tiles in pairs(tile.pos1) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                Count = Count + obj.amount;
            end
        end
    end
    table.insert(data, Count)
    
    -- Count left side gems
    Count = 0;
    for _, obj in pairs(GetObjectList()) do
        for _, tiles in pairs(tile.pos2) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                Count = Count + obj.amount;
            end
        end
    end
    table.insert(data, Count)
    
    -- Determine winner and drop
    if data[2] > data[1] then -- Left wins
        SendPacket(2, "action|input\n|text|`w[`2WIN`w]Kiri `2"..data[2].." `b/ `4"..data[1].." `wKanan[`4LOSE`w]");
        cg2 = data[2]
        LogWinner("LEFT", data[2], data[1])
        
        -- Auto drop to left winner
        if jatuh then
            ireng = math.floor(jatuh / 1000000)
            bgl = math.floor(jatuh / 10000)
            jatuh = jatuh - bgl * 10000
            dl = math.floor(jatuh / 100)
            wl = jatuh % 100
            dropright(takeleftx - 2, takelefty)
            dropwl = tonumber(wl)
            dropdl = tonumber(dl)
            if GetItemCount(242) < dropwl or GetItemCount(242) == 0 then
                wear(1796)
            end
            if GetItemCount(1796) < dropdl or GetItemCount(1796) == 0 then
                wear(7188)
            end
            DropMode = true
        end
        
    elseif data[1] > data[2] then -- Right wins
        SendPacket(2, "action|input\n|text|`w[`4LOSE`w]Kiri `4"..data[2].." `b/ `2"..data[1].." `wKanan[`2WIN`w]");
        cg1 = data[1]
        LogWinner("RIGHT", data[1], data[2])
        
        -- Auto drop to right winner
        if jatuh then
            ireng = math.floor(jatuh / 1000000)
            bgl = math.floor(jatuh / 10000)
            jatuh = jatuh - bgl * 10000
            dl = math.floor(jatuh / 100)
            wl = jatuh % 100
            dropright(takerightx, takerighty)
            dropwl = tonumber(wl)
            dropdl = tonumber(dl)
            if GetItemCount(242) < dropwl or GetItemCount(242) == 0 then
                wear(1796)
            end
            if GetItemCount(1796) < dropdl or GetItemCount(1796) == 0 then
                wear(7188)
            end
            DropMode = true
        end
        
    else -- Tie
        ---SendPacket(2, "action|input\n|text|Ya Sama `2: " .. data[2] .. "(wink) `0[ `bTie `0] Ya Sama `w: " .. data[1] .. "(wink)");
	SendPacket(2, "action|input\n|text|`0[TIE] Kiri (gems) `0"..data[2].." `b/ `0"..data[1].." `0(gems) Kanan [TIE]");
        ProxyOverlay("`9Nothing Winner `4TIE!")
    end
    
    data = {};
end

function get(val)
	for _, player in pairs(GetPlayerList()) do
		if player.netid == val then
			return player.name
		end
	end
end

function GetItemCount(id)
	for _, inv in pairs(GetInventory()) do
		if inv.id == id then
			return inv.amount
		end
	end
	return 0
end

function hook(type, str)
	if str:find("action|wrench\n|netid|(%d+)") then 
		local id = str:match("action|wrench\n|netid|(%d+)")
		if pull == true then
			local netid0 = tonumber(id)
			for _, plr in pairs(GetPlayerList()) do
				if plr.netid == netid0 then
					SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..id.."|\nbuttonClicked|pull")
					SendPacket(2, "action|input\n|text|`#Gas Sir?(evil)")
					return true
				elseif kick == true then
					SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..id.."|\nbuttonClicked|kick")
					return true
				elseif ban == true then
					SendPacket(2,"action|dialog_return\ndialog_name|popup\nnetID|"..id.."|\nbuttonClicked|world_ban")
					return true 
				end 
			end 
		end 
	end
	if str:find("/pm") or str:find("buttonClicked|wp") then
		if pull == false then
			pull = true
			SendPacket(2, "action|input\n|text|`2Enabled `9Wrench `9Pull `9Mode")
			return true
		else
			pull = false
			SendPacket(2, "action|input\n|text|`4Disabled `9Wrench `9Pull `9Mode")
			return true
		end
	end
	if str:find("/wk") or str:find("buttonClicked|wk") then
		if kick == false then
			kick = true
			SendPacket(2, "action|input\n|text|`2Enabled `9Wrench `9Kick `9Mode")
			return true
		else
			kick = false
			SendPacket(2, "action|input\n|text|`4Disabled `9Wrench `9kick `9Mode")
			return true
		end
	end
	if str:find("/wb") or str:find("buttonClicked|wb") then
		if ban == false then
			ban = true
			SendPacket(2, "action|input\n|text|`2Enabled `9Wrench `9Ban `9Mode")
			return true
		else
			ban = false
			SendPacket(2, "action|input\n|text|`4Disabled `9Wrench `9Ban `9Mode")
			return true
		end
	end
	if str:find("/mm") or str:find("buttonClicked|cbgl") then
		if cbgl == false then
			cbgl = true
			ProxyOverlay("`2Enabled `9Fast Change Blue Gem Lock")
			return true
		else
			cbgl = false
			ProxyOverlay("`4Disabled `9Fast Change Blue Gem Lock")
			return true
		end
	end
	if str:find("/cmd") or str:find("buttonClicked|cmd") then
		command()
		return true
	elseif str:find("/setup") or str:find("buttonClicked|cui") then
		btk()
		return true
    end
	if str:find("/sdb") or str:find("buttonClicked|sdb") then
		if sdbb == false then
			sdbb = true
			ProxyOverlay("`2Enabled `9Blok SDB")
			return true
		else
			sdbb = false
			ProxyOverlay("`4Disabled `9Blok SDB")
			return true
		end
	end
	if str:find("/spam (.+)") then
		spam = str:match("/spam (.+)")
		ProxyOverlay("`9Your Spam Message Has Been Set Into`w : " .. spam)
		SendPacket(2, [[
action|input
|text|/setSpam ]] .. spam)
		return true
	end
	if str:find("/os") then
		SendPacket(2, [[
action|dialog_return
dialog_name|cheats
check_autospam|1]])
		ProxyOverlay("`9Activate Spam Mode")
		return true
	elseif str:find("/ofs") then
		SendPacket(2, [[
action|dialog_return
dialog_name|cheats
check_autospam|0]])
		ProxyOverlay("`9Deactivate Spam Mode")
		return true
	end
	if str:find("/eat") then
		if bgems == false then
			bgems = true
			ProxyOverlay("`2Enabled `9Auto Eat Black Gems")
			return true
		else
			bgems = false
			ProxyOverlay("`4Disabled `9Auto Eat Black Gems")
			return true
		end
	end
	if str:find("/blue") or str:find("buttonClicked|cbb") then
		SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bluegl")
		bubble("`9You Sharttered `bBlack Gem Lock `9into a `w100 `eBlue Gem Locks`w!")
		return true
	elseif str:find("/black") or str:find("buttonClicked|cbl") then
		SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
		bubble("`9You Compressed a `w100 `eBlue Gem Locks `winto `bBlack Gem Locks`w!")
		return true
	end
	if str:find("/win") then
		if cg2 > cg1 then
			ireng = math.floor(jatuh / 1000000)
			bgl = math.floor(jatuh / 10000)
			jatuh = jatuh - bgl * 10000
			dl = math.floor(jatuh / 100)
			wl = jatuh % 100
			dropright(takeleftx - 2, takelefty)
			dropwl = tonumber(wl)
			dropdl = tonumber(dl)
			if GetItemCount(242) < dropwl or GetItemCount(242) == 0 then
				wear(1796)
			end
			if GetItemCount(1796) < dropdl or GetItemCount(1796) == 0 then
				wear(7188)
			end
			DropMode = true
			ProxyOverlay("`9Dropping Win To Pos `2Left")
			cg1 = 0
			cg2 = 0
			return true
		elseif cg2 < cg1 then
			ireng = math.floor(jatuh / 1000000)
			bgl = math.floor(jatuh / 10000)
			jatuh = jatuh - bgl * 10000
			dl = math.floor(jatuh / 100)
			wl = jatuh % 100
			dropright(takerightx + 1, takerighty)
			dropwl = tonumber(wl)
			dropdl = tonumber(dl)
			if GetItemCount(242) < dropwl or GetItemCount(242) == 0 then
				wear(1796)
			end
			if GetItemCount(1796) < dropdl or GetItemCount(1796) == 0 then
				wear(7188)
			end
			DropMode = true
			ProxyOverlay("`9Dropping Win To Pos `2Right")
			cg1 = 0
			cg2 = 0
			return true
		elseif cg2 == cg1 then
			ProxyOverlay("`9Nothing Winner `2TIE!")
			cg1 = 0
			cg2 = 0
			return true
		end
	end
	if str:find("/tax (%d+)") then
		taxset = str:match("/tax (%d+)")
		ProxyOverlay("`w[`9Tax: `2" .. taxset .. "%`w]")
		return true
	end
	if str:find("/w (%d+)") then
		count = str:match("/w (%d+)")
		c = tonumber(count)
		if GetItemCount(242) < c or GetItemCount(242) == 0 then
			wear(1796)
		end
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. count)
		ProxyLog("`9Dropped `2" .. count .. " `9World Lock")
		return true
	end
	if str:find("/dd (%d+)") then
		count = str:match("/dd (%d+)")
		c = tonumber(count)
		if GetItemCount(1796) < c or GetItemCount(1796) == 0 then
			wear(7188)
			wear(242)
		end
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. count)
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `cDiamond Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. count .." `cDiamond Lock `9in `2"..GetWorld().name.."|\n")
		return true
	end
	if str:find("/b (%d+)") then
		count = str:match("/b (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. count)
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `eBlue Gem Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. count .." `eBlue Gem Lock `9in `2"..GetWorld().name.."|\n")
		return true
	end
	if str:find("/bl (%d+)") then
		count = str:match("/bl (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. count)
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `bBlack Gem Lock")
		table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. count .." `bBlack Gem Lock `9in `2"..GetWorld().name.."|\n")
		return true
	end
	if str:find("/ar (%d+)") then
	    count = str:match("/ar (%d+)")
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `9Arroz")
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|4604|\nitem_count|"..count)
        return true
    end
	if str:find("/cl (%d+)") then
	    count = str:match("/cl (%d+)")
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `9Clover")
        SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|528||\nitem_count|"..count)
        return true
    end	
	if str:find("/tg") or str:find("buttonClicked|tk") then
		takegems()
		return true
	end
            if str:find("/emoji") then
        emojiChatEnabled = not emojiChatEnabled
        local status = emojiChatEnabled and "`2Enabled" or "`4Disabled"
        SendPacket(2, "action|input\n|text|`9Emoji chat: "..status)
        return true
    end
    if str:find("dialog_name|WorldSpin\nbuttonClicked|(%d+)") then 
        NetID = tonumber(str:match("dialog_name|WorldSpin\nbuttonClicked|(%d+)")) 
        FilterSpin(NetID) 
        return true 
    end
	if str:find("/wlog") then
        ShowWinnerLog()
        return true
    end
	if str:find("/top") or str:find("buttonClicked|V1") then
        setupTopPositions()
    return true
    end
    if str:find("/down") or str:find("buttonClicked|V2") then
        setupDownPositions()
    return true
    end
	if str:find("buttonClicked|pt") then
	    btkw()
		return true
	end
	if str:find("buttonClicked|tel") then
		tele()
		return true
	end
	if str:find("buttonClicked|back") then
	 xxx()  -- Return to main menu
	 return true
    end
	if str:find("/log") then
    dropTakeLogs()
    return true
	end
	if str:find("/cg") or str:find("buttonClicked|ck") then
	    checkGems()
		return true
	end
	    if str:find("/slave") then
        blockSlaveChat = not blockSlaveChat
        local status = blockSlaveChat and "`2Enabled" or "`4Disabled"
        SendPacket(2, "action|input\n|text|`9Spammer slave chat blocking: "..status)
        return true
    end

    if str:find("/slaveav") then
        blockSlaveAvatar = not blockSlaveAvatar
        local status = blockSlaveAvatar and "`2Enabled" or "`4Disabled"
        SendPacket(2, "action|input\n|text|`9Spammer slave avatar blocking: "..status)
        return true
    end
	if str:find("/tb") or str:find("buttonClicked|dw") then
        take()
        tax = math.floor(Amount * taxset / 100)
        jatuh = Amount - tax
	 -- Update current session total
		CurrentTotalAfterTax = CurrentTotalAfterTax + jatuh
    
    -- Add to permanent history
    table.insert(BetHistory, {
        amount = jatuh,
        time = os.date("%H:%M on %d/%m"),
        taxRate = taxset
    })
        
        -- Convert to BGL and DL format
        local totalBGL = math.floor(Amount / 20000)
        local totalDL = math.floor((Amount % 10000) / 100)
        local jatuhBGL = math.floor(jatuh / 10000)
        local jatuhDL = math.floor((jatuh % 10000) / 100)
        SendPacket(2, "action|input\n|text|`w[`0P1: `2"..totalBGL.." BGL "..totalDL.." DL`w]`bVS`w[`0P2 :`2"..totalBGL.." BGL "..totalDL.." DL`w] `w[`0Tax: `2"..taxset.."%`w] `w[`0Win: `2"..jatuhBGL.." BGL "..jatuhDL.." DL`w]")
        return true
    end
if str:find("/betlog") or str:find("buttonClicked|logbet") then
    ShowBetLog()
    return true
end
	if str:find("/depo (%d+)") or str:find("/dp (%d+)") then
		count = str:match("/depo (%d+)") or str:match("/dp (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|bank_deposit\nbgl_count|" .. count)
		SendPacket(2, "action|input\n|text|"..Growid.." `wDeposit `e" .. count .. " Blue Gem Lock")
		return true
	elseif str:find("/wd (%d+)") then
		count = str:match("/wd (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|bank_withdraw\nbgl_count|" .. count)
		SendPacket(2, "action|input\n|text|"..Growid.." `wWithdraw `e" .. count .. " Blue Gem Lock")
		return true
	end
	if str:find("buttonClicked|gemsright1") then
		gemsright1 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	elseif str:find("buttonClicked|gemsright2") then
		gemsright2 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	elseif str:find("buttonClicked|gemsright3") then
		gemsright3 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	end
	if str:find("buttonClicked|gemsleft1") then
		gemsleft1 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	elseif str:find("buttonClicked|gemsleft2") then
		gemsleft2 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	elseif str:find("buttonClicked|gemsleft3") then
		gemsleft3 = true
		ProxyLog("`9Please Punch Chand")
		ProxyOverlay("`9Please Punch Chand")
		return true
	elseif str:find("buttonClicked|gemsleft4") then
		gemsleft4 = true
		ProxyLog("`9Punch Position Back")
		ProxyOverlay("`9Punch Position Back")
		return true
	end
	if str:find("buttonClicked|takeright") then
		takerighton = true
		ProxyLog("`9Please Punch Display")
		ProxyOverlay("`9Please Punch Display")
		return true
	elseif str:find("buttonClicked|takeleft") then
		takelefton = true
		ProxyLog("`9Please Punch Display")
		ProxyOverlay("`9Please Punch Display")
		return true
	end
end
AddHook("onsendpacket", "any", hook)

function autoDetectPositions()
    local xhost = math.floor(GetLocal().pos.x / 32)
    local yhost = math.floor(GetLocal().pos.y / 32)
    local chandsAbove = 0
    local chandsBelow = 0

    -- Count chandeliers
    for _, tile in pairs(GetTiles()) do
        if math.abs(tile.x - xhost) <= 5 and math.abs(tile.y - yhost) <= 5 then
            if tile.fg == 340 then -- Chandelier ID
                if tile.y < yhost then
                    chandsAbove = chandsAbove + 1
                elseif tile.y > yhost then
                    chandsBelow = chandsBelow + 1
                end
            end
        end
    end

    -- New improved decision logic
    if chandsAbove > chandsBelow and chandsAbove >= 3 then
        setupTopPositions()
        ---SendPacket(2, "action|input\n|text|`9Detected TOP setup ("..chandsAbove.." above vs "..chandsBelow.." below)")
    elseif chandsBelow > chandsAbove and chandsBelow >= 3 then
        setupDownPositions()
        ---SendPacket(2, "action|input\n|text|`9Detected DOWN setup ("..chandsBelow.." below vs "..chandsAbove.." above)")
    else
        -- Fallback to world position if counts are equal or unclear
        local worldHeight = GetWorld().height or 100
        if yhost < worldHeight / 2 then
            setupTopPositions()
            ---SendPacket(2, "action|input\n|text|`9Fallback TOP (equal chands: "..chandsAbove.." above, "..chandsBelow.." below)")
        else
            setupDownPositions()
           --- SendPacket(2, "action|input\n|text|`9Fallback DOWN (equal chands: "..chandsAbove.." above, "..chandsBelow.." below)")
        end
    end
end

-- Modify the existing functions to include auto-detection
function setupTopPositions()
    local xhost = math.floor(GetLocal().pos.x / 32)
    local yhost = math.floor(GetLocal().pos.y / 32)
    
    -- Take positions (display)
    takeleftx = xhost - 3
    takelefty = yhost + 1
    takerightx = xhost + 3
    takerighty = yhost + 1
    
    -- Gem positions (top)
    gemsleftx1 = xhost - 3
    gemslefty1 = yhost - 1
    gemsleftx2 = gemsleftx1 - 1
    gemslefty2 = gemslefty1
    gemsleftx3 = gemsleftx1 - 2
    gemslefty3 = gemslefty1
    
    gemsrightx1 = xhost + 3
    gemsrighty1 = yhost - 1
    gemsrightx2 = gemsrightx1 + 1
    gemsrighty2 = gemsrighty1
    gemsrightx3 = gemsrightx1 + 2
    gemsrighty3 = gemsrighty1
    
    -- Back position
    gemsleftx4 = xhost
    gemslefty4 = yhost
    
    -- Update tile table
    tile = {
        pos1 = {
            {x = gemsrightx1, y = gemsrighty1},
            {x = gemsrightx2, y = gemsrighty2},
            {x = gemsrightx3, y = gemsrighty3}
        },
        pos2 = {
            {x = gemsleftx1, y = gemslefty1},
            {x = gemsleftx2, y = gemslefty2},
            {x = gemsleftx3, y = gemslefty3}
        }
    }
    
    ProxyOverlay("`9Setup `2Done!")

end

function setupDownPositions()
    local xhost = math.floor(GetLocal().pos.x / 32)
    local yhost = math.floor(GetLocal().pos.y / 32)
    
    -- Take positions (display)
    takeleftx = xhost - 3
    takelefty = yhost - 1
    takerightx = xhost + 3
    takerighty = yhost - 1
    
    -- Gem positions (bottom)
    gemsleftx1 = xhost - 3
    gemslefty1 = yhost + 1
    gemsleftx2 = gemsleftx1 - 1
    gemslefty2 = gemslefty1
    gemsleftx3 = gemsleftx1 - 2
    gemslefty3 = gemslefty1
    
    gemsrightx1 = xhost + 3
    gemsrighty1 = yhost + 1
    gemsrightx2 = gemsrightx1 + 1
    gemsrighty2 = gemsrighty1
    gemsrightx3 = gemsrightx1 + 2
    gemsrighty3 = gemsrighty1
    
    -- Back position
    gemsleftx4 = xhost
    gemslefty4 = yhost
    
    -- Update tile table
    tile = {
        pos1 = {
            {x = gemsrightx1, y = gemsrighty1},
            {x = gemsrightx2, y = gemsrighty2},
            {x = gemsrightx3, y = gemsrighty3}
        },
        pos2 = {
            {x = gemsleftx1, y = gemslefty1},
            {x = gemsleftx2, y = gemslefty2},
            {x = gemsleftx3, y = gemslefty3}
        }
    }
    
    ProxyOverlay("`9Setup `2Done!")
end

function var(var)
	if var[0]:find("OnConsoleMessage") and var[1]:find("(%d+) Diamond Lock") then
		jumlah = var[1]:match("(%d+) Diamond Lock")
		s = tonumber(jumlah)
		for _, tile in pairs(GetTiles()) do
			if tile.fg == 3898 then
				if GetItemCount(1796) >= 100 or s >= 99 then
					SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. tile.x .. "|\ny|" .. tile.y .. "|\nbuttonClicked|bglconvert")
					ProxyOverlay("`2Successfully `9Change Blue Gem Lock")
				end
			end
		end
	end
	if var[0]:find("OnConsoleMessage") and var[1]:find("Collected") and var[1]:find("(%d+) Blue Gem Lock") then
		jumlah = var[1]:match("(%d+) Blue Gem Lock")
		s = tonumber(jumlah)
		if GetItemCount(7188) >= 150 or s >= 145 then
			SendPacket(2, "action|dialog_return\ndialog_name|info_box\nbuttonClicked|make_bgl")
			ProxyOverlay("`2Successfully `9Change Black Gem Lock")
		end
	end
	if var[0]:find("OnConsoleMessage") and var[1]:find("Collected") and var[1]:find("(%d+) World Lock") then
		jumlah = var[1]:match("(%d+) World Lock")
		s = tonumber(jumlah)
		if GetItemCount(242) >= 100 or s >= 99 then
			wear(242)
		end
	end
	if var[0]:find("OnConsoleMessage") then
		ProxyLog(var[1])
		return true
	end
	if var[0]:find("OnConsoleMessage") and var[1]:find("Collected") and var[1]:find("(%d+) Black Gems") then
		jumlah = var[1]:match("(%d+) Black Gems")
		if bgems == true then
			SendPacket(2, "action|dialog_return\ndialog_name|givexgems\nitem_id|-484|\nitem_count|" .. jumlah)
			ProxyLog("`9Auto Eat `2" .. jumlah .. " `9Black Gems")
			return true
		end
	end
	if var[0]:find("OnSDBroadcast") then
		if sdbb == true then
			return true
		end
	end
	if var[0]:find("OnDialogRequest") and var[1]:find("Wow, that's fast delivery.") then
		return true
	end
	if var[0]:find("OnDialogRequest") and var[1]:find("`wTelephone") then
		if cbgl == true then
			x = var[1]:match("embed_data|x|(%d+)")
			y = var[1]:match("embed_data|y|(%d+)")
			SendPacket(2, "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. x .. "|\ny|" .. y .. "|\nbuttonClicked|bglconvert")
			ProxyOverlay("`2Successfully `9Change Blue Gem Lock")
			return true
		end
		return false
	end
end
AddHook("onvariant", "any", var)

function raw(a)
    -- FPS Mode Handling
    if fpsMode and a.type == 3 and a.value == 18 then
        -- Get all position names that need to be set
        local positionsToSet = {}
        if not gemsrightx1 then table.insert(positionsToSet, "gemsright1") end
        if not gemsrightx2 then table.insert(positionsToSet, "gemsright2") end
        if not gemsrightx3 then table.insert(positionsToSet, "gemsright3") end
        if not gemsleftx1 then table.insert(positionsToSet, "gemsleft1") end
        if not gemsleftx2 then table.insert(positionsToSet, "gemsleft2") end
        if not gemsleftx3 then table.insert(positionsToSet, "gemsleft3") end
        if not gemsleftx4 then table.insert(positionsToSet, "gemsleft4") end
        if not takerightx then table.insert(positionsToSet, "takeright") end
        if not takeleftx then table.insert(positionsToSet, "takeleft") end
        
        if #positionsToSet > 0 then
            local nextPos = positionsToSet[1]
            
            if nextPos == "gemsright1" then
                gemsrightx1 = a.px
                gemsrighty1 = a.py
                --ProxyOverlay("`2Right 1")
            elseif nextPos == "gemsright2" then
                gemsrightx2 = a.px
                gemsrighty2 = a.py
                --ProxyOverlay("`2Right 2")
            elseif nextPos == "gemsright3" then
                gemsrightx3 = a.px
                gemsrighty3 = a.py
				--ProxyOverlay("`2Right 3")
				ProxyOverlay("`9Punch All Left Chand Position")
            elseif nextPos == "gemsleft1" then
                gemsleftx1 = a.px
                gemslefty1 = a.py
                --ProxyOverlay("`2Left 1")
            elseif nextPos == "gemsleft2" then
                gemsleftx2 = a.px
                gemslefty2 = a.py
                --ProxyOverlay("`2Left 2")
            elseif nextPos == "gemsleft3" then
                gemsleftx3 = a.px
                gemslefty3 = a.py
				--ProxyOverlay("`2Left 3\n`9Punch Back Position")
				ProxyOverlay("`9Punch Back Position")
            elseif nextPos == "gemsleft4" then
                gemsleftx4 = a.px
                gemslefty4 = a.py
                ProxyOverlay("`9Punch Take Right")
            elseif nextPos == "takeright" then
                takerightx = a.px
                takerighty = a.py
                ProxyOverlay("`9Punch Take Left")
            elseif nextPos == "takeleft" then
                takeleftx = a.px
                takelefty = a.py
                ProxyOverlay("`2All positions set!")
                fpsMode = true -- Automatically turn off when done
            end
            
            -- Update the tile table
            tile = {
                pos1 = {
                    {x = gemsrightx1, y = gemsrighty1},
                    {x = gemsrightx2, y = gemsrighty2},
                    {x = gemsrightx3, y = gemsrighty3}
                },
                pos2 = {
                    {x = gemsleftx1, y = gemslefty1},
                    {x = gemsleftx2, y = gemslefty2},
                    {x = gemsleftx3, y = gemslefty3}
                }
            }
            
            return true
        else
            fpsMode = false
            ProxyOverlay("`9All positions already set! Disabling FPS mode.")
            return true
        end
    end
    
    -- Original buttonClicked handling
	if gemsright1 == true then
		if a.type == 3 and a.value == 18 then
			gemsrightx1 = a.px
			gemsrighty1 = a.py
			gemsright1 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Right 1: `2DONE")
			ProxyOverlay("`9Pos Gems Right 1: `2DONE")
		end
	end
	if gemsright2 == true then
		if a.type == 3 and a.value == 18 then
			gemsrightx2 = a.px
			gemsrighty2 = a.py
			gemsright2 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Right 2: `2DONE")
			ProxyOverlay("`9Pos Gems Right 2: `2DONE")
		end
	end
	if gemsright3 == true then
		if a.type == 3 and a.value == 18 then
			gemsrightx3 = a.px
			gemsrighty3 = a.py
			gemsright3 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Right 3: `2DONE")
			ProxyOverlay("`9Pos Gems Right 3: `2DONE")
		end
	end
	if gemsleft1 == true then
		if a.type == 3 and a.value == 18 then
			gemsleftx1 = a.px
			gemslefty1 = a.py
			gemsleft1 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Left 1: `2DONE")
			ProxyOverlay("`9Pos Gems Left 1: `2DONE")
		end
	end
	if gemsleft2 == true then
		if a.type == 3 and a.value == 18 then
			gemsleftx2 = a.px
			gemslefty2 = a.py
			gemsleft2 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Left 2: `2DONE")
			ProxyOverlay("`9Pos Gems Left 2: `2DONE")
		end
	end
	if gemsleft3 == true then
		if a.type == 3 and a.value == 18 then
			gemsleftx3 = a.px
			gemslefty3 = a.py
			gemsleft3 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Pos Gems Left 3: `2DONE")
			ProxyOverlay("`9Pos Gems Left 3: `2DONE")
		end
	end
	if gemsleft4 == true then
		if a.type == 3 and a.value == 18 then
			gemsleftx4 = a.px
			gemslefty4 = a.py
			gemsleft4 = false
			tile = {
				pos1 = {
					{
						x = gemsrightx1,
						y = gemsrighty1
					},
					{
						x = gemsrightx2,
						y = gemsrighty2
					},
					{
						x = gemsrightx3,
						y = gemsrighty3
					}
				},
				pos2 = {
					{
						x = gemsleftx1,
						y = gemslefty1
					},
					{
						x = gemsleftx2,
						y = gemslefty2
					},
					{
						x = gemsleftx3,
						y = gemslefty3
					}
				}
			}
			btk()
			ProxyLog("`9Back Position: `2DONE")
			ProxyOverlay("`9Back Position : `2DONE")
		end
	end
	if takerighton == true then
		if a.type == 3 and a.value == 18 then
			takerightx = a.px
			takerighty = a.py
			takerighton = false
			btk()
			ProxyLog("`9Pos Take Right: `2DONE")
			ProxyOverlay("`9Pos Take Right: `2DONE")
		end
	end
	if takelefton == true then
		if a.type == 3 and a.value == 18 then
			takeleftx = a.px
			takelefty = a.py
			takelefton = false
			btk()
			ProxyLog("`9Pos Take Left: `2DONE")
			ProxyOverlay("`9Pos Take Left: `2DONE")
		end
	end
	return false
end
AddHook("onsendpacketraw", "any", raw)



function checkGems()
    Count1 = 0  -- Right side gems count
    Count2 = 0  -- Left side gems count
    objects = GetObjectList()
    
    -- Count gems on right side positions
    for _, obj in pairs(objects) do
        for _, tiles in pairs(tile.pos1) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                Count1 = Count1 + obj.amount
            end
        end
    end
    
    -- Count gems on left side positions
    for _, obj in pairs(objects) do
        for _, tiles in pairs(tile.pos2) do
            if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                Count2 = Count2 + obj.amount
            end
        end
    end
    
    -- Determine winner and send appropriate message
    if Count1 > Count2 then
        SendPacket(2, "action|input\n|text|`w[`4Lose`w]Kiri `4"..Count2.." `b/ `2"..Count1.." `w Kanan[`2Win`w]")
    elseif Count1 == Count2 then
        SendPacket(2, "action|input\n|text|`0[TIE] Kiri (gems) `0"..Count2.." `b/ `0"..Count1.." `0(gems) Kanan [TIE]")
    else
        SendPacket(2, "action|input\n|text|`w[`2Win`w]Kiri `2"..Count2.." `b/ `4"..Count1.." `w Kanan[`4Lose`w]")
    end
end


while true do
	Sleep(1000)
	if DropMode then
		if ireng > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. ireng)
			SendPacket(2, "action|input\n|text|"..GetLocal().name.." `0Dropped `2" .. ireng .. " `bBlack Gem Lock")
			table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. ireng .." `bBlack Gem Lock `9in `2"..GetWorld().name.."|\n")
			Sleep(500)
		end
		if bgl > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl)
			SendPacket(2, "action|input\n|text|"..GetLocal().name.." `0Dropped `2" .. bgl .. " `eBlue Gem Lock")
			table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. bgl .." `eBlue Gem Lock `9in `2"..GetWorld().name.."|\n")
			Sleep(500)
		end
		if dl > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl)
			table.insert(dropTakeList, "add_smalltext|`w"..os.date("%X").." `4Dropped `w".. dl .." `cDiamond Lock `9in `2"..GetWorld().name.."|\n")
			Sleep(500)
		end
		if wl > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|242|\nitem_count|" .. wl)
			Sleep(500)
		end
		jatuh = nil
		DropMode = false
		if putchand then
			Sleep(250)
			FindPath(gemsrightx1, gemsrighty1, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsrightx1,
				py = gemsrighty1,
				state = 16
			})
			Sleep(50)
			FindPath(gemsrightx2, gemsrighty2, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsrightx2,
				py = gemsrighty2,
				state = 16
			})
			Sleep(50)
			FindPath(gemsrightx3, gemsrighty3, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsrightx3,
				py = gemsrighty3,
				state = 16
			})
			Sleep(50)
			FindPath(gemsleftx1, gemslefty1, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsleftx1,
				py = gemslefty1,
				state = 16
			})
			Sleep(50)
			FindPath(gemsleftx2, gemslefty2, 100)
			Sleep(100)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsleftx2,
				py = gemslefty2,
				state = 16
			})
			Sleep(50)
			FindPath(gemsleftx3, gemslefty3, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsleftx3,
				py = gemslefty3,
				state = 16
			})
			Sleep(50)
			FindPath(gemsleftx4, gemslefty4, 100)
			Sleep(150)
			SendPacketRaw(false, {
				type = 3,
				value = 5640,
				x = GetLocal().pos.x,
				y = GetLocal().pos.y,
				px = gemsleftx3,
				py = gemslefty4,
				state = 16
			})
			SendPacket(2, "action|input\n|text|`2Done `0Put Chand")
			Sleep(250)
		end
	end
	Sleep(2000)
end
