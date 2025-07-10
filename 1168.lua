local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao66778/xGB/refs/heads/main/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "UI Title",
    Icon = "door-open",
    Author = "Example UI",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
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