-- discord.gg/syncrypt

loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/Blox-Fruits/refs/heads/main/core.luau"))()

-- ============================================================================
-- Redz UI  ->  Banana UI  compatibility layer
-- Giữ nguyên toàn bộ lệnh gọi kiểu Redz (MakeTab / AddToggle / ...) bên dưới,
-- nhưng giao diện thật được vẽ bằng thư viện UI của Banana (CreateMain / ...).
-- ============================================================================
local RedzToBananaUI = (function()
	local BananaUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fendezoc/phongdz2/refs/heads/main/zzzz_clean.lua"))()

	local UserInputService = game:GetService("UserInputService")
	local CoreGui = game:GetService("CoreGui")
	local GUI_NAME = "Nousigi Hub GUI" -- tên ScreenGui mà thư viện Banana tạo ra

	local function noop() end

	-- Đối tượng "rỗng": gọi method nào cũng không lỗi (dành cho code Redz giữ lại giá trị trả về)
	local function dummyObject()
		return setmetatable({}, { __index = function() return noop end })
	end

	local function pick(t, ...)
		for _, key in ipairs({ ... }) do
			if t[key] ~= nil then
				return t[key]
			end
		end
		return nil
	end

	local function blankToNil(s)
		if s == nil or s == "" then
			return nil
		end
		return s
	end

	-- Redz gọi Callback ngay khi tạo với giá trị Default. Nếu thư viện Banana không tự gọi,
	-- ta gọi bù đúng 1 lần sau 1 giây (người dùng đã tương tác thì không gọi bù nữa).
	local function ensureDefault(callback, defaultValue)
		local fired = false
		task.delay(1, function()
			if not fired then
				fired = true
				pcall(callback, defaultValue)
			end
		end)
		return function(...)
			fired = true
			return callback(...)
		end
	end

	local function uiContainers()
		local containers = { CoreGui }
		if gethui then
			local ok, hidden = pcall(gethui)
			if ok and hidden then
				table.insert(containers, hidden)
			end
		end
		return containers
	end

	local function findBananaGuis()
		local found = {}
		for _, container in ipairs(uiContainers()) do
			for _, gui in ipairs(container:GetChildren()) do
				if gui.Name == GUI_NAME then
					table.insert(found, gui)
				end
			end
		end
		return found
	end

	local function toggleBananaUI()
		local guis = findBananaGuis()
		if #guis == 0 then
			return
		end
		local newState = not guis[1].Enabled
		for _, gui in ipairs(guis) do
			gui.Enabled = newState
		end
	end

	------------------------------------------------------------------ Tab
	local Tab = {}
	Tab.__index = Tab

	-- Redz cho phép thêm control ngay khi chưa có Section; Banana thì bắt buộc có Section.
	function Tab:_section()
		if not self._current then
			self._current = self._page.CreateSection(self._title)
		end
		return self._current
	end

	function Tab:AddSection(name)
		if type(name) == "table" then
			name = pick(name, "Name", "Title")
		end
		self._current = self._page.CreateSection(tostring(name or self._title))
		return dummyObject()
	end

	function Tab:AddParagraph(title, desc)
		if type(title) == "table" then
			desc = pick(title, "Content", "Description", "Desc")
			title = pick(title, "Title", "Name")
		end
		local currentTitle = tostring(title or "")
		local currentDesc = desc

		local function render()
			local d = currentDesc ~= nil and tostring(currentDesc) or nil
			d = blankToNil(d)
			if d then
				return currentTitle .. ": " .. d
			end
			return currentTitle
		end

		-- Paragraph của Redz = Label của Banana (SetDesc -> SetText)
		local label = self:_section().CreateLabel({ Title = render() })

		local paragraph = {}
		function paragraph:SetDesc(newDesc)
			currentDesc = newDesc
			pcall(label.SetText, render())
		end
		function paragraph:SetTitle(newTitle)
			currentTitle = tostring(newTitle or "")
			pcall(label.SetText, render())
		end
		function paragraph:Set(newTitle, newDesc)
			currentTitle = tostring(newTitle or currentTitle)
			currentDesc = newDesc
			pcall(label.SetText, render())
		end
		return paragraph
	end

	function Tab:AddToggle(opts)
		local callback = opts.Callback or noop
		local default = opts.Default == true
		if default then
			callback = ensureDefault(callback, true)
		end
		self:_section().CreateToggle({
			Title = pick(opts, "Name", "Title"),
			Desc = blankToNil(pick(opts, "Description", "Desc")),
			Default = default,
		}, callback)
		return dummyObject()
	end

	function Tab:AddButton(opts)
		self:_section().CreateButton({
			Title = pick(opts, "Name", "Title"),
			Desc = blankToNil(pick(opts, "Description", "Desc")),
		}, opts.Callback or noop)
		return dummyObject()
	end

	function Tab:AddTextBox(opts)
		self:_section().CreateBox({
			Title = pick(opts, "Name", "Title"),
			Desc = blankToNil(pick(opts, "Description", "Desc")),
			Placeholder = opts.Placeholder or "Type here",
			Number = opts.Number == true,
			Default = opts.Default,
		}, opts.Callback or noop)
		return dummyObject()
	end

	function Tab:AddSlider(opts)
		local minValue = opts.Min or 0
		local default = opts.Default or minValue
		local callback = ensureDefault(opts.Callback or noop, default)
		self:_section().CreateSlider({
			Title = pick(opts, "Name", "Title"),
			Desc = blankToNil(pick(opts, "Description", "Desc")),
			Min = minValue,
			Max = opts.Max or 100,
			Default = default,
		}, callback)
		return dummyObject()
	end

	function Tab:AddDropdown(opts)
		local title = pick(opts, "Name", "Title")
		local desc = blankToNil(pick(opts, "Description", "Desc"))
		local options = opts.Options or {}
		local callback = opts.Callback or noop

		if opts.MultiSelect then
			-- Redz: callback nhận MẢNG các mục đang chọn.
			-- Banana: List/Default là bảng {tên = true/false}, callback nhận (tên, true/false).
			local lookup = {}
			if type(opts.Default) == "table" then
				for key, value in pairs(opts.Default) do
					if type(key) == "number" then
						lookup[value] = true
					elseif value then
						lookup[key] = true
					end
				end
			end

			local state, list, anyDefault = {}, {}, false
			for _, name in ipairs(options) do
				local on = lookup[name] == true
				state[name] = on
				list[name] = on
				anyDefault = anyDefault or on
			end

			local function selectedArray()
				local result = {}
				for _, name in ipairs(options) do
					if state[name] then
						table.insert(result, name)
					end
				end
				return result
			end

			local fired = false
			if anyDefault then
				task.delay(1, function()
					if not fired then
						fired = true
						pcall(callback, selectedArray())
					end
				end)
			end

			local defaultMap
			if anyDefault then
				defaultMap = {}
				for name, on in pairs(list) do
					defaultMap[name] = on
				end
			end

			self:_section().CreateDropdown({
				Title = title,
				Desc = desc,
				List = list,
				Search = true,
				Selected = true,
				Default = defaultMap,
			}, function(name, value)
				fired = true
				if name ~= nil then
					state[name] = (value == true)
				end
				return callback(selectedArray())
			end)
			return dummyObject()
		end

		-- Dropdown chọn 1 mục
		local default = opts.Default
		if default ~= nil then
			callback = ensureDefault(callback, default)
		end
		self:_section().CreateDropdown({
			Title = title,
			Desc = desc,
			List = options,
			Search = true,
			Selected = false,
			Default = default,
		}, callback)
		return dummyObject()
	end

	---------------------------------------------------------------- Window
	local Window = {}
	Window.__index = Window

	function Window:MakeTab(opts)
		opts = opts or {}
		local title = tostring(pick(opts, "Title", "Name") or "Tab")
		local page = self._main.CreatePage({ Page_Name = title, Page_Title = title })
		return setmetatable({ _page = page, _title = title, _current = nil }, Tab)
	end

	function Window:Notify(opts)
		opts = opts or {}
		pcall(BananaUI.CreateNoti, {
			Title = tostring(pick(opts, "Title", "Name") or "Notification"),
			Desc = tostring(pick(opts, "Content", "Text", "Description", "Desc") or ""),
			ShowTime = pick(opts, "Duration", "Time") or 5,
		})
	end

	-- Banana không có sẵn chức năng scale: áp UIScale lên khung chính (best-effort)
	function Window:SetUIScale(scale)
		pcall(function()
			for _, gui in ipairs(findBananaGuis()) do
				for _, child in ipairs(gui:GetChildren()) do
					if child:IsA("GuiObject") then
						local uiScale = child:FindFirstChildOfClass("UIScale") or Instance.new("UIScale")
						uiScale.Scale = scale
						uiScale.Parent = child
						break
					end
				end
			end
		end)
	end

	-- Phím tắt ẩn/hiện UI + nút nổi cho điện thoại
	function Window:NewMinimizer(opts)
		opts = opts or {}
		if opts.KeyCode then
			UserInputService.InputBegan:Connect(function(input, processed)
				if not processed and input.KeyCode == opts.KeyCode then
					toggleBananaUI()
				end
			end)
		end

		local minimizer = {}
		function minimizer:CreateMobileMinimizer(mobileOpts)
			mobileOpts = mobileOpts or {}
			pcall(function()
				for _, container in ipairs(uiContainers()) do
					local old = container:FindFirstChild("BombHubMinimizer")
					if old then
						old:Destroy()
					end
				end

				local gui = Instance.new("ScreenGui")
				gui.Name = "BombHubMinimizer"
				gui.ResetOnSpawn = false

				local button = Instance.new("ImageButton")
				button.Size = UDim2.fromOffset(44, 44)
				button.Position = UDim2.new(0, 12, 0, 12)
				button.BackgroundColor3 = mobileOpts.BackgroundColor3 or Color3.fromRGB(25, 25, 25)
				button.Image = mobileOpts.Image or ""
				button.Parent = gui

				local corner = Instance.new("UICorner")
				corner.CornerRadius = UDim.new(0, 10)
				corner.Parent = button

				button.Activated:Connect(toggleBananaUI)

				local containers = uiContainers()
				gui.Parent = containers[#containers]
			end)
			return minimizer
		end
		return minimizer
	end

	local Compat = {}
	function Compat.MakeWindow(opts)
		opts = opts or {}
		local main = BananaUI.CreateMain({
			Title = tostring(opts.Title or "Hub"),
			Desc = opts.SubTitle and (" - " .. tostring(opts.SubTitle)) or "",
		})
		return setmetatable({ _main = main }, Window)
	end
	return Compat
end)()

local mainWindow = RedzToBananaUI.MakeWindow({
	Title = "Bomb Hub : Blox Fruits",
	SubTitle = "by obbi_D",
	SaveFolder = "okneiget.json"
})

mainWindow:NewMinimizer({
	KeyCode = Enum.KeyCode.LeftControl
}):CreateMobileMinimizer({
	Image = "rbxassetid://114714624677743",
	BackgroundColor3 = Color3.fromRGB(25, 25, 25)
})

local tabs = {
	Info = mainWindow:MakeTab({
		Title = "Info And Status",
		Icon = "Info"
	}),
	Main = mainWindow:MakeTab({
		Title = "Farming",
		Icon = "rbxassetid://7733960981"
	}),
	Settings = mainWindow:MakeTab({
		Title = "Setting",
		Icon = "rbxassetid://7734053495"
	}),
	Fish = mainWindow:MakeTab({
		Title = "Fishing",
		Icon = "rbxassetid://127664059821666"
	}),
	Quests = mainWindow:MakeTab({
		Title = "Quest And Item",
		Icon = "rbxassetid://13075622619"
	}),
	Halloween = mainWindow:MakeTab({
		Title = "Halloween Event",
		Icon = "ghost"
	}),
	SeaEvent = mainWindow:MakeTab({
		Title = "Sea Event",
		Icon = "waves"
	}),
	Prehistoric = mainWindow:MakeTab({
		Title = "Volcano Event",
		Icon = "tent"
	}),
	Race = mainWindow:MakeTab({
		Title = "Mirage And Race",
		Icon = "rbxassetid://11162889532"
	}),
	Esp = mainWindow:MakeTab({
		Title = "Stats And Esp",
		Icon = "rbxassetid://7040410130"
	}),
	Raids = mainWindow:MakeTab({
		Title = "Fruit And Raid",
		Icon = "rbxassetid://11155986081"
	}),
	Combat = mainWindow:MakeTab({
		Title = "Local Player",
		Icon = "rbxassetid://13075651575"
	}),
	Travel = mainWindow:MakeTab({
		Title = "Teleport",
		Icon = "locate"
	}),
	Shop = mainWindow:MakeTab({
		Title = "Shopping",
		Icon = "rbxassetid://6031265976"
	}),
	Misc = mainWindow:MakeTab({
		Title = "Miscellaneous",
		Icon = "rbxassetid://10709783577"
	})
}

tabs.Info:AddSection("Status Server")

local gameTimeParagraph = tabs.Info:AddParagraph("Game Time", "")

UpdateGameTime = function()
	local elapsedGameSeconds = math.floor(workspace.DistributedGameTime + 0.5)

	gameTimeParagraph:SetDesc(math.floor(elapsedGameSeconds / 3600) % 24 .. " Hour (h) " .. math.floor(elapsedGameSeconds / 60) % 60 .. " Minute (m) " .. math.floor(elapsedGameSeconds / 1) % 60 .. " Second (s)")
end
spawn(function()
	while true do
		UpdateGameTime()
		wait(1)
	end
end)

do
	local mirageIslandParagraph = tabs.Info:AddParagraph("Mirage Island", "Status: ")
	local previousMirageIslandStatus = ""

	spawn(function()
		pcall(function()
			while true do
				wait(1)

				local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") ~= nil and "✅" or "❌"

				if status == previousMirageIslandStatus then
					continue
				end

				mirageIslandParagraph:SetDesc("Status: " .. status)
				previousMirageIslandStatus = status
			end
		end)
	end)
end

do
	local kitsuneIslandParagraph = tabs.Info:AddParagraph("Kitsune Island", "Status: ")
	local previousKitsuneIslandStatus = ""

	spawn(function()
		while task.wait(1) do
			pcall(function()
				local status = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") and "✅"

				status = status or "❌"

				if status ~= previousKitsuneIslandStatus then
					kitsuneIslandParagraph:SetDesc("Status: " .. status)
					previousKitsuneIslandStatus = status
				end
			end)
		end
	end)
end

local prehistoricIslandParagraph = tabs.Info:AddParagraph("Prehistoric Island", "Status: ")

do
	local previousPrehistoricIslandStatus = ""

	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") and "✅" or "❌"

				if status ~= previousPrehistoricIslandStatus then
					prehistoricIslandParagraph:SetDesc("Status: " .. status)
					previousPrehistoricIslandStatus = status
				end
			end)
		end
	end)
end

do
	local frozenDimensionParagraph = tabs.Info:AddParagraph("Frozen Dimension", "Status: ")
	local previousFrozenDimensionStatus = ""

	spawn(function()
		while wait(1) do
			pcall(function()
				local status = game.Workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") and "✅"

				status = status or "❌"

				if status ~= previousFrozenDimensionStatus then
					frozenDimensionParagraph:SetDesc("Status: " .. status)
					previousFrozenDimensionStatus = status
				end
			end)
		end
	end)
end

local ripIndraParagraph = tabs.Info:AddParagraph("Rip Indra", "Status: ")

do
	local previousRipIndraStatus = ""

	spawn(function()
		while wait(1) do
			pcall(function()
				local status = (game:GetService("ReplicatedStorage"):FindFirstChild("rip_indra True Form") or game:GetService("Workspace").Enemies:FindFirstChild("rip_indra")) and "✅"

				status = status or "❌"

				if status ~= previousRipIndraStatus then
					ripIndraParagraph:SetDesc("Status: " .. status)
					previousRipIndraStatus = status
				end
			end)
		end
	end)
end

local doughKingParagraph = tabs.Info:AddParagraph("Dough King", "Status: ")
local previousDoughKingStatus = ""

