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
    Title = "Open Example UI",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("6E94FF"), 
        Color3.fromHex("73E8FF")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})
local Tab = Window:Tab({
    Title = "Tab Title",
    Icon = "bird",
    Locked = false,
})
local Button = Tab:Button({
    Title = "Button",
    Desc = "Test Button",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/CNHM/asg/refs/heads/main/hm.lua"))()
    end
})

local Input = Tab:Input({
    Title = "重力设置",
    Desc = "Input Description",
    Value = "Default value",
    InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter text...",
    Callback = function(Value) 
		game.Workspace.Gravity = Value
    end
})

local Toggle = Tab:Toggle({
    Title = "Toggle",
    Desc = "Toggle Description",
    Icon = "bird",
    Type = "Checkbox",
    Default = false,
    Callback = function(state) 
                if Value then
                    game.Lighting.Ambient = Color3.new(1, 1, 1)
                else
                    game.Lighting.Ambient = Color3.new(0, 0, 0)
                end
    end
})

local Slider = Tab:Slider({
    Title = "重力设置(滑动)",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
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