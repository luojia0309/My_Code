
                                userInfo="作者V:PUBGAi1688" -- 有问题联系作者V:PUBGAi1688，



userInfo = { 
debug = 1,
	cpuLoad = 1,
sensitivity = {
		ADS = 190,
		Aim = 0.25,		
		scopeX2 = 1.3,		
		scopeX4 = 3.9,		
		scopeX6 = 2.3,
	},


	autoPressAimKey = "",

	startControl = "G_bind",
aimingSettings = "default",
customAimingSettings = {
		ADS = function ()
			return false 
		end,
		
		Aim = function ()
			return false 
		end,
	},
	canUse = {
		[".45"] = {

			{ "UMP45",          1,          1,          0.8 }, 
			{ "Tommy Gun",      1,          1,          0.8 },
		},
			["9mm"] = {
			{ "Vector",         1,          1,          0.8 }, 
			{ "Micro UZI",      1,          1,          0.8 },  
		},
		["5.56"] = {
			{ "M416",           1,          1,          0.8 }, 
			{ "M16A4",          2,          1,          0.8 }, 
			{ "QBZ",            1,          1,          0.8 }, 
			{ "SCAR-L",         0,          1,          0.8 }, 
			{ "G36C",           0,          1,          0.8 }, 
		},
		["7.62"] = {
			{ "AKM",            1,          1,          0.8 }, 
			{ "Beryl M762",     1,          1,          0.8 }, 
			{ "DP-28",          0,          1,          0.8 },
		},
	},
	

	G_bind = {
		-- G
		
		["G4"] = "off",
		["G5"] = "AKM",
		
	},
}


pubg = {
	gun = {
		[".45"] = {},
		["9mm"] = {},
		["5.56"] = {},
		["7.62"] = {},
	}, 
	gunOptions = {
		[".45"] = {},
		["9mm"] = {},
		["5.56"] = {},
		["7.62"] = {},
	}, 
	allCanUse = {},
	allCanUse_index = 1, 
	allCanUse_count = 0,
	bulletType = "", 
	gunIndex = 1,
	counter = 0, 
	xCounter = 0,
	sleep = userInfo.cpuLoad, 
	sleepRandom = { userInfo.cpuLoad, userInfo.cpuLoad + 5 },
	startTime = 0,
	prevTime = 0,
	scopeX1 = 1,
	scopeX2 = userInfo.sensitivity.scopeX2, 
	scopeX3 = userInfo.sensitivity.scopeX3,  
	scopeX4 = userInfo.sensitivity.scopeX4,
	scopeX6 = userInfo.sensitivity.scopeX6,
	scope_current = "scopeX1", 
	generalSensitivityRatio = userInfo.sensitivity.ADS / 100, -- 
	isStart = false, 
	G1 = false, 
	currentTime = 0, 
	bulletIndex = 0, 
}

pubg.xLengthForDebug = pubg.generalSensitivityRatio * 0 
 
pubg.renderDom = {
	switchTable = "  --------------------------------------------   zuozhe  VX :   PUBGAi1688   --------------------------------------------    ",

	separator = "  --------------------------------------------   zuozhe  VX :   PUBGAi1688   --------------------------------------------     \n", 
	combo_key = "  --------------------------------------------   zuozhe  VX :   PUBGAi1688   --------------------------------------------     ",  
	cmd = "  --------------------------------------------   zuozhe  VX :   PUBGAi1688     --------------------------------------------    ",  
	autoLog = "  --------------------------------------------   zuozhe  VX :   PUBGAi1688   -------------------------------------------- \n",  
}


function pubg.isAimingState (mode)
	local switch = {

		 
		["ADS"] = function ()
			if userInfo.aimingSettings == "recommend" then
				return IsMouseButtonPressed(3) and not IsModifierPressed("lalt")
			elseif userInfo.aimingSettings == "default" then
				return not IsModifierPressed("ctrl") and not IsModifierPressed("lalt")
			elseif userInfo.aimingSettings == "ctrlmode" then
				return IsMouseButtonPressed(3) and not IsModifierPressed("lshift")
			elseif userInfo.aimingSettings == "custom" then
				return userInfo.customAimingSettings.ADS()
			end
		end,

		 
		["Aim"] = function ()
			if userInfo.aimingSettings == "recommend" then
				if userInfo.autoPressAimKey == "" then
					return IsModifierPressed("lctrl")
				else
					return not IsModifierPressed("lshift") and not IsModifierPressed("lalt")
				end
			elseif userInfo.aimingSettings == "default" then
				return IsMouseButtonPressed(3)
			elseif userInfo.aimingSettings == "ctrlmode" then
				return false
			elseif userInfo.aimingSettings == "custom" then
				return userInfo.customAimingSettings.Aim()
			end
		end,

	}

	return switch[mode]()