do
	spawn(function()
		while wait(1) do
			pcall(function()
				local status = (game:GetService("ReplicatedStorage"):FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Dough King")) and "✅" or "❌"

				if status ~= previousDoughKingStatus then
					doughKingParagraph:SetDesc("Status: " .. status)
					previousDoughKingStatus = status
				end
			end)
		end
	end)
end

local fullMoonParagraph = tabs.Info:AddParagraph("Full Moon", "")

task.spawn(function()
	while task.wait(1) do
		pcall(function()
			local MoonTextureId = game:GetService("Lighting").Sky.MoonTextureId
			local moonStatusText = "Moon: 0/5"

			if MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
				moonStatusText = "Moon: 5/5 (Full Moon) ✅"
			elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				moonStatusText = "Moon: 4/5"
			elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
				moonStatusText = "Moon: 3/5"
			elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
				moonStatusText = "Moon: 2/5"
			elseif MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
				moonStatusText = "Moon: 1/5"
			end

			fullMoonParagraph:SetDesc(moonStatusText)
		end)
	end
end)

do
	local legendarySwordParagraph = tabs.Info:AddParagraph("Legendary Sword", "Status: ")

	spawn(function()
		while wait(5) do
			pcall(function()
				local legendarySwordNames = {}

				for _, v in ipairs({
					"Shizu",
					"Saishi",
					"Oroshi"
				}) do
					if GetWP(v) then
						table.insert(legendarySwordNames, v .. " ✅")
					end
				end

				legendarySwordParagraph:SetDesc(#legendarySwordNames > 0 and table.concat(legendarySwordNames, ", ") or "Not Found")
			end)
		end
	end)
end

local cakePrinceParagraph = tabs.Info:AddParagraph("Cake Prince", "")

spawn(function()
	while wait(1) do
		local ok, result = pcall(function()
			return game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
		end)
		local cakePrinceStatusText = "Cake Prince: ✅"

		if ok and type(result) == "string" and string.len(result) >= 86 then
			cakePrinceStatusText = "Killed: " .. string.sub(result, 39, 41)
		end

		cakePrinceParagraph:SetDesc(cakePrinceStatusText)
	end
end)

local Bone_ = tabs.Info:AddParagraph("Bone", "")

spawn(function()
	while wait(1) do
		pcall(function()
			local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")

			Bone_:SetDesc("You Have: " .. tostring(response) .. " Bones")
		end)
	end
end)
WeaponDropdown = tabs.Main:AddDropdown({
	Name = "Select Weapon",
	Options = {
		"Melee",
		"Sword",
		"Blox Fruit",
		"Gun"
	},
	Default = "Melee",
	Callback = function(selectedWeapon)
		_G.ChooseWP = selectedWeapon
	end
})
tabs.Main:AddDropdown({
	Name = "UI Scale",
	Options = {
		"Small",
		"Normal",
		"Big"
	},
	Default = "Normal",
	Callback = function(selectedUIScale)
		mainWindow:SetUIScale(({
			Small = 0.8,
			Normal = 1,
			Big = 1.2
		})[selectedUIScale])
	end
})
tabs.Main:AddSection("Farming")

do
	FarmLevel = tabs.Main:AddToggle({
		Name = "Auto Farm Level",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmLevelEnabled)
			_G.Level = isAutoFarmLevelEnabled

			if not isAutoFarmLevelEnabled then
				alreadyTeleported = false
				teleporting = false
			end
		end
	})
end

ClosetMons = tabs.Main:AddToggle({
	Name = "Auto Farm Nearest",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmNearestEnabled)
		_G.AutoFarmNear = isAutoFarmNearestEnabled
	end
})
FactoryRaids = tabs.Main:AddToggle({
	Name = "Auto Factory Raid",
	Description = "",
	Default = false,
	Callback = function(isAutoFactoryRaidEnabled)
		_G.AutoFactory = isAutoFactoryRaidEnabled
	end
})
CastleRaids = tabs.Main:AddToggle({
	Name = "Auto Pirate Raid",
	Description = "",
	Default = false,
	Callback = function(isAutoPirateRaidEnabled)
		_G.AutoRaidCastle = isAutoPirateRaidEnabled
	end
})
Ecto = tabs.Main:AddToggle({
	Name = "Auto Farm Ectoplasm",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmEctoplasmEnabled)
		_G.AutoEctoplasm = isAutoFarmEctoplasmEnabled
	end
})
tabs.Main:AddSection("Chest")

do
	ChestTW = tabs.Main:AddToggle({
		Name = "Auto Farm Chest",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmChestEnabled)
			_G.AutoFarmChest = isAutoFarmChestEnabled
		end
	})
end

ChestBP = tabs.Main:AddToggle({
	Name = "Auto Chest Bypass",
	Description = "",
	Default = false,
	Callback = function(isAutoChestBypassEnabled)
		_G.AutoChestBP = isAutoChestBypassEnabled

		if isAutoChestBypassEnabled then
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local chestBypassRunning = false
			local cachedChestParts = {}
			local chestCacheInitialized = true

			local function getCharacter()
				if not LocalPlayer.Character then
					LocalPlayer.CharacterAdded:Wait()
				end

				LocalPlayer.Character:WaitForChild("HumanoidRootPart")

				return LocalPlayer.Character
			end
			local function getChestsByDistance()
				if chestCacheInitialized then
					chestCacheInitialized = false

					for _, descendant in pairs(game:GetDescendants()) do
						if descendant.Name:find("Chest") and descendant.ClassName == "Part" then
							table.insert(cachedChestParts, descendant)
						end
					end
				end

				local touchableChestParts = {}

				for _, v in pairs(cachedChestParts) do
					if v:FindFirstChild("TouchInterest") then
						table.insert(touchableChestParts, v)
					end
				end

				local LowerTorso = getCharacter().LowerTorso

				table.sort(touchableChestParts, function(firstChestPart, secondChestPart)
					return (LowerTorso.Position - firstChestPart.Position).Magnitude < (LowerTorso.Position - secondChestPart.Position).Magnitude
				end)

				return touchableChestParts
			end
			local function startChestBypass()
				if chestBypassRunning then
					return
				end

				chestBypassRunning = true
				task.spawn(function()
					while _G.AutoChestBP and LocalPlayer.Character and LocalPlayer.Character.Parent do
						local sortedChestParts = getChestsByDistance()

						if #sortedChestParts > 0 then
							getCharacter().HumanoidRootPart.CFrame = sortedChestParts[1].CFrame
						end

						task.wait(0.1)
					end

					chestBypassRunning = false
				end)
			end

			LocalPlayer.CharacterAdded:Connect(function()
				getCharacter()
				task.wait(0.5)

				if _G.AutoChestBP then
					startChestBypass()
				end
			end)
			startChestBypass()
		end
	end
})
StopI = tabs.Main:AddToggle({
	Name = "Stop Farm for FOD & Chalice",
	Description = "",
	Default = true,
	Callback = function(isStopFarmForFODChaliceEnabled)
		_G.StopWhenChalice = isStopFarmForFODChaliceEnabled
	end
})
tabs.Main:AddSection("Berry")

do
	Berry = tabs.Main:AddToggle({
		Name = "Auto Farm Berry",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmBerryEnabled)
			_G.AutoBerry = isAutoFarmBerryEnabled
		end
	})
end

BerryH = tabs.Main:AddToggle({
	Name = "Auto Farm Berry + Hop",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmBerryHopEnabled)
		_G.AutoBerryH = isAutoFarmBerryHopEnabled
	end
})
tabs.Main:AddSection("Farm Mob")

if World1 then
	tabs.Main:AddDropdown({
		Name = "Select Mob",
		Default = Bandit,
		Options = {
			"Bandit",
			"Monkey",
			"Gorilla",
			"Pirate",
			"Brute",
			"Desert Bandit",
			"Desert Officer",
			"Snow Bandit",
			"Snowman",
			"Chief Petty Officer",
			"Sky Bandit",
			"Dark Master",
			"Toga Warrior",
			"Gladiator",
			"Military Soldier",
			"Military Spy",
			"Fishman Warrior",
			"Fishman Commando",
			"God's Guard",
			"Shanda",
			"Royal Squad",
			"Royal Soldier",
			"Galley Pirate",
			"Galley Captain"
		},
		Callback = function(selectedMobSea1)
			getgenv().SelectMob = selectedMobSea1
		end
	})
end

if World2 then
	tabs.Main:AddDropdown({
		Name = "Select Mob",
		Default = Raider,
		Options = {
			"Raider",
			"Mercenary",
			"Swan Pirate",
			"Factory Staff",
			"Marine Lieutenant",
			"Marine Captain",
			"Zombie",
			"Vampire",
			"Snow Trooper",
			"Winter Warrior",
			"Lab Subordinate",
			"Horned Warrior",
			"Magma Ninja",
			"Lava Pirate",
			"Ship Deckhand",
			"Ship Engineer",
			"Ship Steward",
			"Ship Officer",
			"Arctic Warrior",
			"Snow Lurker",
			"Sea Soldier",
			"Water Fighter"
		},
		Callback = function(selectedMobSea2)
			getgenv().SelectMob = selectedMobSea2
		end
	})
end

if World3 then
	tabs.Main:AddDropdown({
		Name = "Select Mob",
		Options = {
			"Pirate Millionaire",
			"Dragon Crew Warrior",
			"Dragon Crew Archer",
			"Female Islander",
			"Giant Islander",
			"Marine Commodore",
			"Marine Rear Admiral",
			"Fishman Raider",
			"Fishman Captain",
			"Forest Pirate",
			"Mythological Pirate",
			"Jungle Pirate",
			"Musketeer Pirate",
			"Reborn Skeleton",
			"Living Zombie",
			"Demonic Soul",
			"Posessed Mummy",
			"Peanut Scout",
			"Peanut President",
			"Ice Cream Chef",
			"Ice Cream Commander",
			"Cookie Crafter",
			"Cake Guard",
			"Baking Staff",
			"Head Baker",
			"Cocoa Warrior",
			"Chocolate Bar Battler",
			"Sweet Thief",
			"Candy Rebel",
			"Candy Pirate",
			"Snow Demon",
			"Isle Outlaw",
			"Island Boy",
			"Sun-kissed Warrior",
			"Isle Champion"
		},
		Callback = function(selectedMobSea3)
			getgenv().SelectMob = selectedMobSea3
		end
	})
end

do
	tabs.Main:AddToggle({
		Name = "Auto Farm Mob",
		Default = false,
		Callback = function(isAutoFarmMobEnabled)
			_G.AutoKillMob = isAutoFarmMobEnabled
		end
	})
end

tabs.Main:AddSection("Farm Island")

local function getIslandList()
	local islandNames = {}
	local Island = Core.Island or {}

	for k in pairs(Island) do
		table.insert(islandNames, k)
	end

	table.sort(islandNames)

	return islandNames
end

tabs.Main:AddDropdown({
	Name = "Select Island",
	Options = getIslandList(),
	Callback = function(selectedFarmIsland)
		_G.SelectIsland = selectedFarmIsland
	end
})
tabs.Main:AddToggle({
	Name = "Auto Farm Island",
	Default = false,
	Callback = function(isAutoFarmIslandEnabled)
		_G.AutoFarmIsland = isAutoFarmIslandEnabled
	end
})
tabs.Main:AddSection("Elite Hunter")

do
	local eliteHunterParagraph = tabs.Main:AddParagraph("Elite Hunter", "Status: ❌ | Killed: 0")

	spawn(function()
		while wait(1) do
			local Diablo = game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")

			Diablo = Diablo and "✅" or "❌"

			local ok, result = pcall(function()
				return replicated.Remotes.CommF_:InvokeServer("EliteHunter", "Progress")
			end)
			local tostring_ = tostring
			local eliteHunterProgress = ok and result

			eliteHunterParagraph:SetDesc("Status: " .. Diablo .. " | Killed: " .. tostring_(eliteHunterProgress or 0))
		end
	end)
end

EliteQ = tabs.Main:AddToggle({
	Name = "Auto Farm Elite Hunter",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmEliteHunterEnabled)
		_G.FarmEliteHunt = isAutoFarmEliteHunterEnabled
	end
})
EliteH = tabs.Main:AddToggle({
	Name = "Auto Farm Elite Hunter + Hop",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmEliteHunterHopEnabled)
		_G.FarmEliteH = isAutoFarmEliteHunterHopEnabled
	end
})
tabs.Main:AddSection("Rip Indra")

do
	tabs.Main:AddToggle({
		Name = "Auto Farm Rip Indra",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmRipIndraEnabled)
			_G.AutoRipIngay = isAutoFarmRipIndraEnabled
		end
	})
end

tabs.Main:AddToggle({
	Name = "Auto Unlocked Haki",
	Description = "",
	Default = false,
	Callback = function(isAutoUnlockedHakiEnabled)
		_G.AutoUnHaki = isAutoUnlockedHakiEnabled
	end
})
tabs.Main:AddSection("Cake Prince")

local cakePrinceSpawnerParagraph = tabs.Main:AddParagraph("Cake Princes", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			local cakePrinceRemainingCount = string.match(replicated.Remotes.CommF_:InvokeServer("CakePrinceSpawner"), "%d+")

			if cakePrinceRemainingCount then
				cakePrinceSpawnerParagraph:SetDesc("Killed : " .. (500 - tonumber(cakePrinceRemainingCount) or 0))
			end
		end)
	end
end)
Cake = tabs.Main:AddToggle({
	Name = "Auto Farm Cake Prince",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmCakePrinceEnabled)
		_G.Auto_Cake_Prince = isAutoFarmCakePrinceEnabled
	end
})

do
	CakeQ = tabs.Main:AddToggle({
		Name = "Accept Quests",
		Description = "",
		Default = false,
		Callback = function(isAcceptQuestsEnabled)
			_G.AcceptQuestC = isAcceptQuestsEnabled
		end
	})
end

CakeSM = tabs.Main:AddToggle({
	Name = "Auto Summon Cake Prince",
	Description = "",
	Default = false,
	Callback = function(isAutoSummonCakePrinceEnabled)
		_G.AutoSpawnCP = isAutoSummonCakePrinceEnabled
	end
})
tabs.Main:AddToggle({
	Name = "Auto Farm Dough King",
	Default = false,
	Callback = function(isAutoFarmDoughKingEnabled)
		_G.AutoAttackDoughKing = isAutoFarmDoughKingEnabled
	end
})
tabs.Main:AddToggle({
	Name = "Auto Farm Dough King Fully",
	Default = false,
	Callback = function(isAutoFarmDoughKingFullyEnabled)
		_G.AutoDoughKing = isAutoFarmDoughKingFullyEnabled
	end
})
tabs.Main:AddToggle({
	Name = "Auto Farm Dough King + Hop",
	Default = false,
	Callback = function(isAutoFarmDoughKingHopEnabled)
		_G.AutoHop_Dough = isAutoFarmDoughKingHopEnabled
	end
})
tabs.Main:AddSection("Bone")

local Bones = tabs.Main:AddParagraph("Bones", "")

spawn(function()
	while wait(1) do
		pcall(function()
			local response = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")

			Bones:SetDesc("Bones : " .. tostring(response))
		end)
	end
end)
tabs.Main:AddToggle({
	Name = "Auto Farm Bone",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmBoneEnabled)
		_G.AutoFarm_Bone = isAutoFarmBoneEnabled
	end
})
BoneQ = tabs.Main:AddToggle({
	Name = "Accept Quests",
	Description = "",
	Default = false,
	Callback = function(isAcceptQuestsEnabled)
		_G.AcceptQuestB = isAcceptQuestsEnabled
	end
})

do
	RanBone = tabs.Main:AddToggle({
		Name = "Auto Random Bones",
		Description = "",
		Default = false,
		Callback = function(isAutoRandomBonesEnabled)
			_G.Auto_Random_Bone = isAutoRandomBonesEnabled
		end
	})
end

tabs.Main:AddToggle({
	Name = "Auto Soul Reaper",
	Description = "",
	Default = false,
	Callback = function(isAutoSoulReaperEnabled)
		_G.AutoHytHallow = isAutoSoulReaperEnabled
	end
})

do
	Lucky = tabs.Main:AddToggle({
		Name = "Auto Try Luck Gravestone",
		Description = "",
		Default = false,
		Callback = function(isAutoTryLuckGravestoneEnabled)
			_G.TryLucky = isAutoTryLuckGravestoneEnabled
		end
	})
end

Pray = tabs.Main:AddToggle({
	Name = "Auto Pray Gravestone",
	Description = "",
	Default = false,
	Callback = function(isAutoPrayGravestoneEnabled)
		_G.Praying = isAutoPrayGravestoneEnabled
	end
})
tabs.Main:AddSection("Tyrant of the Skies")

