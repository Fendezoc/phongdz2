-- discord.gg/syncrypt

loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptpastebin/Blox-Fruits/refs/heads/main/core.luau"))()

-- ============================================================================
-- Redz UI  ->  Banana UI  compatibility layer
-- Giữ nguyên toàn bộ lệnh gọi kiểu Redz (MakeTab / AddToggle / ...) bên dưới,
-- nhưng giao diện thật được vẽ bằng thư viện UI của Banana (CreateMain / ...).
-- ============================================================================
local RedzToBananaUI = (function()
	local BananaUI = loadstring([==[
-- Recovered Luau source by ZeroVector
local function __store_list(t, start, ...)
    for i = 1, select("#", ...) do
        t[start + i - 1] = (select(i, ...))
    end
end

if getgenv().Nousigi and game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
    for i, child in ipairs(game.CoreGui:GetChildren()) do
        if string.find(child.Name, "Nousigi Hub") then
            child:Destroy()
        end
    end
end

getgenv().Nousigi = true

local tbl = {
    ["Border Color"] = Color3.fromRGB(255, 85, 85),
    ["Click Effect Color"] = Color3.fromRGB(240, 240, 240),
    ["Setting Icon Color"] = Color3.fromRGB(255, 110, 110),
    ["Logo Image"] = "rbxassetid://100721448633555",
    ["Search Icon Color"] = Color3.fromRGB(255, 255, 255),
    ["Search Icon Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["GUI Text Color"] = Color3.fromRGB(235, 235, 235),
    ["Text Color"] = Color3.fromRGB(235, 235, 235),
    ["Placeholder Text Color"] = Color3.fromRGB(178, 178, 178),
    ["Title Text Color"] = Color3.fromRGB(255, 85, 85),
    ["Background Main Color"] = Color3.fromRGB(30, 30, 30),
    ["Background 1 Color"] = Color3.fromRGB(40, 40, 40),
    ["Background 1 Transparency"] = 1,
    ["Background 2 Color"] = Color3.fromRGB(50, 50, 50),
    ["Background 3 Color"] = Color3.fromRGB(60, 60, 60),
    ["Background Image"] = "",
    ["Page Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Text Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Underline Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Border Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Checked Color"] = Color3.fromRGB(235, 235, 235),
    ["Toggle Desc Color"] = Color3.fromRGB(185, 185, 185),
    ["Button Color"] = Color3.fromRGB(255, 85, 85),
    ["Label Color"] = Color3.fromRGB(255, 100, 100),
    ["Dropdown Icon Color"] = Color3.fromRGB(235, 235, 235),
    ["Dropdown Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(230, 100, 100),
    ["Textbox Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Box Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Slider Line Color"] = Color3.fromRGB(70, 70, 70),
    ["Slider Highlight Color"] = Color3.fromRGB(255, 64, 64),
    ["Tween Animation 1 Speed"] = 0,
    ["Tween Animation 2 Speed"] = 0,
    ["Tween Animation 3 Speed"] = 0,
    ["Text Stroke Transparency"] = 0.5,
}

local tbl2 = {
    ["Page Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Underline Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Border Color"] = Color3.fromRGB(255, 85, 85),
    ["Toggle Checked Color"] = Color3.fromRGB(235, 235, 235),
    ["Button Color"] = Color3.fromRGB(255, 85, 85),
    ["Dropdown Selected Color"] = Color3.fromRGB(255, 85, 85),
    ["Dropdown Selected Check Color"] = Color3.fromRGB(230, 100, 100),
    ["Textbox Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Box Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Slider Highlight Color"] = Color3.fromRGB(255, 64, 64),
    ["Background Main Color"] = Color3.fromRGB(18, 18, 22),
    ["Background 1 Color"] = Color3.fromRGB(28, 28, 34),
    ["Background 1 Transparency"] = 0.25,
    ["Background 2 Color"] = Color3.fromRGB(38, 38, 46),
    ["Background 3 Color"] = Color3.fromRGB(48, 48, 56),
    ["Background Image"] = "",
    ["GUI Text Color"] = Color3.fromRGB(235, 235, 230),
    ["Text Color"] = Color3.fromRGB(235, 235, 230),
    ["Title Text Color"] = Color3.fromRGB(255, 85, 85),
    ["Section Text Color"] = Color3.fromRGB(220, 220, 210),
    ["Placeholder Text Color"] = Color3.fromRGB(170, 170, 160),
    ["Toggle Desc Color"] = Color3.fromRGB(190, 190, 180),
    ["Label Color"] = Color3.fromRGB(240, 240, 230),
    ["Border Color"] = Color3.fromRGB(120, 55, 55),
    ["Text Stroke Transparency"] = 0.85,
    ["Setting Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Dropdown Icon Color"] = Color3.fromRGB(220, 220, 210),
    ["Search Icon Color"] = Color3.fromRGB(240, 240, 230),
    ["Search Icon Highlight Color"] = Color3.fromRGB(255, 85, 85),
    ["Logo Image"] = "rbxassetid://100721448633555",
    ["Click Effect Color"] = Color3.fromRGB(230, 230, 220),
    ["Slider Line Color"] = Color3.fromRGB(80, 60, 60),
    ["Tween Animation 1 Speed"] = 0,
    ["Tween Animation 2 Speed"] = 0,
    ["Tween Animation 3 Speed"] = 0,
}

local genv = getgenv()
local t1 = getgenv().T1
local v = t1 and tbl or tbl2
genv.UIColor = v
getgenv().UIToggled = false
local tbl3 = {}
local options = tbl3.Options
local options2 = options or {}
tbl3.Options = options2
local titleMap = tbl3._TitleMap
local titleMap2 = titleMap or {}
tbl3._TitleMap = titleMap2

tbl3.RegisterOption = function(arg, arg2, arg3)
    local title = arg2.Title
    if not title then
        return
    end
    local tbl4 = {title = title, callback = arg3}
    local pageName = arg2.Page_Name
    local pageName2 = pageName or ""
    tbl4.Page_Name = pageName2
    local sectionName = arg2.Section_Name
    local sectionName2 = sectionName or ""
    tbl4.Section_Name = sectionName2
    local search = arg2.Search
    local search2 = search or false
    tbl4.search = search2
    local priority = arg2.Priority
    local priority2 = priority or false
    tbl4.priority = priority2
    local selected = arg2.Selected
    local selected2 = selected or false
    tbl4.selected = selected2
    local box = arg2.Box
    local box2 = box or false
    tbl4.box = box2
    local slider = arg2.Slider
    local slider2 = slider or false
    tbl4.slider = slider2
    local button = arg2.Button
    local button2 = button or false
    tbl4.button = button2
    local textLabel = arg2.TextLabel
    local textlabel = textLabel or false
    tbl4.textlabel = textlabel
    tbl4.min = arg2.Min
    tbl4.max = arg2.Max
    tbl4.step = arg2.Step
    tbl4.list = arg2.List
    tbl4.value = arg2.Default
    tbl4.FunctionCreate = arg2.FunctionCreate

    if arg2.Box then
        tbl4.type = "box"
    elseif arg2.Button then
        tbl4.type = "button"
    elseif arg2.TextLabel then
        tbl4.type = "textlabel"
    elseif arg2.Slider and arg2.Min and arg2.Max then
        tbl4.type = "slider"
    elseif typeof(arg2.Default) == "boolean" then
        tbl4.type = "toggle"
    elseif arg2.Slider and type(arg2.List) == "table" then
        tbl4.type = "slider_dropdown"
    elseif arg2.Priority then
        tbl4.type = "priority_dropdown"
    elseif arg2.Selected then
        tbl4.type = "multi_toggle"
    else
        tbl4.type = "dropdown"
    end

    local tbl5 = {}

    for i, v2 in ipairs({
        {"title", tbl4.title},
        {"callback", tbl4.callback},
        {"Page_Name", tbl4.Page_Name},
        {"Section_Name", tbl4.Section_Name},
        {"search", tbl4.search},
        {"priority", tbl4.priority},
        {"selected", tbl4.selected},
        {"box", tbl4.box},
        {"slider", tbl4.slider},
        {"min", tbl4.min},
        {"max", tbl4.max},
        {"step", tbl4.step},
        {"list", tbl4.list},
        {"value", tbl4.value},
        {"FunctionCreate", tbl4.FunctionCreate},
        {"type", tbl4.type},
    }) do
        tbl5[v2[1]] = v2[2]
    end

    tbl3.Options[title] = tbl5
    tbl3._TitleMap[title] = arg2
    return tbl5
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local function fn(arg, arg2)
    local flag = nil
    local v2 = nil
    local position = nil
    local position2 = nil

    arg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            flag = true
            position = input.Position
            position2 = arg2.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    flag = false
                end
            end)
        end
    end)

    arg.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            v2 = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == v2 and flag then
            local n = input.Position - position

            if not djtmemay and cac then
                TweenService:Create(arg2, TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
                    Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y),
                }):Play()
            elseif not djtmemay and not cac then
                arg2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
            end
        end
    end)
end

local tbl4 = {Gui = Instance.new("ScreenGui")}
tbl4.Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.Gui.Name = "Nousigi Hub GUI"
tbl4.Gui.Enabled = false
getgenv().ReadyForGuiLoaded = false

spawn(function()
    repeat
        task.wait()
    until getgenv().ReadyForGuiLoaded

    if getgenv().UIToggled then
        tbl4.Gui.Enabled = true
    end
end)

tbl4.NotiGui = Instance.new("ScreenGui")
tbl4.NotiGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.NotiGui.Name = "Nousigi Hub Notification"
tbl4.HideGui = Instance.new("ScreenGui")
tbl4.HideGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
tbl4.HideGui.Name = "Nousigi Hub Btn"
local textButton = Instance.new("TextButton", tbl4.HideGui)
textButton.BackgroundTransparency = 1
textButton.Text = ""
textButton.AnchorPoint = Vector2.new(0, 1)
textButton.Size = UDim2.new(0, 50, 0, 50)
textButton.Position = UDim2.new(0, 15, 1, -15)
local frame = Instance.new("Frame", textButton)
frame.AnchorPoint = Vector2.new(0, 1)
frame.Size = UDim2.new(0, 50, 0, 50)
frame.Position = UDim2.new(0, 0, 1, 0)
frame.Name = "dut dit"
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
local uiToggled = getgenv().UIToggled
local backgroundTransparency = uiToggled and 0 or 0.25
frame.BackgroundTransparency = backgroundTransparency
local imageLabel = Instance.new("ImageLabel", textButton)
imageLabel.AnchorPoint = Vector2.new(0, 0)
imageLabel.Image = getgenv().UIColor["Logo Image"]
imageLabel.BackgroundTransparency = 1
local udim2 = UDim2.new
local uiToggled2 = getgenv().UIToggled
local n = uiToggled2

if uiToggled2 then
    local t12 = getgenv().T1
    n = t12 and 30 or 40
end

if not n then
    local t12 = getgenv().T1
    n = t12 and 25 or 30
end

local uiToggled3 = getgenv().UIToggled
local n2 = uiToggled3

if uiToggled3 then
    local t12 = getgenv().T1
    n2 = t12 and 30 or 40
end

if not n2 then
    local t12 = getgenv().T1
    n2 = t12 and 25 or 30
end

imageLabel.Size = udim2(0, n, 0, n2)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
local uiCorner = Instance.new("UICorner")
uiCorner.Parent = frame
uiCorner.CornerRadius = UDim.new(1, 0)

tbl3.ToggleUI = function()
    local genv2 = getgenv()
    local uiToggled4

    if getgenv().UIToggled then
        uiToggled4 = false
    else
        uiToggled4 = true
    end

    genv2.UIToggled = uiToggled4
    local uiToggled5 = getgenv().UIToggled
    local n3 = uiToggled5

    if uiToggled5 then
        local t12 = getgenv().T1
        n3 = t12 and 30 or 40
    end

    if not n3 then
        local t12 = getgenv().T1
        n3 = t12 and 25 or 30
    end

    TweenService:Create(imageLabel, TweenInfo.new(0), {Size = UDim2.new(0, n3, 0, n3)}):Play()
    local create = TweenService.Create
    local tweenInfo = TweenInfo.new(0)
    local tbl5 = {}
    local uiToggled6 = getgenv().UIToggled
    local backgroundTransparency2 = uiToggled6 and 0 or 0.25
    tbl5.BackgroundTransparency = backgroundTransparency2
    create(TweenService, frame, tweenInfo, tbl5):Play()

    if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
        for i, child in ipairs(game.CoreGui:GetChildren()) do
            if child.Name == "Nousigi Hub GUI" then
                child.Enabled = getgenv().UIToggled
            end
        end
    end
end

tbl3.DestroyUI = function()
    if game.CoreGui:FindFirstChild("Nousigi Hub GUI") then
        for i, child in ipairs(game.CoreGui:GetChildren()) do
            if string.find(child.Name, "Nousigi Hub") then
                child:Destroy()
            end
        end
    end
end

game:GetService("UserInputService")
local flag = false
local v2 = nil
local position = nil
local position2 = nil
local n3 = 0

local function fn2(arg)
    local n4 = arg.Position - position
    textButton.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n4.X, position2.Y.Scale, position2.Y.Offset + n4.Y)
end

textButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        n3 = tick()
        position = input.Position
        position2 = textButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                flag = false
                n3 = 0
            end
        end)
    end
end)

textButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        flag = false
        n3 = 0
    end
end)

textButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        v2 = input
    end
end)

RunService.RenderStepped:Connect(function()
    if n3 > 0 and tick() - n3 >= 0.1 and not flag then
        flag = true
    end

    if flag and v2 then
        fn2(v2)
    end
end)

textButton.MouseButton1Click:Connect(function()
    tbl3.ToggleUI()
end)

local frame2 = Instance.new("Frame")
local uiListLayout = Instance.new("UIListLayout")
frame2.Name = "NotiContainer"
frame2.Parent = tbl4.NotiGui
frame2.AnchorPoint = Vector2.new(1, 1)
frame2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
frame2.BackgroundTransparency = 1
frame2.Position = UDim2.new(1, -5, 1, -5)
frame2.Size = UDim2.new(0, 350, 1, -10)
uiListLayout.Name = "NotiList"
uiListLayout.Parent = frame2
uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
uiListLayout.Padding = UDim.new(0, 5)
tbl4.Gui.Parent = game:GetService("CoreGui")
tbl4.NotiGui.Parent = game:GetService("CoreGui")
tbl4.HideGui.Parent = game:GetService("CoreGui")

tbl4.Getcolor = function(arg)
    return {
        math.floor(arg.r * 255),
        math.floor(arg.g * 255),
        math.floor(arg.b * 255),
    }
end

local function fn3(arg)
    local genv2 = getgenv()
    local title = arg.Title
    local titleNameNoti = title or ""
    genv2.TitleNameNoti = titleNameNoti
    local desc = arg.Desc
    local showTime = arg.ShowTime
    local n4 = showTime or 10
    local frame3 = Instance.new("Frame")
    local frame4 = Instance.new("Frame")
    local uiCorner2 = Instance.new("UICorner")
    local frame5 = Instance.new("Frame")
    local imageLabel2 = Instance.new("ImageLabel")
    local uiCorner3 = Instance.new("UICorner")
    local textLabel = Instance.new("TextLabel")
    local frame6 = Instance.new("Frame")
    local imageLabel3 = Instance.new("ImageLabel")
    local textButton2 = Instance.new("TextButton")
    local textLabel2 = Instance.new("TextLabel")
    frame3.Name = "NotiFrame"
    frame3.Parent = frame2
    frame3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame3.BackgroundTransparency = 1
    frame3.ClipsDescendants = true
    frame3.Position = UDim2.new(0, 0, 0, 0)
    frame3.Size = UDim2.new(1, 0, 0, 0)
    frame3.AutomaticSize = Enum.AutomaticSize.Y
    frame4.Name = "Noticontainer"
    frame4.Parent = frame3
    frame4.Position = UDim2.new(1, 0, 0, 0)
    frame4.Size = UDim2.new(1, 0, 1, 6)
    frame4.AutomaticSize = Enum.AutomaticSize.Y
    frame4.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
    uiCorner2.CornerRadius = UDim.new(0, 4)
    uiCorner2.Parent = frame4
    frame5.Name = "Topnoti"
    frame5.Parent = frame4
    frame5.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame5.BackgroundTransparency = 1
    frame5.Position = UDim2.new(0, 0, 0, 5)
    frame5.Size = UDim2.new(1, 0, 0, 25)
    imageLabel2.Name = "Ruafimg"
    imageLabel2.Parent = frame5
    imageLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel2.BackgroundTransparency = 1
    local udim22 = UDim2.new
    local t12 = getgenv().T1
    local n5 = t12 and 5 or 0
    imageLabel2.Position = udim22(0, 5, 0, n5)
    local udim23 = UDim2.new
    local t13 = getgenv().T1
    local n6 = t13 and 30 or 25
    local t14 = getgenv().T1
    local n7 = t14 and 15 or 25
    imageLabel2.Size = udim23(0, n6, 0, n7)
    imageLabel2.Image = getgenv().UIColor["Logo Image"]
    uiCorner3.CornerRadius = UDim.new(1, 0)
    uiCorner3.Name = "RuafimgCorner"
    uiCorner3.Parent = imageLabel2
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">Bomb Hub</font> " .. getgenv().TitleNameNoti
    textLabel.Name = "TextLabelNoti"
    textLabel.Parent = frame5
    textLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel.BackgroundTransparency = 1
    local udim24 = UDim2.new
    local t15 = getgenv().T1
    local n8 = t15 and 40 or 35
    textLabel.Position = udim24(0, n8, 0, 0)
    local udim25 = UDim2.new
    local t16 = getgenv().T1
    local n9 = t16 and -40 or -35
    textLabel.Size = udim25(1, n9, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 14
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.RichText = true
    textLabel.TextColor3 = getgenv().UIColor["GUI Text Color"]
    frame6.Name = "CloseContainer"
    frame6.Parent = frame5
    frame6.AnchorPoint = Vector2.new(1, 0.5)
    frame6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame6.BackgroundTransparency = 1
    frame6.Position = UDim2.new(1, -4, 0.5, 0)
    frame6.Size = UDim2.new(0, 22, 0, 22)
    imageLabel3.Name = "CloseImage"
    imageLabel3.Parent = frame6
    imageLabel3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel3.BackgroundTransparency = 1
    imageLabel3.Size = UDim2.new(1, 0, 1, 0)
    imageLabel3.Image = "rbxassetid://3926305904"
    imageLabel3.ImageRectOffset = Vector2.new(284, 4)
    imageLabel3.ImageRectSize = Vector2.new(24, 24)
    imageLabel3.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    textButton2.Parent = frame6
    textButton2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textButton2.BackgroundTransparency = 1
    textButton2.Size = UDim2.new(1, 0, 1, 0)
    textButton2.Font = Enum.Font.SourceSans
    textButton2.Text = ""
    textButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
    textButton2.TextSize = 14

    if desc then
        textLabel2.Name = "TextColor"
        textLabel2.Parent = frame4
        textLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Position = UDim2.new(0, 10, 0, 35)
        textLabel2.Size = UDim2.new(1, -15, 0, 0)
        textLabel2.Font = Enum.Font.GothamBold
        textLabel2.Text = desc
        textLabel2.TextSize = 14
        textLabel2.TextXAlignment = Enum.TextXAlignment.Left
        textLabel2.RichText = true
        textLabel2.TextColor3 = getgenv().UIColor["Text Color"]
        textLabel2.AutomaticSize = Enum.AutomaticSize.Y
        textLabel2.TextWrapped = true
    end

    local function fn4()
        TweenService:Create(frame4, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(1, 0, 0, 0)}):Play()
        wait(0.25)
        frame3:Destroy()
    end

    TweenService:Create(frame4, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Position = UDim2.new(0, 0, 0, 0)}):Play()

    textButton2.MouseEnter:Connect(function()
        TweenService:Create(imageLabel3, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {
            ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"],
        }):Play()
    end)

    textButton2.MouseLeave:Connect(function()
        TweenService:Create(imageLabel3, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {ImageColor3 = getgenv().UIColor["Search Icon Color"]}):Play()
    end)

    textButton2.MouseButton1Click:Connect(function()
        wait(0.25)
        fn4()
    end)

    spawn(function()
        wait(n4)
        fn4()
    end)
end

tbl3.CreateNoti = function(arg, arg2)
    if not getgenv().Config or arg2 then
        local ok, result = pcall(function()
            fn3(arg)
        end)

        if result then
            pcall(function()
                local StarterGui = game:GetService("StarterGui")
                local setCore = StarterGui.SetCore
                local tbl5 = {Title = "Bomb Hub"}
                local desc = arg.Desc
                local text = desc or ""
                tbl5.Text = text
                tbl5.Icon = "rbxassetid://16791647668"
                local showTime = arg.ShowTime
                local duration = showTime or 10
                tbl5.Duration = duration
                setCore(StarterGui, "SendNotification", tbl5)
            end)
        end
    end
