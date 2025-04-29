function open()
	opening = "\nadd_label_with_icon|big|`9BTK`w-`9HELPER|left|2480|"..
"\nadd_textbox|`0Hi, "..GetLocal().name.." `0Thanks for Using this script!|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`^Change Log|left|2480|"..
"\nadd_textbox|`2Version : `92|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/win `w[`9Auto drop to winners`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/cg `w[`9Check Gems`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/fps `w[`9Fast Setup`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/ar `w[`9Drop Arroz`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/cl `w[`9Drop Clover`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/top `w[`9Set Chand On Top`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/down `w[`9Set Chand On Down`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/log `w[`9Winner Gems Logs`w]|"..
"\nadd_textbox|`w[`2+`w] `0Added `w/emoji `w[`9Rainbow Chat with Emoji`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`^Information|left|5956|"..
"\nadd_textbox|`w/cmd `w[`9Shows all proxy commands`w]|"..
"\nadd_spacer|small|"..
"\nadd_quick_exit||"..
"\nend_dialog|cl|Enjoy|"
	SendVariantList({
		[0] = "OnDialogRequest",
		[1] = opening
	})
end

local taxset = 5
function xxx()
    dialog = "\nadd_label_with_icon|big|BTK HELPER|left|340|"..
    "\nadd_spacer|small|"..
    "\nadd_label_with_icon|small|`0Hi, "..GetLocal().name.."|left|15746|"..
    "\nadd_label_with_icon|small|`0World: `2"..GetWorld().name.."|left|3802|"..
    "\nadd_label_with_icon|small|`0Current Tax: `2"..taxset.."`9%|left|15580|"..
	"\nadd_label_with_icon|small|`0Current Position `2X:`0"..math.floor(GetLocal().pos.x / 32).." `2Y:`0"..math.floor(GetLocal().pos.y / 32).."|left|15476|"..
    "\nadd_spacer|small|"..
    "\nadd_button_with_icon|pt|   `cBTK Setup   |staticYellowFrame|340|"..
	"\nadd_button_with_icon|tel|   `cTelephone   |staticYellowFrame|3898||"..
    "\nadd_button_with_icon|wrench|   `cWrench Setting   |staticYellowFrame|32||"..
    "\nadd_button_with_icon|sdb|   `cBlock SDB   |staticYellowFrame|2480|"..
    "\nadd_button_with_icon|cmd|   `c SHOW COMMANDS     |staticYellowFrame|3524|"..
    "\nadd_button_with_icon||END_LIST|noflags|0||"..
    "\nadd_quick_exit||".. 
    "\nend_dialog|xxx|Close||"   
    SendVariantList({
        [0] = "OnDialogRequest",
        [1] = dialog
    })
end

function wset()
	dialog = "\nadd_label_with_icon|big|Wrench Mode|left|32|"..
"\nadd_spacer|small|"..
"\nadd_button_with_icon|wp|   `cWrench Autopull   |staticYellowFrame|32||"..
"\nadd_button_with_icon|wk|   `cWrench Kick   |staticYellowFrame|32||"..
"\nadd_button_with_icon|wb|   `cWrench Ban   |staticYellowFrame|32||"..
"\nadd_button_with_icon||END_LIST|noflags|0||"..
"\nadd_button|back|`wBack|noflags|0|0|"..
"\nend_quick_exit||"
	SendVariantList({
		[0] = "OnDialogRequest",
		[1] = dialog
	})
end

function tele()
	dialog = "\nadd_label_with_icon|small|Wrench Mode|left|3898|"..
	"\nadd_spacer|small|"..
	"\nadd_button_with_icon|cbgl|   `0Convert BGL   |staticYellowFrame|3898||"..
	"\nadd_button_with_icon|cbl|   `0BGL to Black   |staticYellowFrame|3898||"..
	"\nadd_button_with_icon|cbb|   `0Black to BGL   |staticYellowFrame|3898||"..
	"\nadd_button_with_icon||END_LIST|noflags|0||"..
	"\nadd_button|back|`wBack|noflags|0|0|"..
	"\nend_quick_exit||"
	SendVariantList({
		[0] = "OnDialogRequest",
		[1] = dialog
	})
end

function btkw()
    dialog = "\nadd_label_with_icon|big|BTK SETUP|left|2480|"..
"\nadd_spacer|small|"..
"\nadd_button_with_icon|tk|   `cTake Gems   |staticYellowFrame|6140||"..
"\nadd_button_with_icon|ck|   `cCheck Gems   |staticYellowFrame|9438||"..
"\nadd_button_with_icon|dw|   `cTake Bet   |staticYellowFrame|7188||"..
"\nadd_button_with_icon||END_LIST|noflags|0||"..
"\nadd_button_with_icon|V1|   `cChand Atas   |staticYellowFrame|340|"..
"\nadd_button_with_icon|V2|   `cChand Bawah   |staticYellowFrame|340|"..
"\nadd_button_with_icon|cui|   `cManual Setup   |staticYellowFrame|12854||"..
"\nadd_button_with_icon||END_LIST|noflags|0||"..
"\nadd_button|back|`wBack|noflags|0|0|"..
"\nend_quick_exit||"
	SendVariantList({
		[0] = "OnDialogRequest",
		[1] = dialog
	})