local tyrantSpawnParagraph = tabs.Main:AddParagraph("Boss Spawn", "")

spawn(function()
	pcall(function()
		while wait(1) do
			if workspace.Enemies:FindFirstChild("Tyrant of the Skies") then
				tyrantSpawnParagraph:SetDesc("✅")
			else
				tyrantSpawnParagraph:SetDesc("❌")
			end
		end
	end)
end)

local tyrantEyesParagraph = tabs.Main:AddParagraph("Check Status Eyes", "")

task.spawn(function()
	local previousEyeCheckResult = false

	while task.wait(1) do
		local ok, result, result2 = pcall(Check_Eye)

		if ok then
			tyrantEyesParagraph:SetDesc("Eyes: " .. result .. "/4")

			if not result2 or previousEyeCheckResult then
				if not result2 then
					previousEyeCheckResult = false
				end
			else
				previousEyeCheckResult = true
			end
		end
	end
end)

do
	FarmTyrant = tabs.Main:AddToggle({
		Name = "Auto Farm Tyrant of the Skies",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmTyrantOfTheSkiesEnabled)
			_G.FarmTyrant = isAutoFarmTyrantOfTheSkiesEnabled
		end
	})
end

FarmPhaBinh = tabs.Main:AddToggle({
	Name = "Auto Summon Tyrant of the Skies",
	Description = "",
	Default = false,
	Callback = function(isAutoSummonTyrantOfTheSkiesEnabled)
		_G.FarmPhaBinh = isAutoSummonTyrantOfTheSkiesEnabled
	end
})
tabs.Main:AddSection("Material")
Test = tabs.Main:AddDropdown({
	Name = "Select Material",
	Description = "",
	Options = MaterialList,
	Callback = function(selectedMaterial)
		getgenv().SelectMaterial = selectedMaterial
	end
})
Toggle = tabs.Main:AddToggle({
	Name = "Auto Farm Material",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmMaterialEnabled)
		getgenv().AutoMaterial = isAutoFarmMaterialEnabled
	end
})
tabs.Main:AddSection("Boss")

do
	BossDropdown = tabs.Main:AddDropdown({
		Name = "Select Boss",
		Description = "",
		Options = BossList,
		Callback = function(selectedBoss)
			_G.FindBoss = selectedBoss
		end
	})
end

do
	FarmBoss = tabs.Main:AddToggle({
		Name = "Auto Farm Boss",
		Description = "",
		Default = false,
		Callback = function(isAutoFarmBossEnabled)
			_G.FarmBoss = isAutoFarmBossEnabled
		end
	})
end

BossQ = tabs.Main:AddToggle({
	Name = "Accept Quests",
	Description = "",
	Default = true,
	Callback = function(isAcceptQuestsEnabled)
		_G.AcceptQuestBoss = isAcceptQuestsEnabled
	end
})
FarmAllBoss = tabs.Main:AddToggle({
	Name = "Auto Farm All Boss",
	Default = false,
	Callback = function(isAutoFarmAllBossEnabled)
		_G.AutoFarmAllBoss = isAutoFarmAllBossEnabled
	end
})
tabs.Main:AddSection("Mastery")
tabs.Main:AddDropdown({
	Name = "Choose Island",
	Description = "",
	Options = {
		"Cake",
		"Bone"
	},
	Default = Bone,
	Callback = function(selectedMasteryIsland)
		SelectIsland = selectedMasteryIsland
	end
})

do
	tabs.Main:AddSlider({
		Title = "NPC Health % Switch to Weapon",
		Description = "Switches to mastery weapon moves when NPC HP drops below this percent",
		Min = 10,
		Max = 95,
		Default = 70,
		Callback = function(npcHealthSwitchPercent)
			_G.MasteryHealthPct = npcHealthSwitchPercent
		end
	})
end

tabs.Main:AddDropdown({
	Name = "Select Skills",
	Description = "Select which skills to spam (locked skills are auto-skipped)",
	Options = {
		"Z",
		"X",
		"C",
		"V",
		"F",
		"Y"
	},
	Default = {
		"Z",
		"X",
		"C",
		"V",
		"F"
	},
	MultiSelect = true,
	Callback = function(selectedSkills)
		_G.SelectedMasterySkills = selectedSkills
	end
})
tabs.Main:AddToggle({
	Name = "Auto Mastery Fruits",
	Description = "",
	Default = false,
	Callback = function(isAutoMasteryFruitsEnabled)
		_G.FarmMastery_Dev = isAutoMasteryFruitsEnabled
	end
})

do
	tabs.Main:AddToggle({
		Name = "Auto Mastery Gun",
		Description = "",
		Default = false,
		Callback = function(isAutoMasteryGunEnabled)
			_G.FarmMastery_G = isAutoMasteryGunEnabled
		end
	})
end

tabs.Main:AddToggle({
	Name = "Auto Mastery All Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoMasteryAllSwordEnabled)
		_G.FarmMastery_S = isAutoMasteryAllSwordEnabled
	end
})
tabs.Settings:AddSection("Setting")

do
	Initialize = tabs.Settings:AddToggle({
		Name = "Fast Attack",
		Description = "",
		Default = true,
		Callback = function(isFastAttackEnabled)
			_G.Seriality = isFastAttackEnabled
		end
	})
end

Bringmob = tabs.Settings:AddToggle({
	Name = "Bring Mobs",
	Description = "",
	Default = true,
	Callback = function(isBringMobsEnabled)
		_B = isBringMobsEnabled
	end
})
tabs.Settings:AddToggle({
	Name = "Auto Hop Server with time",
	Default = false,
	Callback = function(isAutoHopServerWithTimeEnabled)
		_G.AutoHopServer = isAutoHopServerWithTimeEnabled

		if not isAutoHopServerWithTimeEnabled then
			_G.HopTimer = nil
		end
	end
})

do
	tabs.Settings:AddSlider({
		Name = "Hop Delay (Minutes)",
		Min = 5,
		Max = 120,
		Default = 30,
		Increment = 1,
		Callback = function(hopDelayMinutes)
			_G.HopDelay = hopDelayMinutes * 60
		end
	})
end

tabs.Settings:AddToggle({
	Name = "Auto Set Spawn Point",
	Default = false,
	Callback = function(isAutoSetSpawnPointEnabled)
		getgenv().Set = isAutoSetSpawnPointEnabled

		if isAutoSetSpawnPointEnabled then
			pcall(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
			end)
		end
	end
})
BusuAura = tabs.Settings:AddToggle({
	Name = "Auto Turn on Buso",
	Description = "",
	Default = true,
	Callback = function(isAutoTurnOnBusoEnabled)
		Boud = isAutoTurnOnBusoEnabled
	end
})
tabs.Settings:AddToggle({
	Name = "Auto Haki Observation",
	Default = false,
	Callback = function(isAutoHakiObservationEnabled)
		getgenv().Observation = isAutoHakiObservationEnabled
	end
})
RaceV3Aura = tabs.Settings:AddToggle({
	Name = "Auto Turn on Race V3",
	Description = "",
	Default = false,
	Flag = "AutoTurnonRaceV3",
	Callback = function(isAutoTurnOnRaceV3Enabled)
		_G.RaceClickAutov3 = isAutoTurnOnRaceV3Enabled
	end
})
RaceV4Aura = tabs.Settings:AddToggle({
	Name = "Auto Turn on Race V4",
	Description = "",
	Default = false,
	Callback = function(isAutoTurnOnRaceV4Enabled)
		_G.RaceClickAutov4 = isAutoTurnOnRaceV4Enabled
	end
})

do
	RandomAround = tabs.Settings:AddToggle({
		Name = "Auto Turn on Spin  xyz",
		Description = "",
		Default = false,
		Callback = function(isAutoTurnOnSpinXyzEnabled)
			RandomCFrame = isAutoTurnOnSpinXyzEnabled
		end
	})
end

SafeModes = tabs.Settings:AddToggle({
	Name = "Safe Mode",
	Description = "",
	Default = false,
	Callback = function(isSafeModeEnabled)
		_G.Safemode = isSafeModeEnabled
	end
})
DisableHitVFX = tabs.Settings:AddToggle({
	Name = "Remove Hit VFX",
	Description = "Removes slash and sword visual effects for better visibility",
	Default = false,
	Callback = function(isRemoveHitVFXEnabled)
		_G.DestroyHit = isRemoveHitVFXEnabled
	end
})

do
	RmvVFX = tabs.Settings:AddToggle({
		Name = "Remove Death & Respawned VFX",
		Description = "",
		Default = false,
		Callback = function(isRemoveDeathRespawnedVFXEnabled)
			RDeath = isRemoveDeathRespawnedVFXEnabled
		end
	})
end

do
	DisblesNotify = tabs.Settings:AddToggle({
		Name = "Disable Notify",
		Description = "",
		Default = false,
		Callback = function(isDisableNotifyEnabled)
			RemoveDamage = isDisableNotifyEnabled
		end
	})
end

tabs.Settings:AddToggle({
	Name = "Anti AFK",
	Default = true,
	Callback = function(isAntiAFKEnabled)
		if isAntiAFKEnabled then
			local VirtualUser = game:GetService("VirtualUser")

			repeat
				wait()
			until game:IsLoaded()

			game:GetService("Players").LocalPlayer.Idled:Connect(function()
				VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				wait(1)
				VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			end)
		end
	end
})
tabs.Settings:AddToggle({
	Name = "Auto Anti - Admin Join Server",
	Description = "",
	Default = true,
	Callback = function(isAutoAntiAdminJoinServerEnabled)
		getgenv().HopServerAdmin = isAutoAntiAdminJoinServerEnabled
	end
})
tabs.Settings:AddToggle({
	Name = "No Clip",
	Default = false,
	Callback = function(isNoClipEnabled)
		getgenv().NoClip = isNoClipEnabled
	end
})
tabs.Fish:AddSection("Fishing")

do
	tabs.Fish:AddDropdown({
		Name = "Select Fishing Rod",
		Description = "",
		Options = {
			"Fishing Rod",
			"Gold Rod",
			"Shark Rod",
			"Shell Rod",
			"Treasure Rod"
		},
		Default = "Fishing Rod",
		Callback = function(selectedFishingRod)
			_G.SelectedRod = selectedFishingRod
		end
	})
end

do
	BaitDropdown = tabs.Fish:AddDropdown({
		Name = "Select Bait",
		Description = "",
		Options = {
			"Basic Bait",
			"Kelp Bait",
			"Good Bait",
			"Abyssal Bait",
			"Frozen Bait",
			"Epic Bait",
			"Carnivore Bait"
		},
		Default = "Basic Bait",
		Callback = function(selectedBait)
			_G.SelectedBait = selectedBait

			if _G.AutoBuyBait then
				pcall(function()
					Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
				end)
			end
		end
	})
end

BuyBaitToggle = tabs.Fish:AddToggle({
	Name = "Auto Buy Bait",
	Description = "",
	Default = false,
	Callback = function(isAutoBuyBaitEnabled)
		_G.AutoBuyBait = isAutoBuyBaitEnabled

		if isAutoBuyBaitEnabled then
			pcall(function()
				Remotes.RFCraft:InvokeServer("Craft", _G.SelectedBait, {})
			end)
		end
	end
})
FishingToggle = tabs.Fish:AddToggle({
	Name = "Auto Fishing",
	Description = "",
	Default = false,
	Callback = function(isAutoFishingEnabled)
		_G.AutoFishing = isAutoFishingEnabled
	end
})
SellFishToggle = tabs.Fish:AddToggle({
	Name = "Auto Sell Fish",
	Description = "",
	Default = false,
	Callback = function(isAutoSellFishEnabled)
		_G.AutoSellFish = isAutoSellFishEnabled

		if isAutoSellFishEnabled then
			pcall(function()
				Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "SellFish")
			end)
		end
	end
})
FishingQ = tabs.Fish:AddToggle({
	Name = "Auto Quest Fishing",
	Description = "",
	Default = false,
	Callback = function(isAutoQuestFishingEnabled)
		_G.AutoFishingQuest = isAutoQuestFishingEnabled
	end
})
QuestToggle = tabs.Fish:AddToggle({
	Name = "Auto Complete Quest",
	Description = "",
	Default = false,
	Callback = function(isAutoCompleteQuestEnabled)
		_G.AutoQuestComplete = isAutoCompleteQuestEnabled

		if isAutoCompleteQuestEnabled then
			pcall(function()
				Remotes.RFJobsRemoteFunction:InvokeServer("FishingNPC", "FinishQuest")
			end)
		end
	end
})
SpamSkillZ = tabs.Fish:AddToggle({
	Name = "Auto Spam Skill Z",
	Description = "",
	Default = false,
	Callback = function(isAutoSpamSkillZEnabled)
		_G.AutoSkillZ = isAutoSpamSkillZEnabled
	end
})
TravelDress = tabs.Quests:AddToggle({
	Name = "Auto Quest Sea 2",
	Description = "",
	Default = false,
	Callback = function(isAutoQuestSea2Enabled)
		_G.TravelDres = isAutoQuestSea2Enabled
	end
})
Zou = tabs.Quests:AddToggle({
	Name = "Auto Quest Sea 3",
	Description = "",
	Default = false,
	Callback = function(isAutoQuestSea3Enabled)
		_G.AutoZou = isAutoQuestSea3Enabled
	end
})
tabs.Quests:AddSection("Tushita + Yama")
Q = tabs.Quests:AddToggle({
	Name = "Auto Tushita Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoTushitaSwordEnabled)
		_G.Auto_Tushita = isAutoTushitaSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Yama Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoYamaSwordEnabled)
		_G.Auto_Yama = isAutoYamaSwordEnabled
	end
})
tabs.Quests:AddSection("Skull Guitar")

local skullGuitarQuestParagraph = tabs.Quests:AddParagraph("Skull Guitar Quests", "")

spawn(function()
	while wait(0.2) do
		pcall(function()
			if Quest1 == true then
				skullGuitarQuestParagraph:SetDesc("Quest Number : Quest1")
			elseif Quest2 == true then
				skullGuitarQuestParagraph:SetDesc("Quest Number : Quest2")
			elseif Quest3 == true then
				skullGuitarQuestParagraph:SetDesc("Quest Number : Quest3")
			elseif Quest4 == true then
				skullGuitarQuestParagraph:SetDesc("Quest Number : Quest4")
			elseif GetWP("Skull Guitar") then
				skullGuitarQuestParagraph:SetDesc("Quest Number : Collect!!")
			else
				skullGuitarQuestParagraph:SetDesc("Quest Number : No Quest!!")
			end
		end)
	end
end)

do
	tabs.Quests:AddToggle({
		Name = "Auto Skull Guitar",
		Description = "",
		Default = false,
		Callback = function(isAutoSkullGuitarEnabled)
			_G.Auto_Soul_Guitar = isAutoSkullGuitarEnabled
		end
	})
end

tabs.Quests:AddToggle({
	Name = "Auto Farm Material Skull Guitar",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmMaterialSkullGuitarEnabled)
		_G.AutoMatSoul = isAutoFarmMaterialSkullGuitarEnabled
	end
})
tabs.Quests:AddSection("Cursed Dual Katana")

local cursedDualKatanaQuestParagraph = tabs.Quests:AddParagraph("Number Cursed Dual Katana quests", "Quest Numbers :")

spawn(function()
	while wait(0.2) do
		if QuestYama_1 == true then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : yama quest 1")
		elseif QuestYama_2 == true then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : yama quest 2")
		elseif QuestYama_3 == true then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : yama quest 3")
		elseif QuestTushita_1 == true then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : tushita quest 1")
		elseif QuestTushita_2 == true then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : tushita quest 2")
		elseif GetWP("Cursed Dual Katana") then
			cursedDualKatanaQuestParagraph:SetDesc("Quest Numbers : CDK done!!")
		end
	end
end)

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Get CDK Last Quest",
		Description = "",
		Default = false,
		Callback = function(isAutoGetCDKLastQuestEnabled)
			_G.CDK = isAutoGetCDKLastQuestEnabled
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Auto Yama CDK",
	Description = "",
	Default = false,
	Callback = function(isAutoYamaCDKEnabled)
		_G.CDK_YM = isAutoYamaCDKEnabled
	end
})

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Tushita CDK",
		Description = "",
		Default = false,
		Callback = function(isAutoTushitaCDKEnabled)
			_G.CDK_TS = isAutoTushitaCDKEnabled
		end
	})