end

tbl3.CreateMain = function(arg)
    local str = tostring(arg.Title)
    local text = str or "Bomb Hub"
    local genv2 = getgenv()
    local desc = arg.Desc
    local mainDesc = desc or ""
    genv2.MainDesc = mainDesc
    cac = false
    local frame3 = Instance.new("Frame")
    local imageLabel2 = Instance.new("ImageLabel")
    local uiCorner2 = Instance.new("UICorner")
    local frame4 = Instance.new("Frame")
    local imageLabel3 = Instance.new("ImageLabel")
    local textLabel = Instance.new("TextLabel")
    local frame5 = Instance.new("Frame")
    local uiCorner3 = Instance.new("UICorner")
    local scrollingFrame = Instance.new("ScrollingFrame")
    local uiListLayout2 = Instance.new("UIListLayout")
    local textLabel2 = Instance.new("TextLabel")
    local frame6 = Instance.new("Frame")
    local uiPageLayout = Instance.new("UIPageLayout")
    local frame7 = Instance.new("Frame")
    local frame8 = Instance.new("Frame")
    frame3.Name = "Main"
    frame3.Parent = tbl4.Gui
    frame3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
    frame3.BackgroundTransparency = 1
    frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    frame3.Size = UDim2.new(0, 629, 0, 359)
    fn(frame3, frame3)
    imageLabel2.Name = "maingui"
    imageLabel2.Parent = frame3
    imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    imageLabel2.BackgroundTransparency = 1
    imageLabel2.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel2.Selectable = true
    imageLabel2.Size = UDim2.new(1, 30, 1, 30)
    imageLabel2.Image = "rbxassetid://8068653048"
    imageLabel2.ScaleType = Enum.ScaleType.Slice
    imageLabel2.SliceCenter = Rect.new(15, 15, 175, 175)
    imageLabel2.SliceScale = 1.3
    imageLabel2.ImageColor3 = getgenv().UIColor["Border Color"]
    imageLabel2.ImageTransparency = 1
    imageLabel2.ImageColor3 = getgenv().UIColor["Title Text Color"]
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">Bomb Hub</font> " .. getgenv().MainDesc
    local imageLabel4 = Instance.new("ImageLabel")
    imageLabel4.Name = "MainContainer"
    imageLabel4.Parent = frame3
    imageLabel4.BackgroundColor3 = getgenv().UIColor["Background Main Color"]
    imageLabel4.Size = UDim2.new(1, 0, 1, 0)
    getgenv().ReadyForGuiLoaded = true
    local imageLabel5 = Instance.new("ImageLabel")
    imageLabel5.Name = "Shadow"
    imageLabel5.Parent = frame3
    imageLabel5.BackgroundTransparency = 1
    imageLabel5.Image = "rbxassetid://5028857084"
    imageLabel5.ImageTransparency = 0.35
    imageLabel5.ScaleType = Enum.ScaleType.Slice
    imageLabel5.SliceCenter = Rect.new(24, 24, 276, 276)
    imageLabel5.Size = UDim2.new(1, 40, 1, 40)
    imageLabel5.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel5.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel5.ZIndex = imageLabel4.ZIndex - 1
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Parent = imageLabel4
    uiStroke.Thickness = 1
    uiStroke.Transparency = 0.35
    uiStroke.Color = getgenv().UIColor["Border Color"]
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Parent = imageLabel4
    uiGradient.Rotation = 90

    uiGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200)),
    })

    uiGradient.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.92),
        NumberSequenceKeypoint.new(1, 0.92),
    })

    uiCorner2.CornerRadius = UDim.new(0, 5)
    uiCorner2.Name = "MainCorner"
    uiCorner2.Parent = imageLabel4
    frame7.Name = "Concacontainer"
    frame7.Parent = imageLabel4
    frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame7.BackgroundTransparency = 1
    frame7.ClipsDescendants = true
    frame7.Position = UDim2.new(0, 0, 0, 30)
    frame7.Size = UDim2.new(1, 0, 1, -30)
    frame8.Name = "Concacmain"
    frame8.Parent = frame7
    frame8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame8.BackgroundTransparency = 1
    frame8.Selectable = true
    frame8.Size = UDim2.new(1, 0, 1, 0)
    frame4.Name = "TopMain"
    frame4.Parent = imageLabel4
    frame4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame4.BackgroundTransparency = 1
    frame4.Size = UDim2.new(1, 0, 0, 25)
    local frame9 = Instance.new("Frame")
    frame9.Name = "TopStroke"
    frame9.Parent = frame4
    frame9.BackgroundColor3 = getgenv().UIColor["Border Color"]
    frame9.BackgroundTransparency = 0.6
    frame9.BorderSizePixel = 0
    frame9.Position = UDim2.new(0, 0, 1, -1)
    frame9.Size = UDim2.new(1, 0, 0, 1)
    local uiStroke2 = Instance.new("UIStroke")
    uiStroke2.Parent = textLabel
    uiStroke2.Thickness = 1
    uiStroke2.Transparency = 0.85
    uiStroke2.Color = Color3.new(0, 0, 0)
    imageLabel3.Name = "Ruafimg"
    imageLabel3.Parent = frame4
    imageLabel3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageLabel3.BackgroundTransparency = 1
    local udim22 = UDim2.new
    local t12 = getgenv().T1
    local n4 = t12 and 5 or 0
    imageLabel3.Position = udim22(0, 5, 0, n4)
    local udim23 = UDim2.new
    local t13 = getgenv().T1
    local n5 = t13 and 30 or 25
    local t14 = getgenv().T1
    local n6 = t14 and 15 or 25
    imageLabel3.Size = udim23(0, n5, 0, n6)
    imageLabel3.Image = getgenv().UIColor["Logo Image"]
    textLabel.Name = "TextLabelMain"
    textLabel.Parent = frame4
    textLabel.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel.BackgroundTransparency = 1
    local udim24 = UDim2.new
    local t15 = getgenv().T1
    local n7 = t15 and 50 or 220
    textLabel.Position = udim24(0, n7, 0, 0)
    local udim25 = UDim2.new
    local t16 = getgenv().T1
    local n8 = t16 and -40 or -35
    textLabel.Size = udim25(1, n8, 1, 0)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.RichText = true
    textLabel.TextSize = 16
    textLabel.TextWrapped = true
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextColor3 = getgenv().UIColor["GUI Text Color"]
    textLabel.Text = "<font color=\"rgb(" .. (tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[1]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[2]) .. "," .. tostring(tbl4.Getcolor(getgenv().UIColor["Title Text Color"])[3])) .. ")\">Bomb Hub</font> " .. getgenv().MainDesc
    frame5.Name = "Background1"
    frame5.Parent = frame8
    frame5.Position = UDim2.new(0, 5, 0, 0)
    frame5.Size = UDim2.new(0, 180, 0, 325)
    frame5.BackgroundTransparency = 0.1
    frame5.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
    local uiStroke3 = Instance.new("UIStroke")
    uiStroke3.Parent = frame5
    uiStroke3.Thickness = 1
    uiStroke3.Transparency = 0.5
    uiStroke3.Color = getgenv().UIColor["Border Color"]
    local uiGradient2 = Instance.new("UIGradient")
    uiGradient2.Parent = frame5
    uiGradient2.Rotation = 90
    local colorSequence = ColorSequence.new
    local tbl5 = {}
    local v3 = ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 1 Color"])
    local new = ColorSequenceKeypoint.new
    local background2Color = getgenv().UIColor["Background 2 Color"]
    local background1Color = background2Color or getgenv().UIColor["Background 1 Color"]
    local v4 = table.pack(new(1, background1Color))
    tbl5[1] = v3
    __store_list(tbl5, 2, table.unpack(v4, 1, v4.n))
    uiGradient2.Color = colorSequence(tbl5)

    uiGradient2.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.06),
        NumberSequenceKeypoint.new(1, 0.12),
    })

    local uiPadding = Instance.new("UIPadding")
    uiPadding.Parent = frame5
    uiPadding.PaddingLeft = UDim.new(0, 4)
    uiPadding.PaddingRight = UDim.new(0, 4)
    uiPadding.PaddingTop = UDim.new(0, 4)
    uiPadding.PaddingBottom = UDim.new(0, 4)
    uiCorner3.CornerRadius = UDim.new(0, 4)
    uiCorner3.Parent = frame5
    scrollingFrame.Name = "ControlList"
    scrollingFrame.Parent = frame5
    scrollingFrame.Active = true
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.BorderColor3 = Color3.fromRGB(27, 42, 53)
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.Position = UDim2.new(0, 0, 0, 30)
    scrollingFrame.Size = UDim2.new(1, -5, 1, -30)
    scrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
    uiListLayout2.Parent = scrollingFrame
    uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout2.Padding = UDim.new(0, 5)
    textLabel2.Name = "GUITextColor"
    textLabel2.Parent = frame5
    textLabel2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Position = UDim2.new(0, 5, 0, 0)
    textLabel2.Size = UDim2.new(1, 0, 0, 25)
    textLabel2.Font = Enum.Font.GothamBold
    textLabel2.Text = text
    textLabel2.TextSize = 14
    textLabel2.TextXAlignment = Enum.TextXAlignment.Left
    textLabel2.TextColor3 = getgenv().UIColor["GUI Text Color"]
    frame6.Name = "MainPage"
    frame6.Parent = frame8
    frame6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    frame6.BackgroundTransparency = 1
    frame6.ClipsDescendants = true
    frame6.Position = UDim2.new(0, 190, 0, 0)
    frame6.Size = UDim2.new(0, 435, 0, 325)
    uiPageLayout.Name = "UIPage"
    uiPageLayout.Parent = frame6
    uiPageLayout.FillDirection = Enum.FillDirection.Vertical
    uiPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiPageLayout.EasingDirection = Enum.EasingDirection.InOut
    uiPageLayout.EasingStyle = Enum.EasingStyle.Quart
    uiPageLayout.Padding = UDim.new(0, 10)
    uiPageLayout.TweenTime = getgenv().UIColor["Tween Animation 1 Speed"]
    local frame10 = Instance.new("Frame")
    local uiCorner4 = Instance.new("UICorner")
    local frame11 = Instance.new("Frame")
    local imageLabel6 = Instance.new("ImageLabel")
    local textBox = Instance.new("TextBox")
    frame10.Name = "PageSearch"
    frame10.Parent = frame5
    frame10.AnchorPoint = Vector2.new(1, 0)
    frame10.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
    frame10.Position = UDim2.new(1, -5, 0, 5)
    frame10.Size = UDim2.new(0, frame5.AbsoluteSize.X - 10, 0, 25)
    frame10.ClipsDescendants = true
    uiCorner4.CornerRadius = UDim.new(0, 4)
    uiCorner4.Parent = frame10
    frame11.Name = "SearchFrame"
    frame11.Parent = frame10
    frame11.BackgroundTransparency = 1
    frame11.Size = UDim2.new(0, 25, 1, 0)
    imageLabel6.Name = "SearchIcon"
    imageLabel6.Parent = frame11
    imageLabel6.AnchorPoint = Vector2.new(0.5, 0.5)
    imageLabel6.Position = UDim2.new(0.5, 0, 0.5, 0)
    imageLabel6.Size = UDim2.new(0, 16, 0, 16)
    imageLabel6.BackgroundTransparency = 1
    imageLabel6.Image = "rbxassetid://8154282545"
    imageLabel6.ImageColor3 = getgenv().UIColor["Search Icon Color"]
    textBox.Name = "SearchBox"
    textBox.Parent = frame10
    textBox.BackgroundTransparency = 1
    textBox.Position = UDim2.new(0, 30, 0, 0)
    textBox.Size = UDim2.new(1, -30, 1, 0)
    textBox.Font = Enum.Font.GothamBold
    textBox.Text = ""
    textBox.TextSize = 14
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.PlaceholderText = "Search section or Function..."
    textBox.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
    textBox.TextColor3 = getgenv().UIColor["Text Color"]
    local v5 = nil
    local fn4

    fn4 = function(arg2)
        local tbl6 = {}
        local v6, v7, v8 = pairs(arg2:GetChildren())
        local v9 = v8
        local v10 = v6
        local v11 = v7

        while true do
            local v12, v13 = v10(v11, v9)
            if v12 == nil then
                break
            end

            if v13:IsA("TextLabel") then
                table.insert(tbl6, v13)
            end

            local v14 = fn4(v13)

            for k, v15 in pairs(v14) do
                table.insert(tbl6, v15)
            end

            v9 = v12
        end

        return tbl6
    end

    textBox:GetPropertyChangedSignal("Text"):Connect(function()
        local v6 = string.lower(textBox.Text)
        local tbl6 = {}
        local v7, v8, v9 = pairs(frame6:GetChildren())
        local v10 = v9
        local v11 = v7
        local v12 = v8

        while true do
            local v13, v14 = v11(v12, v10)
            if v13 == nil then
                break
            end
            v10 = v13

            if v14:IsA("Frame") and v14:FindFirstChild("PageList") then
                local flag2 = false
                local v15, v16, v17 = pairs(v14.PageList:GetChildren())
                local v18 = v17
                local v19 = v15
                local v20 = v16
                local v21 = v13
                local v22 = v11
                local v23 = v12

                while true do
                    local v24, v25 = v19(v20, v18)
                    if v24 == nil then
                        break
                    end
                    v18 = v24

                    if not v25:IsA("UIListLayout") then
                        local flag3 = false
                        local topsec = v25:FindFirstChild("Topsec")
                        local sectiontitle = topsec and v25.Topsec:FindFirstChild("Sectiontitle")

                        if sectiontitle and v6 ~= "" and string.find(string.lower(sectiontitle.Text), v6) then
                            flag3 = true

                            for k, child in pairs(v25:GetChildren()) do
                                if child:IsA("Frame") then
                                    child.Visible = true
                                end
                            end

                            v18 = v24
                        end

                        local v26, v27, v28 = pairs(v25:GetChildren())
                        local v29 = v28
                        local v30 = v26
                        local v31 = v27
                        local v32 = v18
                        local v33 = v19
                        local v34 = v20
                        local v35 = v21
                        local v36 = v22
                        local v37 = v23

                        while true do
                            local v38, v39 = v30(v31, v29)
                            if v38 == nil then
                                break
                            end
                            v29 = v38

                            if v39:IsA("Frame") then
                                local flag4 = false
                                local v40 = fn4(v39)

                                for k, v41 in pairs(v40) do
                                    if string.find(string.lower(v41.Text), v6) then
                                        flag4 = true
                                        break
                                    end
                                    continue
                                end

                                v29 = v38
                                local visible = v6 == "" or flag4
                                v39.Visible = visible

                                if v39.Visible then
                                    flag3 = true
                                end
                            end
                        end

                        v18 = v32
                        v19 = v33
                        v20 = v34
                        v21 = v35
                        v22 = v36
                        v23 = v37
                        local visible = v6 == "" or flag3
                        v25.Visible = visible

                        if v25.Visible then
                            flag2 = true
                        end
                    end
                end

                v10 = v21
                v11 = v22
                v12 = v23
                local visible = v6 == "" or flag2
                v14.Visible = visible

                if v14.Visible then
                    table.insert(tbl6, v14)
                end
            end
        end

        for k, child in pairs(scrollingFrame:GetChildren()) do
            if child:IsA("Frame") then
                local v13 = frame6:FindFirstChild("Page" .. child.LayoutOrder + 1)

                if v13 then
                    child.Visible = v13.Visible
                end
            end
        end

        if v6 == "" then
            if v5 then
                uiPageLayout:JumpTo(v5)
            end

            return
        end

        if #tbl6 == 1 then
            uiPageLayout:JumpTo(tbl6[1])
        end
    end)

    uiListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout2.AbsoluteContentSize.Y + 5)
    end)

    local layoutOrder = -1
    local layoutOrder2 = -1
    local n9 = 1

    return {
        CreatePage = function(arg2)
            local text2 = tostring(arg2.Page_Name)
            local text3 = tostring(arg2.Page_Title)
            layoutOrder2 = layoutOrder2 + 1
            layoutOrder = layoutOrder + 1
            local frame12 = Instance.new("Frame")
            local frame13 = Instance.new("Frame")
            local uiCorner5 = Instance.new("UICorner")
            local frame14 = Instance.new("Frame")
            local frame15 = Instance.new("Frame")
            local uiCorner6 = Instance.new("UICorner")
            local frame16 = Instance.new("Frame")
            local textLabel3 = Instance.new("TextLabel")
            local textButton2 = Instance.new("TextButton")
            frame12.Name = text2 .. "_Control"
            frame12.Parent = scrollingFrame
            frame12.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame12.BackgroundTransparency = 1
            frame12.Size = UDim2.new(1, -10, 0, 25)
            frame12.LayoutOrder = layoutOrder
            frame13.Parent = frame12
            frame13.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame13.BackgroundTransparency = 1
            frame13.Position = UDim2.new(0, 5, 0, 0)
            frame13.Size = UDim2.new(1, -5, 1, 0)
            uiCorner5.CornerRadius = UDim.new(0, 4)
            uiCorner5.Name = "TabNameCorner"
            uiCorner5.Parent = frame13
            frame14.Name = "Line"
            frame14.Parent = frame13
            frame14.AnchorPoint = Vector2.new(0, 0.5)
            frame14.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame14.BackgroundTransparency = 1
            frame14.Position = UDim2.new(0, 0, 0.5, 0)
            frame14.Size = UDim2.new(0, 14, 1, 0)
            frame15.Name = "PageInLine"
            frame15.Parent = frame14
            frame15.AnchorPoint = Vector2.new(0.5, 0.5)
            frame15.BorderSizePixel = 0
            frame15.Position = UDim2.new(0.5, 0, 0.5, 0)
            frame15.Size = UDim2.new(1, -10, 1, -10)
            frame15.BackgroundColor3 = getgenv().UIColor["Page Selected Color"]
            frame15.BackgroundTransparency = 1
            uiCorner6.Name = "LineCorner"
            uiCorner6.Parent = frame15
            frame16.Name = "TabTitleContainer"
            frame16.Parent = frame13
            frame16.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            frame16.BackgroundTransparency = 1
            frame16.Position = UDim2.new(0, 15, 0, 0)
            frame16.Size = UDim2.new(1, -15, 1, 0)
            textLabel3.Name = "GUITextColor"
            textLabel3.Parent = frame16
            textLabel3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textLabel3.BackgroundTransparency = 1
            textLabel3.Size = UDim2.new(1, 0, 1, 0)
            textLabel3.Font = Enum.Font.GothamBold
            textLabel3.Text = text2
            textLabel3.TextColor3 = Color3.fromRGB(230, 230, 230)
            textLabel3.TextSize = 14
            textLabel3.TextXAlignment = Enum.TextXAlignment.Left
            textLabel3.TextColor3 = getgenv().UIColor["GUI Text Color"]
            textButton2.Name = "PageButton"
            textButton2.Parent = frame12
            textButton2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textButton2.BackgroundTransparency = 1
            textButton2.Size = UDim2.new(1, 0, 1, 0)
            textButton2.Font = Enum.Font.SourceSans
            textButton2.Text = ""
            textButton2.TextColor3 = Color3.fromRGB(0, 0, 0)
            textButton2.TextSize = 14
            local frame17 = Instance.new("Frame")
            local uiCorner7 = Instance.new("UICorner")
            local textLabel4 = Instance.new("TextLabel")
            local scrollingFrame2 = Instance.new("ScrollingFrame")
            local uiListLayout3 = Instance.new("UIListLayout")
            local v6 = n9
            n9 = n9 + 1
            frame17.Name = "Page" .. v6
            frame17.Parent = frame6
            frame17.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
            frame17.Position = UDim2.new(0, 190, 0, 30)
            frame17.Size = UDim2.new(0, 435, 0, 325)
            frame17.LayoutOrder = layoutOrder2
            frame17.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
            local uiStroke4 = Instance.new("UIStroke")
            uiStroke4.Parent = frame17
            uiStroke4.Thickness = 1
            uiStroke4.Transparency = 0.55
            uiStroke4.Color = getgenv().UIColor["Border Color"]
            local uiGradient3 = Instance.new("UIGradient")
            uiGradient3.Parent = frame17
            uiGradient3.Rotation = 90
            local colorSequence2 = ColorSequence.new
            local tbl6 = {}
            local v7 = ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 1 Color"])
            local new2 = ColorSequenceKeypoint.new
            local background2Color2 = getgenv().UIColor["Background 2 Color"]
            local background1Color2 = background2Color2 or getgenv().UIColor["Background 1 Color"]
            local v8 = table.pack(new2(1, background1Color2))
            tbl6[1] = v7
            __store_list(tbl6, 2, table.unpack(v8, 1, v8.n))
            uiGradient3.Color = colorSequence2(tbl6)

            uiGradient3.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0.04),
                NumberSequenceKeypoint.new(1, 0.08),
            })

            local uiPadding2 = Instance.new("UIPadding")
            uiPadding2.Parent = frame17
            uiPadding2.PaddingLeft = UDim.new(0, 5)
            uiPadding2.PaddingRight = UDim.new(0, 5)
            uiPadding2.PaddingTop = UDim.new(0, 2)
            uiPadding2.PaddingBottom = UDim.new(0, 5)
            uiCorner7.CornerRadius = UDim.new(0, 4)
            uiCorner7.Parent = frame17
            textLabel4.Name = "GUITextColor"
            textLabel4.Parent = frame17
            textLabel4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            textLabel4.BackgroundTransparency = 1
            textLabel4.Position = UDim2.new(0, 5, 0, 0)
            textLabel4.Size = UDim2.new(1, 0, 0, 25)
            textLabel4.Font = Enum.Font.GothamBold
            textLabel4.Text = text3
            textLabel4.TextSize = 16
            textLabel4.TextXAlignment = Enum.TextXAlignment.Left
            textLabel4.TextColor3 = getgenv().UIColor["GUI Text Color"]
            scrollingFrame2.Name = "PageList"
            scrollingFrame2.Parent = frame17
            scrollingFrame2.Active = true
            scrollingFrame2.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            scrollingFrame2.BackgroundTransparency = 1
            scrollingFrame2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            scrollingFrame2.BorderSizePixel = 0
            scrollingFrame2.Position = UDim2.new(0, 5, 0, 25)
            scrollingFrame2.Size = UDim2.new(1, -10, 1, -25)
            scrollingFrame2.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            scrollingFrame2.ScrollBarThickness = 5
            scrollingFrame2.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
            scrollingFrame2.ScrollingEnabled = true
            scrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.Always
            uiListLayout3.Name = "Pagelistlayout"
            uiListLayout3.Parent = scrollingFrame2
            uiListLayout3.SortOrder = Enum.SortOrder.LayoutOrder
            uiListLayout3.Padding = UDim.new(0, 5)

            uiListLayout3:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                scrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, uiListLayout3.AbsoluteContentSize.Y)
            end)

            local frame18 = Instance.new("Frame")
            local uiCorner8 = Instance.new("UICorner")
            local frame19 = Instance.new("Frame")
            local imageLabel7 = Instance.new("ImageLabel")
            local textButton3 = Instance.new("TextButton")
            local textBox2 = Instance.new("TextBox")
            frame18.Name = "Page Search"
            frame18.Parent = frame17
            frame18.AnchorPoint = Vector2.new(1, 0)
            frame18.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
            frame18.Position = UDim2.new(1, -5, 0, 5)
            frame18.Size = UDim2.new(0, 20, 0, 20)
            frame18.ClipsDescendants = true
            uiCorner8.CornerRadius = UDim.new(0, 2)
            uiCorner8.Name = "PageSearchCorner"
            uiCorner8.Parent = frame18
            frame19.Name = "SearchFrame"
            frame19.Parent = frame18
            frame19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            frame19.BackgroundTransparency = 1
            frame19.Size = UDim2.new(0, 20, 0, 20)
            imageLabel7.Name = "SearchIcon"
            imageLabel7.Parent = frame19
            imageLabel7.AnchorPoint = Vector2.new(0.5, 0.5)
            imageLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            imageLabel7.BackgroundTransparency = 1
            imageLabel7.Position = UDim2.new(0.5, 0, 0.5, 0)
            imageLabel7.Size = UDim2.new(0, 16, 0, 16)
            imageLabel7.Image = "rbxassetid://8154282545"
            imageLabel7.ImageColor3 = getgenv().UIColor["Search Icon Color"]
            textButton3.Name = "Search Button"
            textButton3.Parent = frame19
            textButton3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textButton3.BackgroundTransparency = 1
            textButton3.Size = UDim2.new(1, 0, 1, 0)
            textButton3.Font = Enum.Font.SourceSans
            textButton3.Text = ""
            textButton3.TextColor3 = Color3.fromRGB(0, 0, 0)
            textButton3.TextSize = 14
            textBox2.Name = "Search Box"
            textBox2.Parent = frame18
            textBox2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textBox2.BackgroundTransparency = 1
            textBox2.Position = UDim2.new(0, 30, 0, 0)
            textBox2.Size = UDim2.new(1, -30, 1, 0)
            textBox2.Font = Enum.Font.GothamBold
            textBox2.Text = ""
            textBox2.TextSize = 14
            textBox2.TextXAlignment = Enum.TextXAlignment.Left
            textBox2.PlaceholderText = "Search Section name"
            textBox2.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
            textBox2.TextColor3 = getgenv().UIColor["Text Color"]
            local flag2 = false

            textButton3.MouseEnter:Connect(function()
                TweenService:Create(imageLabel7, TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]), {
                    ImageColor3 = getgenv().UIColor["Search Icon Highlight Color"],
                }):Play()
            end)

            textButton3.MouseLeave:Connect(function()
                TweenService:Create(imageLabel7, TweenInfo.new(getgenv().UIColor["Tween Animation 3 Speed"]), {ImageColor3 = getgenv().UIColor["Search Icon Color"]}):Play()
            end)

            textButton3.MouseButton1Click:Connect(function()
                local flag3

                if flag2 then
                    flag3 = false
                else
                    flag3 = true
                end

                flag2 = flag3
                local v9 = flag2
                local udim26 = v9 and UDim2.new(0, 175, 0, 20) or UDim2.new(0, 20, 0, 20)
                game.TweenService:Create(frame18, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = udim26}):Play()
            end)

            local function fn5()
                local v9 = next
                local children, v10 = scrollingFrame2:GetChildren()

                for k, v11 in v9, children, v10 do
                    if not v11:IsA("UIListLayout") then
                        v11.Visible = false
                    end
                end
            end

            local function fn6()
                for k, child in pairs(scrollingFrame2:GetChildren()) do
                    if not child:IsA("UIListLayout") and string.find(string.lower(child.Name), string.lower(textBox2.Text)) then
                        child.Visible = true
                    end
                end
            end

            textBox2:GetPropertyChangedSignal("Text"):Connect(function()
                fn5()
                fn6()
            end)

            for k, child in pairs(scrollingFrame:GetChildren()) do
                if not child:IsA("UIListLayout") and k == 2 then
                    child.Frame.Line.PageInLine.BackgroundTransparency = 0
                end
            end

            textButton2.MouseButton1Click:Connect(function()
                if uiPageLayout.CurrentPage ~= frame17 then
                    uiPageLayout:JumpTo(frame17)
                end

                local v9 = next
                local children, v10 = scrollingFrame:GetChildren()

                for k, v11 in v9, children, v10 do
                    if v11:FindFirstChild("Frame") and v11.Frame:FindFirstChild("Line") and v11.Frame.Line:FindFirstChild("PageInLine") then
                        local n10 = v11.Name == text2 .. "_Control" and 0 or 1
                        TweenService:Create(v11.Frame.Line.PageInLine, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = n10}):Play()
                    end
                end

                v5 = frame17
            end)

            return {
                CreateSection = function(text4, arg3, arg4, arg5)
                    local flag3 = arg3 or false
                    local frame20 = Instance.new("Frame")
                    local uiCorner9 = Instance.new("UICorner")
                    local frame21 = Instance.new("Frame")
                    local textLabel5 = Instance.new("TextLabel")
                    local frame22 = Instance.new("Frame")
                    local uiGradient4 = Instance.new("UIGradient")
                    local uiListLayout4 = Instance.new("UIListLayout")
                    frame20.Name = text4 .. "_Dot"
                    frame20.Parent = scrollingFrame2
                    frame20.Size = UDim2.new(1, -5, 0, 30)
                    frame20.BackgroundColor3 = getgenv().UIColor["Background 3 Color"]
                    frame20.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                    frame20.ClipsDescendants = true
                    uiCorner9.CornerRadius = UDim.new(0, 4)
                    uiCorner9.Parent = frame20
                    frame21.Name = "Topsec"
                    frame21.Parent = frame20
                    frame21.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    frame21.BackgroundTransparency = 1
                    frame21.Size = UDim2.new(0, 415, 0, 30)
                    textLabel5.Name = "Sectiontitle"
                    textLabel5.Parent = frame21
                    textLabel5.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                    textLabel5.BackgroundTransparency = 1
                    textLabel5.Size = UDim2.new(1, 0, 1, 0)
                    textLabel5.Font = Enum.Font.GothamBold
                    textLabel5.Text = text4
                    textLabel5.TextSize = 14
                    local sectionTextColor = arg5 and arg5 or getgenv().UIColor["Section Text Color"]
                    textLabel5.TextColor3 = sectionTextColor
                    frame22.Name = "Linesec"
                    frame22.Parent = frame21
                    frame22.AnchorPoint = Vector2.new(0.5, 1)
                    frame22.BorderSizePixel = 0
                    frame22.Position = UDim2.new(0.5, 0, 1, -2)
                    frame22.Size = UDim2.new(1, -10, 0, 2)
                    local sectionUnderlineColor = arg5 and arg5 or getgenv().UIColor["Section Underline Color"]
                    frame22.BackgroundColor3 = sectionUnderlineColor
                    local uiStroke5 = Instance.new("UIStroke")
                    uiStroke5.Parent = frame20
                    uiStroke5.Color = getgenv().UIColor["Border Color"]
                    uiStroke5.Thickness = 1
                    uiStroke5.Transparency = 0.6
                    local uiGradient5 = Instance.new("UIGradient")
                    uiGradient5.Parent = frame20
                    uiGradient5.Rotation = 90

                    uiGradient5.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, getgenv().UIColor["Background 2 Color"]),
                        ColorSequenceKeypoint.new(1, getgenv().UIColor["Background 3 Color"]),
                    })

                    uiGradient5.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.05),
                        NumberSequenceKeypoint.new(1, 0.15),
                    })

                    uiGradient4.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 120, 120)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40)),
                    })

                    uiGradient4.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.8),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(1, 0.8),
                    })

                    local imageLabel8 = Instance.new("ImageLabel")
                    imageLabel8.Name = "LineShadow"
                    imageLabel8.Parent = frame22
                    imageLabel8.BackgroundTransparency = 1
                    imageLabel8.Image = "rbxassetid://5028857084"
                    imageLabel8.ImageTransparency = 0.6
                    imageLabel8.ScaleType = Enum.ScaleType.Slice
                    imageLabel8.SliceCenter = Rect.new(24, 24, 276, 276)
                    imageLabel8.Size = UDim2.new(1, 8, 1, 8)
                    imageLabel8.Position = UDim2.new(0.5, 0, 0.5, 0)
                    imageLabel8.AnchorPoint = Vector2.new(0.5, 0.5)
                    imageLabel8.ZIndex = frame22.ZIndex - 1
                    local n10 = nil
                    local flag4 = false

                    if flag3 then
                        local frame23 = Instance.new("Frame")
                        local uiCorner10 = Instance.new("UICorner")
                        local imageButton = Instance.new("ImageButton")
                        local imageButton2 = Instance.new("ImageButton")
                        local textButton4 = Instance.new("TextButton")
                        textButton4.Name = "VisibilityButton"
                        textButton4.Parent = frame21
                        textButton4.AnchorPoint = Vector2.new(1, 0.5)
                        textButton4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        textButton4.BackgroundTransparency = 1
                        textButton4.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        textButton4.BorderSizePixel = 0
                        textButton4.Font = Enum.Font.SourceSans
                        textButton4.Text = ""
                        textButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                        textButton4.TextSize = 14
                        textButton4.ZIndex = 2
                        textButton4.Position = UDim2.new(1, -5, 0.5, 0)
                        textButton4.Size = UDim2.new(0, 20, 0, 20)
                        frame23.Name = "VisibilitySectionFrame"
                        frame23.Parent = frame21
                        frame23.AnchorPoint = Vector2.new(1, 0.5)
                        frame23.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                        frame23.BorderColor3 = Color3.fromRGB(0, 0, 0)
                        frame23.BorderSizePixel = 0
                        frame23.Position = UDim2.new(1, -12, 0.5, 0)
                        frame23.Size = UDim2.new(0, 20, 0, 20)
                        uiCorner10.CornerRadius = UDim.new(0, 4)
                        uiCorner10.Name = "VisibilitySectionFrameCorner"
                        uiCorner10.Parent = frame23
                        imageButton.Name = "visibility"
                        imageButton.Parent = frame23
                        imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
                        imageButton.BackgroundTransparency = 1
                        imageButton.LayoutOrder = 4
                        imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
                        imageButton.Size = UDim2.new(1, -4, 1, -4)
                        imageButton.ZIndex = 2
                        imageButton.Image = "rbxassetid://3926307971"
                        imageButton.ImageRectOffset = Vector2.new(84, 44)
                        imageButton.ImageRectSize = Vector2.new(36, 36)
                        imageButton.ImageTransparency = 1
                        imageButton2.Name = "visibility_off"
                        imageButton2.Parent = frame23
                        imageButton2.AnchorPoint = Vector2.new(0.5, 0.5)
                        imageButton2.BackgroundTransparency = 1
                        imageButton2.LayoutOrder = 4
                        imageButton2.Position = UDim2.new(0.5, 0, 0.5, 0)
                        imageButton2.Size = UDim2.new(1, -4, 1, -4)
                        imageButton2.ZIndex = 2
                        imageButton2.Image = "rbxassetid://3926307971"
                        imageButton2.ImageRectOffset = Vector2.new(564, 44)
                        imageButton2.ImageRectSize = Vector2.new(36, 36)
                        imageButton2.ImageTransparency = 0

                        textButton4.MouseButton1Down:Connect(function()
                            local flag5

                            if flag4 then
                                flag5 = false
                            else
                                flag5 = true
                            end

                            flag4 = flag5
                            local create = TweenService.Create
                            local tweenInfo = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"] / 2)
                            local tbl7 = {}
                            local v9 = flag4
                            local imageTransparency = v9 and 0 or 1
                            tbl7.ImageTransparency = imageTransparency
                            create(TweenService, imageButton, tweenInfo, tbl7):Play()
                            wait(getgenv().UIColor["Tween Animation 1 Speed"] / 4)
                            local create2 = TweenService.Create
                            local tweenInfo2 = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"] / 2)
                            local tbl8 = {}
                            local v10 = flag4
                            local imageTransparency2 = v10 and 1 or 0
                            tbl8.ImageTransparency = imageTransparency2
                            create2(TweenService, imageButton2, tweenInfo2, tbl8):Play()
                            local create3 = TweenService.Create
                            local tweenInfo3 = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"])
                            local tbl9 = {}
                            local udim26 = UDim2.new
                            local v11 = flag4
                            local n11 = v11 and n10 or 30
                            tbl9.Size = udim26(1, -5, 0, n11)
                            create3(TweenService, frame20, tweenInfo3, tbl9):Play()
                        end)
                    end

                    if arg4 then
                        local frame23 = Instance.new("Frame")
                        frame23.Name = "SectionGap"
                        frame23.Parent = scrollingFrame2
                        frame23.Size = UDim2.new(1, -5, 0, 30)
                        frame23.ClipsDescendants = true
                        frame23.Transparency = 1
                    end

                    uiGradient4.Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.5, 0),
                        NumberSequenceKeypoint.new(0.51, 0.02),
                        NumberSequenceKeypoint.new(1, 1),
                    })

                    uiGradient4.Parent = frame22
                    uiListLayout4.Name = "SectionList"
                    uiListLayout4.Parent = frame20
                    uiListLayout4.SortOrder = Enum.SortOrder.LayoutOrder
                    uiListLayout4.Padding = UDim.new(0, 5)

                    uiListLayout4:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                        if not flag3 then
                            frame20.Size = UDim2.new(1, -5, 0, uiListLayout4.AbsoluteContentSize.Y + 5)
                        end

                        n10 = uiListLayout4.AbsoluteContentSize.Y + 5

                        if flag4 then
                            TweenService:Create(frame20, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = UDim2.new(1, -5, 0, n10)}):Play()
                        end
                    end)

                    return {
                        CreateToggle = function(arg6, arg7)
                            local text5 = tostring(arg6.Title)
                            local desc2 = arg6.Desc
                            local default = arg6.Default

                            if default == nil then
                                default = false
                            end

                            local fn7 = arg7 or function() end
                            local frame23 = Instance.new("Frame")
                            local frame24 = Instance.new("Frame")
                            local frame25 = Instance.new("Frame")
                            local frame26 = Instance.new("Frame")
                            local frame27 = Instance.new("Frame")
                            local textLabel6 = Instance.new("TextLabel")
                            local textLabel7 = Instance.new("TextLabel")
                            local frame28 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local textButton4 = Instance.new("TextButton")
                            local uiListLayout5 = Instance.new("UIListLayout")
                            frame23.Name = "ToggleFrame"
                            frame23.Parent = frame20
                            frame23.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            frame23.BackgroundTransparency = 1
                            frame23.Position = UDim2.new(0, 0, 0.300000012, 0)
                            frame23.Size = UDim2.new(1, 0, 0, 0)
                            frame23.AutomaticSize = Enum.AutomaticSize.Y
                            frame24.Name = "TogFrame1"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            frame24.BackgroundTransparency = 1
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 0, 0)
                            frame24.AutomaticSize = Enum.AutomaticSize.Y
                            frame25.Name = "checkbox"
                            frame25.Parent = frame24
                            frame25.AnchorPoint = Vector2.new(1, 0.5)
                            frame25.BackgroundColor3 = getgenv().UIColor["Toggle Border Color"]
                            frame25.Position = UDim2.new(1, -5, 0.5, 3)
                            frame25.Size = UDim2.new(0, 22.5, 0, 22.5)
                            frame25.BorderSizePixel = 0
                            frame26.Name = "checkbox2"
                            frame26.Parent = frame25
                            frame26.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame26.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame26.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame26.Size = UDim2.new(0, 18, 0, 18)
                            frame26.BorderSizePixel = 0
                            local uiCorner11 = Instance.new("UICorner")
                            uiCorner11.CornerRadius = UDim.new(0, 4)
                            uiCorner11.Name = "checkboxCorner"
                            uiCorner11.Parent = frame25
                            frame27.Name = "check"
                            frame27.Parent = frame26
                            frame27.AnchorPoint = Vector2.new(0, 1)
                            frame27.BackgroundColor3 = getgenv().UIColor["Toggle Checked Color"]
                            frame27.Position = UDim2.new(0, 0, 1, 0)
                            local n11 = 5

                            if desc2 then
                                n11 = 0
                                textLabel6.Name = "ToggleDesc"
                                textLabel6.Parent = frame24
                                textLabel6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                textLabel6.BackgroundTransparency = 1
                                textLabel6.Position = UDim2.new(0, 15, 0, 20)
                                textLabel6.Size = UDim2.new(1, -50, 0, 0)
                                textLabel6.Font = Enum.Font.GothamBlack
                                textLabel6.Text = desc2
                                textLabel6.TextSize = 13
                                textLabel6.TextWrapped = true
                                textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                textLabel6.RichText = true
                                textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                                textLabel6.TextColor3 = getgenv().UIColor["Toggle Desc Color"]
                            else
                                textLabel6.Text = ""
                            end

                            textLabel7.Name = "TextColor"
                            textLabel7.Parent = frame24
                            textLabel7.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textLabel7.BackgroundTransparency = 1
                            textLabel7.Position = UDim2.new(0, 10, 0, n11)
                            textLabel7.Size = UDim2.new(1, -10, 0, 20)
                            textLabel7.Font = Enum.Font.GothamBlack
                            textLabel7.Text = text5
                            textLabel7.TextSize = 14
                            textLabel7.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel7.TextYAlignment = Enum.TextYAlignment.Center
                            textLabel7.RichText = true
                            textLabel7.AutomaticSize = Enum.AutomaticSize.Y
                            textLabel7.TextColor3 = getgenv().UIColor["Text Color"]
                            frame28.Name = "Background1"
                            frame28.Parent = frame24
                            frame28.Size = UDim2.new(1, 0, 1, 6)
                            frame28.ZIndex = 0
                            frame28.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame28.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner10.CornerRadius = UDim.new(0, 4)
                            uiCorner10.Name = "ToggleCorner"
                            uiCorner10.Parent = frame28
                            textButton4.Name = "ToggleButton"
                            textButton4.Parent = frame24
                            textButton4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.BackgroundTransparency = 1
                            textButton4.AnchorPoint = Vector2.new(1, 0.5)
                            textButton4.Size = UDim2.new(0, 25, 0, 25)
                            textButton4.Position = UDim2.new(1, -5, 0.5, 3)
                            textButton4.Font = Enum.Font.SourceSans
                            textButton4.Text = ""
                            textButton4.TextColor3 = Color3.fromRGB(0, 0, 0)
                            textButton4.TextSize = 14
                            uiListLayout5.Name = "ToggleList"
                            uiListLayout5.Parent = frame23
                            uiListLayout5.HorizontalAlignment = Enum.HorizontalAlignment.Center
                            uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                            uiListLayout5.VerticalAlignment = Enum.VerticalAlignment.Center
                            uiListLayout5.Padding = UDim.new(0, 5)

                            local function fn8(arg8)
                                local udim26 = arg8 and UDim2.new(0.8, 0, 0.8, 0) or UDim2.new(0, 0, 0, 0)
                                local udim27 = UDim2.new(0.5, 0, 0.5, 0)
                                local vector2 = Vector2.new(0.5, 0.5)
                                game.TweenService:Create(frame27, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {Size = udim26, Position = udim27, AnchorPoint = vector2}):Play()
                                fn7(arg8)
                            end

                            if fn7 then
                                fn8(default)
                            end

                            local function fn9()
                                local flag5

                                if default then
                                    flag5 = false
                                else
                                    flag5 = true
                                end

                                default = flag5
                                fn8(default)
                            end

                            textButton4.MouseButton1Down:Connect(function()
                                fn9()
                            end)

                            local functionCreate = {
                                SetStage = function(arg8)
                                    if arg8 ~= default then
                                        fn9()
                                    end
                                end,
                                GetText = function()
                                    return textLabel7
                                end,
                            }

                            arg6.FunctionCreate = functionCreate
                            arg6.Page_Name = text2
                            arg6.Section_Name = text4
                            tbl3:RegisterOption(arg6, callback)
                            return functionCreate
                        end,
                        CreateButton = function(arg6, arg7)
                            local title = arg6.Title
                            local icon = arg6.Icon
                            local fn7 = arg7 or function() end
                            local v9 = fn7
                            arg6.Page_Name = text2
                            arg6.Section_Name = text4
                            arg6.Button = true
                            local TweenService2 = game:GetService("TweenService")
                            local frame23 = Instance.new("Frame")
                            local frame24 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local frame25 = Instance.new("Frame")
                            local uiCorner11 = Instance.new("UICorner")
                            local textLabel6 = Instance.new("TextLabel")
                            local frame26 = Instance.new("Frame")
                            local uiCorner12 = Instance.new("UICorner")
                            local uiScale = Instance.new("UIScale")
                            local uiGradient6 = Instance.new("UIGradient")
                            local frame27 = Instance.new("Frame")
                            local uiCorner13 = Instance.new("UICorner")
                            local imageLabel9 = Instance.new("ImageLabel")
                            local textButton4 = Instance.new("TextButton")
                            local str2 = title or "Button"
                            frame23.Name = str2 .. "_Row"
                            frame23.Parent = frame20
                            frame23.BackgroundTransparency = 1
                            frame23.Size = UDim2.new(1, 0, 0, 40)
                            frame24.Name = "RowBG"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 1, 0)
                            local uiColor = getgenv().UIColor
                            local background2Color3 = uiColor and getgenv().UIColor["Background 2 Color"] or Color3.fromRGB(36, 36, 48)
                            frame24.BackgroundColor3 = background2Color3
                            local uiColor2 = getgenv().UIColor
                            local background1Transparency = uiColor2 and getgenv().UIColor["Background 1 Transparency"] or 0.2
                            frame24.BackgroundTransparency = background1Transparency
                            uiCorner10.CornerRadius = UDim.new(0, 10)
                            uiCorner10.Parent = frame24
                            frame25.Name = "RowHover"
                            frame25.Parent = frame24
                            local uiColor3 = getgenv().UIColor
                            local background3Color = uiColor3 and getgenv().UIColor["Background 3 Color"] or Color3.fromRGB(255, 255, 255)
                            frame25.BackgroundColor3 = background3Color
                            frame25.BackgroundTransparency = 1
                            frame25.Size = UDim2.new(1, 0, 1, 0)
                            frame25.ZIndex = frame24.ZIndex + 1
                            uiCorner11.CornerRadius = UDim.new(0, 10)
                            uiCorner11.Parent = frame25
                            textLabel6.Name = "TextColor"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 12, 0, 0)
                            textLabel6.Size = UDim2.new(1, -110, 1, 0)
                            textLabel6.Font = Enum.Font.GothamBold
                            local text5 = title or "Button"
                            textLabel6.Text = text5
                            textLabel6.TextSize = 14
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            local uiColor4 = getgenv().UIColor
                            local guiTextColor = uiColor4 and getgenv().UIColor["GUI Text Color"] or Color3.fromRGB(225, 228, 233)
                            textLabel6.TextColor3 = guiTextColor

                            if getgenv().UIColor and getgenv().UIColor["Text Stroke Transparency"] then
                                textLabel6.TextStrokeTransparency = getgenv().UIColor["Text Stroke Transparency"]
                            end

                            frame26.Name = "ClickArea"
                            frame26.Parent = frame24
                            frame26.AnchorPoint = Vector2.new(1, 0.5)
                            frame26.Position = UDim2.new(1, -8, 0.5, 0)
                            frame26.Size = UDim2.new(0, 94, 0, 30)
                            frame26.BackgroundTransparency = 0
                            uiCorner12.CornerRadius = UDim.new(0, 12)
                            uiCorner12.Parent = frame26
                            uiGradient6.Parent = frame26
                            uiGradient6.Rotation = 90

                            uiGradient6.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 205, 205)),
                                ColorSequenceKeypoint.new(0.65, Color3.fromRGB(255, 120, 120)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 70, 70)),
                            })

                            imageLabel9.Parent = frame26
                            imageLabel9.BackgroundTransparency = 1
                            imageLabel9.Image = "rbxassetid://5028857084"
                            imageLabel9.ImageTransparency = 0.55
                            imageLabel9.ScaleType = Enum.ScaleType.Slice
                            imageLabel9.SliceCenter = Rect.new(24, 24, 276, 276)
                            imageLabel9.Size = UDim2.new(1, 14, 1, 14)
                            imageLabel9.Position = UDim2.new(0.5, 0, 0.5, 0)
                            imageLabel9.AnchorPoint = Vector2.new(0.5, 0.5)
                            imageLabel9.ZIndex = frame26.ZIndex - 1
                            frame27.Parent = frame26
                            frame27.BackgroundTransparency = 0.85
                            frame27.Size = UDim2.new(1, -6, 0, 10)
                            frame27.Position = UDim2.new(0.5, 0, 0, 2)
                            frame27.AnchorPoint = Vector2.new(0.5, 0)
                            frame27.ZIndex = frame26.ZIndex + 1
                            frame27.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            uiCorner13.CornerRadius = UDim.new(0, 10)
                            uiCorner13.Parent = frame27
                            uiScale.Parent = frame26
                            uiScale.Scale = 1
                            textButton4.Name = "Button"
                            textButton4.Parent = frame26
                            textButton4.BackgroundTransparency = 1
                            textButton4.Size = UDim2.new(1, 0, 1, 0)
                            textButton4.AutoButtonColor = false
                            textButton4.Font = Enum.Font.GothamBold
                            local text6 = icon and (typeof(icon) == "string" and string.find(icon, "rbxassetid://") == 1) and "" or "Click"
                            textButton4.Text = text6
                            textButton4.TextSize = 13
                            textButton4.TextColor3 = Color3.fromRGB(25, 28, 36)
                            textButton4.TextXAlignment = Enum.TextXAlignment.Center

                            if icon then
                                if typeof(icon) == "string" and string.find(icon, "rbxassetid://") == 1 then
                                    local imageLabel10 = Instance.new("ImageLabel")
                                    imageLabel10.Parent = frame26
                                    imageLabel10.BackgroundTransparency = 1
                                    imageLabel10.Size = UDim2.new(0, 18, 0, 18)
                                    imageLabel10.Position = UDim2.new(0, 10, 0.5, -9)
                                    imageLabel10.Image = icon
                                    imageLabel10.ImageTransparency = 0
                                    imageLabel10.ScaleType = Enum.ScaleType.Fit
                                    textButton4.Text = "Click"
                                    textButton4.TextXAlignment = Enum.TextXAlignment.Left
                                    textButton4.Position = UDim2.new(0, 34, 0, 0)
                                    textButton4.Size = UDim2.new(1, -36, 1, 0)
                                else
                                    local textLabel7 = Instance.new("TextLabel")
                                    textLabel7.Parent = frame26
                                    textLabel7.BackgroundTransparency = 1
                                    textLabel7.Size = UDim2.new(0, 18, 1, 0)
                                    textLabel7.Position = UDim2.new(0, 10, 0, 0)
                                    textLabel7.Font = Enum.Font.GothamBold
                                    textLabel7.Text = tostring(icon)
                                    textLabel7.TextSize = 14
                                    textLabel7.TextColor3 = Color3.fromRGB(25, 28, 36)
                                    textButton4.Text = "Click"
                                    textButton4.TextXAlignment = Enum.TextXAlignment.Left
                                    textButton4.Position = UDim2.new(0, 34, 0, 0)
                                    textButton4.Size = UDim2.new(1, -36, 1, 0)
                                end
                            end

                            local tween = TweenService2:Create(uiScale, TweenInfo.new(0.12), {Scale = 1.05})
                            local tween2 = TweenService2:Create(uiScale, TweenInfo.new(0.12), {Scale = 1})
                            local tween3 = TweenService2:Create(frame25, TweenInfo.new(0.12), {BackgroundTransparency = 0.94})
                            local tween4 = TweenService2:Create(frame25, TweenInfo.new(0.12), {BackgroundTransparency = 1})
                            local tween5 = TweenService2:Create(uiGradient6, TweenInfo.new(0.15), {Rotation = 75})
                            local tween6 = TweenService2:Create(uiGradient6, TweenInfo.new(0.15), {Rotation = 90})

                            textButton4.MouseEnter:Connect(function()
                                tween:Play()
                                tween3:Play()
                                tween5:Play()
                            end)

                            textButton4.MouseLeave:Connect(function()
                                tween2:Play()
                                tween4:Play()
                                tween6:Play()
                            end)

                            textButton4.MouseButton1Down:Connect(function()
                                TweenService2:Create(uiScale, TweenInfo.new(0.08), {Scale = 0.96}):Play()
                                local frame28 = Instance.new("Frame")
                                frame28.Name = "Ripple"
                                frame28.Parent = frame26
                                frame28.AnchorPoint = Vector2.new(0.5, 0.5)
                                frame28.Position = UDim2.new(0.5, 0, 0.5, 0)
                                frame28.Size = UDim2.new(0, 0, 0, 0)
                                frame28.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                frame28.BackgroundTransparency = 0.6
                                frame28.ZIndex = frame26.ZIndex + 2
                                Instance.new("UICorner", frame28).CornerRadius = UDim.new(1, 0)
                                TweenService2:Create(frame28, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1}):Play()

                                task.delay(0.36, function()
                                    frame28:Destroy()
                                end)

                                task.defer(v9)
                                task.wait(0.08)
                                tween:Play()
                            end)

                            arg6.FunctionCreate = {
                                GetText = function()
                                    return textLabel6
                                end,
                            }

                            tbl3:RegisterOption(arg6, v9)
                        end,
                        CreateLabel = function(arg6)
                            local v9 = tostring
                            local title = arg6.Title
                            local str2 = title or "Label"
                            local v10 = v9(str2)
                            local frame23 = Instance.new("Frame")
                            local frame24 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local uiStroke6 = Instance.new("UIStroke")
                            local textLabel6 = Instance.new("TextLabel")
                            frame23.Name = "LabelFrame"
                            frame23.Parent = frame20
                            frame23.BackgroundTransparency = 1
                            frame23.Size = UDim2.new(1, 0, 0, 0)
                            frame23.AutomaticSize = Enum.AutomaticSize.Y
                            frame24.Name = "LabelBG"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0)
                            frame24.Position = UDim2.new(0.5, 0, 0, 0)
                            frame24.Size = UDim2.new(1, -10, 0, -10)
                            local color = arg6.Color
                            local background2Color3 = color or getgenv().UIColor["Background 2 Color"]
                            frame24.BackgroundColor3 = background2Color3
                            frame24.AutomaticSize = Enum.AutomaticSize.Y
                            frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]

                            if arg6.Invisible then
                                frame24.BackgroundTransparency = 1
                            end

                            uiCorner10.CornerRadius = UDim.new(0, 6)
                            uiCorner10.Parent = frame24
                            uiStroke6.Parent = frame24
                            uiStroke6.Thickness = 1
                            uiStroke6.Transparency = 0.7
                            uiStroke6.Color = getgenv().UIColor["Border Color"]
                            textLabel6.Name = "TextColor"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 12, 0, 6)
                            textLabel6.Size = UDim2.new(1, -24, 1, -12)
                            textLabel6.Font = Enum.Font.GothamSemibold
                            textLabel6.Text = v10
                            textLabel6.TextSize = 14
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel6.AutomaticSize = Enum.AutomaticSize.Y
                            textLabel6.TextWrapped = true
                            local textColor = arg6.TextColor
                            local labelColor = textColor or getgenv().UIColor["Label Color"]
                            textLabel6.TextColor3 = labelColor
                            textLabel6.TextStrokeTransparency = getgenv().UIColor["Text Stroke Transparency"]

                            if arg6.Invisible then
                                textLabel6.TextTransparency = 1
                            end

                            local functionCreate = {
                                SetText = function(text5)
                                    textLabel6.Text = text5
                                end,
                                GetText = function()
                                    return textLabel6.Text
                                end,
                                SetColor = function(textColor3)
                                    textLabel6.TextColor3 = textColor3
                                end,
                                Highlight = function(arg7)
                                    local create = TweenService.Create
                                    local tweenInfo = TweenInfo.new(0.25)
                                    local tbl7 = {Transparency = 0.2}
                                    local pageSelectedColor = arg7 or getgenv().UIColor["Page Selected Color"]
                                    tbl7.Color = pageSelectedColor
                                    create(TweenService, uiStroke6, tweenInfo, tbl7):Play()
                                    TweenService:Create(frame24, TweenInfo.new(0.25), {BackgroundTransparency = 0.15}):Play()
                                end,
                            }

                            arg6.Page_Name = text2
                            arg6.Section_Name = text4
                            arg6.TextLabel = true
                            arg6.FunctionCreate = functionCreate
                            tbl3:RegisterOption(arg6, Callback)
                            return functionCreate
                        end,
                        CreateDropdown = function(arg6, arg7)
                            local str2 = tostring(arg6.Title)
                            local list = arg6.List
                            local search = arg6.Search
                            local flag5 = search or false
                            local selected = arg6.Selected
                            local flag6 = selected or false
                            local slider = arg6.Slider
                            local flag7 = slider or false
                            local sliderRelease = arg6.SliderRelease
                            local flag8 = sliderRelease or false
                            local default = arg6.Default
                            local priority = arg6.Priority
                            local flag9 = priority or false
                            local fn7 = arg7 or function() end
                            local indexTable = arg6.IndexTable
                            local sortPairs = arg6.SortPairs or pairs
                            local frame23 = Instance.new("Frame")
                            local frame24 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local frame25 = Instance.new("Frame")
                            local uiCorner11 = Instance.new("UICorner")
                            local imageLabel9 = Instance.new("ImageLabel")
                            local textButton4 = Instance.new("TextButton")
                            local frame26 = Instance.new("Frame")
                            local scrollingFrame3 = Instance.new("ScrollingFrame")
                            local frame27 = Instance.new("Frame")
                            local uiListLayout5 = Instance.new("UIListLayout")
                            local tbl7 = {}
                            local tbl8 = {}

                            if flag7 and type(default) == "table" then
                                for k, v9 in sortPairs(default) do
                                    tbl7[k] = v9
                                end
                            end

                            local textBox3

                            if flag5 then
                                textBox3 = Instance.new("TextBox")
                            else
                                textBox3 = Instance.new("TextLabel")
                            end

                            frame23.Name = str2 .. "DropdownFrame"
                            frame23.Parent = frame20
                            frame23.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            frame23.BackgroundTransparency = 1
                            frame23.Position = UDim2.new(0, 0, 0.473684222, 0)
                            frame23.Size = UDim2.new(1, 0, 0, 25)
                            frame24.Name = "Background1"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 1, 0)
                            frame24.ClipsDescendants = true
                            frame24.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner10.CornerRadius = UDim.new(0, 4)
                            uiCorner10.Name = "Dropdowncorner"
                            uiCorner10.Parent = frame24
                            frame25.Name = "Background2"
                            frame25.Parent = frame24
                            frame25.Size = UDim2.new(1, 0, 0, 25)
                            frame25.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                            frame25.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner11.CornerRadius = UDim.new(0, 4)
                            uiCorner11.Parent = frame25
                            textBox3.Name = "TextColorPlaceholder"
                            textBox3.Parent = frame25
                            textBox3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textBox3.BackgroundTransparency = 1
                            textBox3.Position = UDim2.new(0, 10, 0, 0)
                            local udim26 = UDim2.new(1, -40, 1, 0)
                            textBox3.Size = udim26
                            textBox3.Font = Enum.Font.GothamBlack
                            textBox3.Text = ""
                            textBox3.TextSize = 14
                            textBox3.TextXAlignment = Enum.TextXAlignment.Left
                            textBox3.ClipsDescendants = true
                            local stringValue = Instance.new("StringValue", textBox3)
                            stringValue.Value = ""
                            local tbl9 = nil

                            if flag9 then
                                tbl9 = {}

                                if typeof(default) == "table" then
                                    for i, v9 in ipairs(default) do
                                        table.insert(tbl9, v9)
                                    end
                                end
                            end

                            if default and table.find(list, default) then
                                stringValue.Value = default
                            end

                            if flag6 then
                                if flag5 then
                                    textBox3.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                                    local v9 = tostring
                                    local str3 = default or ""
                                    textBox3.PlaceholderText = str2 .. ": " .. v9(str3)
                                else
                                    local v9 = tostring
                                    local str3 = default or ""
                                    textBox3.Text = str2 .. ": " .. v9(str3)
                                end
                            elseif flag5 then
                                textBox3.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                                local v9 = tostring
                                local str3 = default or ""
                                textBox3.PlaceholderText = str2 .. ": " .. v9(str3)
                            else
                                local v9 = tostring
                                local str3 = default or ""
                                textBox3.Text = str2 .. ": " .. v9(str3)
                            end

                            textBox3.TextColor3 = getgenv().UIColor["Text Color"]
                            imageLabel9.Name = "ImgDrop"
                            imageLabel9.Parent = frame25
                            imageLabel9.AnchorPoint = Vector2.new(1, 0.5)
                            imageLabel9.BackgroundTransparency = 1
                            imageLabel9.BorderColor3 = Color3.fromRGB(27, 42, 53)
                            imageLabel9.Position = UDim2.new(1, -6, 0.5, 0)
                            imageLabel9.Size = UDim2.new(0, 15, 0, 15)
                            imageLabel9.Image = "rbxassetid://6954383209"
                            imageLabel9.ImageColor3 = getgenv().UIColor["Dropdown Icon Color"]
                            textButton4.Name = "DropdownButton"
                            textButton4.Parent = frame25
                            textButton4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.BackgroundTransparency = 1
                            local udim27 = flag5 and UDim2.new(0, 30, 0, 30) or UDim2.new(1, 0, 1, 0)
                            textButton4.Size = udim27
                            local udim28 = flag5 and UDim2.new(1, -35, 0, 0) or UDim2.new(0, 0, 0, 0)
                            textButton4.Position = udim28
                            textButton4.Font = Enum.Font.GothamBold
                            textButton4.Text = ""
                            textButton4.TextColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.TextSize = 14
                            frame26.Name = "Dropdownlisttt"
                            frame26.Parent = frame24
                            frame26.BackgroundTransparency = 1
                            frame26.BorderSizePixel = 0
                            frame26.Position = UDim2.new(0, 0, 0, 25)
                            frame26.Size = UDim2.new(1, 0, 0, 25)
                            frame26.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            scrollingFrame3.Name = "DropdownScroll"
                            scrollingFrame3.Parent = frame26
                            scrollingFrame3.Active = true
                            scrollingFrame3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            scrollingFrame3.BackgroundTransparency = 1
                            scrollingFrame3.BorderSizePixel = 0
                            scrollingFrame3.Size = UDim2.new(1, 0, 1, 0)
                            scrollingFrame3.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 0)
                            scrollingFrame3.ScrollBarThickness = 5
                            scrollingFrame3.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
                            scrollingFrame3.ScrollingEnabled = true
                            scrollingFrame3.VerticalScrollBarInset = Enum.ScrollBarInset.Always
                            frame27.Name = "ScrollContainer"
                            frame27.Parent = scrollingFrame3
                            frame27.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            frame27.BackgroundTransparency = 1
                            frame27.Position = UDim2.new(0, 5, 0, 5)
                            frame27.Size = UDim2.new(1, -15, 1, -5)
                            uiListLayout5.Name = "ScrollContainerList"
                            uiListLayout5.Parent = frame27
                            uiListLayout5.SortOrder = Enum.SortOrder.LayoutOrder
                            uiListLayout5.Padding = UDim.new(0, 5)

                            uiListLayout5:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                                scrollingFrame3.CanvasSize = UDim2.new(0, 0, 0, 10 + uiListLayout5.AbsoluteContentSize.Y + 5)
                            end)

                            local flag10 = false
                            local tbl10 = {}
                            local tbl11 = {}

                            local function fn8()
                                for k in sortPairs(tbl10) do
                                    tbl10[k] = nil
                                end

                                for k, child in sortPairs(frame27:GetChildren()) do
                                    if not child:IsA("UIListLayout") and not child:IsA("UIPadding") and not child:IsA("UIGridLayout") then
                                        child.Visible = false
                                    end
                                end

                                local v9 = string.lower(textBox3.Text)
                                textBox3.Text = v9
                            end

                            local function fn9()
                                for k, v9 in sortPairs(tbl11) do
                                    if string.find(v9, textBox3.Text) then
                                        table.insert(tbl10, v9)
                                    end
                                end

                                local v9, v10, v11 = sortPairs(frame27:GetChildren())
                                local v12 = v11
                                local v13 = v9
                                local v14 = v10

                                while true do
                                    local v15, v16 = v13(v14, v12)
                                    if v15 == nil then
                                        break
                                    end

                                    for k, v17 in sortPairs(tbl10) do
                                        if v17 == v16.Name then
                                            v16.Visible = true
                                        end
                                    end

                                    v12 = v15
                                end
                            end

                            local function fn10()
                                local v9 = next
                                local children, v10 = frame27:GetChildren()

                                for k, v11 in v9, children, v10 do
                                    if v11:IsA("Frame") then
                                        v11:Destroy()
                                    end
                                end
                            end

                            local tbl12 = list
                            local fn11

                            fn11 = function(arg8)
                                local v9 = arg8 or sortPairs
                                sortPairs = v9
                                fn10()
                                tbl11 = {}

                                for k, v10 in sortPairs(tbl12) do
                                    if flag6 then
                                        table.insert(tbl11, string.lower(k))
                                    elseif flag7 then
                                        table.insert(tbl11, string.lower(v10.Title))
                                    else
                                        table.insert(tbl11, string.lower(v10))
                                    end
                                end

                                if flag6 then
                                    local v10, v11, v12 = sortPairs(tbl12)
                                    local v13 = v12

                                    while true do
                                        local v14, v15 = v10(v11, v13)
                                        if v14 == nil then
                                            break
                                        end
                                        local v16 = v15
                                        v13 = v14
                                        local frame28 = Instance.new("Frame")
                                        local uiCorner12 = Instance.new("UICorner")
                                        local frame29 = Instance.new("Frame")
                                        local uiCorner13 = Instance.new("UICorner")
                                        local textLabel6 = Instance.new("TextLabel")
                                        local imageButton = Instance.new("ImageButton")
                                        local textButton5 = Instance.new("TextButton")
                                        frame28.Name = string.lower(v14)
                                        frame28.Parent = frame27
                                        frame28.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                                        frame28.BackgroundTransparency = 1
                                        frame28.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                        frame28.LayoutOrder = 1
                                        frame28.Position = UDim2.new(0, 0, 0.208333328, 0)
                                        frame28.Size = UDim2.new(1, 0, 0, 25)
                                        uiCorner12.CornerRadius = UDim.new(0, 4)
                                        uiCorner12.Name = "SampleItemCorner"
                                        uiCorner12.Parent = frame28
                                        frame29.Name = "SampleItemBG"
                                        frame29.Parent = frame28
                                        frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                        local dropdownSelectedCheckColor = v16 and getgenv().UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255)
                                        frame29.BackgroundColor3 = dropdownSelectedCheckColor
                                        local backgroundTransparency2 = v16 and 0.5 or 1
                                        frame29.BackgroundTransparency = backgroundTransparency2
                                        frame29.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                        frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        frame29.Size = UDim2.new(1, 0, 1, 0)
                                        uiCorner13.CornerRadius = UDim.new(0, 4)
                                        uiCorner13.Name = "SampleItemBGCorner"
                                        uiCorner13.Parent = frame29
                                        textLabel6.Name = "SampleItemTitle"
                                        textLabel6.Parent = frame29
                                        textLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel6.BackgroundTransparency = 1
                                        textLabel6.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                        textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                        textLabel6.Size = UDim2.new(1, -40, 0, 25)
                                        textLabel6.Font = Enum.Font.GothamBlack
                                        textLabel6.Text = v14
                                        textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                                        textLabel6.TextSize = 14
                                        textLabel6.TextStrokeTransparency = 0.5
                                        textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                        imageButton.Name = "SampleItemCheck"
                                        imageButton.Parent = frame29
                                        imageButton.AnchorPoint = Vector2.new(1, 0.5)
                                        imageButton.BackgroundTransparency = 1
                                        imageButton.Position = UDim2.new(1, 0, 0.5, 0)
                                        imageButton.Size = UDim2.new(0, 25, 0, 25)
                                        imageButton.ZIndex = 2
                                        imageButton.Image = "rbxassetid://3926305904"
                                        imageButton.ImageColor3 = getgenv().UIColor["Dropdown Selected Check Color"]
                                        imageButton.ImageRectOffset = Vector2.new(312, 4)
                                        imageButton.ImageRectSize = Vector2.new(24, 24)
                                        local imageTransparency = v16 and 0 or 1
                                        imageButton.ImageTransparency = imageTransparency
                                        textButton5.Name = "SampleItemButton"
                                        textButton5.Parent = frame28
                                        textButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                        textButton5.BackgroundTransparency = 1
                                        textButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                        textButton5.BorderSizePixel = 0
                                        textButton5.Size = UDim2.new(1, 0, 1, 0)
                                        textButton5.Font = Enum.Font.SourceSans
                                        textButton5.TextColor3 = getgenv().UIColor["Text Color"]
                                        textButton5.TextSize = 14
                                        textButton5.TextTransparency = 1

                                        textButton5.MouseEnter:Connect(function()
                                            if v16 then
                                                return
                                            end
                                            TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                            TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = 0.7}):Play()
                                        end)

                                        textButton5.MouseLeave:Connect(function()
                                            if v16 then
                                                return
                                            end
                                            TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                            TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = 1}):Play()
                                        end)

                                        textButton5.MouseButton1Click:Connect(function()
                                            local flag11

                                            if v16 then
                                                flag11 = false
                                            else
                                                flag11 = true
                                            end

                                            v16 = flag11
                                            local create = TweenService.Create
                                            local tweenInfo = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"])
                                            local tbl13 = {}
                                            local v17 = v16
                                            local imageTransparency2 = v17 and 0 or 1
                                            tbl13.ImageTransparency = imageTransparency2
                                            create(TweenService, imageButton, tweenInfo, tbl13):Play()
                                            local create2 = TweenService.Create
                                            local tweenInfo2 = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"])
                                            local tbl14 = {}
                                            local v18 = v16
                                            local dropdownSelectedCheckColor2 = v18 and getgenv().UIColor["Dropdown Selected Check Color"] or Color3.fromRGB(255, 255, 255)
                                            tbl14.BackgroundColor3 = dropdownSelectedCheckColor2
                                            create2(TweenService, frame29, tweenInfo2, tbl14):Play()
                                            local create3 = TweenService.Create
                                            local tweenInfo3 = TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"])
                                            local tbl15 = {}
                                            local v19 = v16
                                            local backgroundTransparency3 = v19 and 0.5 or 1
                                            tbl15.BackgroundTransparency = backgroundTransparency3
                                            create3(TweenService, frame29, tweenInfo3, tbl15):Play()

                                            if fn7 then
                                                fn7(v14, v16)
                                                tbl12[v14] = v16
                                            end

                                            if flag5 then
                                                textBox3.PlaceholderText = str2 .. ": "
                                            else
                                                textBox3.Text = str2 .. ": "
                                            end
                                        end)
                                    end
                                elseif flag7 then
                                    for k, v10 in sortPairs(tbl12) do
                                        local str3 = tostring(v10.Title)
                                        local text5 = str3 or ""
                                        local num = tonumber(v10.Min)
                                        local n11 = num or 0
                                        local num2 = tonumber(v10.Max)
                                        local n12 = num2 or 100
                                        local precise = v10.Precise
                                        local flag11 = precise or false
                                        local num3 = tonumber(v10.Default)
                                        local v11 = num3 or n11
                                        local frame28 = Instance.new("Frame")
                                        local uiCorner12 = Instance.new("UICorner")
                                        local frame29 = Instance.new("Frame")
                                        local uiCorner13 = Instance.new("UICorner")
                                        local textLabel6 = Instance.new("TextLabel")
                                        local frame30 = Instance.new("Frame")
                                        local textButton5 = Instance.new("TextButton")
                                        local uiCorner14 = Instance.new("UICorner")
                                        local frame31 = Instance.new("Frame")
                                        local uiCorner15 = Instance.new("UICorner")
                                        local frame32 = Instance.new("Frame")
                                        local uiCorner16 = Instance.new("UICorner")
                                        local textBox4 = Instance.new("TextBox")
                                        frame28.Name = string.lower(v10.Title)
                                        frame28.Parent = frame27
                                        frame28.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                                        frame28.BackgroundTransparency = 1
                                        frame28.Position = UDim2.new(0, 0, 0.208333328, 0)
                                        frame28.Size = UDim2.new(1, 0, 0, 50)
                                        uiCorner12.CornerRadius = UDim.new(0, 4)
                                        uiCorner12.Name = "SliderCorner"
                                        uiCorner12.Parent = frame28
                                        frame29.Name = "Background1"
                                        frame29.Parent = frame28
                                        frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                        frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                        frame29.Size = UDim2.new(1, -10, 1, 0)
                                        frame29.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                                        frame29.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                                        uiCorner13.CornerRadius = UDim.new(0, 4)
                                        uiCorner13.Name = "SliderBGCorner"
                                        uiCorner13.Parent = frame29
                                        textLabel6.Name = "TextColor"
                                        textLabel6.Parent = frame29
                                        textLabel6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                        textLabel6.BackgroundTransparency = 1
                                        textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                        textLabel6.Size = UDim2.new(1, -10, 0, 25)
                                        textLabel6.Font = Enum.Font.GothamBlack
                                        textLabel6.Text = text5
                                        textLabel6.TextSize = 14
                                        textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                        textLabel6.TextColor3 = getgenv().UIColor["Text Color"]
                                        frame30.Name = "SliderBar"
                                        frame30.Parent = frame28
                                        frame30.AnchorPoint = Vector2.new(0.5, 0.5)
                                        frame30.Position = UDim2.new(0.5, 0, 0.5, 14)
                                        frame30.Size = UDim2.new(1, -20, 0, 6)
                                        frame30.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                                        textButton5.Name = "SliderButton "
                                        textButton5.Parent = frame30
                                        textButton5.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                        textButton5.BackgroundTransparency = 1
                                        textButton5.Size = UDim2.new(1, 0, 1, 0)
                                        textButton5.Font = Enum.Font.GothamBold
                                        textButton5.Text = ""
                                        textButton5.TextColor3 = Color3.fromRGB(230, 230, 230)
                                        textButton5.TextSize = 14
                                        uiCorner14.CornerRadius = UDim.new(1, 0)
                                        uiCorner14.Name = "SliderBarCorner"
                                        uiCorner14.Parent = frame30
                                        frame31.Name = "Bar"
                                        frame31.BorderSizePixel = 0
                                        frame31.Parent = frame30
                                        frame31.Size = UDim2.new(0, 0, 1, 0)
                                        frame31.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                                        uiCorner15.CornerRadius = UDim.new(1, 0)
                                        uiCorner15.Name = "BarCorner"
                                        uiCorner15.Parent = frame31
                                        frame32.Name = "Background2"
                                        frame32.Parent = frame28
                                        frame32.AnchorPoint = Vector2.new(1, 0)
                                        frame32.Position = UDim2.new(1, -10, 0, 5)
                                        frame32.Size = UDim2.new(0, 150, 0, 25)
                                        frame32.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                                        uiCorner16.CornerRadius = UDim.new(0, 4)
                                        uiCorner16.Name = "Sliderbox"
                                        uiCorner16.Parent = frame32
                                        textBox4.Name = "TextColor"
                                        textBox4.Parent = frame32
                                        textBox4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                                        textBox4.BackgroundTransparency = 1
                                        textBox4.Size = UDim2.new(1, 0, 1, 0)
                                        textBox4.Font = Enum.Font.GothamBold
                                        textBox4.Text = ""
                                        textBox4.TextSize = 14
                                        textBox4.TextColor3 = getgenv().UIColor["Text Color"]

                                        textButton5.MouseEnter:Connect(function()
                                            TweenService:Create(frame31, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {
                                                BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"],
                                            }):Play()
                                        end)

                                        textButton5.MouseLeave:Connect(function()
                                            TweenService:Create(frame31, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}):Play()
                                        end)

                                        local function fn12(default2)
                                            textBox4.Text = tostring(default2)
                                            tbl12[k].Default = default2
                                            tbl7[k] = default2
                                        end

                                        if v11 then
                                            if v11 <= n11 then
                                                v11 = n11
                                            elseif n12 <= v11 then
                                                v11 = n12
                                            end

                                            frame31.Size = UDim2.new(1 - (n12 - v11) / (n12 - n11), 0, 0, 6)
                                            fn12(v11)
                                        end

                                        if flag8 then
                                            local flag12 = false
                                            local v12 = nil
                                            local n13 = 0

                                            textButton5.InputBegan:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                                    n13 = tick()

                                                    input.Changed:Connect(function()
                                                        if input.UserInputState == Enum.UserInputState.End then
                                                            flag12 = false
                                                            n13 = 0
                                                        end
                                                    end)
                                                end
                                            end)

                                            textButton5.InputEnded:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                                    flag12 = false
                                                    n13 = 0
                                                end
                                            end)

                                            textButton5.InputChanged:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                                                    v12 = input
                                                end
                                            end)

                                            RunService.RenderStepped:Connect(function()
                                                if n13 > 0 and tick() - n13 >= 0 and not flag12 then
                                                    flag12 = true
                                                end

                                                if flag12 and v12 then
                                                    local n14 = (n12 - n11) / 365 * frame31.AbsoluteSize.X + n11
                                                    local n15 = flag11 and tonumber(string.format("%.1f", n14)) or math.floor(n14)
                                                    fn12(n15)
                                                    frame31.Size = UDim2.new(0, math.clamp(v12.Position.X - frame31.AbsolutePosition.X, 0, 365), 0, 6)

                                                    fn7({
                                                        Type = "SliderDropdown",
                                                        KeyName = k,
                                                        Value = n15,
                                                        State = table.clone(tbl7),
                                                    })
                                                end
                                            end)
                                        else
                                            local flag12 = false
                                            local v12 = nil
                                            local n13 = 0

                                            textButton5.InputBegan:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                                    n13 = tick()

                                                    input.Changed:Connect(function()
                                                        if input.UserInputState == Enum.UserInputState.End then
                                                            flag12 = false
                                                            n13 = 0
                                                        end
                                                    end)
                                                end
                                            end)

                                            textButton5.InputEnded:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                                    flag12 = false
                                                    n13 = 0
                                                end
                                            end)

                                            textButton5.InputChanged:Connect(function(input)
                                                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                                                    v12 = input
                                                end
                                            end)

                                            RunService.RenderStepped:Connect(function()
                                                if n13 > 0 and tick() - n13 >= 0 and not flag12 then
                                                    flag12 = true
                                                end

                                                if flag12 and v12 then
                                                    local n14 = (n12 - n11) / 365 * frame31.AbsoluteSize.X + n11
                                                    local n15 = flag11 and tonumber(string.format("%.1f", n14)) or math.floor(n14)
                                                    fn12(n15)
                                                    frame31.Size = UDim2.new(0, math.clamp(v12.Position.X - frame31.AbsolutePosition.X, 0, 365), 0, 6)

                                                    fn7({
                                                        Type = "SliderDropdown",
                                                        KeyName = k,
                                                        Value = n15,
                                                        State = table.clone(tbl7),
                                                    })
                                                end
                                            end)
                                        end

                                        local function fn13(arg9, arg10)
                                            local num4 = tonumber(arg9)
                                            local v12 = num4
                                            if not num4 then
                                                return
                                            end

                                            if num4 <= n11 then
                                                v12 = n11
                                            elseif n12 <= num4 then
                                                v12 = n12
                                            end

                                            frame31.Size = UDim2.new(1 - (n12 - v12) / (n12 - n11), 0, 0, 6)
                                            fn12(v12)

                                            if arg10 then
                                                fn7({
                                                    Type = "SliderDropdown",
                                                    KeyName = k,
                                                    Value = v12,
                                                    State = table.clone(tbl7),
                                                })
                                            end
                                        end

                                        textBox4.FocusLost:Connect(function()
                                            fn13(textBox4.Text, true)
                                        end)

                                        tbl8[k] = {Bar = frame31, TextBox = textBox4, Min = n11, Max = n12}
                                    end
                                else
                                    local function fn12(arg9)
                                        local flag11 = flag9 and table.find(tbl9, arg9) ~= nil
                                        return flag11
                                    end

                                    local function fn13(arg9)
                                        local flag11

                                        if flag9 then
                                            flag11 = false
                                        else
                                            flag11 = true
                                        end

                                        if flag11 then
                                            flag11 = stringValue.Value == arg9
                                        end

                                        return flag11
                                    end

                                    for k, v10 in sortPairs(tbl12) do
                                        if typeof(v10) == "string" then
                                            local frame28 = Instance.new("Frame")
                                            local uiCorner12 = Instance.new("UICorner")
                                            local frame29 = Instance.new("Frame")
                                            local uiCorner13 = Instance.new("UICorner")
                                            local textLabel6 = Instance.new("TextLabel")
                                            local imageButton = Instance.new("ImageButton")
                                            local textButton5 = Instance.new("TextButton")
                                            frame28.Name = string.lower(v10)
                                            frame28.Parent = frame27
                                            frame28.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                                            frame28.BackgroundTransparency = 1
                                            frame28.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                            frame28.LayoutOrder = 1
                                            frame28.Position = UDim2.new(0, 0, 0.208333328, 0)
                                            frame28.Size = UDim2.new(1, 0, 0, 25)
                                            uiCorner12.CornerRadius = UDim.new(0, 4)
                                            uiCorner12.Name = "SampleItemCorner"
                                            uiCorner12.Parent = frame28
                                            frame29.Name = "SampleItemBG"
                                            frame29.Parent = frame28
                                            frame29.AnchorPoint = Vector2.new(0.5, 0.5)
                                            frame29.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            frame29.BackgroundTransparency = 1
                                            frame29.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                            frame29.Position = UDim2.new(0.5, 0, 0.5, 0)
                                            frame29.Size = UDim2.new(1, 0, 1, 0)
                                            uiCorner13.CornerRadius = UDim.new(0, 4)
                                            uiCorner13.Name = "SampleItemBGCorner"
                                            uiCorner13.Parent = frame29
                                            local v11 = nil

                                            if flag9 then
                                                local textLabel7 = Instance.new("TextLabel")
                                                v11 = textLabel7
                                                textLabel7.Name = "OrderLabel"
                                                textLabel7.Parent = frame29
                                                textLabel7.AnchorPoint = Vector2.new(0, 0.5)
                                                textLabel7.Position = UDim2.new(0, 6, 0.5, 0)
                                                textLabel7.Size = UDim2.new(0, 22, 0, 22)
                                                textLabel7.BackgroundTransparency = 1
                                                textLabel7.Font = Enum.Font.GothamBold
                                                textLabel7.TextSize = 12
                                                textLabel7.TextColor3 = Color3.new(1, 1, 1)
                                                textLabel7.TextXAlignment = Enum.TextXAlignment.Center
                                                textLabel7.Text = ""
                                            end

                                            if flag9 then
                                                local v12 = tbl9
                                                local tbl13 = v12 or {}
                                                tbl9 = tbl13
                                                local v13 = table.find(tbl9, v10)

                                                if v13 then
                                                    v11.Text = tostring(v13)
                                                    frame29.BackgroundTransparency = 0.4
                                                    frame29.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Check Color"]
                                                    imageButton.ImageTransparency = 0
                                                    frame28.LayoutOrder = v13
                                                else
                                                    v11.Text = ""

                                                    if stringValue.Value ~= v10 then
                                                        frame29.BackgroundTransparency = 1
                                                    end

                                                    imageButton.ImageTransparency = 1
                                                    frame28.LayoutOrder = 999
                                                end
                                            end

                                            textLabel6.Name = "SampleItemTitle"
                                            textLabel6.Parent = frame29
                                            textLabel6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            textLabel6.BackgroundTransparency = 1
                                            textLabel6.BorderColor3 = Color3.fromRGB(27, 42, 53)
                                            textLabel6.Position = UDim2.new(0, 10, 0, 0)
                                            textLabel6.Size = UDim2.new(1, -40, 0, 25)
                                            textLabel6.Font = Enum.Font.GothamBlack
                                            textLabel6.Text = v10
                                            textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
                                            textLabel6.TextSize = 14
                                            textLabel6.TextStrokeTransparency = 0.5
                                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                                            imageButton.Name = "SampleItemCheck"
                                            imageButton.Parent = frame29
                                            imageButton.AnchorPoint = Vector2.new(1, 0.5)
                                            imageButton.BackgroundTransparency = 1
                                            imageButton.Position = UDim2.new(1, 0, 0.5, 0)
                                            imageButton.Size = UDim2.new(0, 25, 0, 25)
                                            imageButton.ZIndex = 2
                                            imageButton.Image = "rbxassetid://3926305904"
                                            imageButton.ImageColor3 = getgenv().UIColor["Dropdown Selected Check Color"]
                                            imageButton.ImageRectOffset = Vector2.new(312, 4)
                                            imageButton.ImageRectSize = Vector2.new(24, 24)
                                            imageButton.ImageTransparency = 1
                                            textButton5.Name = "SampleItemButton"
                                            textButton5.Parent = frame28
                                            textButton5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                                            textButton5.BackgroundTransparency = 1
                                            textButton5.BorderColor3 = Color3.fromRGB(0, 0, 0)
                                            textButton5.BorderSizePixel = 0
                                            textButton5.Size = UDim2.new(1, 0, 1, 0)
                                            textButton5.Font = Enum.Font.SourceSans
                                            textButton5.TextColor3 = getgenv().UIColor["Text Color"]
                                            textButton5.TextSize = 14
                                            textButton5.TextTransparency = 1

                                            textButton5.MouseEnter:Connect(function()
                                                if fn12(v10) or fn13(v10) then
                                                    return
                                                end
                                                TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                                TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = 0.7}):Play()
                                            end)

                                            textButton5.MouseLeave:Connect(function()
                                                if fn12(v10) or fn13(v10) then
                                                    return
                                                end
                                                TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                                                TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = 1}):Play()
                                            end)

                                            textButton5.MouseButton1Click:Connect(function()
                                                if not flag9 then
                                                    if flag5 then
                                                        local str3 = str2 .. ": " .. v10
                                                        local placeholderText = str3 or ""
                                                        textBox3.PlaceholderText = placeholderText
                                                        stringValue.Value = v10
                                                    else
                                                        local str3 = str2 .. ": " .. v10
                                                        local text5 = str3 or ""
                                                        textBox3.Text = text5
                                                        stringValue.Value = v10
                                                    end

                                                    TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {
                                                        BackgroundColor3 = getgenv().UIColor["Dropdown Selected Check Color"],
                                                    }):Play()

                                                    TweenService:Create(frame29, TweenInfo.new(getgenv().UIColor["Tween Animation 1 Speed"]), {BackgroundTransparency = 0.5}):Play()

                                                    if fn7 then
                                                        fn7(v10)
                                                    end

                                                    if flag5 then
                                                        textBox3.Text = ""
                                                    end

                                                    fn11()
                                                    return
                                                end

                                                local v12 = table.find(tbl9, v10)

                                                if v12 then
                                                    table.remove(tbl9, v12)
                                                else
                                                    table.insert(tbl9, v10)
                                                end

                                                if flag5 then
                                                    local placeholderText = str2 .. ": " .. table.concat(tbl9, " > ")
                                                    textBox3.PlaceholderText = placeholderText
                                                else
                                                    local text5 = str2 .. ": " .. table.concat(tbl9, " > ")
                                                    textBox3.Text = text5
                                                end

                                                fn11()

                                                if fn7 then
                                                    fn7(tbl9)
                                                end
                                            end)

                                            if stringValue.Value == v10 then
                                                frame29.BackgroundTransparency = 0.5
                                                frame29.BackgroundColor3 = getgenv().UIColor["Dropdown Selected Check Color"]
                                                frame28.LayoutOrder = 0
                                            end
                                        end
                                    end
                                end
                            end

                            if flag5 then
                                textBox3.Changed:Connect(function()
                                    fn8()
                                    fn9()
                                end)
                            end

                            if flag9 and typeof(default) == "table" then
                                local str3 = #default > 0 and table.concat(default, " > ") or "None"

                                if flag5 then
                                    textBox3.PlaceholderText = str2 .. ": " .. str3
                                else
                                    textBox3.Text = str2 .. ": " .. str3
                                end
                            elseif typeof(default) == "table" then
                                if flag7 then
                                    textBox3.Text = ""
                                    textBox3.PlaceholderText = str2 .. ": "
                                elseif flag6 then
                                    if flag5 then
                                        textBox3.PlaceholderText = str2 .. ": "
                                    else
                                        textBox3.Text = str2 .. ": "
                                    end
                                end
                            else
                                fn7(default)

                                if flag5 then
                                    local v9 = tostring
                                    local str3 = default or ""
                                    textBox3.PlaceholderText = str2 .. ": " .. v9(str3)
                                else
                                    local v9 = tostring
                                    local str3 = default or ""
                                    local text5 = str2 .. ": " .. v9(str3)
                                    textBox3.Text = text5
                                end
                            end

                            textButton4.MouseButton1Click:Connect(function()
                                fn11()
                                local flag11

                                if flag10 then
                                    flag11 = false
                                else
                                    flag11 = true
                                end

                                flag10 = flag11
                                local v9 = flag10
                                local udim29 = v9 and UDim2.new(1, 0, 0, 170) or UDim2.new(1, 0, 0, 0)
                                local v10 = flag10
                                local udim210 = v10 and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)
                                local v11 = flag10
                                local n11 = v11 and 90 or 0
                                TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = udim29}):Play()
                                TweenService:Create(frame23, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = udim210}):Play()
                                TweenService:Create(imageLabel9, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Rotation = n11}):Play()
                            end)

                            local functionCreate = {
                                rf = fn11,
                                ClearText = function(arg8, arg9)
                                    if flag9 and typeof(arg9) == "table" then
                                        local str3 = #arg9 > 0 and table.concat(arg9, " > ") or "None"

                                        if flag5 then
                                            textBox3.PlaceholderText = str2 .. ": " .. str3
                                        else
                                            textBox3.Text = str2 .. ": " .. str3
                                        end

                                        return
                                    end

                                    if flag6 then
                                        local v9 = tostring
                                        local str3 = arg9 or ""
                                        local text5 = str2 .. ": " .. v9(str3)
                                        textBox3.Text = text5
                                    elseif flag5 then
                                        local v9 = tostring
                                        local str3 = arg9 or ""
                                        local placeholderText = str2 .. ": " .. v9(str3)
                                        textBox3.PlaceholderText = placeholderText
                                    else
                                        local v9 = tostring
                                        local str3 = arg9 or ""
                                        local text5 = str2 .. ": " .. v9(str3)
                                        textBox3.Text = text5
                                    end
                                end,
                                SetValue = function(value)
                                    if flag9 and typeof(value) == "table" then
                                        tbl9 = table.clone(value)
                                        local str3 = #tbl9 > 0 and table.concat(tbl9, " > ") or "None"

                                        if flag5 then
                                            textBox3.PlaceholderText = str2 .. ": " .. str3
                                        else
                                            textBox3.Text = str2 .. ": " .. str3
                                        end

                                        fn11()
                                        return
                                    end

                                    if typeof(value) == "string" then
                                        if table.find(tbl12, value) then
                                            stringValue.Value = value
                                        else
                                            if tbl12[value] == nil then
                                                warn("[Dropdown:SetValue] Value not found:", value)
                                                return
                                            end
                                            stringValue.Value = value
                                        end

                                        if flag5 then
                                            textBox3.PlaceholderText = str2 .. ": " .. value
                                        else
                                            textBox3.Text = str2 .. ": " .. value
                                        end

                                        fn11()

                                        if fn7 then
                                            fn7(value)
                                        end
                                    end
                                end,
                                SetSubValue = function(arg8, arg9, arg10)
                                    if not tbl8 then
                                        return
                                    end
                                    local v9 = tbl8[arg9]
                                    if not v9 then
                                        return
                                    end
                                    local num = tonumber(arg10)
                                    if not num then
                                        return
                                    end
                                    local min = v9.Min
                                    local n11 = min or 0
                                    local max = v9.Max
                                    local n12 = max or 100
                                    local default2 = math.clamp(num, n11, n12)
                                    tbl7[arg9] = default2
                                    tbl12[arg9].Default = default2
                                    v9.Bar.Size = UDim2.new((default2 - n11) / (n12 - n11), 0, 0, 6)
                                    v9.TextBox.Text = tostring(default2)

                                    if fn7 then
                                        fn7({
                                            Type = "SliderDropdown",
                                            KeyName = arg9,
                                            Value = default2,
                                            State = table.clone(tbl7),
                                        })
                                    end
                                end,
                                GetNewList = function(arg8, arg9)
                                    stringValue.Value = ""
                                    flag10 = false
                                    local udim29 = UDim2.new(1, 0, 0, 0)
                                    local v9 = flag10
                                    local udim210 = v9 and UDim2.new(1, 0, 0, 200) or UDim2.new(1, 0, 0, 25)
                                    local v10 = flag10
                                    local n11 = v10 and 90 or 0
                                    TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = udim29}):Play()
                                    TweenService:Create(frame23, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Size = udim210}):Play()
                                    TweenService:Create(imageLabel9, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {Rotation = n11}):Play()
                                    tbl12 = {}
                                    tbl12 = arg9
                                    fn11()

                                    if flag5 then
                                        textBox3.PlaceholderText = str2 .. ": "
                                    else
                                        textBox3.Text = str2 .. ": "
                                    end
                                end,
                            }

                            arg6.FunctionCreate = functionCreate
                            arg6.Page_Name = text2
                            arg6.Section_Name = text4
                            tbl3:RegisterOption(arg6, callback)
                            return functionCreate
                        end,
                        CreateBind = function(arg6, arg7)
                            local str2 = tostring(arg6.Title)
                            local text5 = str2 or ""
                            local key = arg6.Key
                            local default = arg6.Default or arg6.Key
                            local str3 = tostring(default):match("UserInputType") and "UserInputType" or "KeyCode"
                            local fn7 = arg7 or function() end
                            local str4 = tostring(key):gsub("Enum.UserInputType.", "")
                            tostring(str4):gsub("Enum.KeyCode.", "")
                            local frame23 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local frame24 = Instance.new("Frame")
                            local uiCorner11 = Instance.new("UICorner")
                            local textLabel6 = Instance.new("TextLabel")
                            Instance.new("TextButton")
                            local frame25 = Instance.new("Frame")
                            local uiCorner12 = Instance.new("UICorner")
                            local textButton4 = Instance.new("TextButton")
                            frame23.Name = text5 .. "bguvl"
                            frame23.Parent = frame20
                            frame23.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                            frame23.BackgroundTransparency = 1
                            frame23.Position = UDim2.new(0, 0, 0.208333328, 0)
                            frame23.Size = UDim2.new(1, 0, 0, 35)
                            uiCorner10.CornerRadius = UDim.new(0, 4)
                            uiCorner10.Name = "BindCorner"
                            uiCorner10.Parent = frame23
                            frame24.Name = "Background1"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 1, 0)
                            frame24.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner11.CornerRadius = UDim.new(0, 4)
                            uiCorner11.Name = "ButtonCorner"
                            uiCorner11.Parent = frame24
                            textLabel6.Name = "TextColor"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 10, 0, 0)
                            textLabel6.Size = UDim2.new(1, -10, 1, 0)
                            textLabel6.Font = Enum.Font.GothamBlack
                            textLabel6.Text = text5
                            textLabel6.TextSize = 14
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel6.TextColor3 = getgenv().UIColor["Text Color"]
                            frame25.Name = "Background2"
                            frame25.Parent = frame24
                            frame25.AnchorPoint = Vector2.new(1, 0.5)
                            frame25.Position = UDim2.new(1, -5, 0.5, 0)
                            frame25.Size = UDim2.new(0, 150, 0, 25)
                            frame25.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                            uiCorner12.CornerRadius = UDim.new(0, 4)
                            uiCorner12.Name = "ButtonCorner"
                            uiCorner12.Parent = frame25
                            textButton4.Name = "Bindkey"
                            textButton4.Parent = frame25
                            textButton4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.BackgroundTransparency = 1
                            textButton4.Size = UDim2.new(1, 0, 1, 0)
                            textButton4.Font = Enum.Font.GothamBold
                            textButton4.Text = tostring(default):gsub("Enum.KeyCode.", "")
                            textButton4.TextSize = 14
                            textButton4.TextColor3 = getgenv().UIColor["Text Color"]
                            local tbl7 = {}
                            tbl7[Enum.UserInputType.MouseButton1] = "Mouse1"
                            tbl7[Enum.UserInputType.MouseButton2] = "Mouse2"
                            tbl7[Enum.UserInputType.MouseButton3] = "Mouse3"

                            textButton4.MouseButton1Click:Connect(function()
                                local connection = nil
                                textButton4.Text = "..."

                                connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
                                    if tbl7[input.UserInputType] then
                                        textButton4.Text = tbl7[input.UserInputType]

                                        spawn(function()
                                            wait(0.1)
                                            default = input.UserInputType
                                            str3 = "UserInputType"
                                        end)
                                    elseif input.KeyCode ~= Enum.KeyCode.Unknown then
                                        textButton4.Text = tostring(input.KeyCode):gsub("Enum.KeyCode.", "")

                                        spawn(function()
                                            wait(0.1)
                                            default = input.KeyCode
                                            str3 = "KeyCode"
                                        end)
                                    end

                                    connection:Disconnect()
                                end)
                            end)

                            game:GetService("UserInputService").InputBegan:Connect(function(input)
                                if default == input.UserInputType or default == input.KeyCode then
                                    fn7(default)
                                end
                            end)
                        end,
                        CreateBox = function(arg6, arg7)
                            local str2 = tostring(arg6.Title)
                            local text5 = str2 or ""
                            local str3 = tostring(arg6.Placeholder)
                            local placeholderText = str3 or ""
                            local default = arg6.Default
                            local text6 = default or false
                            local number = arg6.Number
                            local flag5 = number or false
                            local fn7 = arg7 or function() end
                            local frame23 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local frame24 = Instance.new("Frame")
                            local uiCorner11 = Instance.new("UICorner")
                            local textLabel6 = Instance.new("TextLabel")
                            local frame25 = Instance.new("Frame")
                            local uiCorner12 = Instance.new("UICorner")
                            local textBox3 = Instance.new("TextBox")
                            local frame26 = Instance.new("Frame")
                            local uiCorner13 = Instance.new("UICorner")
                            frame23.Name = "BoxFrame"
                            frame23.Parent = frame20
                            frame23.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                            frame23.BackgroundTransparency = 1
                            frame23.Position = UDim2.new(0, 0, 0.208333328, 0)
                            frame23.Size = UDim2.new(1, 0, 0, 60)
                            uiCorner10.CornerRadius = UDim.new(0, 4)
                            uiCorner10.Name = "BoxCorner"
                            uiCorner10.Parent = frame23
                            frame24.Name = "Background1"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 1, 0)
                            frame24.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner11.CornerRadius = UDim.new(0, 4)
                            uiCorner11.Name = "ButtonCorner"
                            uiCorner11.Parent = frame24
                            textLabel6.Name = "TextColor"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 10, 0, 0)
                            textLabel6.Size = UDim2.new(1, -10, 0.5, 0)
                            textLabel6.Font = Enum.Font.GothamBlack
                            textLabel6.Text = text5
                            textLabel6.TextSize = 14
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel6.TextColor3 = getgenv().UIColor["Text Color"]
                            frame25.Name = "Background2"
                            frame25.Parent = frame24
                            frame25.AnchorPoint = Vector2.new(1, 0.5)
                            frame25.ClipsDescendants = true
                            frame25.Position = UDim2.new(1, -5, 0, 40)
                            frame25.Size = UDim2.new(1, -10, 0, 25)
                            frame25.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                            uiCorner12.CornerRadius = UDim.new(0, 4)
                            uiCorner12.Name = "ButtonCorner"
                            uiCorner12.Parent = frame25
                            textBox3.Name = "TextColorPlaceholder"
                            textBox3.Parent = frame25
                            textBox3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textBox3.BackgroundTransparency = 1
                            textBox3.Position = UDim2.new(0, 5, 0, 0)
                            textBox3.Size = UDim2.new(1, -5, 1, 0)
                            textBox3.Font = Enum.Font.GothamBold
                            textBox3.PlaceholderText = placeholderText
                            textBox3.Text = ""
                            textBox3.TextSize = 14
                            textBox3.TextXAlignment = Enum.TextXAlignment.Left
                            textBox3.PlaceholderColor3 = getgenv().UIColor["Placeholder Text Color"]
                            textBox3.TextColor3 = getgenv().UIColor["Text Color"]
                            frame26.Name = "TextNSBoxLineeeee"
                            frame26.Parent = frame25
                            frame26.BackgroundTransparency = 1
                            frame26.Position = UDim2.new(0, 0, 1, -2)
                            frame26.Size = UDim2.new(1, 0, 0, 6)
                            frame26.BackgroundColor3 = getgenv().UIColor["Box Highlight Color"]
                            uiCorner13.CornerRadius = UDim.new(1, 0)
                            uiCorner13.Parent = frame26

                            textBox3.Focused:Connect(function()
                                TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {BackgroundTransparency = 0}):Play()
                            end)

                            if flag5 then
                                textBox3:GetPropertyChangedSignal("Text"):Connect(function()
                                    if not tonumber(textBox3.Text) then
                                        textBox3.PlaceholderText = placeholderText
                                        textBox3.Text = ""
                                    end
                                end)
                            end

                            textBox3.FocusLost:Connect(function()
                                TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {BackgroundTransparency = 1}):Play()

                                if textBox3.Text ~= "" then
                                    fn7(textBox3.Text)
                                end
                            end)

                            local tbl7 = {}

                            if text6 then
                                textBox3.Text = text6
                                fn7(text6)
                            end

                            tbl7.SetValue = function(text7)
                                textBox3.Text = text7
                                fn7(text7)
                            end

                            tbl3:RegisterOption({
                                Title = arg6.Title,
                                Default = text6,
                                Box = true,
                                Page_Name = text2,
                                Section_Name = text4,
                                FunctionCreate = tbl7,
                            }, fn7)

                            return tbl7
                        end,
                        CreateSlider = function(arg6, arg7)
                            local str2 = tostring(arg6.Title)
                            local text5 = str2 or ""
                            local num = tonumber(arg6.Min)
                            local n11 = num or 0
                            local num2 = tonumber(arg6.Max)
                            local n12 = num2 or 100
                            local precise = arg6.Precise
                            local flag5 = precise or false
                            local num3 = tonumber(arg6.Default)
                            local n13 = num3 or 0
                            local fn7 = arg7 or function() end
                            local fn8 = fn7 or function() end
                            local frame23 = Instance.new("Frame")
                            local uiCorner10 = Instance.new("UICorner")
                            local frame24 = Instance.new("Frame")
                            local uiCorner11 = Instance.new("UICorner")
                            local textLabel6 = Instance.new("TextLabel")
                            local frame25 = Instance.new("Frame")
                            local textButton4 = Instance.new("TextButton")
                            local uiCorner12 = Instance.new("UICorner")
                            local frame26 = Instance.new("Frame")
                            local uiCorner13 = Instance.new("UICorner")
                            local frame27 = Instance.new("Frame")
                            local uiCorner14 = Instance.new("UICorner")
                            local textBox3 = Instance.new("TextBox")
                            frame23.Name = text5 .. "buda"
                            frame23.Parent = frame20
                            frame23.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                            frame23.BackgroundTransparency = 1
                            frame23.Position = UDim2.new(0, 0, 0.208333328, 0)
                            frame23.Size = UDim2.new(1, 0, 0, 50)
                            uiCorner10.CornerRadius = UDim.new(0, 4)
                            uiCorner10.Name = "SliderCorner"
                            uiCorner10.Parent = frame23
                            frame24.Name = "Background1"
                            frame24.Parent = frame23
                            frame24.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame24.Position = UDim2.new(0.5, 0, 0.5, 0)
                            frame24.Size = UDim2.new(1, -10, 1, 0)
                            frame24.BackgroundColor3 = getgenv().UIColor["Background 1 Color"]
                            frame24.BackgroundTransparency = getgenv().UIColor["Background 1 Transparency"]
                            uiCorner11.CornerRadius = UDim.new(0, 4)
                            uiCorner11.Name = "SliderBGCorner"
                            uiCorner11.Parent = frame24
                            textLabel6.Name = "TextColor"
                            textLabel6.Parent = frame24
                            textLabel6.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textLabel6.BackgroundTransparency = 1
                            textLabel6.Position = UDim2.new(0, 10, 0, 0)
                            textLabel6.Size = UDim2.new(1, -10, 0, 25)
                            textLabel6.Font = Enum.Font.GothamBlack
                            textLabel6.Text = text5
                            textLabel6.TextSize = 14
                            textLabel6.RichText = true
                            textLabel6.TextXAlignment = Enum.TextXAlignment.Left
                            textLabel6.TextColor3 = getgenv().UIColor["Text Color"]
                            frame25.Name = "SliderBar"
                            frame25.Parent = frame23
                            frame25.AnchorPoint = Vector2.new(0.5, 0.5)
                            frame25.Position = UDim2.new(0.5, 0, 0.5, 14)
                            frame25.Size = UDim2.new(0, 400, 0, 6)
                            frame25.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                            textButton4.Name = "SliderButton "
                            textButton4.Parent = frame25
                            textButton4.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.BackgroundTransparency = 1
                            textButton4.Size = UDim2.new(1, 0, 1, 0)
                            textButton4.Font = Enum.Font.GothamBold
                            textButton4.Text = ""
                            textButton4.TextColor3 = Color3.fromRGB(230, 230, 230)
                            textButton4.TextSize = 14
                            uiCorner12.CornerRadius = UDim.new(1, 0)
                            uiCorner12.Name = "SliderBarCorner"
                            uiCorner12.Parent = frame25
                            frame26.Name = "Bar"
                            frame26.BorderSizePixel = 0
                            frame26.Parent = frame25
                            frame26.Size = UDim2.new(0, 0, 1, 0)
                            frame26.BackgroundColor3 = getgenv().UIColor["Slider Line Color"]
                            uiCorner13.CornerRadius = UDim.new(1, 0)
                            uiCorner13.Name = "BarCorner"
                            uiCorner13.Parent = frame26
                            frame27.Name = "Background2"
                            frame27.Parent = frame23
                            frame27.AnchorPoint = Vector2.new(1, 0)
                            frame27.Position = UDim2.new(1, -10, 0, 5)
                            frame27.Size = UDim2.new(0, 150, 0, 25)
                            frame27.BackgroundColor3 = getgenv().UIColor["Background 2 Color"]
                            uiCorner14.CornerRadius = UDim.new(0, 4)
                            uiCorner14.Name = "Sliderbox"
                            uiCorner14.Parent = frame27
                            textBox3.Name = "TextColor"
                            textBox3.Parent = frame27
                            textBox3.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                            textBox3.BackgroundTransparency = 1
                            textBox3.Size = UDim2.new(1, 0, 1, 0)
                            textBox3.Font = Enum.Font.GothamBold
                            textBox3.Text = ""
                            textBox3.TextSize = 14
                            textBox3.TextColor3 = getgenv().UIColor["Text Color"]

                            textButton4.MouseEnter:Connect(function()
                                TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {
                                    BackgroundColor3 = getgenv().UIColor["Slider Highlight Color"],
                                }):Play()
                            end)

                            textButton4.MouseLeave:Connect(function()
                                TweenService:Create(frame26, TweenInfo.new(getgenv().UIColor["Tween Animation 2 Speed"]), {BackgroundColor3 = getgenv().UIColor["Slider Line Color"]}):Play()
                            end)

                            local function fn9(text6)
                                textBox3.Text = text6
                                fn8(tonumber(text6))
                            end

                            if n13 then
                                if n13 <= n11 then
                                    n13 = n11
                                elseif n12 <= n13 then
                                    n13 = n12
                                end

                                frame26.Size = UDim2.new(1 - (n12 - n13) / (n12 - n11), 0, 0, 6)
                                fn9(n13)
                            end

                            local flag6 = false
                            local v9 = nil
                            local n14 = 0

                            textButton4.InputBegan:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                    n14 = tick()

                                    input.Changed:Connect(function()
                                        if input.UserInputState == Enum.UserInputState.End then
                                            flag6 = false
                                            n14 = 0
                                        end
                                    end)
                                end
                            end)

                            textButton4.InputEnded:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                    flag6 = false
                                    n14 = 0
                                end
                            end)

                            textButton4.InputChanged:Connect(function(input)
                                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                                    v9 = input
                                end
                            end)

                            RunService.RenderStepped:Connect(function()
                                if n14 > 0 and tick() - n14 >= 0 and not flag6 then
                                    flag6 = true
                                end

                                if flag6 and v9 then
                                    local n15 = flag5 and tonumber(string.format("%.1f", (tonumber(n12) - tonumber(n11)) / 400 * frame26.AbsoluteSize.X + tonumber(n11))) or math.floor((tonumber(n12) - tonumber(n11)) / 400 * frame26.AbsoluteSize.X + tonumber(n11))

                                    pcall(function()
                                        fn9(n15)
                                    end)

                                    frame26.Size = UDim2.new(0, math.clamp(v9.Position.X - frame26.AbsolutePosition.X, 0, 400), 0, 6)
                                end
                            end)

                            local function fn10(arg8)
                                if tonumber(arg8) <= n11 then
                                    frame26.Size = UDim2.new(0, 0, 0, 6)
                                    fn9(n11)
                                elseif n12 <= tonumber(arg8) then
                                    frame26.Size = UDim2.new(0, n12 / n12 * 400, 0, 6)
                                    fn9(n12)
                                else
                                    frame26.Size = UDim2.new(1 - (n12 - arg8) / (n12 - n11), 0, 0, 6)
                                    fn9(arg8)
                                end
                            end

                            textBox3.FocusLost:Connect(function()
                                fn10(textBox3.Text)
                            end)

                            local tbl7 = {
                                SetValue = function(arg8)
                                    fn10(arg8)
                                end,
                                GetText = function()
                                    return textLabel6
                                end,
                            }

                            tbl3:RegisterOption({
                                Title = arg6.Title,
                                Default = n13,
                                Slider = true,
                                Min = n11,
                                Max = n12,
                                Precise = flag5,
                                Page_Name = text2,
                                Section_Name = text4,
                                FunctionCreate = tbl7,
                            }, fn8)

                            return tbl7
                        end,
                    }
                end,
            }
        end,
    }
