local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/Main/refs/heads/main/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "小空脚本",
    Icon = "moon",
    Author = "作者:晓空",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(400, 300),
    Transparent = true,
    Theme = "Sky",
    User = {
        Enabled = true, 
        Callback = function() print("clicked") end, 
        Anonymous = true 
    },
})

Window:EditOpenButton({
    Title = "      开/关UI      ",
    Icon = "eye",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( 
        Color3.fromHex("FF00FF"), 
        Color3.fromHex("00FFFF"), 
        Color3.fromHex("800080")   
    ),
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
        print("clicked")
    end
})
Snow = "Snow Hub团队"
loadstring(game:HttpGet("https://raw.githubusercontent.com/canxiaoxue666/SnowHubDemo/refs/heads/main/SnowHub"))()
     end 
})