end

tabs.Quests:AddSection("True Triple Katana")

do
	tabs.Quests:AddButton({
		Name = "Buy Legendary Sword",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "1")
			replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "2")
			replicated.Remotes.CommF_:InvokeServer("LegendarySwordDealer", "3")
		end
	})
end

do
	tabs.Quests:AddButton({
		Name = "Buy True Triple Katana Sword",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("MysteriousMan", "2")
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Tween to Legendary Sword Dealer",
	Description = "",
	Default = false,
	Callback = function(isTweenToLegendarySwordDealerEnabled)
		_G.Tp_LgS = isTweenToLegendarySwordDealerEnabled
	end
})
tabs.Quests:AddSection("Rengoku")

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Rengoku Sword",
		Description = "",
		Default = false,
		Callback = function(isAutoRengokuSwordEnabled)
			_G.IceBossRen = isAutoRengokuSwordEnabled
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Auto Key Rengoku",
	Description = "",
	Default = false,
	Callback = function(isAutoKeyRengokuEnabled)
		_G.KeysRen = isAutoKeyRengokuEnabled
	end
})
tabs.Quests:AddSection("Sword")
Q = tabs.Quests:AddToggle({
	Name = "Auto Pole V1",
	Description = "",
	Default = false,
	Callback = function(isAutoPoleV1Enabled)
		_G.AutoPole = isAutoPoleV1Enabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Pole V2",
	Description = "",
	Default = false,
	Callback = function(isAutoPoleV2Enabled)
		_G.AutoPoleV2 = isAutoPoleV2Enabled
	end
})
tabs.Quests:AddToggle({
	Name = "Auto Saw Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoSawSwordEnabled)
		_G.AutoSaw = isAutoSawSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Saber Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoSaberSwordEnabled)
		_G.AutoSaber = isAutoSaberSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Warden Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoWardenSwordEnabled)
		_G.WardenBoss = isAutoWardenSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Long Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoLongSwordEnabled)
		_G.LongsWord = isAutoLongSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Canvendish Sword",
	Description = "",
	Default = false,
	Callback = function(isAutoCanvendishSwordEnabled)
		_G.Auto_Cavender = isAutoCanvendishSwordEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Twin Hooks",
	Description = "",
	Default = false,
	Callback = function(isAutoTwinHooksEnabled)
		_G.TwinHook = isAutoTwinHooksEnabled
	end
})

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Bigmom",
		Description = "",
		Default = false,
		Callback = function(isAutoBigmomEnabled)
			_G.AutoBigmom = isAutoBigmomEnabled
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Auto Midnight Blade",
	Description = "",
	Default = false,
	Callback = function(isAutoMidnightBladeEnabled)
		_G.AutoEcBoss = isAutoMidnightBladeEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Black Spikey",
	Description = "",
	Default = false,
	Callback = function(isAutoBlackSpikeyEnabled)
		_G.BlackSpikey = isAutoBlackSpikeyEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Dragon Trident",
	Description = "",
	Default = false,
	Callback = function(isAutoDragonTridentEnabled)
		_G.AutoTridentW2 = isAutoDragonTridentEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Bisento V2",
	Description = "",
	Default = false,
	Callback = function(isAutoBisentoV2Enabled)
		_G.Greybeard = isAutoBisentoV2Enabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Dark Blade V3",
	Description = "",
	Default = false,
	Callback = function(isAutoDarkBladeV3Enabled)
		_G.DarkBladev3 = isAutoDarkBladeV3Enabled
	end
})
tabs.Quests:AddSection("Accessories")
Q = tabs.Quests:AddToggle({
	Name = "Auto Usoap's Hat",
	Description = "",
	Default = false,
	Callback = function(isAutoUsoapSHatEnabled)
		_G.AutoGetUsoap = isAutoUsoapSHatEnabled
	end
})

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Marine Coat",
		Description = "",
		Default = false,
		Callback = function(isAutoMarineCoatEnabled)
			_G.MarinesCoat = isAutoMarineCoatEnabled
		end
	})
end

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Swan Coat",
		Description = "",
		Default = false,
		Callback = function(isAutoSwanCoatEnabled)
			_G.SwanCoat = isAutoSwanCoatEnabled
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Auto Swan Glasses",
	Description = "",
	Default = false,
	Callback = function(isAutoSwanGlassesEnabled)
		_G.Auto_SwanGG = isAutoSwanGlassesEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Lei Accessory",
	Description = "",
	Default = false,
	Callback = function(isAutoLeiAccessoryEnabled)
		_G.AutoKilo = isAutoLeiAccessoryEnabled
	end
})
tabs.Quests:AddSection("Gun")
Q = tabs.Quests:AddToggle({
	Name = "Auto Serpent Bow",
	Description = "",
	Default = false,
	Callback = function(isAutoSerpentBowEnabled)
		_G.AutoSerpentBow = isAutoSerpentBowEnabled
	end
})
tabs.Quests:AddSection("Other")
Q = tabs.Quests:AddToggle({
	Name = "Auto Cybrog",
	Description = "",
	Default = false,
	Callback = function(isAutoCybrogEnabled)
		_G.AutoColShad = isAutoCybrogEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Darkbeard",
	Description = "",
	Default = false,
	Callback = function(isAutoDarkbeardEnabled)
		_G.Auto_Def_DarkCoat = isAutoDarkbeardEnabled
	end
})

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Unlocked DonSwan",
		Description = "",
		Default = false,
		Callback = function(isAutoUnlockedDonSwanEnabled)
			_G.Auto_DonAcces = isAutoUnlockedDonSwanEnabled
		end
	})
end

Bartilo = tabs.Quests:AddToggle({
	Name = "Auto Done Bartilo Quest",
	Description = "",
	Default = false,
	Callback = function(isAutoDoneBartiloQuestEnabled)
		_G.Bartilo_Quest = isAutoDoneBartiloQuestEnabled
	end
})

do
	CitizenQ = tabs.Quests:AddToggle({
		Name = "Auto Done Citizen Quest",
		Description = "",
		Default = false,
		Callback = function(isAutoDoneCitizenQuestEnabled)
			_G.CitizenQuest = isAutoDoneCitizenQuestEnabled
		end
	})
end

Q = tabs.Quests:AddToggle({
	Name = "Auto Training Dummy",
	Description = "",
	Default = false,
	Callback = function(isAutoTrainingDummyEnabled)
		_G.DummyMan = isAutoTrainingDummyEnabled
	end
})
tabs.Quests:AddSection("Haki Color")
tabs.Quests:AddButton({
	Name = "Buy Buso Colors",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("ColorsDealer", "2")
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Rainbow Haki",
	Description = "",
	Default = false,
	Callback = function(isAutoRainbowHakiEnabled)
		_G.Auto_Rainbow_Haki = isAutoRainbowHakiEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Accept Rainbow Haki Quest",
	Description = "",
	Default = false,
	Callback = function(isAcceptRainbowHakiQuestEnabled)
		_G.GetQFast = isAcceptRainbowHakiQuestEnabled
	end
})

do
	Q = tabs.Quests:AddToggle({
		Name = "Auto Teleport Barista Cousin",
		Description = "",
		Default = false,
		Callback = function(isAutoTeleportBaristaCousinEnabled)
			_G.Tp_MasterA = isAutoTeleportBaristaCousinEnabled
		end
	})
end

tabs.Quests:AddSection("Observation")
Q = tabs.Quests:AddToggle({
	Name = "Auto Farm Observation",
	Description = "",
	Default = false,
	Callback = function(isAutoFarmObservationEnabled)
		_G.obsFarm = isAutoFarmObservationEnabled
	end
})
Q = tabs.Quests:AddToggle({
	Name = "Auto Observation V2",
	Description = "",
	Default = false,
	Callback = function(isAutoObservationV2Enabled)
		_G.AutoKenVTWO = isAutoObservationV2Enabled
	end
})
tabs.Quests:AddSection("Fighting Style")
SuperHuman = tabs.Quests:AddToggle({
	Name = "Auto Superhuman",
	Description = "",
	Default = false,
	Callback = function(isAutoSuperhumanEnabled)
		_G.Auto_SuperHuman = isAutoSuperhumanEnabled
	end
})
DeathStep = tabs.Quests:AddToggle({
	Name = "Auto DeathStep",
	Description = "",
	Default = false,
	Callback = function(isAutoDeathStepEnabled)
		_G.AutoDeathStep = isAutoDeathStepEnabled
	end
})
SharkManV2 = tabs.Quests:AddToggle({
	Name = "Auto Sharkman Karate",
	Description = "",
	Default = false,
	Callback = function(isAutoSharkmanKarateEnabled)
		_G.Auto_SharkMan_Karate = isAutoSharkmanKarateEnabled
	end
})
ElectricClaw = tabs.Quests:AddToggle({
	Name = "Auto ElectricClaw",
	Description = "",
	Default = false,
	Callback = function(isAutoElectricClawEnabled)
		_G.Auto_Electric_Claw = isAutoElectricClawEnabled
	end
})
DragonTalon = tabs.Quests:AddToggle({
	Name = "Auto DragonTalon",
	Description = "",
	Default = false,
	Callback = function(isAutoDragonTalonEnabled)
		_G.AutoDragonTalon = isAutoDragonTalonEnabled
	end
})

do
	Godhuman = tabs.Quests:AddToggle({
		Name = "Auto Godhuman",
		Description = "",
		Default = false,
		Callback = function(isAutoGodhumanEnabled)
			_G.Auto_God_Human = isAutoGodhumanEnabled
		end
	})
end

SanguineArt = tabs.Quests:AddToggle({
	Name = "Auto SanguineArt",
	Description = "",
	Default = false,
	Callback = function(isAutoSanguineArtEnabled)
		_G.Snaguine = isAutoSanguineArtEnabled
	end
})
tabs.Halloween:AddSection("Halloween Event")
tabs.Halloween:AddButton({
	Name = "Copy Arvyn Hub - Halloween",
	Description = "Copy Arvyn Hub Loader",
	Callback = function()
		setclipboard("loadstring(game:HttpGet(\"https://api.luasentry.com/api/scripts/loader/e664cbd4c071c95381797367d7444a7b.lua\"))()")
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Halloween Event",
			Text = "Arvyn Hub copied successfully!",
			Duration = 5
		})
	end
})
tabs.Halloween:AddButton({
	Name = "Load Arvyn Hub - Halloween",
	Description = "If it freeze, copy and run Arvyn manually",
	Callback = function()
		loadstring(game:HttpGet("https://api.luasentry.com/api/scripts/loader/e664cbd4c071c95381797367d7444a7b.lua"))()
	end
})
tabs.SeaEvent:AddButton({
	Name = "Remove Lighting Effect",
	Callback = function()
		game:GetService("Lighting").BaseAtmosphere:Destroy()
	end
})
tabs.SeaEvent:AddToggle({
	Name = "Ship Speed Modifier",
	Default = false,
	Callback = function(isShipSpeedModifierEnabled)
		getgenv().SpeedBoat = isShipSpeedModifierEnabled
	end
})

do
	game:GetService("RunService").RenderStepped:Connect(function()
		if getgenv().SpeedBoat then
			local LocalPlayer = game:GetService("Players").LocalPlayer

			if LocalPlayer.Character then
				if LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.Sit then
					for _, child in pairs(game:GetService("Workspace").Boats:GetChildren()) do
						local VehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat")

						if VehicleSeat then
							VehicleSeat.MaxSpeed = SetSpeedBoat
						end
					end
				end
			end
		end
	end)
end

tabs.SeaEvent:AddSlider({
	Name = "Ship Speed",
	Min = 0,
	Max = 1000,
	Increment = 1,
	Default = 300,
	Callback = function(shipSpeed)
		SetSpeedBoat = shipSpeed
	end
})
tabs.SeaEvent:AddToggle({
	Name = "Auto Press W",
	Default = false,
	Callback = function(isAutoPressWEnabled)
		getgenv().AutoPressW = isAutoPressWEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "No Clip Ship",
		Default = false,
		Callback = function(isNoClipShipEnabled)
			getgenv().NoClipShip = isNoClipShipEnabled
		end
	})
end

tabs.SeaEvent:AddSection("Sea Event")
Q = tabs.SeaEvent:AddDropdown({
	Name = "Select Boats",
	Options = ListSeaBoat,
	Callback = function(selectedBoats)
		_G.SelectedBoat = selectedBoats
	end
})

do
	tabs.SeaEvent:AddButton({
		Name = "Buy Boats",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("BuyBoat", _G.SelectedBoat)
		end
	})
end

Q = tabs.SeaEvent:AddDropdown({
	Name = "Select Sea Level",
	Options = ListSeaZone,
	Callback = function(selectedSeaLevel)
		_G.DangerSc = selectedSeaLevel
	end
})
Q = tabs.SeaEvent:AddToggle({
	Name = "Auto Sail Boat",
	Description = "",
	Default = false,
	Callback = function(isAutoSailBoatEnabled)
		_G.SailBoats = isAutoSailBoatEnabled
	end
})
tabs.SeaEvent:AddSection("Sea Event Entity")
tabs.SeaEvent:AddToggle({
	Name = "Auto Shark",
	Description = "",
	Default = false,
	Callback = function(isAutoSharkEnabled)
		_G.Shark = isAutoSharkEnabled
	end
})
tabs.SeaEvent:AddToggle({
	Name = "Auto Piranha",
	Description = "",
	Default = false,
	Callback = function(isAutoPiranhaEnabled)
		_G.Piranha = isAutoPiranhaEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Terror Shark",
		Description = "",
		Default = false,
		Callback = function(isAutoTerrorSharkEnabled)
			_G.TerrorShark = isAutoTerrorSharkEnabled
		end
	})
end

tabs.SeaEvent:AddToggle({
	Name = "Auto Fish Crew Member",
	Description = "",
	Default = false,
	Callback = function(isAutoFishCrewMemberEnabled)
		_G.MobCrew = isAutoFishCrewMemberEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Haunted Crew Member",
		Description = "",
		Default = false,
		Callback = function(isAutoHauntedCrewMemberEnabled)
			_G.HCM = isAutoHauntedCrewMemberEnabled
		end
	})
end

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Attack PirateGrandBrigade",
		Description = "",
		Default = false,
		Callback = function(isAutoAttackPirateGrandBrigadeEnabled)
			_G.PGB = isAutoAttackPirateGrandBrigadeEnabled
		end
	})
end

tabs.SeaEvent:AddToggle({
	Name = "Auto Attack Fish Boat",
	Description = "",
	Default = false,
	Callback = function(isAutoAttackFishBoatEnabled)
		_G.FishBoat = isAutoAttackFishBoatEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Attack Sea Beast",
		Description = "",
		Default = false,
		Callback = function(isAutoAttackSeaBeastEnabled)
			_G.SeaBeast1 = isAutoAttackSeaBeastEnabled
		end
	})
end

tabs.SeaEvent:AddSection("Sea Event Crafting")
tabs.SeaEvent:AddButton({
	Name = "Craft SharkTooth",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"SharkTooth"
		}))
	end
})
tabs.SeaEvent:AddButton({
	Name = "Craft TerrorJaw",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"TerrorJaw"
		}))
	end
})
tabs.SeaEvent:AddButton({
	Name = "Craft SharkAnchor",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"SharkAnchor"
		}))
	end
})
tabs.SeaEvent:AddButton({
	Name = "Craft LeviathanCrown",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LeviathanCrown"
		}))
	end
})
tabs.SeaEvent:AddButton({
	Name = "Craft LeviathanShield",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LeviathanShield"
		}))
	end
})

do
	tabs.SeaEvent:AddButton({
		Name = "Craft LeviathanBoat",
		Description = "",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
				"CraftItem",
				"Craft",
				"LeviathanBoat"
			}))
		end
	})
end

tabs.SeaEvent:AddButton({
	Name = "Craft LegendaryScroll",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"LegendaryScroll"
		}))
	end
})

do
	tabs.SeaEvent:AddButton({
		Name = "Craft MythicalScroll",
		Description = "",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
				"CraftItem",
				"Craft",
				"MythicalScroll"
			}))
		end
	})
end

tabs.SeaEvent:AddSection("Kitsune Event")

local kitsuneEventParagraph = tabs.SeaEvent:AddParagraph("Kitsune Island Status", "")