end

tbl3.CreateNoti({
    Title = "UI Library",
    Desc = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
    ShowTime = 10,
}, true)

return tbl3

]==])()

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

	------------------------------------------------- Đổi màu VÀNG -> ĐỎ
	-- 1) Thư viện đọc màu từ getgenv().UIColor mỗi khi tạo control => ghi đè bảng màu trước khi tạo UI
	local RED_PALETTE = {
		["Page Selected Color"] = Color3.fromRGB(255, 85, 85),
		["Section Underline Color"] = Color3.fromRGB(255, 85, 85),
		["Toggle Border Color"] = Color3.fromRGB(255, 85, 85),
		["Toggle Checked Color"] = Color3.fromRGB(235, 235, 235),
		["Button Color"] = Color3.fromRGB(255, 85, 85),
		["Dropdown Selected Color"] = Color3.fromRGB(255, 85, 85),
		["Dropdown Selected Check Color"] = Color3.fromRGB(230, 100, 100),
		["Textbox Highlight Color"] = Color3.fromRGB(255, 85, 85),
		["Box Highlight Color"] = Color3.fromRGB(255, 85, 85),
		["Slider Highlight Color"] = Color3.fromRGB(255, 64, 64),
		["Title Text Color"] = Color3.fromRGB(255, 85, 85),
		["Search Icon Highlight Color"] = Color3.fromRGB(255, 85, 85),
		["Border Color"] = Color3.fromRGB(120, 55, 55),
		["Slider Line Color"] = Color3.fromRGB(80, 60, 60),
	}
	do
		local uiColor = getgenv().UIColor
		if uiColor then
			for key, color in pairs(RED_PALETTE) do
				uiColor[key] = color
			end
		end
	end

	-- 2) Thư viện còn gán cứng vài UIGradient màu vàng (gạch chân Section, nút Click) => đổi hue sang đỏ
	local function isYellowish(color)
		local h, s = Color3.toHSV(color)
		return h >= 0.08 and h <= 0.20 and s >= 0.2
	end

	local function recolorGradient(gradient)
		pcall(function()
			local points, changed = {}, false
			for _, keypoint in ipairs(gradient.Color.Keypoints) do
				local color = keypoint.Value
				if isYellowish(color) then
					local _, s, v = Color3.toHSV(color)
					color = Color3.fromHSV(0, s, v)
					changed = true
				end
				table.insert(points, ColorSequenceKeypoint.new(keypoint.Time, color))
			end
			if changed then
				gradient.Color = ColorSequence.new(points)
			end
		end)
	end

	local function watchGradient(object)
		if object:IsA("UIGradient") then
			recolorGradient(object)
			-- thư viện có chỗ gán Color sau khi đã parent, nên bắt cả lần đổi sau
			object:GetPropertyChangedSignal("Color"):Connect(function()
				recolorGradient(object)
			end)
		end
	end

	local hookedGuis = {}
	local function hookBananaGuis()
		for _, gui in ipairs(findBananaGuis()) do
			if not hookedGuis[gui] then
				hookedGuis[gui] = true
				for _, descendant in ipairs(gui:GetDescendants()) do
					watchGradient(descendant)
				end
				gui.DescendantAdded:Connect(function(descendant)
					watchGradient(descendant)
				end)
			end
		end
	end
	hookBananaGuis()
	task.spawn(function()
		for _ = 1, 20 do
			task.wait(0.5)
			hookBananaGuis()
		end
	end)

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
		-- Thư viện Banana gọi callback ngay lúc tạo (kể cả khi Default = nil) => bỏ qua giá trị nil
		local rawCallback = callback
		callback = function(value, ...)
			if value == nil then
				return
			end
			return rawCallback(value, ...)
		end

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

