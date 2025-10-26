loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/other.lua"))()

-- GUI 생성
local gui = Instance.new("ScreenGui")
gui.Name = "Z3US_Rivals"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999
gui.IgnoreGuiInset = true
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(400, 250)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
frame.BorderSizePixel = 0
frame.Parent = gui

-- 둥근 모서리
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 25)
corner.Parent = frame

-- 드래그 기능 (모바일 터치 지원)
frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		local startPos = input.Position
		local startFramePos = frame.Position
		local moveConn, endConn

		moveConn = game:GetService("UserInputService").InputChanged:Connect(function(input2)
			if input2.UserInputType == Enum.UserInputType.MouseMovement or input2.UserInputType == Enum.UserInputType.Touch then
				local delta = input2.Position - startPos
				frame.Position = UDim2.new(
					startFramePos.X.Scale, startFramePos.X.Offset + delta.X,
					startFramePos.Y.Scale, startFramePos.Y.Offset + delta.Y
				)
			end
		end)

		endConn = game:GetService("UserInputService").InputEnded:Connect(function(input2)
			if input2.UserInputType == Enum.UserInputType.MouseButton1 or input2.UserInputType == Enum.UserInputType.Touch then
				moveConn:Disconnect()
				endConn:Disconnect()
			end
		end)
	end
end)

-- 로고
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.fromOffset(90, 90)
logo.Position = UDim2.fromScale(0.5, 0.2)
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://92661965333918"
logo.Parent = frame

-- 제목
local title = Instance.new("TextLabel")
title.Size = UDim2.fromOffset(300, 50)
title.Position = UDim2.fromScale(0.5, 0.45)
title.AnchorPoint = Vector2.new(0.5, 0.5)
title.BackgroundTransparency = 1
title.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
title.Text = "Rivals"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 48
title.Parent = frame

-- 상태 표시
local status = Instance.new("TextLabel")
status.Size = UDim2.fromOffset(300, 40)
status.Position = UDim2.fromScale(0.5, 0.63)
status.AnchorPoint = Vector2.new(0.5, 0.5)
status.BackgroundTransparency = 1
status.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
status.Text = "터치하여 로드"
status.TextColor3 = Color3.fromRGB(100, 180, 255)
status.TextSize = 28
status.Parent = frame

-- 로드 버튼
local loadBtn = Instance.new("TextButton")
loadBtn.Size = UDim2.fromOffset(220, 60)
loadBtn.Position = UDim2.fromScale(0.5, 0.8)
loadBtn.AnchorPoint = Vector2.new(0.5, 0.5)
loadBtn.BackgroundColor3 = Color3.fromRGB(27, 29, 37)
loadBtn.BorderSizePixel = 0
loadBtn.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
loadBtn.Text = "Load Rivals"
loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadBtn.TextScaled = true
loadBtn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 25)
btnCorner.Parent = loadBtn

-- 닫기 버튼
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.fromOffset(40, 40)
closeBtn.Position = UDim2.fromScale(0.92, 0.05)
closeBtn.BackgroundTransparency = 1
closeBtn.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json")
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
closeBtn.TextScaled = true
closeBtn.Parent = frame

-- 클릭 → 즉시 실행
loadBtn.MouseButton1Click:Connect(function()
	status.Text = "로딩 중..."
	status.TextColor3 = Color3.fromRGB(255, 255, 100)

	-- Rivals 스크립트 실행
	loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Rivals%20Beta.lua"))()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Test.lua"))()

	task.wait(1)
	status.Text = "로드 완료!"
	status.TextColor3 = Color3.fromRGB(100, 255, 100)
	task.wait(1.5)
	status.Text = "준비 완료"
	status.TextColor3 = Color3.fromRGB(100, 180, 255)
end)

-- 닫기
closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