spawn(function()
	if wait(0.2) then
		repeat
			if workspace.Map:FindFirstChild("KitsuneIsland") then
				kitsuneEventParagraph:SetDesc("Kitsune Island : True")
			elseif workspace._WorldOrigin.Locations:FindFirstChild("Kitsune Island") then
				kitsuneEventParagraph:SetDesc("Kitsune Island : True")

				if not wait(0.2) then
					break
				end
			else
				kitsuneEventParagraph:SetDesc("Kitsune Island : False")
			end
		until not wait(0.2)
	end
end)
tabs.SeaEvent:AddToggle({
	Name = "Auto Find Kitsune Island",
	Description = "",
	Default = false,
	Callback = function(isAutoFindKitsuneIslandEnabled)
		_G.AutofindKitIs = isAutoFindKitsuneIslandEnabled
	end
})
tabs.SeaEvent:AddToggle({
	Name = "Auto Teleport to Shrine Actived",
	Description = "",
	Default = false,
	Callback = function(isAutoTeleportToShrineActivedEnabled)
		_G.tweenShrine = isAutoTeleportToShrineActivedEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Collect Azure Ember",
		Description = "",
		Default = false,
		Callback = function(isAutoCollectAzureEmberEnabled)
			_G.Collect_Ember = isAutoCollectAzureEmberEnabled
		end
	})
end

tabs.SeaEvent:AddToggle({
	Name = "Auto Trade Azure Ember",
	Description = "",
	Default = false,
	Callback = function(isAutoTradeAzureEmberEnabled)
		_G.Trade_Ember = isAutoTradeAzureEmberEnabled
	end
})
tabs.SeaEvent:AddButton({
	Name = "Trade Azure Ember",
	Description = "",
	Callback = function()
		replicated.Modules.Net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
	end
})
tabs.SeaEvent:AddButton({
	Name = "Talk with kitsune statue",
	Description = "",
	Callback = function()
		replicated.Modules.Net:FindFirstChild("RE/TouchKitsuneStatue"):FireServer()
	end
})
tabs.SeaEvent:AddSection("Frozen Dimension")

local frozenDimensionEventParagraph = tabs.SeaEvent:AddParagraph("FrozenDimension Status", "")

spawn(function()
	pcall(function()
		while wait(0.2) do
			if workspace._WorldOrigin.Locations:FindFirstChild("Frozen Dimension") then
				frozenDimensionEventParagraph:SetDesc("Frozen Dimension : True")
			else
				frozenDimensionEventParagraph:SetDesc("Frozen Dimension : False")
			end
		end
	end)
end)

local leviathanSpyParagraph = tabs.SeaEvent:AddParagraph("Spy Status", "")

spawn(function()
	if wait(0.2) then
		repeat
			pcall(function()
				local leviathanSpyProgress = string.match(replicated.Remotes.CommF_:InvokeServer("InfoLeviathan", "1"), "%d+")

				if leviathanSpyProgress then
					leviathanSpyParagraph:SetDesc("Spy Leviathan : " .. tostring(leviathanSpyProgress))

					if tonumber(leviathanSpyProgress) == 5 then
						leviathanSpyParagraph:SetDesc("Spy Leviathan : Already Done!!")
					end
				end
			end)
		until not wait(0.2)
	end
end)

do
	tabs.SeaEvent:AddButton({
		Name = "Buy Spy",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
		end
	})
end

tabs.SeaEvent:AddToggle({
	Name = "Auto Teleport Frozen Dimension",
	Description = "",
	Default = false,
	Callback = function(isAutoTeleportFrozenDimensionEnabled)
		_G.FrozenTP = isAutoTeleportFrozenDimensionEnabled
	end
})

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Drive To Hydra Island",
		Description = "",
		Default = false,
		Callback = function(isAutoDriveToHydraIslandEnabled)
			_G.SailBoat_Hydra = isAutoDriveToHydraIslandEnabled
		end
	})
end

do
	tabs.SeaEvent:AddToggle({
		Name = "Auto Attack Leviathan",
		Description = "",
		Default = false,
		Callback = function(isAutoAttackLeviathanEnabled)
			_G.Leviathan1 = isAutoAttackLeviathanEnabled
		end
	})
end

tabs.Prehistoric:AddSection("Dojo")
tabs.Prehistoric:AddButton({
	Title = "Teleport To Dragon Dojo",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, -334.96499633789062))
		_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))
	end
})
DojoQ = tabs.Prehistoric:AddToggle({
	Name = "Auto Dojo Trainer",
	Description = "",
	Default = false,
	Callback = function(isAutoDojoTrainerEnabled)
		_G.Dojoo = isAutoDojoTrainerEnabled
	end
})
BlazeEM = tabs.Prehistoric:AddToggle({
	Name = "Auto Dragon Hunter",
	Description = "",
	Default = false,
	Callback = function(isAutoDragonHunterEnabled)
		_G.FarmBlazeEM = isAutoDragonHunterEnabled
	end
})
tabs.Prehistoric:AddSection("Droco Trial")
Toggle = tabs.Prehistoric:AddToggle({
	Name = "Tween To Upgrade Droco Trial",
	Description = "",
	Default = false,
	Callback = function(isTweenToUpgradeDrocoTrialEnabled)
		_G.UPGDrago = isTweenToUpgradeDrocoTrialEnabled
	end
})

do
	Toggle = tabs.Prehistoric:AddToggle({
		Name = "Auto Draco V1",
		Description = "",
		Default = false,
		Callback = function(isAutoDracoV1Enabled)
			_G.DragoV1 = isAutoDracoV1Enabled
		end
	})
end

fireflower = tabs.Prehistoric:AddToggle({
	Name = "Auto Draco V2",
	Description = "",
	Default = false,
	Callback = function(isAutoDracoV2Enabled)
		_G.AutoFireFlowers = isAutoDracoV2Enabled
	end
})
Toggle = tabs.Prehistoric:AddToggle({
	Name = "Auto Draco V3",
	Description = "",
	Default = false,
	Callback = function(isAutoDracoV3Enabled)
		_G.DragoV3 = isAutoDracoV3Enabled
	end
})
Toggle = tabs.Prehistoric:AddToggle({
	Name = "Auto Relic Draco Trial",
	Description = "",
	Default = false,
	Callback = function(isAutoRelicDracoTrialEnabled)
		_G.Relic123 = isAutoRelicDracoTrialEnabled
	end
})
Toggle = tabs.Prehistoric:AddToggle({
	Name = "Auto Train Droco v4",
	Description = "",
	Default = false,
	Callback = function(isAutoTrainDrocoV4Enabled)
		_G.TrainDrago = isAutoTrainDrocoV4Enabled
	end
})
dragoTpVolcano = tabs.Prehistoric:AddToggle({
	Name = "Tween to Droco Trials",
	Description = "",
	Default = false,
	Callback = function(isTweenToDrocoTrialsEnabled)
		_G.TpDrago_Prehis = isTweenToDrocoTrialsEnabled
	end
})
bdrago = tabs.Prehistoric:AddToggle({
	Name = "Swap Drago Race",
	Description = "",
	Default = false,
	Callback = function(isSwapDragoRaceEnabled)
		_G.BuyDrago = isSwapDragoRaceEnabled
	end
})

do
	UpTalon = tabs.Prehistoric:AddToggle({
		Name = "Upgrade Dragon Talon With Uzoth",
		Description = "",
		Default = false,
		Callback = function(isUpgradeDragonTalonWithUzothEnabled)
			_G.DT_Uzoth = isUpgradeDragonTalonWithUzothEnabled
		end
	})
end

tabs.Prehistoric:AddSection("Volcano Crafting")
tabs.Prehistoric:AddButton({
	Name = "Craft Dragonheart",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"Dragonheart"
		}))
	end
})
tabs.Prehistoric:AddButton({
	Name = "Craft Dragonstorm",
	Description = "",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"Dragonstorm"
		}))
	end
})
tabs.Prehistoric:AddButton({
	Name = "Craft Dino Hood",
	Callback = function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
			"CraftItem",
			"Craft",
			"DinoHood"
		}))
	end
})

do
	tabs.Prehistoric:AddButton({
		Name = "Craft T-Rex Skull",
		Callback = function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
				"CraftItem",
				"Craft",
				"TRexSkull"
			}))
		end
	})
end

tabs.Prehistoric:AddSection("Prehistoric Island")

local prehistoricIslandStatusParagraph = tabs.Prehistoric:AddParagraph("Prehistoric Island Status", "")

spawn(function()
	while wait(0.2) do
		if not workspace.Map:FindFirstChild("PrehistoricIsland") then
			if not workspace._WorldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				prehistoricIslandStatusParagraph:SetDesc("Prehistoric Island : False")

				continue
			end
		end

		prehistoricIslandStatusParagraph:SetDesc("Prehistoric Island : True")
	end
end)

do
	tabs.Prehistoric:AddButton({
		Name = "Craft Volcanic Magnet",
		Callback = function()
			game:GetService("ReplicatedStorage").Modules.Net["RF/Craft"]:InvokeServer("PossibleHardcode", "Volcanic Magnet")
		end
	})
end

do
	tabs.Prehistoric:AddToggle({
		Name = "Craft Volcanic Magnet",
		Default = false,
		Callback = function(isCraftVolcanicMagnetEnabled)
			getgenv().AutoCraftVolcanic = isCraftVolcanicMagnetEnabled
		end
	})
end

do
	tabs.Prehistoric:AddToggle({
		Name = "Auto Find Prehistoric Island",
		Description = "",
		Default = false,
		Callback = function(isAutoFindPrehistoricIslandEnabled)
			_G.Prehis_Find = isAutoFindPrehistoricIslandEnabled
			PrehisUser.Find = isAutoFindPrehistoricIslandEnabled
		end
	})
end

tabs.Prehistoric:AddToggle({
	Name = "Auto Start Volcano Event",
	Default = false,
	Callback = function(isAutoStartVolcanoEventEnabled)
		_G.AutoStartPrehistoric = isAutoStartVolcanoEventEnabled
	end
})
tabs.Prehistoric:AddToggle({
	Name = "Auto Patch Volcano Event",
	Description = "",
	Default = false,
	Callback = function(isAutoPatchVolcanoEventEnabled)
		_G.Prehis_Skills = isAutoPatchVolcanoEventEnabled
		PrehisUser.Skills = isAutoPatchVolcanoEventEnabled
	end
})
Kaura = tabs.Prehistoric:AddToggle({
	Name = "Kill Aura",
	Description = "",
	Default = false,
	Callback = function(isKillAuraEnabled)
		_G.KillAuraFull = isKillAuraEnabled
	end
})
Vocan = tabs.Prehistoric:AddToggle({
	Name = "Auto Collect Dino Bones",
	Description = "",
	Default = false,
	Callback = function(isAutoCollectDinoBonesEnabled)
		_G.Prehis_DB = isAutoCollectDinoBonesEnabled
	end
})
Vocan = tabs.Prehistoric:AddToggle({
	Name = "Auto Collect Dragon Eggs",
	Description = "",
	Default = false,
	Callback = function(isAutoCollectDragonEggsEnabled)
		_G.Prehis_DE = isAutoCollectDragonEggsEnabled
		PrehisUser.DE = isAutoCollectDragonEggsEnabled
	end
})
Toggle = tabs.Prehistoric:AddToggle({
	Name = "Auto Reset When Complete Volcano",
	Description = "",
	Default = false,
	Callback = function(isAutoResetWhenCompleteVolcanoEnabled)
		_G.ResetPH = isAutoResetWhenCompleteVolcanoEnabled
	end
})
tabs.Race:AddSection("Mirage Island")

do
	local raceFullMoonParagraph = tabs.Race:AddParagraph("FullMoon Status", "")
	local mirageIslandStatusParagraph = tabs.Race:AddParagraph("Mirage Island Status", "")

	spawn(function()
		while wait(0.2) do
			if not workspace.Map:FindFirstChild("MysticIsland") then
				if not workspace._WorldOrigin.Locations:FindFirstChild("Mirage Island") then
					mirageIslandStatusParagraph:SetDesc("Mirage Island : False")

					continue
				end
			end

			mirageIslandStatusParagraph:SetDesc("Mirage Island : True")
		end
	end)
	spawn(function()
		while wait(0.2) do
			pcall(function()
				local moonTextureId = Getmoon()

				if moonTextureId == "http://www.roblox.com/asset/?id=9709135895" then
					raceFullMoonParagraph:SetDesc("Moon : 0 / 8")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709139597" then
					raceFullMoonParagraph:SetDesc("Moon : 1 / 8")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
					raceFullMoonParagraph:SetDesc("Moon : 2 / 8")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
					raceFullMoonParagraph:SetDesc("Moon : 3 / 8 [ Next Night ]")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
					raceFullMoonParagraph:SetDesc("Moon : 4 / 8 [ Full Moon ]")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
					raceFullMoonParagraph:SetDesc("Moon : 5 / 8 [ Last Night ]")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150086" then
					raceFullMoonParagraph:SetDesc("Moon : 6 / 8")
				elseif moonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
					raceFullMoonParagraph:SetDesc("Moon : 7 / 8")
				end
			end)
		end
	end)
end

do
	tabs.Race:AddToggle({
		Name = "Auto Find Mirage Island",
		Description = "",
		Default = false,
		Callback = function(isAutoFindMirageIslandEnabled)
			_G.FindMirage = isAutoFindMirageIslandEnabled
		end
	})
end

tabs.Race:AddToggle({
	Name = "Esp Mirage Island",
	Description = "",
	Value = false,
	Callback = function(isEspMirageIslandEnabled)
		MirageIslandESP = isEspMirageIslandEnabled

		if MirageIslandESP then
			task.spawn(function()
				while MirageIslandESP do
					if UpdateIslandMirageESP then
						UpdateIslandMirageESP()
					end

					task.wait(1)
				end
			end)
		elseif UpdateIslandMirageESP then
			UpdateIslandMirageESP()
		end
	end
})
tabs.Race:AddToggle({
	Name = "Auto Tween To Mirage Island",
	Description = "",
	Default = false,
	Callback = function(isAutoTweenToMirageIslandEnabled)
		_G.AutoMysticIsland = isAutoTweenToMirageIslandEnabled
	end
})
tabs.Race:AddToggle({
	Name = "Auto Tween To Highest Point",
	Description = "",
	Default = false,
	Callback = function(isAutoTweenToHighestPointEnabled)
		_G.HighestMirage = isAutoTweenToHighestPointEnabled
	end
})
tabs.Race:AddToggle({
	Name = "Auto Collect Gear",
	Description = "",
	Default = false,
	Callback = function(isAutoCollectGearEnabled)
		_G.TPGEAR = isAutoCollectGearEnabled
	end
})
tabs.Race:AddToggle({
	Name = "Change Transparency can see",
	Description = "",
	Default = false,
	Callback = function(isChangeTransparencyCanSeeEnabled)
		_G.can = isChangeTransparencyCanSeeEnabled
	end
})
tabs.Race:AddToggle({
	Name = "Auto Tween Advanced Fruit Dealer",
	Description = "",
	Default = false,
	Callback = function(isAutoTweenAdvancedFruitDealerEnabled)
		_G.Addealer = isAutoTweenAdvancedFruitDealerEnabled
	end
})

do
	tabs.Race:AddToggle({
		Name = "Auto Collect Mirage Chest",
		Description = "",
		Default = false,
		Callback = function(isAutoCollectMirageChestEnabled)
			_G.FarmChestM = isAutoCollectMirageChestEnabled
		end
	})
end

tabs.Race:AddToggle({
	Name = "Auto Look At Moon",
	Description = "",
	Default = false,
	Callback = function(isAutoLookAtMoonEnabled)
		LookM = isAutoLookAtMoonEnabled
	end
})

do
	tabs.Race:AddToggle({
		Name = "Look Moon + Auto V3",
		Description = "",
		Default = false,
		Callback = function(isLookMoonAutoV3Enabled)
			LookMV3 = isLookMoonAutoV3Enabled
		end
	})
end