-- ===== ADD-ON (chép từ Banana): Server Browser + Hop Server Less People =====
do
	pcall(function()
		if not isfolder("Banana Cat Hub") then
			makefolder("Banana Cat Hub")
		end
	end)

	tabs.Misc:AddSection("Server")
	-- Cầu nối để giữ nguyên code Banana: SectionServer.CreateButton -> tabs.Misc:AddButton
	local SectionServer = {
		CreateButton = function(opts, callback)
			tabs.Misc:AddButton({ Name = opts.Title, Callback = callback })
		end,
	}

	SectionServer.CreateButton({ Title = "Open Gui Server Browser (Low Player and Ping)" }, function()
		local G = game:GetService("HttpService")
		game:GetService("TeleportService")
		local f, K = game:GetService("Players"), game:GetService("TweenService")
		local R, R, m = f.LocalPlayer, game.PlaceId, syn and syn.request or http_request or request
		if not m then
			warn("[ServerBrowser] Executor does not support http_request")
			return
		end
		if game.CoreGui:FindFirstChild("SB_UI") then
			game.CoreGui.SB_UI:Destroy()
		end
		local E, l, Q =
			{ servers = {}, cursor = nil, finished = false, lastUpdate = 0, pages = 0 },
			{
				CACHE_TIME = 60,
				MAX_SHOW = 50,
				PAGE_DELAY = 5,
				RETRY_MAX = 4,
				RETRY_BASE = 2,
				RETRY_JITTER = 5,
				RATE_COOLDOWN = 30,
			},
			{
				BG = Color3.fromRGB(10, 11, 16),
				SURFACE = Color3.fromRGB(13, 14, 20),
				ROW = Color3.fromRGB(16, 17, 26),
				ROW_HOVER = Color3.fromRGB(20, 22, 35),
				ROW_TOP = Color3.fromRGB(10, 22, 34),
				BORDER = Color3.fromRGB(28, 31, 48),
				BORDER_HOV = Color3.fromRGB(0, 80, 120),
				CYAN = Color3.fromRGB(0, 212, 255),
				CYAN_DIM = Color3.fromRGB(0, 80, 120),
				GREEN = Color3.fromRGB(0, 204, 102),
				GREEN_GLOW = Color3.fromRGB(0, 255, 136),
				AMBER = Color3.fromRGB(255, 170, 0),
				RED = Color3.fromRGB(255, 68, 85),
				TEXT_PRI = Color3.fromRGB(232, 234, 240),
				TEXT_SEC = Color3.fromRGB(80, 90, 120),
				TEXT_DIM = Color3.fromRGB(45, 52, 82),
			}
		local function S(L, d, I)
			local _ = Instance.new(L)
			for L, o in pairs(d or {}) do
				_[L] = o
			end
			if I then
				_.Parent = I
			end
			return _
		end
		local function L(d, I)
			return S("UICorner", { CornerRadius = UDim.new(0, d) }, I)
		end
		local function d(I, _, o, V)
			return S("UIStroke", { Thickness = I, Color = _, Transparency = o or 0 }, V)
		end
		local function I(_, o, V, N, y)
			K:Create(_, TweenInfo.new(V or 0.15, N or Enum.EasingStyle.Quad, y or Enum.EasingDirection.Out), o):Play()
		end
		local function K(_, o, V)
			_.MouseEnter:Connect(function()
				I(_, { BackgroundColor3 = V })
			end)
			_.MouseLeave:Connect(function()
				I(_, { BackgroundColor3 = o })
			end)
		end
		local function _()
			return math.random() * l.RETRY_JITTER
		end
		local o = S(
			"ScreenGui",
			{ Name = "SB_UI", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, IgnoreGuiInset = true },
			game.CoreGui
		)
		local V = S(
			"Frame",
			{
				Name = "Window",
				Size = UDim2.new(0, 580, 0, 500),
				Position = UDim2.new(0.5, -290, 0.5, -250),
				BackgroundColor3 = Q.SURFACE,
				BorderSizePixel = 0,
				ClipsDescendants = true,
			},
			o
		)
		L(4, V)
		d(1, Q.BORDER, 0, V)
		do
			local N, y, x
			V.InputBegan:Connect(function(k)
				if k.UserInputType == Enum.UserInputType.MouseButton1 then
					N = true
					y = k.Position
					x = V.Position
				end
			end)
			V.InputEnded:Connect(function(k)
				local P, e = k.UserInputType, Enum.UserInputType.MouseButton1
				if P == e then
					N = false
				end
			end)
			game:GetService("UserInputService").InputChanged:Connect(function(k)
				if N and k.UserInputType == Enum.UserInputType.MouseMovement then
					local N = k.Position - y
					V.Position = UDim2.new(x.X.Scale, x.X.Offset + N.X, x.Y.Scale, x.Y.Offset + N.Y)
				end
			end)
		end
		f = S("Frame", { Size = UDim2.new(1, 0, 0, 52), BackgroundColor3 = Q.BG, BorderSizePixel = 0 }, V)
		S(
			"TextLabel",
			{
				Size = UDim2.new(0, 300, 0, 18),
				Position = UDim2.new(0, 18, 0, 9),
				BackgroundTransparency = 1,
				Text = "SERVER BROWSER",
				TextColor3 = Q.TEXT_PRI,
				Font = Enum.Font.GothamBold,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
			},
			f
		)
		S(
			"TextLabel",
			{
				Size = UDim2.new(0, 360, 0, 14),
				Position = UDim2.new(0, 18, 0, 30),
				BackgroundTransparency = 1,
				Text = "CACHE PAGE \194\183 LOAD MORE \194\183 LOWEST PLAYER / PING",
				TextColor3 = Q.TEXT_DIM,
				Font = Enum.Font.Gotham,
				TextSize = 10,
				TextXAlignment = Enum.TextXAlignment.Left,
			},
			f
		)
		local N = S(
			"TextButton",
			{
				Size = UDim2.new(0, 28, 0, 28),
				Position = UDim2.new(1, -42, 0, 12),
				BackgroundColor3 = Color3.fromRGB(26, 13, 13),
				BorderSizePixel = 0,
				Text = "X",
				TextColor3 = Q.RED,
				Font = Enum.Font.GothamBold,
				TextSize = 11,
			},
			f
		)
		L(3, N)
		K(N, Color3.fromRGB(26, 13, 13), Color3.fromRGB(60, 20, 20))
		N.MouseButton1Click:Connect(function()
			o:Destroy()
		end)
		f = S(
			"Frame",
			{
				Size = UDim2.new(1, 0, 0, 42),
				Position = UDim2.new(0, 0, 0, 52),
				BackgroundColor3 = Color3.fromRGB(11, 12, 17),
				BorderSizePixel = 0,
			},
			V
		)
		local o = S(
			"Frame",
			{
				Size = UDim2.new(0, 6, 0, 6),
				Position = UDim2.new(0, 14, 0.5, -3),
				BackgroundColor3 = Q.TEXT_DIM,
				BorderSizePixel = 0,
			},
			f
		)
		L(99, o)
		local N, y =
			S(
				"TextLabel",
				{
					Size = UDim2.new(1, -300, 1, 0),
					Position = UDim2.new(0, 26, 0, 0),
					BackgroundTransparency = 1,
					Text = "READY",
					TextColor3 = Q.TEXT_SEC,
					Font = Enum.Font.Gotham,
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				f
			),
			S(
				"TextButton",
				{
					Size = UDim2.new(0, 82, 0, 26),
					Position = UDim2.new(1, -270, 0.5, -13),
					BackgroundColor3 = Color3.fromRGB(14, 22, 40),
					BorderSizePixel = 0,
					Text = "REFRESH",
					TextColor3 = Color3.fromRGB(100, 140, 200),
					Font = Enum.Font.GothamBold,
					TextSize = 10,
				},
				f
			)
		L(3, y)
		K(y, Color3.fromRGB(14, 22, 40), Color3.fromRGB(10, 30, 55))
		local x = S(
			"TextButton",
			{
				Size = UDim2.new(0, 82, 0, 26),
				Position = UDim2.new(1, -182, 0.5, -13),
				BackgroundColor3 = Color3.fromRGB(16, 32, 24),
				BorderSizePixel = 0,
				Text = "LOAD MORE",
				TextColor3 = Q.GREEN,
				Font = Enum.Font.GothamBold,
				TextSize = 10,
			},
			f
		)
		L(3, x)
		K(x, Color3.fromRGB(16, 32, 24), Color3.fromRGB(10, 48, 28))
		local k = S(
			"TextButton",
			{
				Size = UDim2.new(0, 82, 0, 26),
				Position = UDim2.new(1, -94, 0.5, -13),
				BackgroundColor3 = Color3.fromRGB(38, 18, 18),
				BorderSizePixel = 0,
				Text = "RESET",
				TextColor3 = Q.RED,
				Font = Enum.Font.GothamBold,
				TextSize = 10,
			},
			f
		)
		L(3, k)
		K(k, Color3.fromRGB(38, 18, 18), Color3.fromRGB(60, 20, 20))
		local P = S(
			"Frame",
			{
				Size = UDim2.new(1, 0, 0, 24),
				Position = UDim2.new(0, 0, 0, 94),
				BackgroundColor3 = Color3.fromRGB(11, 12, 17),
				BorderSizePixel = 0,
			},
			V
		)
		local function e(Y, H, B)
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, B, 1, 0),
					Position = UDim2.new(0, H, 0, 0),
					BackgroundTransparency = 1,
					Text = Y,
					TextColor3 = Q.TEXT_DIM,
					Font = Enum.Font.GothamBold,
					TextSize = 9,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				P
			)
		end
		e("#", 14, 28)
		e("JOB ID", 42, 170)
		e("PLAYERS", 220, 80)
		e("PING", 310, 60)
		local P = S(
			"ScrollingFrame",
			{
				Size = UDim2.new(1, -8, 1, -172),
				Position = UDim2.new(0, 4, 0, 118),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 3,
				ScrollBarImageColor3 = Q.CYAN_DIM,
				CanvasSize = UDim2.new(0, 0, 0, 0),
			},
			V
		)
		local e = S("UIListLayout", { Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder }, P)
		S(
			"UIPadding",
			{
				PaddingTop = UDim.new(0, 6),
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 6),
			},
			P
		)
		f = S(
			"Frame",
			{
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.new(0, 0, 1, -30),
				BackgroundColor3 = Color3.fromRGB(10, 11, 15),
				BorderSizePixel = 0,
			},
			V
		)
		local Y, H, B =
			S(
				"TextLabel",
				{
					Size = UDim2.new(0.5, 0, 1, 0),
					Position = UDim2.new(0, 14, 0, 0),
					BackgroundTransparency = 1,
					Text = "PLACE \194\183 " .. tostring(R),
					TextColor3 = Q.TEXT_DIM,
					Font = Enum.Font.Gotham,
					TextSize = 9,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				f
			),
			S(
				"TextLabel",
				{
					Size = UDim2.new(0.5, -14, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0),
					BackgroundTransparency = 1,
					Text = "SHOWING 0 / 0",
					TextColor3 = Q.TEXT_DIM,
					Font = Enum.Font.Gotham,
					TextSize = 9,
					TextXAlignment = Enum.TextXAlignment.Right,
				},
				f
			),
			S(
				"Frame",
				{
					Size = UDim2.new(1, 0, 1, -52),
					Position = UDim2.new(0, 0, 0, 52),
					BackgroundColor3 = Q.SURFACE,
					BackgroundTransparency = 0.05,
					ZIndex = 20,
					Visible = false,
				},
				V
			)
		local f, Z =
			S(
				"TextLabel",
				{
					Size = UDim2.new(1, -20, 0, 36),
					Position = UDim2.new(0, 10, 0.5, 10),
					BackgroundTransparency = 1,
					Text = "SCANNING SERVERS...",
					TextColor3 = Q.CYAN,
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextWrapped = true,
					ZIndex = 21,
				},
				B
			),
			S(
				"Frame",
				{
					Size = UDim2.new(1, -8, 0, 28),
					Position = UDim2.new(0, 4, 0, 118),
					BackgroundColor3 = Color3.fromRGB(38, 24, 6),
					BorderSizePixel = 0,
					ZIndex = 15,
					Visible = false,
				},
				V
			)
		L(3, Z)
		d(1, Q.AMBER, 0.4, Z)
		local C = S(
			"TextLabel",
			{
				Size = UDim2.new(1, -12, 1, 0),
				Position = UDim2.new(0, 6, 0, 0),
				BackgroundTransparency = 1,
				Text = "\226\143\179 429 RATE LIMITED \226\128\148 WAITING...",
				TextColor3 = Q.AMBER,
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextXAlignment = Enum.TextXAlignment.Center,
				ZIndex = 16,
			},
			Z
		)
		local function J(F)
			C.Text = F
			Z.Visible = true
			P.Position = UDim2.new(0, 4, 0, 150)
			P.Size = UDim2.new(1, -8, 1, -204)
		end
		local function F()
			Z.Visible = false
			P.Position = UDim2.new(0, 4, 0, 118)
			P.Size = UDim2.new(1, -8, 1, -172)
		end
		local q = S(
			"Frame",
			{
				Size = UDim2.new(0, 360, 0, 36),
				Position = UDim2.new(0.5, -180, 1, -50),
				BackgroundColor3 = Color3.fromRGB(10, 26, 40),
				BorderSizePixel = 0,
				ZIndex = 30,
				Visible = false,
			},
			V
		)
		L(3, q)
		local V = S(
			"TextLabel",
			{
				Size = UDim2.new(1, -12, 1, 0),
				Position = UDim2.new(0, 6, 0, 0),
				BackgroundTransparency = 1,
				Text = "READY",
				TextColor3 = Q.CYAN,
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextWrapped = true,
				ZIndex = 31,
			},
			q
		)
		local c
		local function D(r, n)
			if c then
				task.cancel(c)
			end
			V.Text = r
			V.TextColor3 = n or Q.CYAN
			q.Visible = true
			c = task.delay(3.5, function()
				q.Visible = false
			end)
		end
		local function V(q, c)
			N.Text = q
			o.BackgroundColor3 = c or Q.TEXT_DIM
		end
		local function o(N)
			return ({
				RATE_LIMIT = "429 RATE LIMITED \226\128\148 TOO MANY REQUESTS",
				FORBIDDEN = "403 FORBIDDEN \226\128\148 ACCESS BLOCKED",
				UNAUTHORIZED = "401 UNAUTHORIZED",
				SERVER_ERROR = "5xx ROBLOX SERVER ERROR",
				NETWORK_ERROR = "NETWORK / EXECUTOR ERROR",
				INVALID_JSON = "INVALID JSON RESPONSE",
				EMPTY_BODY = "EMPTY RESPONSE BODY",
			})[N] or "REQUEST FAILED: " .. tostring(N)
		end
		local function N(q, c)
			local r = 0
			for n = 0, l.RETRY_MAX, 1 do
				local u, W = pcall(function()
					return m({
						Url = q,
						Method = "GET",
						Headers = { ["User-Agent"] = "Mozilla/5.0", Accept = "application/json" },
					})
				end)
				if not u or not W then
					return nil, "NETWORK_ERROR"
				end
				u = W.StatusCode or W.Status or 0
				if u == 429 then
					r += 1
					if n >= l.RETRY_MAX then
						return nil, "RATE_LIMIT"
					end
					local m = if r >= 2 then l.RATE_COOLDOWN + _() else math.pow(l.RETRY_BASE, n + 1) + _()
					local _ = string.format(
						"\226\143\179 429 RATE LIMITED \226\128\148 WAITING %.0fs THEN RETRYING (%d/%d)",
						m,
						n + 1,
						l.RETRY_MAX
					)
					if c then
						J(_)
						B.Visible = false
					else
						B.Visible = true
						f.Text = _
					end
					V("RATE LIMITED \226\128\148 WAITING " .. math.floor(m) .. "s", Q.AMBER)
					D(string.format("\226\143\179 429 \226\128\148 RETRYING IN %.0fs", m), Q.AMBER)
					warn(
						string.format(
							"[ServerBrowser] 429 \226\128\148 waiting %.1fs (attempt %d/%d)",
							m,
							n + 1,
							l.RETRY_MAX
						)
					)
					local _ = math.floor(m)
					task.spawn(function()
						while _ > 0 do
							task.wait(1)
							_ -= 1
							local q = string.format(
								"\226\143\179 429 RATE LIMITED \226\128\148 %.0fs REMAINING (%d/%d)",
								_,
								n + 1,
								l.RETRY_MAX
							)
							if c then
								if Z.Visible then
									C.Text = q
								end
							elseif B.Visible then
								f.Text = q
							end
						end
					end)
					task.wait(m)
					if c then
						F()
					end
					continue
				end
				if u == 403 then
					return nil, "FORBIDDEN"
				end
				if u == 401 then
					return nil, "UNAUTHORIZED"
				end
				if u >= 500 then
					return nil, "SERVER_ERROR"
				end
				if u ~= 200 and u ~= 0 then
					return nil, "HTTP_" .. tostring(u)
				end
				if not W.Body or W.Body == "" then
					return nil, "EMPTY_BODY"
				end
				local m, _ = pcall(G.JSONDecode, G, W.Body)
				if not m or not _ then
					return nil, "INVALID_JSON"
				end
				return _, nil
			end
			return nil, "RATE_LIMIT"
		end
		local function m()
			for _, _ in ipairs(P:GetChildren()) do
				if _:IsA("Frame") then
					_:Destroy()
				end
			end
		end
		local function _()
			table.sort(E.servers, function(Z, C)
				local q, c = Z.playing or 999, C.playing or 999
				if q ~= c then
					return q < c
				end
				return (Z.ping or 999) < (C.ping or 999)
			end)
		end
		local function Z(C)
			if C < 100 then
				return Q.GREEN_GLOW
			elseif C < 200 then
				return Q.AMBER
			else
				return Q.RED
			end
		end
		local function C(q)
			if q > 0.8 then
				return Q.RED
			elseif q > 0.5 then
				return Q.AMBER
			else
				return Q.CYAN
			end
		end
		local function q(c, r)
			local n = r == 1
			local u = n and Q.ROW_TOP or Q.ROW
			local W =
				S("Frame", { Size = UDim2.new(1, 0, 0, 48), BackgroundColor3 = u, BorderSizePixel = 0, LayoutOrder = r }, P)
			L(3, W)
			local O = d(1, n and Q.CYAN_DIM or Q.BORDER, 0, W)
			W.MouseEnter:Connect(function()
				I(W, { BackgroundColor3 = Q.ROW_HOVER })
				I(O, { Color = Q.BORDER_HOV })
			end)
			W.MouseLeave:Connect(function()
				I(W, { BackgroundColor3 = u })
				I(O, { Color = n and Q.CYAN_DIM or Q.BORDER })
			end)
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, 28, 1, 0),
					Position = UDim2.new(0, 10, 0, 0),
					BackgroundTransparency = 1,
					Text = string.format("%02d", r),
					TextColor3 = n and Q.CYAN or Q.TEXT_DIM,
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				W
			)
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, 160, 0, 14),
					Position = UDim2.new(0, 44, 0, 8),
					BackgroundTransparency = 1,
					Text = tostring(c.id):sub(1, 18) .. "...",
					TextColor3 = Color3.fromRGB(60, 75, 110),
					Font = Enum.Font.Code,
					TextSize = 10,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				W
			)
			local d, I = c.playing or 0, c.maxPlayers or 20
			r = d / math.max(I, 1)
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, 80, 0, 14),
					Position = UDim2.new(0, 44, 0, 26),
					BackgroundTransparency = 1,
					Text = d .. "/" .. I .. " players",
					TextColor3 = Q.TEXT_DIM,
					Font = Enum.Font.Gotham,
					TextSize = 9,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				W
			)
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, 50, 0, 20),
					Position = UDim2.new(0, 210, 0, 4),
					BackgroundTransparency = 1,
					Text = tostring(d),
					TextColor3 = Q.TEXT_PRI,
					Font = Enum.Font.GothamBold,
					TextSize = 15,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				W
			)
			d = S(
				"Frame",
				{
					Size = UDim2.new(0, 50, 0, 2),
					Position = UDim2.new(0, 210, 0, 28),
					BackgroundColor3 = Color3.fromRGB(22, 24, 36),
					BorderSizePixel = 0,
				},
				W
			)
			L(1, d)
			L(
				1,
				S(
					"Frame",
					{ Size = UDim2.new(math.clamp(r, 0, 1), 0, 1, 0), BackgroundColor3 = C(r), BorderSizePixel = 0 },
					d
				)
			)
			d = c.ping or 999
			S(
				"TextLabel",
				{
					Size = UDim2.new(0, 55, 1, 0),
					Position = UDim2.new(0, 278, 0, 0),
					BackgroundTransparency = 1,
					Text = d .. "ms",
					TextColor3 = Z(d),
					Font = Enum.Font.GothamBold,
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
				},
				W
			)
			d = S(
				"TextButton",
				{
					Size = UDim2.new(0, 72, 0, 28),
					Position = UDim2.new(1, -82, 0.5, -14),
					BackgroundColor3 = Color3.fromRGB(10, 30, 18),
					BorderSizePixel = 0,
					Text = "JOIN",
					TextColor3 = Q.GREEN,
					Font = Enum.Font.GothamBold,
					TextSize = 10,
				},
				W
			)
			L(3, d)
			K(d, Color3.fromRGB(10, 30, 18), Color3.fromRGB(8, 44, 24))
			d.MouseButton1Click:Connect(function()
				D("TELEPORTING TO " .. tostring(c.id):sub(1, 16) .. "...", Q.CYAN)
				local K, S = pcall(function()
					game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", c.id)
				end)
				if not K then
					D("TELEPORT FAILED: " .. tostring(S), Q.RED)
					V("TELEPORT FAILED", Q.RED)
				end
			end)
		end
		local function K()
			m()
			_()
			local S = #E.servers
			local L = math.min(S, l.MAX_SHOW)
			for d = 1, L, 1 do
				q(E.servers[d], d)
			end
			P.CanvasSize = UDim2.new(0, 0, 0, e.AbsoluteContentSize.Y + 16)
			H.Text = "SHOWING " .. L .. " / " .. S
			Y.Text = "PLACE \194\183 " .. tostring(R) .. " \194\183 PAGE " .. tostring(E.pages)
			if E.finished then
				V("CACHE DONE \226\128\148 " .. S .. " SERVERS", Q.GREEN_GLOW)
			else
				V("CACHE SAVED \226\128\148 " .. S .. " SERVERS \226\128\148 PAGE " .. E.pages, Q.CYAN)
			end
		end
		local function S()
			E.servers = {}
			E.cursor = nil
			E.finished = false
			E.lastUpdate = 0
			E.pages = 0
			F()
			m()
			H.Text = "SHOWING 0 / 0"
			Y.Text = "PLACE \194\183 " .. tostring(R)
			V("CACHE RESET", Q.RED)
			D("CACHE RESET", Q.RED)
		end
		local m = false
		local function L(d, I)
			if m then
				return
			end
			m = true
			if I then
				S()
			end
			y.Active = false
			x.Active = false
			k.Active = false
			y.Text = "LOADING"
			x.Text = "WAIT"
			local _, P = 0
			repeat
				if E.finished then
					break
				end
				_ += 1
				E.pages = E.pages + 1
				I = #E.servers > 0
				if I then
					B.Visible = false
				else
					B.Visible = true
					f.Text = "SCANNING PAGE " .. E.pages .. "\226\128\166"
				end
				V("PAGE " .. E.pages .. " \226\128\148 " .. #E.servers .. " FOUND", Q.AMBER)
				local e = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(R)
				local R, Y = N(if E.cursor then e .. "&cursor=" .. G:UrlEncode(E.cursor) else e, I)
				if not R then
					e = o(Y)
					if not I then
						f.Text = e
					end
					V(e, Q.RED)
					D(e, Q.RED)
					warn("[ServerBrowser] " .. e .. " | Page: " .. E.pages)
					P = Y
					break
				end
				for G, G in ipairs(R.data or {}) do
					if G.id and G.id ~= game.JobId then
						e, Y = G.playing or 0, G.maxPlayers or 0
						if Y == 0 or e < Y then
							table.insert(E.servers, G)
						end
					end
				end
				E.cursor = R.nextPageCursor
				E.lastUpdate = tick()
				if not E.cursor or E.cursor == "" then
					E.finished = true
					E.cursor = nil
				end
				if not E.finished and _ < d then
					R = string.format("PAGE %d DONE \226\128\148 WAITING %.1fs\226\128\166", E.pages, l.PAGE_DELAY)
					if #E.servers > 0 then
						K()
						J(R)
					else
						f.Text = R
					end
					V(R, Q.CYAN)
					task.wait(l.PAGE_DELAY)
					F()
				end
			until _ >= d
			B.Visible = false
			F()
			K()
			if P then
				if #E.servers > 0 then
					D(o(P) .. " \226\128\148 SHOWING " .. #E.servers .. " CACHED", Q.AMBER)
					V(o(P) .. " | PARTIAL " .. #E.servers, Q.AMBER)
				else
					V(o(P), Q.RED)
				end
			elseif E.finished then
				V("FULL SCAN DONE \226\128\148 " .. #E.servers .. " SERVERS", Q.GREEN_GLOW)
				D("SCAN COMPLETE \226\128\148 " .. #E.servers .. " SERVERS", Q.GREEN_GLOW)
			else
				V("PAGE SAVED \226\128\148 CLICK LOAD MORE TO CONTINUE", Q.CYAN)
			end
			y.Active = true
			x.Active = true
			k.Active = true
			y.Text = "REFRESH"
			x.Text = "LOAD MORE"
			m = false
		end
		y.MouseButton1Click:Connect(function()
			task.spawn(function()
				local G = tick() - E.lastUpdate
				if #E.servers > 0 and G <= l.CACHE_TIME then
					K()
					D("CACHE STILL FRESH (" .. math.floor(l.CACHE_TIME - G) .. "s) \226\128\148 RESET TO RELOAD", Q.CYAN)
					return
				end
				L(2, true)
			end)
		end)
		x.MouseButton1Click:Connect(function()
			task.spawn(function()
				if E.finished then
					D("ALL PAGES LOADED \226\128\148 NO MORE SERVERS", Q.AMBER)
					V("NO MORE PAGES", Q.AMBER)
					return
				end
				L(2, false)
			end)
		end)
		k.MouseButton1Click:Connect(function()
			if not m then
				S()
			end
		end)
		task.spawn(function()
			L(2, true)
		end)
	end)
	function HopLessAll()
		require(game:GetService("ReplicatedStorage").Notification)
			.new("<Color=Red>Banana Hub : Hop Server<Color=/>")
			:Display()
		local K, R, m, E = game.PlaceId, {}, "", os.date("!*t").hour
		if
			not pcall(function()
				R = game:GetService("HttpService"):JSONDecode(readfile("Banana Cat Hub/NotSameServers.json"))
			end)
		then
			table.insert(R, E)
			writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(R))
		end
		function HopServerLess()
			local l, Q =
				if m == ""
					then (game.HttpService:JSONDecode(
						game:HttpGet("https://games.roblox.com/v1/games/" .. K .. "/servers/Public?sortOrder=Asc&limit=100")
					))
					else (game.HttpService:JSONDecode(
						game:HttpGet(
							"https://games.roblox.com/v1/games/"
								.. K
								.. "/servers/Public?sortOrder=Asc&limit=100&cursor="
								.. m
						)
					)),
				""
			local K = l.nextPageCursor and l.nextPageCursor ~= "null" and l.nextPageCursor ~= nil
			if K then
				m = l.nextPageCursor
			end
			K = 0
			for m, S in pairs(l.data) do
				m = true
				Q = tostring(S.id)
				if tonumber(S.maxPlayers) > tonumber(S.playing) and tonumber(S.playing) <= 3 then
					for l, l in pairs(R) do
						if K ~= 0 then
							m = if Q == tostring(l) then false else m
						elseif tonumber(E) ~= tonumber(l) then
							pcall(function()
								delfile("Banana Cat Hub/NotSameServers.json")
								R = {}
								table.insert(R, E)
							end)
						end
						K += 1
					end
					if m == true then
						table.insert(R, Q)
						wait()
						pcall(function()
							writefile("Banana Cat Hub/NotSameServers.json", game:GetService("HttpService"):JSONEncode(R))
							wait()
							game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", Q)
							getgenv().limit_type("clearAll")
						end)
						wait(4)
					end
				end
			end
		end
		while wait() do
			HopServerLess()
		end
	end
	SectionServer.CreateButton({ Title = "Hop Server Less People" }, function()
		HopLessAll()
	end)
end

mainWindow:Notify({
	Title = "Bomb Hub",
	Content = "thank",
	Image = "rbxassetid://114714624677743",
	Duration = 5
})
-- ĐỔI MÀU VÀNG -> ĐỎ cho UI Banana
task.spawn(function()
	local CoreGui = game:GetService("CoreGui")
	local GUI_NAME = "Nousigi Hub GUI"

	local function isYellow(c)
		local h, s, v = Color3.toHSV(c)
		return h >= 0.09 and h <= 0.20 and s >= 0.35 and v >= 0.45
	end

	local function toRed(c)
		local _, s, v = Color3.toHSV(c)
		return Color3.fromHSV(0, s, v) -- hue 0 = đỏ, giữ nguyên độ đậm nhạt
	end

	local PROPS = {
		"BackgroundColor3", "TextColor3", "ImageColor3",
		"ScrollBarImageColor3", "BorderColor3", "TextStrokeColor3",
	}

	local function fixProp(obj, prop)
		pcall(function()
			local c = obj[prop]
			if typeof(c) == "Color3" and isYellow(c) then
				obj[prop] = toRed(c)
			end
		end)
	end

	local function fixGradient(g)
		pcall(function()
			local points, changed = {}, false
			for _, k in ipairs(g.Color.Keypoints) do
				local c = k.Value
				if isYellow(c) then
					c = toRed(c)
					changed = true
				end
				table.insert(points, ColorSequenceKeypoint.new(k.Time, c))
			end
			if changed then
				g.Color = ColorSequence.new(points)
			end
		end)
	end

	local function handle(obj)
		if obj:IsA("UIStroke") then
			fixProp(obj, "Color")
			obj:GetPropertyChangedSignal("Color"):Connect(function() fixProp(obj, "Color") end)
		elseif obj:IsA("UIGradient") then
			fixGradient(obj)
			obj:GetPropertyChangedSignal("Color"):Connect(function() fixGradient(obj) end)
		elseif obj:IsA("GuiObject") then
			for _, p in ipairs(PROPS) do
				pcall(function()
					fixProp(obj, p)
					-- thư viện hay tween màu khi bật/tắt, nên bắt lại mỗi lần đổi
					obj:GetPropertyChangedSignal(p):Connect(function() fixProp(obj, p) end)
				end)
			end
		end
	end

	local function hook(gui)
		for _, d in ipairs(gui:GetDescendants()) do handle(d) end
		gui.DescendantAdded:Connect(function(d) task.defer(handle, d) end)
	end

	local containers = { CoreGui }
	if gethui then
		local ok, h = pcall(gethui)
		if ok and h then table.insert(containers, h) end
	end

	local hooked = {}
	while true do
		for _, container in ipairs(containers) do
			for _, gui in ipairs(container:GetChildren()) do
				if gui.Name == GUI_NAME and not hooked[gui] then
					hooked[gui] = true
					hook(gui)
				end
			end
		end
		task.wait(1)
	end
end)