end

pubg["M16A4"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 108,
		ballistic = {
			{1, 0},
			{5, 20},
			{40, 24},
		}
	})

end

pubg["SCAR-L"] = function (gunName)

	return pubg.execOptions(gunName, {
        interval = 8,
        ballistic = {
 			{1, 10},
			{2, 35},
			{4, 18},
			{10, 24},
			{15, 32},
			{18, 30},
			{60, 39},
		}
	})

end

pubg["Beryl M762"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 76,
		ballistic = {
			{1, 15},
			{2, 35},
			{4, 18},
			{10, 24},
			{15, 32},
			{18, 30},
			{48, 38},
		}
	})

end

pubg["Tommy Gun"] = function (gunName)

	return pubg.execOptions(gunName, {
    interval = 85,
    ballistic = {
      {5, 10},
      {13, 20},
      {16, 11},
      {18, 14},
      {10, 10},
      {15, 10},
      {15, 16},
      {150, 13},
		}
	})

end

pubg["G36C"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 28,
		ballistic = {
 			{1, 10},
			{2, 35},
			{4, 18},
			{10, 24},
			{15, 32},
			{18, 30},
			{60, 39},
		}
	})

end

pubg["Vector"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 55,
		ballistic = {
			{1, 0},
			{6, 16},
			{10, 20},
			{13, 24},
			{15, 28},
			{20, 32},
			{33, 34},
		}
	})

end

pubg["Micro UZI"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 46,
		ballistic = {
			{1, 0},
			{2, 13},
			{10, 12},
			{15, 20},
			{35, 30},
		}
	})

end

pubg["UMP45"] = function (gunName)

	return pubg.execOptions(gunName, {
        interval = 83,
        ballistic = {
			{0, 45},
			{4, 16},
			{15, 27},
			{15, 34},
			{54, 34},
		}
	})

end

pubg["AKM"] = function (gunName)

	return pubg.execOptions(gunName, {
        interval = 100,
        ballistic = {
			{0, 20},
			{5, 18},
			{15, 29},
			{25, 32},
			{40, 32},
		}
	})

end

pubg["M416"] = function (gunName)

	return pubg.execOptions(gunName, {
        interval = 63,
        ballistic = {
 			{1, 10},
			{2, 25},
			{3, 18},
			{10, 24},
			{15, 32},
			{18, 30},
			{60, 39},
		}
	})

end

pubg["QBZ"] = function (gunName)

	return pubg.execOptions(gunName, {
		interval = 92,
		ballistic = {
			{1, 0},
			{2, 34},
			{5, 18},
			{10, 22},
			{15, 32},
			{20, 34},
			{40, 36},
		}
	})

end




function pubg.canUseFindByGunName (gunName)
	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do
		local bulletType = forList[i]
		for j = 1, #userInfo.canUse[bulletType] do
			local item = userInfo.canUse[bulletType][j]
			if item[1] == gunName then
				return item
			end
		end
	end
end