tabs.Race:AddButton({
	Name = "Talk With Stone",
	Description = "",
	Callback = function()
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Begin")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Check")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Teleport")
		replicated:WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress", "Continue")
	end
})
tabs.Race:AddSection("Races V2 And V3")
RaceMink = tabs.Race:AddToggle({
	Name = "Auto Upgrade Mink",
	Description = "",
	Default = false,
	Callback = function(isAutoUpgradeMinkEnabled)
		_G.Auto_Mink = isAutoUpgradeMinkEnabled
	end
})
RaceHuman = tabs.Race:AddToggle({
	Name = "Auto Upgrade Human",
	Description = "",
	Default = false,
	Callback = function(isAutoUpgradeHumanEnabled)
		_G.Auto_Human = isAutoUpgradeHumanEnabled
	end
})
RaceSky = tabs.Race:AddToggle({
	Name = "Auto Upgrade Angel",
	Description = "",
	Default = false,
	Callback = function(isAutoUpgradeAngelEnabled)
		_G.Auto_Skypiea = isAutoUpgradeAngelEnabled
	end
})
RaceFish = tabs.Race:AddToggle({
	Name = "Auto Upgrade FishMan",
	Description = "",
	Default = false,
	Callback = function(isAutoUpgradeFishManEnabled)
		_G.Auto_Fish = isAutoUpgradeFishManEnabled
	end
})
tabs.Race:AddSection("Trial Race V4")

local raceV4TierParagraph = tabs.Race:AddParagraph("Tiers V4 Status", "")

spawn(function()
	pcall(function()
		while wait(0.2) do
			raceV4TierParagraph:SetDesc("Tiers - V4 : " .. " " .. plr.Data.Race.C.Value)
		end
	end)
end)

do
	PullLv = tabs.Race:AddToggle({
		Name = "Auto Pull Lever",
		Description = "",
		Default = false,
		Callback = function(isAutoPullLeverEnabled)
			_G.Lver = isAutoPullLeverEnabled
		end
	})
end

Train = tabs.Race:AddToggle({
	Name = "Auto Train V4",
	Description = "",
	Default = false,
	Callback = function(isAutoTrainV4Enabled)
		_G.AcientOne = isAutoTrainV4Enabled
	end
})

do
	tabs.Race:AddButton({
		Name = "Teleport to Temple of Time",
		Description = "",
		Callback = function()
			local LocalPlayer = game:GetService("Players").LocalPlayer
			local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
			end

			if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
				local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

				if MapStash and MapStash:FindFirstChild("Temple of Time") then
					MapStash["Temple of Time"].Parent = workspace.Map
				end
			end
		end
	})
end

tabs.Race:AddButton({
	Name = "Teleport to Ancient One",
	Description = "",
	Callback = function()
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

		if HumanoidRootPart then
			HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
		end

		if not game:GetService("Workspace").Map:FindFirstChild("Temple of Time") and World3 then
			local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

			if MapStash and MapStash:FindFirstChild("Temple of Time") then
				MapStash["Temple of Time"].Parent = workspace.Map
			end
		end

		task.wait(2)
		tween(CFrame.new(28981.552734375, 14888.4267578125, -120.245849609375))
	end
})
tabs.Race:AddButton({
	Name = "Teleport to Ancient Clock",
	Description = "",
	Callback = function()
		local LocalPlayer = game:GetService("Players").LocalPlayer
		local HumanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local cFrame = CFrame.new(28286.35546875, 14895.3017578125, 102.62469482421875)
		local cFrame2 = CFrame.new(29549, 15069, -88)

		if HumanoidRootPart then
			HumanoidRootPart.CFrame = cFrame
		end

		task.delay(2, function()
			_tp(cFrame2)
		end)

		if not workspace.Map:FindFirstChild("Temple of Time") and World3 then
			local MapStash = game:GetService("ReplicatedStorage"):FindFirstChild("MapStash")

			if MapStash and MapStash:FindFirstChild("Temple of Time") then
				MapStash["Temple of Time"].Parent = workspace.Map
			end
		end
	end
})
Doors = tabs.Race:AddToggle({
	Name = "Auto Teleport to Race Doors",
	Description = "",
	Default = false,
	Callback = function(isAutoTeleportToRaceDoorsEnabled)
		_G.TPDoor = isAutoTeleportToRaceDoorsEnabled
	end
})
Trials = tabs.Race:AddToggle({
	Name = "Auto Complete Trial Race",
	Description = "",
	Default = false,
	Callback = function(isAutoCompleteTrialRaceEnabled)
		_G.Complete_Trials = isAutoCompleteTrialRaceEnabled
	end
})
AutoKill = tabs.Race:AddToggle({
	Name = "Auto Kill Player After Trial",
	Description = "",
	Default = false,
	Callback = function(isAutoKillPlayerAfterTrialEnabled)
		_G.Defeating = isAutoKillPlayerAfterTrialEnabled
	end
})
tabs.Esp:AddSection("Stats")
StatusSelect = tabs.Esp:AddSlider({
	Name = "Stats Value",
	Description = "",
	Default = 10,
	Min = 0,
	Max = 1000,
	Rounding = 1,
	Callback = function(statsValue)
		pSats = statsValue
	end
})
StatsUpg = tabs.Esp:AddToggle({
	Name = "Auto Melee",
	Description = "",
	Default = false,
	Callback = function(isAutoMeleeEnabled)
		_G.Auto_Melee = isAutoMeleeEnabled
	end
})
StatsUpg = tabs.Esp:AddToggle({
	Name = "Auto Swords",
	Description = "",
	Default = false,
	Callback = function(isAutoSwordsEnabled)
		_G.Auto_Sword = isAutoSwordsEnabled
	end
})

do
	StatsUpg = tabs.Esp:AddToggle({
		Name = "Auto Gun",
		Description = "",
		Default = false,
		Callback = function(isAutoGunEnabled)
			_G.Auto_Gun = isAutoGunEnabled
		end
	})
end

do
	StatsUpg = tabs.Esp:AddToggle({
		Name = "Auto Blox Fruit",
		Description = "",
		Default = false,
		Callback = function(isAutoBloxFruitEnabled)
			_G.Auto_DevilFruit = isAutoBloxFruitEnabled
		end
	})
end

StatsUpg = tabs.Esp:AddToggle({
	Name = "Auto Defense",
	Description = "",
	Default = false,
	Callback = function(isAutoDefenseEnabled)
		_G.Auto_Defense = isAutoDefenseEnabled
	end
})
tabs.Esp:AddSection("Esp")
tabs.Esp:AddToggle({
	Name = "Esp Berry",
	Description = "",
	Default = false,
	Callback = function(isEspBerryEnabled)
		BerryEsp = isEspBerryEnabled

		if isEspBerryEnabled then
			task.spawn(function()
				while BerryEsp do
					berriesEsp()
					task.wait()
				end
			end)
		else
			for _, child in ipairs(workspace:GetChildren()) do
				if child:IsA("Part") then
					if child.Name:match("BerryEspPart_.*") then
						child:Destroy()
					end
				end
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Player",
	Description = "",
	Default = false,
	Callback = function(isEspPlayerEnabled)
		PlayerEsp = isEspPlayerEnabled

		if isEspPlayerEnabled then
			task.spawn(function()
				if PlayerEsp then
					repeat
						EspPly()
						task.wait()
					until not PlayerEsp
				end
			end)
		else
			local next_ = next
			local children, initialPlayerChildIndex = game.Players:GetChildren()

			for _, v in next_, children, initialPlayerChildIndex do
				pcall(function()
					if not isnil(v.Character) then
						if not isnil(v.Character.Head) then
							if v.Character.Head:FindFirstChild("NameEsp" .. Number) then
								v.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
							end
						end
					end
				end)
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Chest",
	Description = "",
	Default = false,
	Callback = function(isEspChestEnabled)
		ChestESP = isEspChestEnabled

		if isEspChestEnabled then
			task.spawn(function()
				while ChestESP do
					ChestEsp()
					task.wait()
				end
			end)
		else
			for _, v in ipairs(game:GetService("CollectionService"):GetTagged("_ChestTagged")) do
				local ChestEspAttachment = v:FindFirstChild("ChestEspAttachment")

				if ChestEspAttachment then
					ChestEspAttachment:Destroy()
				end
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Fruit",
	Description = "",
	Default = false,
	Callback = function(isEspFruitEnabled)
		DevilFruitESP = isEspFruitEnabled

		if isEspFruitEnabled then
			task.spawn(function()
				while DevilFruitESP do
					DevEsp()
					task.wait()
				end
			end)
		else
			local next_ = next
			local children, initialWorkspaceChildIndex = workspace:GetChildren()

			for _, v in next_, children, initialWorkspaceChildIndex do
				pcall(function()
					if v:FindFirstChild("Handle") then
						if v.Handle:FindFirstChild("NameEsp" .. Number) then
							v.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
						end
					end
				end)
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Island",
	Description = "",
	Default = false,
	Callback = function(isEspIslandEnabled)
		IslandESP = isEspIslandEnabled

		if isEspIslandEnabled then
			task.spawn(function()
				while IslandESP do
					LocationEsp()
					task.wait()
				end
			end)
		else
			local next_ = next
			local children, initialLocationChildIndex = workspace._WorldOrigin.Locations:GetChildren()

			for _, v in next_, children, initialLocationChildIndex do
				pcall(function()
					if v:FindFirstChild("NameEsp") then
						v:FindFirstChild("NameEsp"):Destroy()
					end
				end)
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Flower",
	Description = "",
	Default = false,
	Callback = function(isEspFlowerEnabled)
		FlowerESP = isEspFlowerEnabled

		if isEspFlowerEnabled then
			local function runFlowerEsp()
				while FlowerESP do
					flowerEsp()
					task.wait()
				end
			end

			task.spawn(runFlowerEsp)
		else
			for _, child in pairs(workspace:GetChildren()) do
				pcall(function()
					if (child.Name == "Flower2" or child.Name == "Flower1") and child:FindFirstChild("NameEsp" .. Number) then
						child:FindFirstChild("NameEsp" .. Number):Destroy()
					end
				end)
			end
		end
	end
})

do
	tabs.Esp:AddToggle({
		Name = "Esp Legendary Sword",
		Description = "",
		Default = false,
		Callback = function(isEspLegendarySwordEnabled)
			LegenS = isEspLegendarySwordEnabled

			if isEspLegendarySwordEnabled then
				task.spawn(function()
					while LegenS do
						LegenSword()
						task.wait()
					end
				end)
			elseif workspace:FindFirstChild("Lgd") then
				workspace:FindFirstChild("Lgd"):Destroy()
			end
		end
	})
end

tabs.Esp:AddToggle({
	Name = "Esp Haki Color",
	Description = "",
	Default = false,
	Callback = function(isEspHakiColorEnabled)
		ColorEsp = isEspHakiColorEnabled

		if isEspHakiColorEnabled then
			task.spawn(function()
				while ColorEsp do
					HakiClorEsp()
					task.wait()
				end
			end)
		elseif workspace:FindFirstChild("Gay") then
			workspace:FindFirstChild("Gay"):Destroy()
		end
	end
})

do
	tabs.Esp:AddToggle({
		Name = "Esp Gear",
		Description = "",
		Default = false,
		Callback = function(isEspGearEnabled)
			ESPGear = isEspGearEnabled

			if isEspGearEnabled then
				task.spawn(function()
					while ESPGear do
						gearEsp()
						task.wait()
					end
				end)
			else
				local MysticIsland = workspace.Map:FindFirstChild("MysticIsland")
				local pairs_ = pairs
				local descendants = MysticIsland and MysticIsland:GetDescendants() or {}

				for _, descendant in pairs_(descendants) do
					pcall(function()
						if descendant:FindFirstChild("NameEsp") then
							descendant:FindFirstChild("NameEsp"):Destroy()
						end
					end)
				end
			end
		end
	})
end

tabs.Esp:AddToggle({
	Name = "Esp Sea Event Island",
	Description = "",
	Default = false,
	Callback = function(isEspSeaEventIslandEnabled)
		EspEventIsland = isEspSeaEventIslandEnabled

		if isEspSeaEventIslandEnabled then
			task.spawn(function()
				while EspEventIsland do
					EventIslandEsp()
					task.wait()
				end
			end)
		else
			for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
				pcall(function()
					if child:FindFirstChild("NameEsp") then
						child:FindFirstChild("NameEsp"):Destroy()
					end
				end)
			end
		end
	end
})
tabs.Esp:AddToggle({
	Name = "Esp Advanced Dealer",
	Description = "",
	Default = false,
	Callback = function(isEspAdvancedDealerEnabled)
		advanEsp = isEspAdvancedDealerEnabled

		if isEspAdvancedDealerEnabled then
			task.spawn(function()
				while advanEsp do
					AdvanFruitEsp()
					task.wait()
				end
			end)
		elseif workspace:FindFirstChild("Adv") then
			workspace:FindFirstChild("Adv"):Destroy()
		end
	end
})
tabs.Raids:AddSection("Fruit")

local fruitStockParagraph = tabs.Raids:AddParagraph("Stock Fruit", "Loading...")

task.spawn(function()
	while task.wait(60) do
		pcall(function()
			fruitStockParagraph:SetDesc(getFruitStock())
		end)
	end
end)
pcall(function()
	fruitStockParagraph:SetDesc(getFruitStock())
end)
RandomFF = tabs.Raids:AddToggle({
	Name = "Auto Random Fruit",
	Description = "",
	Default = false,
	Callback = function(isAutoRandomFruitEnabled)
		_G.Random_Auto = isAutoRandomFruitEnabled
		_G.RandomFruitCooldown = nil
	end
})

do
	DropF = tabs.Raids:AddToggle({
		Name = "Auto Drop Fruit",
		Description = "",
		Default = false,
		Callback = function(isAutoDropFruitEnabled)
			_G.DropFruit = isAutoDropFruitEnabled
		end
	})
end

StoredF = tabs.Raids:AddToggle({
	Name = "Auto Store Fruit",
	Description = "",
	Default = false,
	Callback = function(isAutoStoreFruitEnabled)
		_G.StoreF = isAutoStoreFruitEnabled
	end
})
TwF = tabs.Raids:AddToggle({
	Name = "Auto Tween to Fruit",
	Description = "",
	Default = false,
	Callback = function(isAutoTweenToFruitEnabled)
		_G.TwFruits = isAutoTweenToFruitEnabled
	end
})
BringF = tabs.Raids:AddToggle({
	Name = "Auto Collect Fruit",
	Description = "",
	Default = false,
	Callback = function(isAutoCollectFruitEnabled)
		_G.InstanceF = isAutoCollectFruitEnabled
	end
})

do
	tabs.Raids:AddDropdown({
		Name = "Select Fruit Shop",
		Options = {
			"Rocket-Rocket",
			"Spin-Spin",
			"Blade-Blade",
			"Spring-Spring",
			"Bomb-Bomb",
			"Smoke-Smoke",
			"Spike-Spike",
			"Flame-Flame",
			"Ice-Ice",
			"Sand-Sand",
			"Dark-Dark",
			"Eagle-Eagle",
			"Diamond-Diamond",
			"Light-Light",
			"Rubber-Rubber",
			"Ghost-Ghost",
			"Magma-Magma",
			"Quake-Quake",
			"Buddha-Buddha",
			"Love-Love",
			"Creation-Creation",
			"Spider-Spider",
			"Sound-Sound",
			"Phoenix-Phoenix",
			"Portal-Portal",
			"Lightning-Lightning",
			"Pain-Pain",
			"Blizzard-Blizzard",
			"Gravity-Gravity",
			"T-Rex-T-Rex",
			"Mammoth-Mammoth",
			"Dough-Dough",
			"Shadow-Shadow",
			"Venom-Venom",
			"Gas-Gas",
			"Control-Control",
			"Spirit-Spirit",
			"Leopard-Leopard",
			"Yeti-Yeti",
			"Kitsune-Kitsune",
			"Dragon-Dragon"
		},
		Callback = function(selectedFruitShop)
			getgenv().SelectFruit = selectedFruitShop
		end
	})
end

tabs.Raids:AddToggle({
	Name = "Auto Buy Fruit Shop",
	Default = false,
	Callback = function(isAutoBuyFruitShopEnabled)
		getgenv().AutoBuyFruitSniper = isAutoBuyFruitShopEnabled
	end
})
tabs.Raids:AddSection("Raid")
DungeonTables = {
	"Flame",
	"Ice",
	"Quake",
	"Light",
	"Dark",
	"String",
	"Rumble",
	"Magma",
	"Human: Buddha",
	"Sand",
	"Bird: Phoenix",
	"Dough"
}

do
	Q = tabs.Raids:AddDropdown({
		Name = "Select Chip",
		Description = "",
		Options = DungeonTables,
		Callback = function(selectedChip)
			_G.SelectChip = selectedChip
		end
	})
end