end

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
"\nadd_textbox|`w/bb `7{amount} `w[`9Drop black gem lock`w]|"..
"\nadd_textbox|`w/setup `w[`9Manual Setup`w]"..
"\nadd_textbox|`w/tax `7{amount} `w[`9Set tax`w]|"..
"\nadd_textbox|`w/tb `w[`9Take lock`w]|"..
"\nadd_textbox|`w/tg `w[`9Shows Gems and Auto Drop to Winner`w]|"..
"\nadd_textbox|`w/win `w[`9Auto drop to winners`w]|"..
"\nadd_textbox|`w/wp `w[`9Enabled/disabled wrench mode pull`w]|"..
"\nadd_textbox|`w/log `w[`9Winner Gems Logs`w]|"..
"\nadd_spacer|small|"..
"\nadd_label_with_icon|small|`wBnk Command|left|340|"..
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
local sdbb = false
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

local emojiChatEnabled = true
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
    local dialogContent = "\nadd_label_with_icon|big|`9Gems Winner Log|left|9438|"..
                         "\nadd_spacer|small|"
    
    if #WinnerLog == 0 then
        dialogContent = dialogContent.."\nadd_textbox|`9No winner logs yet|left|"
    else
        for i, log in ipairs(WinnerLog) do
            dialogContent = dialogContent..
                "\nadd_label_with_icon|small|`2"..log.side.." `wWin `2"..log.gems.." `wVS `4"..log.opponentGems.." `w("..log.time..")|left|9438|"
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

function mufflogs(text)
    LogToConsole("`w[`2BTK Helper`w] `0"..text)
end

function pos(px, py)
	local hasil
	if not px and not py then
		hasil = "`2Click This To Set``"
	else
		hasil = "`b[`2X: `9" .. px .. "`w,`2Y: `9" .. py .. "`b]"
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

function ProxyLog(str)
	LogToConsole("`w[`2BTK Helper`w] `0" .. str)
end

LogToConsole("`9Script Will Run In `25 `9Seconds")
SendPacket(2, "action|input\n|text|`0Proxy `#BTK HELPER `2ON!")
Sleep(1000)
open()