function pubg.execOptions (gunName, options)

	--[[

		from

		{
			{ 5, 10 },
			{ 10, 24 },
		}

		to

		{ 10, 10, 10, 10, 10, 24, 24, 24, 24, 24 }

		to

		{ 10, 20, 30, 40, 50, 74, 98, 122, 146, 170 }

	]]

	local gunInfo = pubg.canUseFindByGunName(gunName)

	-- Temporary container
	local ballisticConfig1 = {}
	-- Temporary container (v3.0)
	local ballisticConfig2 = {}

	local ballisticIndex = 1
	for i = 1, #options.ballistic do
		local nextCount = options.ballistic[i][1]
		if i ~= 1 then
			nextCount = options.ballistic[i][1] - options.ballistic[i - 1][1]
		end
		for j = 1, nextCount do
			ballisticConfig1[ballisticIndex] =
				-- options.ballistic[i][2] * pubg.generalSensitivityRatio * options.ratio
				options.ballistic[i][2] * pubg.generalSensitivityRatio * gunInfo[3]
			ballisticIndex = ballisticIndex + 1
		end
	end

	for i = 1, #ballisticConfig1 do
		if i == 1 then
			ballisticConfig2[i] = ballisticConfig1[i]
		else
			ballisticConfig2[i] = ballisticConfig2[i - 1] + ballisticConfig1[i]
		end
	end

	-- 取整 
	-- for i = 1, #ballisticConfig2 do
	-- 	ballisticConfig2[i] = math.ceil(ballisticConfig2[i])
	-- end

	return {
		duration = options.interval * #ballisticConfig2, -- Time of duration
		amount = #ballisticConfig2, -- Number of bullets
		interval = options.interval, -- Time of each bullet
		ballistic = ballisticConfig2, -- ballistic data
		ctrlmodeRatio = gunInfo[4], -- Individual recoil coefficient for each gun when squatting
	}

end

--[[ Initialization of firearms database ]]
function pubg.init ()

	-- Clean up the firearms Depot
	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do

		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do
			local gunName = userInfo.canUse[type][j][1]
			local gunState = userInfo.canUse[type][j][2]

			if gunState >= 1 then
				-- one series
				gunCount = gunCount + 1 -- Accumulative number of firearms configuration files
				pubg.gun[type][gunCount] = gunName -- Adding available firearms to the Arsenal
				pubg.gunOptions[type][gunCount] = pubg[gunName](gunName) -- Get firearms data and add it to the configuration library

				-- 单独设置连发 
				pubg.gunOptions[type][gunCount].autoContinuousFiring = ({ 0, 0, 1 })[
					math.max(1, math.min(gunState + 1, 3))
				]
				-- all canUse
				pubg.allCanUse_count = pubg.allCanUse_count + 1 -- Total plus one
				pubg.allCanUse[pubg.allCanUse_count] = gunName -- All available firearms

				if pubg.bulletType == "" then pubg.bulletType = type end -- Default Bullet type

			end

		end

	end

	-- Initial setting of random number seeds
	pubg.SetRandomseed()
	pubg.outputLogRender()
	-- console.log(pubg)

end

-- SetRandomseed
function pubg.SetRandomseed ()
	math.randomseed(GetRunningTime())
end

--[[ Before automatic press gun ]]
function pubg.auto (options)

	-- Accurate aiming press gun
	pubg.currentTime = GetRunningTime()
	pubg.bulletIndex = math.ceil(((pubg.currentTime - pubg.startTime == 0 and {1} or {pubg.currentTime - pubg.startTime})[1]) / options.interval) + 1

	if pubg.bulletIndex > options.amount then return false end
	-- Developer Debugging Mode
	local d = (IsKeyLockOn("scrolllock") and { (pubg.bulletIndex - 1) * pubg.xLengthForDebug } or { 0 })[1]
	local x = math.ceil((pubg.currentTime - pubg.startTime) / (options.interval * (pubg.bulletIndex - 1)) * d) - pubg.xCounter
	local y = math.ceil((pubg.currentTime - pubg.startTime) / (options.interval * (pubg.bulletIndex - 1)) * options.ballistic[pubg.bulletIndex]) - pubg.counter
	-- 4-fold pressure gun mode
	local realY = pubg.getRealY(options, y)
	MoveMouseRelative(x, realY)
	-- Whether to issue automatically or not
	if options.autoContinuousFiring == 1 then
		PressAndReleaseMouseButton(1)
	end

	-- Real-time operation parameters
	pubg.autoLog(options, y)
	pubg.outputLogRender()

	pubg.xCounter = pubg.xCounter + x
	pubg.counter = pubg.counter + y

	pubg.autoSleep(IsKeyLockOn("scrolllock"))

end

--[[ Sleep of pubg.auto ]]
function pubg.autoSleep (isTest)
	local random = 0
	if isTest then
		-- When debugging mode is turned on, Turn off random delays in preventive testing
		random = math.random(pubg.sleep, pubg.sleep)
	else
		random = math.random(pubg.sleepRandom[1], pubg.sleepRandom[2])
	end
	-- Sleep(10)
	Sleep(random)