Q = tabs.Raids:AddToggle({
	Name = "Auto Select Raid Chip",
	Description = "",
	Default = false,
	Callback = function(isAutoSelectRaidChipEnabled)
		_G.AutoSelectDungeon = isAutoSelectRaidChipEnabled
	end
})
tabs.Raids:AddToggle({
	Name = "Get Fruit In Inventory Below 1M",
	Default = false,
	Callback = function(isGetFruitInInventoryBelow1MEnabled)
		getgenv().AutoGetFruit = isGetFruitInInventoryBelow1MEnabled
	end
})

do
	AutoChipBeli = tabs.Raids:AddToggle({
		Name = "Auto Buy Chip",
		Description = "",
		Default = false,
		Callback = function(isAutoBuyChipEnabled)
			_G.AutoChipBeli = isAutoBuyChipEnabled
		end
	})
end

do
	AutoChipFruit = tabs.Raids:AddToggle({
		Name = "Auto Buy Chip Fruit",
		Description = "",
		Default = false,
		Callback = function(isAutoBuyChipFruitEnabled)
			_G.AutoChipFruit = isAutoBuyChipFruitEnabled
		end
	})
end

StartR = tabs.Raids:AddToggle({
	Name = "Auto Start Raid",
	Description = "",
	Default = false,
	Callback = function(isAutoStartRaidEnabled)
		_G.Auto_StartRaid = isAutoStartRaidEnabled
	end
})
Raiding = tabs.Raids:AddToggle({
	Name = "Auto Raid + Next Island",
	Description = "",
	Default = false,
	Callback = function(isAutoRaidNextIslandEnabled)
		_G.Raiding = isAutoRaidNextIslandEnabled
	end
})
KillAuraRaid = tabs.Raids:AddToggle({
	Name = "Kill Aura (Island 4 & 5)",
	Description = "",
	Default = false,
	Callback = function(isKillAuraIsland45Enabled)
		_G.KillAuraRaid = isKillAuraIsland45Enabled
	end
})
tabs.Raids:AddToggle({
	Name = "Auto Awakening",
	Description = "",
	Default = false,
	Callback = function(isAutoAwakeningEnabled)
		_G.Auto_Awakener = isAutoAwakeningEnabled
	end
})
tabs.Raids:AddToggle({
	Name = "Teleport To Lab",
	Default = false,
	Callback = function(isTeleportToLabEnabled)
		_G.TpLab = isTeleportToLabEnabled

		while _G.TpLab do
			wait()

			if _G.TpLab then
				if World2 and _G.TpLab then
					_tp(CFrame.new(-6438.73535, 250.645355, -4501.50684))
				elseif World3 and _G.TpLab then
					_tp(CFrame.new(-5046, 314, -2960))
				end
			end
		end
	end
})
tabs.Raids:AddSection("Law")
tabs.Raids:AddButton({
	Name = "Buy Chip Law",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
	end
})
tabs.Raids:AddButton({
	Name = "Start Law",
	Description = "",
	Callback = function()
		fireclickdetector(workspace.Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
	end
})
tabs.Raids:AddToggle({
	Name = "Auto Buy Microchip Law",
	Description = "",
	Default = false,
	Callback = function(isAutoBuyMicrochipLawEnabled)
		getgenv().AutoBuyMicrochipLaw = isAutoBuyMicrochipLawEnabled
	end
})

do
	tabs.Raids:AddToggle({
		Name = "Auto Start Law",
		Description = "",
		Default = false,
		Callback = function(isAutoStartLawEnabled)
			getgenv().AutoStartLawRaids = isAutoStartLawEnabled
		end
	})
end

tabs.Raids:AddToggle({
	Name = "Auto Kill Law",
	Description = "",
	Default = false,
	Callback = function(isAutoKillLawEnabled)
		_G.AutoLawKak = isAutoKillLawEnabled
	end
})
tabs.Raids:AddSection("Dungeon")

do
	tabs.Raids:AddToggle({
		Name = "Auto Dungeon",
		Description = "",
		Default = false,
		Callback = function(isAutoDungeonEnabled)
			_G.AutoFarmDungeon = isAutoDungeonEnabled
		end
	})
end

tabs.Raids:AddToggle({
	Name = "TP Exit (1)",
	Default = false,
	Callback = function(isTPExit1Enabled)
		_G.TPFloor1 = isTPExit1Enabled
	end
})

do
	tabs.Raids:AddToggle({
		Name = "TP Exit (2)",
		Default = false,
		Callback = function(isTPExit2Enabled)
			_G.TPFloor2 = isTPExit2Enabled
		end
	})
end

tabs.Raids:AddToggle({
	Name = "TP Exit (3)",
	Default = false,
	Callback = function(isTPExit3Enabled)
		_G.TPFloor3 = isTPExit3Enabled
	end
})
tabs.Raids:AddToggle({
	Name = "TP Exit (4)",
	Default = false,
	Callback = function(isTPExit4Enabled)
		_G.TPFloor4 = isTPExit4Enabled
	end
})
tabs.Combat:AddSection("Combat")

local playerCountParagraph = tabs.Combat:AddParagraph("All Players On Server", "")

spawn(function()
	while wait(Sec) do
		pcall(function()
			local serverPlayerCount = #game:GetService("Players"):GetPlayers()

			if serverPlayerCount == 12 then
				playerCountParagraph:SetDesc("All Players : " .. serverPlayerCount .. " / 12 [Max]")
			else
				playerCountParagraph:SetDesc("All Players : " .. serverPlayerCount .. " / 12")
			end
		end)
	end
end)

local aimbotStatusParagraph = tabs.Combat:AddParagraph("Aimbot Status", "")

Checking_AimStatus = function()
	if _G.AimCam then
		return "Aimbot Camera"
	end

	if _G.AimbotGun then
		return "Aimbot Guns"
	end

	return ""
end

do
	spawn(function()
		while wait(0.2) do
			pcall(function()
				if not _G.AimMethod then
					aimbotStatusParagraph:SetDesc("Aimbot - Skills : False")
				elseif _G.AimCam or _G.AimbotGun then
					aimbotStatusParagraph:SetDesc("Aimbot - " .. Checking_AimStatus() .. " : True")
				else
					aimbotStatusParagraph:SetDesc("Aimbot - Skills : True")
				end
			end)
		end
	end)
end

tabs.Combat:AddDropdown({
	Name = "Select Players",
	Description = "",
	Options = PlrList,
	Callback = function(selectedPlayers)
		_G.PlayersList = selectedPlayers
	end
})
tabs.Combat:AddToggle({
	Name = "Teleport To Select Players",
	Description = "",
	Default = false,
	Callback = function(isTeleportToSelectPlayersEnabled)
		_G.TpPly = isTeleportToSelectPlayersEnabled
	end
})
tabs.Combat:AddToggle({
	Name = "Spectate Select Players",
	Description = "",
	Default = false,
	Callback = function(isSpectateSelectPlayersEnabled)
		SpectatePlys = isSpectateSelectPlayersEnabled
	end
})
tabs.Combat:AddDropdown({
	Name = "Select Aim Method",
	Description = "",
	Options = {
		"Aim Player",
		"Nearest Aim"
	},
	Callback = function(selectedAimMethod)
		ABmethod = selectedAimMethod
	end
})
tabs.Combat:AddToggle({
	Name = "Aimbot Method Skills",
	Description = "",
	Default = false,
	Callback = function(isAimbotMethodSkillsEnabled)
		_G.AimMethod = isAimbotMethodSkillsEnabled
	end
})
tabs.Combat:AddToggle({
	Name = "Aimbot Camera Closet Players",
	Description = "",
	Default = false,
	Callback = function(isAimbotCameraClosetPlayersEnabled)
		_G.AimCam = isAimbotCameraClosetPlayersEnabled
	end
})
tabs.Combat:AddSection("Quest Player")
tabs.Combat:AddButton({
	Name = "Get player quest",
	Description = "",
	Callback = function()
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
		end)
	end
})

do
	tabs.Combat:AddToggle({
		Name = "Auto Get Player Quest",
		Description = "",
		Default = false,
		Callback = function(isAutoGetPlayerQuestEnabled)
			_G.AutoReceivePlayerQuest = isAutoGetPlayerQuestEnabled
		end
	})
end

tabs.Combat:AddToggle({
	Name = "Auto Kill Player Quest",
	Default = false,
	Callback = function(isAutoKillPlayerQuestEnabled)
		_G.AutoPlayerHunter = isAutoKillPlayerQuestEnabled

		if not isAutoKillPlayerQuestEnabled then
			Useskill = false
		end
	end
})
tabs.Combat:AddToggle({
	Name = "Auto Enable PvP",
	Description = "",
	Default = false,
	Callback = function(isAutoEnablePvPEnabled)
		_G.AutoPvP = isAutoEnablePvPEnabled
	end
})

do
	tabs.Combat:AddToggle({
		Name = "Auto Safe Mode",
		Default = false,
		Callback = function(isAutoSafeModeEnabled)
			_G.SafeMode = isAutoSafeModeEnabled
		end
	})
end

tabs.Combat:AddSection("Local Player Setting")
tabs.Combat:AddToggle({
	Name = "Enable Fly",
	Default = false,
	Callback = function(flyEnabled)
		toggleFly(flyEnabled)
	end
})

do
	tabs.Combat:AddSlider({
		Name = "Speed Fly Mode",
		Min = 10,
		Max = 200,
		Default = 50,
		Callback = function(flySpeed)
			updateFlySpeed(flySpeed)
		end
	})
end

tabs.Combat:AddToggle({
	Name = "Dash No Cooldown",
	Default = false,
	Callback = function(isDashNoCooldownEnabled)
		getgenv().DodgeNoCD = isDashNoCooldownEnabled
	end
})
tabs.Combat:AddToggle({
	Name = "Instance Mink V3 [ INF ]",
	Description = "",
	Default = false,
	Callback = function(isInstanceMinkV3INFEnabled)
		InfAblities = isInstanceMinkV3INFEnabled
	end
})

do
	tabs.Combat:AddToggle({
		Name = "Instance Energy [ INF ]",
		Description = "",
		Default = false,
		Callback = function(isInstanceEnergyINFEnabled)
			infEnergy = isInstanceEnergyINFEnabled

			if isInstanceEnergyINFEnabled then
				getInfinity_Ability("Energy", infEnergy)
			end
		end
	})
end

tabs.Combat:AddToggle({
	Name = "Instance Soru [ INF ]",
	Description = "",
	Default = false,
	Callback = function(isInstanceSoruINFEnabled)
		_G.InfSoru = isInstanceSoruINFEnabled

		if isInstanceSoruINFEnabled then
			getInfinity_Ability("Soru", _G.InfSoru)
		end
	end
})
tabs.Combat:AddToggle({
	Name = "Instance Observation Range [ INF ]",
	Description = "",
	Default = false,
	Callback = function(isInstanceObservationRangeINFEnabled)
		_G.InfiniteObRange = isInstanceObservationRangeINFEnabled

		if isInstanceObservationRangeINFEnabled then
			getInfinity_Ability("Observation", _G.InfiniteObRange)
		end
	end
})
tabs.Combat:AddToggle({
	Name = "Ignore Same Teams",
	Description = "",
	Default = false,
	Callback = function(isIgnoreSameTeamsEnabled)
		_G.NoAimTeam = isIgnoreSameTeamsEnabled
	end
})
tabs.Combat:AddToggle({
	Name = "Accept Allies",
	Description = "",
	Default = false,
	Callback = function(isAcceptAlliesEnabled)
		_G.AcceptAlly = isAcceptAlliesEnabled
	end
})
tabs.Travel:AddSection("Sea")
tabs.Travel:AddButton({
	Name = "Travel Sea 1",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("TravelMain")
	end
})

do
	tabs.Travel:AddButton({
		Name = "Travel Sea 2",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("TravelDressrosa")
		end
	})
end

tabs.Travel:AddButton({
	Name = "Travel Sea 3",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("TravelZou")
	end
})
tabs.Travel:AddSection("Island")
Location = {}

for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
	table.insert(Location, child.Name)
end

do
	Travelllll = tabs.Travel:AddDropdown({
		Name = "Select Island",
		Description = "",
		Options = Location,
		Callback = function(selectedTravelIsland)
			_G.Island = selectedTravelIsland
		end
	})
end

GoIsland = tabs.Travel:AddToggle({
	Name = "Auto Teleport",
	Description = "",
	Default = false,
	Callback = function(isAutoTeleportEnabled)
		_G.Teleport = isAutoTeleportEnabled

		if isAutoTeleportEnabled then
			for _, child in pairs(workspace._WorldOrigin.Locations:GetChildren()) do
				if child.Name == _G.Island then
					while true do
						wait()
						_tp(child.CFrame * CFrame.new(0, 30, 0))

						if not _G.Teleport then
							break
						elseif Root.CFrame == child.CFrame then
							break
						end
					end
				end
			end
		end
	end
})
tabs.Travel:AddSection("Portal")

if World1 then
	Location_Portal = {
		"Sky",
		"UnderWater"
	}
elseif World2 then
	Location_Portal = {
		"SwanRoom",
		"Cursed Ship"
	}
elseif World3 then
	Location_Portal = {
		"Castle On The Sea",
		"Mansion Cafe",
		"Hydra Teleport",
		"Canvendish Room",
		"Temple of Time"
	}
end

PortalTP = tabs.Travel:AddDropdown({
	Name = "Select Portal",
	Options = Location_Portal,
	Callback = function(selectedPortal)
		_G.Island_PT = selectedPortal
	end
})

do
	tabs.Travel:AddButton({
		Name = "Teleport Portal",
		Description = "",
		Callback = function()
			if _G.Island_PT == "Sky" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894, 5547, -380))
			elseif _G.Island_PT == "UnderWater" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163, 11, 1819))
			elseif _G.Island_PT == "SwanRoom" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2285, 15, 905))
			elseif _G.Island_PT == "Cursed Ship" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923, 126, 32852))
			elseif _G.Island_PT == "Castle On The Sea" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-5097.93164, 316.447021, -3142.66602, -0.405007899, -4.31682743e-08, 0.914313197, -1.90943332e-08, 1, 3.8755779e-08, -0.914313197, -1.76180437e-09, -0.405007899))
			elseif _G.Island_PT == "Mansion Cafe" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-12471.169921875, 374.94024658203, -7551.677734375))
			elseif _G.Island_PT == "Hydra Teleport" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5643.45263671875, 1013.0858154296875, -340.51025390625))
			elseif _G.Island_PT == "Canvendish Room" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5314.54638671875, 22.562219619750977, -127.06755065917969))
			elseif _G.Island_PT == "Temple of Time" then
				replicated.Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28310.0234, 14895.1123, 109.456741, -0.469690144, -2.85620132e-08, -0.882831335, -3.23509219e-08, 1, -1.51411736e-08, 0.882831335, 2.14487486e-08, -0.469690144))
			end
		end
	})
end

tabs.Travel:AddSection("NPC")

for _, child in pairs(replicated.NPCs:GetChildren()) do
	table.insert(NPCList, child.Name)
end

NPCsPos = tabs.Travel:AddDropdown({
	Name = "Select NPC",
	Options = NPCList,
	Callback = function(selectedNPC)
		NPClist = selectedNPC
	end
})
GoNPCs = tabs.Travel:AddToggle({
	Name = "Tween to NPC",
	Description = "",
	Default = false,
	Callback = function(isTweenToNPCEnabled)
		_G.TPNpc = isTweenToNPCEnabled
	end
})
tabs.Shop:AddSection("Shop")
tabs.Shop:AddButton({
	Name = "Buy Buso",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Geppo",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Soru",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Ken",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("KenTalk", "Buy")
	end
})
tabs.Shop:AddSection("Fighting Style")
tabs.Shop:AddButton({
	Name = "Buy Black Leg",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyBlackLeg")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Electro",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyElectro")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Fishman Karate",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
	end
})

do
	tabs.Shop:AddButton({
		Name = "Buy DragonClaw",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
		end
	})
end

tabs.Shop:AddButton({
	Name = "Buy Superhuman",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuySuperhuman")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Death Step",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyDeathStep")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Sharkman Karate",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
	end
})
tabs.Shop:AddButton({
	Name = "Buy ElectricClaw",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyElectricClaw")
	end
})
tabs.Shop:AddButton({
	Name = "Buy DragonTalon",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyDragonTalon")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Godhuman",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyGodhuman")
	end
})
tabs.Shop:AddButton({
	Name = "Buy SanguineArt",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuySanguineArt")
	end
})
tabs.Shop:AddSection("Accessories")
tabs.Shop:AddButton({
	Name = "Buy Tomoe Ring",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Tomoe Ring")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Black Cape",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Black Cape")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Swordsman Hat",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Swordsman Hat")
	end
})

