local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao66778/xGB/main/91UI.lua"))()

local Window = WindUI:CreateWindow({
    Title = "小空脚本",
    Icon = "moon",
    Author = "作者:晓空",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(400, 300),
    Transparent = true,
    Theme = "Sky",
    Resizable = true,
    SideBarWidth = 200,
    Background = "", -- rbxassetid only
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
})

Window:EditOpenButton({
    Title = "小空脚本",
    Icon = "monitor",
    CornerRadius = UDim.new(0,60),
    StrokeThickness = 6,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("6E94FF"), 
        Color3.fromHex("73E8FF"),
        Color3.fromHex("8D29FF")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Tab = Window:Tab({
    Title = "通用",
    Icon = "star",
    Locked = false,
})

local Button = Tab:Button({
    Title = "玩家加入游戏提示",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
    end
})

local Button = Tab:Button({
    Title = "获得管理员权限",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/sZpgTVas"))()
    end
})

local Button = Tab:Button({
    Title = "死亡笔记",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/tt/main/%E6%AD%BB%E4%BA%A1%E7%AC%94%E8%AE%B0%20(1).txt"))()
    end
})

local Button = Tab:Button({
    Title = "透视",
    Desc = "",
    Locked = false,
    Callback = function()
    _G.FriendColor = Color3.fromRGB(0, 0, 255)
        local function ApplyESP(v)
       if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
           v.Character.Humanoid.NameDisplayDistance = 9e9
           v.Character.Humanoid.NameOcclusion = "NoOcclusion"
           v.Character.Humanoid.HealthDisplayDistance = 9e9
           v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
           v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
       end
    end
    for i,v in pairs(game.Players:GetPlayers()) do
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end
    
    game.Players.PlayerAdded:Connect(function(v)
       ApplyESP(v)
       v.CharacterAdded:Connect(function()
           task.wait(0.33)
           ApplyESP(v)
       end)
    end)
    
        local Players = game:GetService("Players"):GetChildren()
    local RunService = game:GetService("RunService")
    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    
    for i, v in pairs(Players) do
        repeat wait() until v.Character
        if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = v.Character
            highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlightClone.Name = "Highlight"
        end
    end
    
    game.Players.PlayerAdded:Connect(function(player)
        repeat wait() until player.Character
        if not player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
            local highlightClone = highlight:Clone()
            highlightClone.Adornee = player.Character
            highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            highlightClone.Name = "Highlight"
        end
    end)
    
    game.Players.PlayerRemoving:Connect(function(playerRemoved)
        playerRemoved.Character:FindFirstChild("HumanoidRootPart").Highlight:Destroy()
    end)
    
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(Players) do
            repeat wait() until v.Character
            if not v.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("Highlight") then
                local highlightClone = highlight:Clone()
                highlightClone.Adornee = v.Character
                highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
                highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                highlightClone.Name = "Highlight"
                task.wait()
            end
    end
    end)
    end
})

local Button = Tab:Button({
    Title = "甩人",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    end
})

local Slider = Tab:Slider({
    Title = "重力设置",
    
    Step = 1,
    
    Value = {
        Min = 20,
        Max = 120,
        Default = 70,
    },
    Callback = function(Value)
		game.Workspace.Gravity = Value
    end
})

local Input = Tab:Input({
    Title = "移动速度设置",
    Desc = "",
    Value = "20",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "请输入文本",
    Callback = function(Value) 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

local Input = Tab:Input({
    Title = "最大视野设置",
    Desc = "",
    Value = "70",
    InputIcon = "",
    Type = "Input", -- or "Textarea"
    Placeholder = "请输入文本",
    Callback = function(Value) 
Workspace.CurrentCamera.FieldOfView = Value
    end
})

local Button = Tab:Button({
    Title = "光影V4",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()
    end
})