end

--[[ 四舍五入 #170 ]]
function math.round (num, digit)
    local decimalPlaces = 10 ^ (digit or 0)
    return math.floor((num * decimalPlaces * 10 + 5) / 10) / decimalPlaces
end

--[[ get real y position ]]
function pubg.getRealY (options, y)
	local realY = y

	if pubg.isAimingState("ADS") then
		realY = y * pubg[pubg.scope_current]
	elseif pubg.isAimingState("Aim") then
		realY = y * userInfo.sensitivity.Aim * pubg.generalSensitivityRatio
	end

	if userInfo.aimingSettings == "ctrlmode" and IsModifierPressed("lctrl") then
		realY = realY * options.ctrlmodeRatio
	end

	return math.round(realY)
end

--[[ change pubg isStart status ]]
function pubg.changeIsStart (isTrue)
	pubg.isStart = isTrue
	if isTrue then
		SetBacklightColor(0, 255, 150, "kb")
		SetBacklightColor(0, 255, 150, "mouse")
	else
		SetBacklightColor(255, 0, 90, "kb")
		SetBacklightColor(255, 0, 90, "mouse")
	end
end

--[[ set bullet type ]]
function pubg.setBulletType (bulletType)
	pubg.bulletType = bulletType
	pubg.gunIndex = 1
	pubg.allCanUse_index = 0

	local forList = { ".45", "9mm", "5.56", "7.62" }

	for i = 1, #forList do
		local type = forList[i]
		if type ==  bulletType then
			pubg.allCanUse_index = pubg.allCanUse_index + 1
			break
		else
			pubg.allCanUse_index = pubg.allCanUse_index + #pubg.gun[type]
		end
	end

	pubg.changeIsStart(true)
end

--[[ set current scope ]]
function pubg.setScope (scope)
	pubg.scope_current = scope
end

--[[ set current gun ]]
function pubg.setGun (gunName)

	local forList = { ".45", "9mm", "5.56", "7.62" }
	local allCanUse_index = 0

	for i = 1, #forList do

		local type = forList[i]
		local gunIndex = 0
		local selected = false

		for j = 1, #userInfo.canUse[type] do
			if userInfo.canUse[type][j][2] >= 1 then
				gunIndex = gunIndex + 1
				allCanUse_index = allCanUse_index + 1
				if userInfo.canUse[type][j][1] == gunName then
					pubg.bulletType = type
					pubg.gunIndex = gunIndex
					pubg.allCanUse_index = allCanUse_index
					selected = true
					break
				end
			end
		end

		if selected then break end

	end

	pubg.changeIsStart(true)
end

--[[ Consider all available firearms as an entire list ]]
function pubg.findInCanUse (cmd)

	if "first_in_canUse" == cmd then
		pubg.allCanUse_index = 1
	elseif "next_in_canUse" == cmd then
		if pubg.allCanUse_index < #pubg.allCanUse then
			pubg.allCanUse_index = pubg.allCanUse_index + 1
		end
	elseif "last_in_canUse" == cmd then
		pubg.allCanUse_index = #pubg.allCanUse
	end

	pubg.setGun(pubg.allCanUse[pubg.allCanUse_index])
end

--[[ Switching guns in the same series ]]
function pubg.findInSeries (cmd)
	if "first" == cmd then
		pubg.gunIndex = 1
	elseif "next" == cmd then
		if pubg.gunIndex < #pubg.gun[pubg.bulletType] then
			pubg.gunIndex = pubg.gunIndex + 1
		end
	elseif "last" == cmd then
		pubg.gunIndex = #pubg.gun[pubg.bulletType]
	end

	pubg.setGun(pubg.gun[pubg.bulletType][pubg.gunIndex])
end

--[[ Script running status ]]
function pubg.runStatus ()
	if userInfo.startControl == "capslock" then
		return IsKeyLockOn("capslock")
	elseif userInfo.startControl == "numlock" then
		return IsKeyLockOn("numlock")
	elseif userInfo.startControl == "G_bind" then
		return pubg.isStart
	end
end

--[[ 随机偏移 ]]
function pubg.randomOffset (val, offsetScopePx)
	local offsetScope = (offsetScopePx or 10) / 1080 * 65535

	return math.random(
		math.ceil(val - offsetScope),
		math.ceil(val + offsetScope)
	)
end


function pubg.fastLickBox ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(20 + pubg.sleep)
	PressAndReleaseMouseButton(1)

	local lastItemCp = {
		300 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535

	
	for i = 1, 3 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(
				pubg.randomOffset(670 / 2560 * 65535, 50),
				pubg.randomOffset(710 / 1440 * 65535, 50)
			) -- 修改为背包的坐标 
			ReleaseMouseButton(1)
			Sleep(10 + pubg.sleep)
		end
	end

	Sleep(20 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
end


function pubg.fastPickup ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(20 + pubg.sleep)
	PressAndReleaseMouseButton(1)

	local lastItemCp = {
		300 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535

	
	for i = 1, 3 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(
				pubg.randomOffset(32767, 100),
				pubg.randomOffset(32767, 100)
			)
			ReleaseMouseButton(1)
			Sleep(10 + pubg.sleep)
		end
	end

	Sleep(20 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
end


function pubg.fastDiscard ()
	PressAndReleaseKey("lshift")
	PressAndReleaseKey("lctrl")
	PressAndReleaseKey("lalt")
	PressAndReleaseKey("rshift")
	PressAndReleaseKey("rctrl")
	PressAndReleaseKey("ralt")
	PressAndReleaseKey("tab")
	Sleep(10 + pubg.sleep)
	PressAndReleaseMouseButton(1)
	local lastItemCp = {
		630 / 2560 * 65535,
		1210 / 1440 * 65535
	}
	local itemHeight = 83 / 1440 * 65535
	-- 清空背包 第一轮 
	Sleep(10 + pubg.sleep)
	for i = 1, 5 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(0, 0)
			ReleaseMouseButton(1)
		end
	end

	Sleep(10 + pubg.sleep)
	local itemPos = {
		{ 1770, 180 },
		{ 1770, 480 },
		{ 1770, 780 },
		{ 1770, 1050 },
		{ 2120, 1050 }
	}
	for i = 1, #itemPos do
		MoveMouseTo(
			pubg.randomOffset(itemPos[i][1] / 2560 * 65535),
			pubg.randomOffset(itemPos[i][2] / 1440 * 65535)
		)
		PressAndReleaseMouseButton(3)
	end

	Sleep(10 + pubg.sleep)
	for i = 1, 5 do
		for j = 1, 13 do
			MoveMouseTo(
				pubg.randomOffset(lastItemCp[1]),
				pubg.randomOffset(lastItemCp[2] - itemHeight * (j - 1))
			)
			PressMouseButton(1)
			MoveMouseTo(0, 0)
			ReleaseMouseButton(1)
		end
	end
	
	Sleep(10 + pubg.sleep)
	local itemPos2 = {
		{ 900, 392 },
		{ 900, 630 },
		{ 900, 720 },
		{ 900, 808 },
		{ 1605, 397 },
		{ 1605, 481 },
		{ 1605, 632 },
		{ 1605, 719 },
		{ 1605, 807 },
		{ 1605, 1049 },
		{ 1605, 1229 }
	}
	for i = 1, #itemPos2 do
		MoveMouseTo(
			pubg.randomOffset(itemPos2[i][1] / 2560 * 65535),
			pubg.randomOffset(itemPos2[i][2] / 1440 * 65535)
		)
		-- Sleep(300 + pubg.sleep)
		PressAndReleaseMouseButton(3)
	end
	Sleep(10 + pubg.sleep)
	MoveMouseTo(
		pubg.randomOffset(lastItemCp[1]),
		pubg.randomOffset(lastItemCp[2])
	)
	PressAndReleaseKey("tab")
end

--[[ G key command binding ]]
function pubg.runCmd (cmd)
	if cmd == "" then cmd = "none" end
	local switch = {
		["none"] = function () end,
		[".45"] = pubg.setBulletType,
		["9mm"] = pubg.setBulletType,
		["5.56"] = pubg.setBulletType,
		["7.62"] = pubg.setBulletType,
		["scopeX1"] = pubg.setScope,
		["scopeX2"] = pubg.setScope,
		["scopeX3"] = pubg.setScope,
		["scopeX4"] = pubg.setScope,
		["scopeX6"] = pubg.setScope,
		["UMP45"] = pubg.setGun,
		["Tommy Gun"] = pubg.setGun,
		["Vector"] = pubg.setGun,
		["Micro UZI"] = pubg.setGun,
		["M416"] = pubg.setGun,
		["SCAR-L"] = pubg.setGun,
		["QBZ"] = pubg.setGun,
		["G36C"] = pubg.setGun,
		["M16A4"] = pubg.setGun,
		["AKM"] = pubg.setGun,
		["Beryl M762"] = pubg.setGun,
		["DP-28"] = pubg.setGun,
		["first"] = pubg.findInSeries,
		["next"] = pubg.findInSeries,
		["last"] = pubg.findInSeries,
		["first_in_canUse"] = pubg.findInCanUse,
		["next_in_canUse"] = pubg.findInCanUse,
		["last_in_canUse"] = pubg.findInCanUse,
		["fast_pickup"] = pubg.fastPickup,
		["fast_discard"] = pubg.fastDiscard,
		["fast_lick_box"] = pubg.fastLickBox,
		["off"] = function ()
			pubg.changeIsStart(false)
		end,
	}

	local cmdGroup = string.split(cmd, '|')

	for i = 1, #cmdGroup do
		local _cmd = cmdGroup[i]
		if switch[_cmd] then
			switch[_cmd](_cmd)
		end
	end
end

--[[ autputLog render ]]
function pubg.outputLogRender ()
	if userInfo.debug == 0 then return false end
	if not pubg.G1 then
		pubg.renderDom.switchTable = pubg.outputLogGunSwitchTable()
	end
	local resStr = table.concat({
		"\n>> [\"", pubg.renderDom.combo_key, "\"] = \"", pubg.renderDom.cmd, "\" <<\n",
		pubg.renderDom.separator,
		pubg.renderDom.switchTable,
		pubg.renderDom.separator,
		pubg.outputLogGunInfo(),
		pubg.renderDom.separator,
		pubg.renderDom.autoLog,
		pubg.renderDom.separator,
	})
	ClearLog()
	OutputLogMessage(resStr)
end

--[[ Output switching table ]]
function pubg.outputLogGunSwitchTable ()
	local forList = { ".45", "9mm", "5.56", "7.62" }
	local allCount = 0
	local resStr = "      canUse_i\t      series_i\t      Series\t      ratio\t      ctrl ratio\t      Gun Name\n\n"

	for i = 1, #forList do
		local type = forList[i]
		local gunCount = 0

		for j = 1, #userInfo.canUse[type] do
			if userInfo.canUse[type][j][2] >= 1 then
				local gunName = userInfo.canUse[type][j][1]
				local tag = gunName == pubg.gun[pubg.bulletType][pubg.gunIndex] and "=> " or "      "
				gunCount = gunCount + 1
				allCount = allCount + 1
				resStr = table.concat({ resStr, tag, allCount, "\t", tag, gunCount, "\t", tag, type, "\t", tag, userInfo.canUse[type][j][3], "\t", tag, userInfo.canUse[type][j][4], "\t", tag, gunName, "\n" })
			end
		end

	end

	return resStr
end

-- output Log Gun Info
function pubg.outputLogGunInfo ()
	local k = pubg.bulletType
	local i = pubg.gunIndex
	local gunName = pubg.gun[k][i]

	return table.concat({
		"Currently scope: [ " .. pubg.scope_current .. " ]\n",
		"Currently series: [ ", k, " ]\n",
		"Currently index in series: [ ", i, " / ", #pubg.gun[k], " ]\n",
		"Currently index in canUse: [ ", pubg.allCanUse_index, " / ", pubg.allCanUse_count, " ]\n",
		"Recoil table of [ ", gunName, " ]:\n",
		pubg.outputLogRecoilTable(),
	})
end

--[[ output recoil table log ]]
function pubg.outputLogRecoilTable ()
	local k = pubg.bulletType
	local i = pubg.gunIndex
	local resStr = "{ "
	for j = 1, #pubg.gunOptions[k][i].ballistic do
		local num = pubg.gunOptions[k][i].ballistic[j]
		resStr = table.concat({ resStr, num })
		if j ~= #pubg.gunOptions[k][i].ballistic then
			resStr = table.concat({ resStr, ", " })
		end
	end

	resStr = table.concat({ resStr, " }\n" })

	return resStr
end

--[[ log of pubg.auto ]]
function pubg.autoLog (options, y)
	pubg.renderDom.autoLog = table.concat({
		"----------------------------------- Automatically counteracting gun recoil -----------------------------------\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
		"bullet index: ", pubg.bulletIndex, "    target counter: ", options.ballistic[pubg.bulletIndex], "    current counter: ", pubg.counter, "\n",
		"D-value(target - current): ", options.ballistic[pubg.bulletIndex], " - ", pubg.counter, " = ", options.ballistic[pubg.bulletIndex] - pubg.counter, "\n",
		"move: math.ceil((", pubg.currentTime, " - ", pubg.startTime, ") / (", options.interval, " * (", pubg.bulletIndex, " - 1)) * ", options.ballistic[pubg.bulletIndex], ") - ", pubg.counter, " = ", y, "\n",
		"------------------------------------------------------------------------------------------------------------------------------\n",
	})
end

function pubg.PressOrRelaseAimKey (toggle)
	if userInfo.autoPressAimKey ~= "" then
		if toggle then
			PressKey(userInfo.autoPressAimKey)
		else
			ReleaseKey(userInfo.autoPressAimKey)
		end
	end
end

--[[ Automatic press gun ]]  --GHUB与LGS不同的方法 
function pubg.OnEvent_NoRecoil (event, arg, family)
	if event == "MOUSE_BUTTON_PRESSED" and arg == 1 and family == "mouse" then
		if not pubg.runStatus() then return false end
		if userInfo.aimingSettings ~= "default" and not IsMouseButtonPressed(3) then
			pubg.PressOrRelaseAimKey(true)
		end
		if pubg.isAimingState("ADS") or pubg.isAimingState("Aim") then
			pubg.startTime = GetRunningTime()
			pubg.G1 = true
            OutputLogMessage("Start Shooting....\n")
            pubg.shooting()
		end
	end

	if event == "MOUSE_BUTTON_RELEASED" and arg == 1 and family == "mouse" then
		pubg.PressOrRelaseAimKey(false)
		pubg.G1 = false
		pubg.counter = 0 -- Initialization counter
		pubg.xCounter = 0 -- Initialization xCounter
		pubg.SetRandomseed() -- Reset random number seeds
	end


end

-- [[ GHUB SetMKeyState ]] --该方法实现SetMKeyState功能
function pubg.shooting()
    repeat
        pubg.auto(pubg.gunOptions[pubg.bulletType][pubg.gunIndex])
    until not IsMouseButtonPressed(1)
    OutputLogMessage("Stop Shooting....\n")
end

-- [[ processing instruction ]]
function pubg.modifierHandle (modifier)
	local cmd = userInfo.G_bind[modifier]
	pubg.renderDom.combo_key = modifier -- Save combination keys

	if (cmd) then
		pubg.renderDom.cmd = cmd -- Save instruction name
		pubg.runCmd(cmd) -- Execution instructions
	else
		pubg.renderDom.cmd = ""
	end

	pubg.outputLogRender() -- Call log rendering method to output information
end

--[[ Listener method ]]
function OnEvent (event, arg, family)
local Outtime = '202405142358'
local Gettime = GetDate("%Y%m%d%H%M")
if tonumber(Gettime) >= tonumber(Outtime) then
    while true do
         Sleep(1000)
        OutputLogMessage("  --------------------------------------------   zuozhe  VX :   PUBGAi1688  -------------------------------------------- \n")
    end
end
	-- OutputLogMessage("event = %s, arg = %s, family = %s\n", event, arg, family)
	-- console.log("event = " .. event .. ", arg = " .. arg .. ", family = " .. family)


	pubg.OnEvent_NoRecoil(event, arg, family)

	-- Switching arsenals according to different types of ammunition
	if event == "MOUSE_BUTTON_PRESSED" and arg >=3 and arg <= 11 and family == "mouse" then
		local modifier = "G" .. arg
		local list = { "lalt", "lctrl", "lshift", "ralt", "rctrl", "rshift" }

		for i = 1, #list do
			if IsModifierPressed(list[i]) then
				modifier = list[i] .. " + " .. modifier
				break
			end
		end

		pubg.modifierHandle(modifier)
	elseif event == "G_PRESSED" and arg >=1 and arg <= 12 then
		-- if not pubg.runStatus() and userInfo.startControl ~= "G_bind" then return false end
		local modifier = "F" .. arg

		pubg.modifierHandle(modifier)
	end

	-- Script deactivated event
	if event == "PROFILE_DEACTIVATED" then
		EnablePrimaryMouseButtonEvents(false)
		ReleaseKey("lshift")
		ReleaseKey("lctrl")
		ReleaseKey("lalt")
		ReleaseKey("rshift")
		ReleaseKey("rctrl")
		ReleaseKey("ralt")
		ClearLog()
	end

end

--[[ tools ]]

-- split function
function string.split (str, s)
	if string.find(str, s) == nil then return { str } end

	local res = {}
	local reg = "(.-)" .. s .. "()"
	local index = 0
	local last_i
	
	--- @diagnostic disable-next-line: undefined-field
	for n, i in string.gfind(str, reg) do
		index = index + 1
		res[index] = n
		last_i = i
	end

	res[index + 1] = string.sub(str, last_i)

	return res
end

-- Javascript Array.prototype.reduce
function table.reduce (t, c)
	local res = c(t[1], t[2])
	for i = 3, #t do res = c(res, t[i]) end
	return res
end

-- Javascript Array.prototype.map
function table.map (t, c)
	local res = {}
	for i = 1, #t do res[i] = c(t[i], i) end
	return res
end

-- Javascript Array.prototype.forEach
function table.forEach (t, c)
	for i = 1, #t do c(t[i], i) end
end

--[[
	* 打印 table
	* @param  {any} val     传入值 
	* @return {str}         格式化后的文本 
]]
function table.print (val)

	local function loop (val, keyType, _indent)
		_indent = _indent or 1
		keyType = keyType or "string"
		local res = ""
		local indentStr = "     " -- 缩进空格 
		local indent = string.rep(indentStr, _indent)
		local end_indent = string.rep(indentStr, _indent - 1)
		local putline = function (...)
			local arr = { res, ... }
			for i = 1, #arr do
				if type(arr[i]) ~= "string" then arr[i] = tostring(arr[i]) end
			end
			res = table.concat(arr)
		end

		if type(val) == "table" then
			putline("{ ")

			if #val > 0 then
				local index = 0
				local block = false

				for i = 1, #val do
					local n = val[i]
					if type(n) == "table" or type(n) == "function" then
						block = true
						break
					end
				end

				if block then
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						if index == 1 then putline("\n") end
						putline(indent, loop(n, type(i), _indent + 1), "\n")
						if index == #val then putline(end_indent) end
					end
				else
					for i = 1, #val do
						local n = val[i]
						index = index + 1
						putline(loop(n, type(i), _indent + 1))
					end
				end

			else
				putline("\n")
				for k, v in pairs(val) do
					putline(indent, k, " = ", loop(v, type(k), _indent + 1), "\n")
				end
				putline(end_indent)
			end

			putline("}, ")
		elseif type(val) == "string" then
			val = string.gsub(val, "\a", "\\a")
			val = string.gsub(val, "\b", "\\b")
			val = string.gsub(val, "\f", "\\f")
			val = string.gsub(val, "\n", "\\n")  
			val = string.gsub(val, "\r", "\\r") 
			val = string.gsub(val, "\t", "\\t") 
			val = string.gsub(val, "\v", "\\v") 
			putline("\"", val, "\", ")
		elseif type(val) == "boolean" then
			putline(val and "true, " or "false, ")
		elseif type(val) == "function" then
			putline(tostring(val), ", ")
		elseif type(val) == "nil" then
			putline("nil, ")
		else
			putline(val, ", ")
		end

		return res
	end

	local res = loop(val)
	res = string.gsub(res, ",(%s*})", "%1")
	res = string.gsub(res, ",(%s*)$", "%1")
	res = string.gsub(res, "{%s+}", "{}")

	return res
end

-- console
console = {}
function console.log (str)
	OutputLogMessage(table.print(str) .. "\n")
end

--[[ Other ]]
EnablePrimaryMouseButtonEvents(true) -- Enable left mouse button event reporting
pubg.GD = GetDate -- Setting aliases
pubg.init() -- Script initialization

--[[ Script End ]]