do
	tabs.Shop:AddButton({
		Name = "Buy Bizarre Rifle",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 1)
		end
	})
end

do
	tabs.Shop:AddButton({
		Name = "Buy Ghoul Mask",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 2)
		end
	})
end

tabs.Shop:AddSection("Weapon")

do
	tabs.Shop:AddButton({
		Name = "Buy Cutlass",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
		end
	})
end

tabs.Shop:AddButton({
	Name = "Buy Katana",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Katana")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Iron Mace",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Duel Katana",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Triple Katana",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Pipe",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Dual-Headed Blade",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Bisento",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Soul Cane",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Slingshot",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Slingshot")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Musket",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Musket")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Dual Flintlock",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Dual Flintlock")
	end
})

do
	tabs.Shop:AddButton({
		Name = "Buy Flintlock",
		Description = "",
		Callback = function()
			replicated.Remotes.CommF_:InvokeServer("BuyItem", "Flintlock")
		end
	})
end

tabs.Shop:AddButton({
	Name = "Buy Refined Flintlock",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Refined Flintlock")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Cannon",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BuyItem", "Cannon")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Kabucha",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Slingshot", "2")
	end
})
tabs.Shop:AddSection("Fragment")
tabs.Shop:AddButton({
	Name = "Buy Refund Stats",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Reroll Race",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Ghoul Race",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("Ectoplasm", " Change", 4)
	end
})
tabs.Shop:AddButton({
	Name = "Buy Cyborg Race (2.5k)",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("CyborgTrainer", " Buy")
	end
})
tabs.Shop:AddButton({
	Name = "Buy Draco Race",
	Callback = function()
		_tp(CFrame.new(5814.42724609375, 1208.3267822265625, 884.57855224609375))

		local vector3 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.57855224609375)
		local Character = player.Character or player.CharacterAdded:Wait()

		repeat
			wait()
		until (Character.HumanoidRootPart.Position - vector3).Magnitude < 1

		game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({ {
			NPC = "Dragon Wizard",
			Command = "DragonRace"
		} }))
	end
})
tabs.Misc:AddSection("Server")

do
	tabs.Misc:AddButton({
		Name = "Redeem All Codes",
		Description = "",
		Callback = function()
			local redeemableCodes = {
				"LIGHTNINGABUSE",
				"1LOSTADMIN",
				"ADMINFIGHT",
				"GIFTING_HOURS",
				"NOMOREHACK",
				"BANEXPLOIT",
				"WildDares",
				"BossBuild",
				"GetPranked",
				"EARN_FRUITS",
				"SUB2GAMERROBOT_RESET1",
				"KITT_RESET",
				"Bignews",
				"CHANDLER",
				"Fudd10",
				"fudd10_v2",
				"Sub2UncleKizaru",
				"FIGHT4FRUIT",
				"kittgaming",
				"TRIPLEABUSE",
				"Sub2CaptainMaui",
				"Sub2Fer999",
				"Enyu_is_Pro",
				"Magicbus",
				"JCWK",
				"Starcodeheo",
				"Bluxxy",
				"SUB2GAMERROBOT_EXP1",
				"Sub2NoobMaster123",
				"Sub2Daigrock",
				"Axiore",
				"TantaiGaming",
				"StrawHatMaine",
				"Sub2OfficialNoobie",
				"TheGreatAce",
				"JULYUPDATE_RESET",
				"ADMINHACKED",
				"SEATROLLING",
				"24NOADMIN",
				"ADMIN_TROLL",
				"NEWTROLL",
				"SECRET_ADMIN",
				"staffbattle",
				"NOEXPLOIT",
				"NOOB2ADMIN",
				"CODESLIDE",
				"fruitconcepts",
				"krazydares"
			}
			local Redeem = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("Redeem")

			if not Redeem then
				return
			end

			for _, v in ipairs(redeemableCodes) do
				task.wait(0)
				pcall(function()
					if Redeem.InvokeServer then
						Redeem:InvokeServer(v)
					else
						Redeem:FireServer(v)
					end
				end)
			end
		end
	})
end

tabs.Misc:AddButton({
	Name = "Rejoin Server",
	Description = "",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end
})
tabs.Misc:AddButton({
	Name = "Hop Server",
	Description = "",
	Callback = function()
		task.spawn(function()
			local HttpService = game:GetService("HttpService")
			local TeleportService = game:GetService("TeleportService")
			local Players = game:GetService("Players")
			local ok, result = pcall(function()
				local response = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")

				return HttpService:JSONDecode(response).data
			end)

			if ok and result then
				local id

				for _, v in pairs(result) do
					if v.playing < v.maxPlayers then
						id = v.id
					end
				end

				if id then
					pcall(function()
						TeleportService:TeleportToPlaceInstance(game.PlaceId, id, Players.LocalPlayer)
					end)
				end
			end
		end)
	end
})

do
	tabs.Misc:AddButton({
		Name = "Hop to Lowest Players",
		Description = "",
		Callback = function()
			game:GetService("HttpService")

			local TeleportService = game:GetService("TeleportService")
			local nextPageCursor
			local lowestPlayerServer

			repeat
				local serverPageResult = ListServers(nextPageCursor)

				lowestPlayerServer = serverPageResult.data[1]
				nextPageCursor = serverPageResult.nextPageCursor
			until lowestPlayerServer

			TeleportService:TeleportToPlaceInstance(game.PlaceId, lowestPlayerServer.id, plr)
		end
	})
end

tabs.Misc:AddButton({
	Name = "Hop to Lowest Pings Server",
	Description = "",
	Callback = function()
		game:GetService("HttpService")

		local TeleportService = game:GetService("TeleportService")
		local Stats = game:GetService("Stats")
		local serverPingResults = fetchServersData(game.PlaceId, 100)

		if not serverPingResults then
			return
		end

		local lowestPingServer = serverPingResults[1]

		for _, v in pairs(serverPingResults) do
			if v.ping < lowestPingServer.ping and v.playing < v.maxPlayers then
				lowestPingServer = v
			end
		end

		task.wait(0.5)

		if tonumber(Stats.Network.ServerStatsItem["Data Ping"]:GetValueString():match("(%d+)")) >= 100 then
			TeleportService:TeleportToPlaceInstance(game.PlaceId, lowestPingServer.id)
		end
	end
})
tabs.Misc:AddTextBox({
	Name = "Input Job Id",
	Placeholder = "Job ID",
	ClearOnFocus = true,
	Callback = function(jobIdText)
		getgenv().Job = jobIdText
	end
})
tabs.Misc:AddButton({
	Name = "Teleport Job ID",
	Callback = function()
		if getgenv().Job then
			if getgenv().Job ~= "" then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, getgenv().Job, game.Players.LocalPlayer)
			end
		end
	end
})
tabs.Misc:AddButton({
	Name = "Copy Job ID",
	Description = "",
	Callback = function()
		setclipboard(tostring(game.JobId))
	end
})
tabs.Misc:AddSection("GUI")
tabs.Misc:AddButton({
	Name = "Open Awakenings Expert",
	Description = "",
	Callback = function()
		plr.PlayerGui.Main.AwakeningToggler.Visible = true
	end
})
tabs.Misc:AddButton({
	Name = "Open Title Selection",
	Description = "",
	Callback = function()
		replicated.Remotes.CommF_:InvokeServer("getTitles", true)
		plr.PlayerGui.Main.Titles.Visible = true
	end
})
DisbleChat = tabs.Misc:AddToggle({
	Name = "Disable Chat GUI",
	Description = "",
	Default = false,
	Callback = function(isDisableChatGUIEnabled)
		_G.Rechat = isDisableChatGUIEnabled

		if _G.Rechat == true then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
		elseif _G.chat == false then
			game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true)
		end
	end
})

do
	DisbleLeaderB = tabs.Misc:AddToggle({
		Name = "Disable Leader Board GUI",
		Description = "",
		Default = false,
		Callback = function(isDisableLeaderBoardGUIEnabled)
			ReLeader = isDisableLeaderBoardGUIEnabled

			if ReLeader == true then
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			elseif ReLeader == false then
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
			end
		end
	})
end

tabs.Misc:AddSection("Boost FPS")
rtxM = tabs.Misc:AddToggle({
	Name = "Turn on RTX Mode",
	Description = "",
	Default = false,
	Callback = function(isTurnOnRTXModeEnabled)
		_G.RTXMode = isTurnOnRTXModeEnabled

		local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect", game.Lighting)
		local ColorCorrectionEffect2 = Instance.new("ColorCorrectionEffect", game.Lighting)

		OldAmbient = game.Lighting.Ambient
		OldBrightness = game.Lighting.Brightness
		OldColorShift_Top = game.Lighting.ColorShift_Top
		OldBrightnessc = ColorCorrectionEffect.Brightness
		OldContrastc = ColorCorrectionEffect.Contrast
		OldTintColorc = ColorCorrectionEffect.TintColor
		OldTintColore = ColorCorrectionEffect2.TintColor

		if not _G.RTXMode then
			return
		end

		while _G.RTXMode do
			wait()
			game.Lighting.Ambient = Color3.fromRGB(33, 33, 33)
			game.Lighting.Brightness = 0.3
			ColorCorrectionEffect.Brightness = 0.176
			ColorCorrectionEffect.Contrast = 0.39
			ColorCorrectionEffect.TintColor = Color3.fromRGB(217, 145, 57)
			game.Lighting.FogEnd = 999

			if not plr.Character.HumanoidRootPart:FindFirstChild("PointLight") then
				local PointLight = Instance.new("PointLight")

				PointLight.Parent = plr.Character.HumanoidRootPart
				PointLight.Range = 15
				PointLight.Color = Color3.fromRGB(217, 145, 57)
			end

			if not _G.RTXMode then
				game.Lighting.Ambient = OldAmbient
				game.Lighting.Brightness = OldBrightness
				game.Lighting.ColorShift_Top = OldColorShift_Top
				ColorCorrectionEffect.Contrast = OldContrastc
				ColorCorrectionEffect.Brightness = OldBrightnessc
				ColorCorrectionEffect.TintColor = OldTintColorc
				ColorCorrectionEffect2.TintColor = OldTintColore
				game.Lighting.FogEnd = 2500
				plr.Character.HumanoidRootPart:FindFirstChild("PointLight"):Destroy()
			end
		end
	end
})

do
	tabs.Misc:AddButton({
		Name = "Turn on Fast Mode",
		Description = "",
		Callback = function()
			local descendants, initialDescendantIndex = workspace:GetDescendants()

			for _, v in next, descendants, initialDescendantIndex do
				if table.find(Past, v.ClassName) then
					v.Material = "Plastic"
				end
			end
		end
	})
end

tabs.Misc:AddButton({
	Name = "Turn on Low CPU",
	Description = "",
	Callback = function()
		LowCpu()
	end
})
tabs.Misc:AddButton({
	Name = "Remove Sky Fog",
	Description = "",
	Callback = function()
		if Lighting:FindFirstChild("LightingLayers") then
			Lighting.LightingLayers:Destroy()
		end

		if Lighting:FindFirstChild("SeaTerrorCC") then
			Lighting.SeaTerrorCC:Destroy()
		end

		if Lighting:FindFirstChild("FantasySky") then
			Lighting.FantasySky:Destroy()
		end
	end
})
tabs.Misc:AddSection("Other")
tabs.Misc:AddButton({
	Name = "Rain Fruits (Client)",
	Description = "",
	Callback = function()
		for _, child in pairs(game:GetObjects("rbxassetid://14759368201")[1]:GetChildren()) do
			child.Parent = game.Workspace.Map
			child:MoveTo(plr.Character.PrimaryPart.Position + Vector3.new(math.random(-50, 50), 100, math.random(-50, 50)))

			if child.Fruit:FindFirstChild("AnimationController") then
				child.Fruit:FindFirstChild("AnimationController"):LoadAnimation(child.Fruit:FindFirstChild("Idle")):Play()
			end

			child.Handle.Touched:Connect(function(part)
				if part.Parent == plr.Character then
					child.Parent = plr.Backpack
					plr.Character.Humanoid:EquipTool(child)
				end
			end)
		end
	end
})

do
	briggt1 = tabs.Misc:AddToggle({
		Name = "Turn on Full Bright",
		Description = "",
		Default = false,
		Callback = function(isTurnOnFullBrightEnabled)
			bright = isTurnOnFullBrightEnabled

			if isTurnOnFullBrightEnabled == true then
				Lighting.Ambient = Color3.new(1, 1, 1)
				Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
				Lighting.ColorShift_Top = Color3.new(1, 1, 1)
			else
				Lighting.Ambient = Color3.new(0, 0, 0)
				Lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
				Lighting.ColorShift_Top = Color3.new(0, 0, 0)
			end
		end
	})
end

do
	tabs.Misc:AddButton({
		Name = "Turn on increase Boats",
		Description = "",
		Callback = function()
			for _, descendant in pairs(workspace.Boats:GetDescendants()) do
				if table.find(ListSeaBoat, descendant.Name) and tostring(descendant.Owner.Value) == tostring(plr.Name) then
					descendant.VehicleSeat.MaxSpeed = 350
					descendant.VehicleSeat.Torque = 0.2
					descendant.VehicleSeat.TurnSpeed = 5
					descendant.VehicleSeat.HeadsUpDisplay = true
				end
			end
		end
	})
end

tabs.Misc:AddButton({
	Name = "Set Pirate Team",
	Description = "",
	Callback = function()
		Pirates()
	end
})
tabs.Misc:AddButton({
	Name = "Set Marine Team",
	Description = "",
	Callback = function()
		Marines()
	end
})
UnPortal = tabs.Misc:AddToggle({
	Name = "Unlock All Portals",
	Description = "",
	Default = false,
	Callback = function(isUnlockAllPortalsEnabled)
		_G.PortalUnLock = isUnlockAllPortalsEnabled
	end
})
HakiSt = {
	"State 0",
	"State 1",
	"State 2",
	"State 3",
	"State 4",
	"State 5"
}

do
	HakiStat = tabs.Misc:AddDropdown({
		Name = "Select Haki States",
		Options = HakiSt,
		Callback = function(selectedHakiStates)
			_G.SelectStateHaki = selectedHakiStates
		end
	})
end

tabs.Misc:AddButton({
	Name = "ChangeBusoStage",
	Description = "",
	Callback = function()
		if _G.SelectStateHaki == "State 0" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 0)
		elseif _G.SelectStateHaki == "State 1" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 1)
		elseif _G.SelectStateHaki == "State 2" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 2)
		elseif _G.SelectStateHaki == "State 3" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 3)
		elseif _G.SelectStateHaki == "State 4" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 4)
		elseif _G.SelectStateHaki == "State 5" then
			replicated.Remotes.CommF_:InvokeServer("ChangeBusoStage", 5)
		end
	end
})
DayN = tabs.Misc:AddDropdown({
	Name = "Select Time",
	Description = "",
	Options = {
		"Day",
		"Night"
	},
	Default = Day,
	Callback = function(selectedTime)
		_G.SelectDN = selectedTime
	end
})
dayornight = tabs.Misc:AddToggle({
	Name = "Turn on Time",
	Description = "",
	Default = false,
	Callback = function(isTurnOnTimeEnabled)
		_G.daylightN = isTurnOnTimeEnabled
	end
})
walkWater = tabs.Misc:AddToggle({
	Name = "Turn on Walk on Water",
	Description = "",
	Default = true,
	Callback = function(isTurnOnWalkOnWaterEnabled)
		_G.WalkWater_Part = isTurnOnWalkOnWaterEnabled

		if _G.WalkWater_Part then
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
		else
			game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
		end
	end
})

do
	iceWalk = tabs.Misc:AddToggle({
		Name = "Turn on Ice Walk",
		Description = "",
		Default = false,
		Callback = function(isTurnOnIceWalkEnabled)
			_G.WalkWater = isTurnOnIceWalkEnabled
		end
	})
end

mainWindow:Notify({
	Title = "Bomb Hub",
	Content = "thank",
	Image = "rbxassetid://114714624677743",
	Duration = 5
})