function take()
	tiles = {
		{
			takeleftx,
			takelefty
		},
		{
			takerightx,
			takerighty
		}
	}
	for _, tiles in pairs(tiles) do
		for _, obj in pairs(GetObjectList()) do
			if (obj.pos.x) // 32 == tiles[1] and (obj.pos.y) // 32 == tiles[2] then
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

    -- Additional logic for Collected messages and logging
    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) World Lock") then
        local AmountCollectWL = tonumber(var[1]:match("Collected  `w(%d+) World Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectWL.." `9World Lock")
        return true
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Diamond Lock") then
        local AmountCollectDL = tonumber(var[1]:match("Collected  `w(%d+) Diamond Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectDL.." `cDiamond Lock")
        return true
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Blue Gem Lock") then
        local AmountCollectBGL = tonumber(var[1]:match("Collected  `w(%d+) Blue Gem Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectBGL.." `eBlue Gem Lock")
        return true
    end

    if var[0] == "OnConsoleMessage" and var[1]:find("Collected  `w(%d+) Black Gem Lock") then
        local AmountCollectBBGL = tonumber(var[1]:match("Collected  `w(%d+) Black Gem Lock"))
        SendPacket(2, "action|input\ntext|"..Growid.." `0Collected `2"..AmountCollectBBGL.." `bBlack Gem Lock")
        return true
    end

    return false
end)

function ProxyOverlay(str)
	SendVariantList({
		[0] = "OnTextOverlay",
		[1] = str
	})
end

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
    tile = (tile);
    Count = 0;
    data = {};
    do
        for _, obj in pairs(GetObjectList()) do
            for _, tiles in pairs(tile.pos1) do
                if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                    Count = Count + obj.amount;
                end
            end
        end
        table.insert(data, Count)
        Count = 0;
        for _, obj in pairs(GetObjectList()) do
            for _, tiles in pairs(tile.pos2) do
                if obj.id == 112 and (obj.pos.x)//32 == tiles.x and (obj.pos.y)//32 == tiles.y then
                    Count = Count + obj.amount;
                end
            end
        end
        table.insert(data, Count)
        Count = 0;
        if data[2] > data[1] then
            SendPacket(2, "action|input\n|text|`w[`2WIN`w] Kiri (gems) `2"..data[2].." `bVS `4"..data[1].." `w(gems) [`4LOSE`w] Kanan");
            cg2 = data[2]
            LogWinner("LEFT", data[2], data[1]) -- Log left winner
            
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
        elseif data[1] == data[2] then
            SendPacket(2, "action|input\n|text|Ya Sama `2: " .. data[2] .. "(wink) `0[ `bTie `0] Ya Sama `w: " .. data[1] .. "(wink)");
            ProxyOverlay("`9Nothing Winner `4TIE!")
        elseif data[2] < data[1] then
            SendPacket(2, "action|input\n|text|`w[`4LOSE`w] Kiri (gems) `4"..data[2].." `bVS `2"..data[1].." `w(gems) [`2WIN`w] Kanan");
            cg1 = data[1]
            LogWinner("RIGHT", data[1], data[2]) -- Log right winner
            
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
        end
        data = {};
    end;
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
					SendPacket(2, "action|input\n|text|"..plr.name.." `0Gas Sir?")
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
	if str:find("/wp") or str:find("buttonClicked|wp") then
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
	elseif str:find("friends") then
	    xxx()
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
		return true
	end
	if str:find("/b (%d+)") then
		count = str:match("/b (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. count)
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `eBlue Gem Lock")
		return true
	end
	if str:find("/bb (%d+)") then
		count = str:match("/bb (%d+)")
		SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. count)
		SendPacket(2, "action|input\n|text|`c"..Growid.." `0Dropped `2" .. count .. " `bBlack Gem Lock")
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
	if str:find("/log") then
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
	if str:find("buttonClicked|wrench") then
		wset()
		return true
	end
	if str:find("/cg") or str:find("buttonClicked|ck") then
	    checkGems()
		return true
	end
    if str:find("/tb") or str:find("buttonClicked|dw") then
        take()
        tax = math.floor(Amount * taxset / 100)
        jatuh = Amount - tax
        
        -- Convert to BGL and DL format
        local totalBGL = math.floor(Amount / 20000)
        local totalDL = math.floor((Amount % 10000) / 100)
        local jatuhBGL = math.floor(jatuh / 10000)
        local jatuhDL = math.floor((jatuh % 10000) / 100)
        
        SendPacket(2, "action|input\n|text|`w[`0P1: `2"..totalBGL.." BGL "..totalDL.." DL`w]`bVS`w[`0P2 :`2"..totalBGL.." BGL "..totalDL.." DL`w] `w[`0Tax: `2"..taxset.."%`w] `w[`0Drop to Win: `2"..jatuhBGL.." BGL "..jatuhDL.." DL`w]")
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

function setupTopPositions()
    local xhost = GetLocal().pos.x // 32
    local yhost = GetLocal().pos.y // 32
    
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
    
    SendPacket(2, "action|input\n|text|`2BTK MODE `9CHAND ON TOP")
end

function setupDownPositions()
    local xhost = GetLocal().pos.x // 32
    local yhost = GetLocal().pos.y // 32
    
    -- Take positions (display)
    takeleftx = xhost - 3
    takelefty = yhost - 1
    takerightx = xhost + 3
    takerighty = yhost - 1
    
    -- Gem positions (bottom)
    gemsleftx1 = xhost - 3
    gemslefty1 = yhost +1
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
    
    SendPacket(2, "action|input\n|text|`2BTK MODE `9CHAND ON DOWN")
end

function setupDownPositions()
    local xhost = GetLocal().pos.x // 32
    local yhost = GetLocal().pos.y // 32
    
    -- Take positions (display)
    takeleftx = xhost - 3
    takelefty = yhost - 1
    takerightx = xhost + 3
    takerighty = yhost - 1
    
    -- Gem positions (bottom)
    gemsleftx1 = xhost - 3
    gemslefty1 = yhost +1
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
    
    SendPacket(2, "action|input\n|text|`2BTK MODE `9CHAND ON DOWN")
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
		if GetItemCount(7188) >= 100 or s >= 99 then
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
        SendPacket(2, "action|input\n|text|`w[`4Lose`w] Kiri (gems) `4"..Count2.." `b/ `2"..Count1.." `w(gems) [`2Win`w] Kanan")
    elseif Count1 == Count2 then
        SendPacket(2, "action|input\n|text|`0[TIE] Kiri (gems) `0"..Count2.." `b/ `0"..Count1.." `0(gems) Kanan [TIE]")
    else
        SendPacket(2, "action|input\n|text|`w[`2Win`w] Kiri (gems) `2"..Count2.." `b/ `4"..Count1.." `w(gems) [`4Lose`w] Kanan")
    end
end

while true do
	Sleep(1000)
	if DropMode then
		if ireng > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|11550|\nitem_count|" .. ireng)
			Sleep(500)
		end
		if bgl > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|7188|\nitem_count|" .. bgl)
			Sleep(500)
		end
		if dl > 0 then
			SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|1796|\nitem_count|" .. dl)
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
