local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = game:GetService("Players")
local LocalPlayer = LP.LocalPlayer
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera

-- HÀM LẤY PARENT AN TOÀN CHO DELTA MOBILE EXECUTOR
local function getParentUI()
	if gethui then
		return gethui()
	end
	local success, coreGui = pcall(function()
		return game:GetService("CoreGui")
	end)
	if success and coreGui then
		return coreGui
	end
	return LocalPlayer:WaitForChild("PlayerGui")
end

local TargetParent = getParentUI()

-- DỌN DẸP GUI CŨ ĐỂ KHÔNG BỊ TRÙNG
if TargetParent:FindFirstChild("HiepGiaHubGui") then
	TargetParent.HiepGiaHubGui:Destroy()
end

local SG = Instance.new("ScreenGui")
SG.Name = "HiepGiaHubGui"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.Parent = TargetParent

local function C(cls, p, parent)
	local o = Instance.new(cls)
	for k, v in pairs(p) do
		o[k] = v
	end
	if parent then
		o.Parent = parent
	end
	return o
end

-- HÀM DRAG CẢM ỨNG
local function drag(g)
	local dragging = false
	local dragInput, dragStart, startPos

	g.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = g.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	g.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - dragStart
			g.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- NÚT MỞ HUYỆN HÌNH TRÒN
local TBtn = C("ImageButton", {Image = "rbxassetid://99351037294920", Position = UDim2.new(0.03, 0, 0.2, 0), Size = UDim2.new(0, 55, 0, 55), BackgroundColor3 = Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.2}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 12)}, TBtn)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, TBtn)
drag(TBtn)

-- MAIN FRAME
local Main = C("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0.85, 0, 0.8, 0), BackgroundColor3 = Color3.fromRGB(25, 25, 30), Visible = false, ClipsDescendants = true}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 15)}, Main)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, Main)
drag(Main)

local Hd = C("Frame", {Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(15, 15, 20)}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 15)}, Hd)
C("TextLabel", {Size = UDim2.new(0.7, 0, 1, 0), Position = UDim2.new(0.03, 0, 0, 0), Text = "HiepGia—Hub", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 20, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, Hd)
local CBtn = C("TextButton", {Size = UDim2.new(0, 35, 0, 35), Position = UDim2.new(1, -42, 0.5, -17), Text = "✕", TextColor3 = Color3.fromRGB(255, 80, 80), TextSize = 18, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 40)}, Hd)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, CBtn)

local Sb = C("Frame", {Size = UDim2.new(0.25, 0, 1, -50), Position = UDim2.new(0, 5, 0, 50), BackgroundColor3 = Color3.fromRGB(18, 18, 22), BackgroundTransparency = 0.5}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, Sb)
local Pc = C("Frame", {Size = UDim2.new(0.73, 0, 1, -50), Position = UDim2.new(0.26, 0, 0, 50), BackgroundTransparency = 1, ClipsDescendants = true}, Main)

-- NÚT CÁC TAB
local Tb1 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 35), Position = UDim2.new(0.05, 0, 0, 10), Text = "Main", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = 4, BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb1)
local Tb2 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 35), Position = UDim2.new(0.05, 0, 0, 50), Text = "Fly & TP", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = 4, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb2)
local Tb3 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 35), Position = UDim2.new(0.05, 0, 0, 90), Text = "Setting", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = 4, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb3)

-- TRANG TỪNG TAB
local P1 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = true, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P1)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P1)

local P2 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P2)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P2)

local P3 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P3)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P3)

local tabs = {[Tb1] = P1, [Tb2] = P2, [Tb3] = P3}
for btn, page in pairs(tabs) do
	btn.MouseButton1Click:Connect(function()
		for b, p in pairs(tabs) do
			p.Visible = (p == page)
			b.BackgroundColor3 = (b == btn) and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(30, 30, 35)
			b.TextColor3 = (b == btn) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
		end
	end)
end

-- ==================== TAB 1 ====================
local WBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "WALK SPEED: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, WBtn)
local WBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "300", PlaceholderText = "Tốc độ 1 - 10000", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, WBox)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, WBox)

local walkSpd, aW = 300, false
local function resetSpd()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
	end
end
WBox.FocusLost:Connect(function()
	local n = tonumber(WBox.Text)
	walkSpd = n and math.clamp(n, 1, 10000) or 300
	WBox.Text = tostring(walkSpd)
end)
WBtn.MouseButton1Click:Connect(function()
	aW = not aW
	WBtn.Text = "WALK SPEED: " .. (aW and "ON" or "OFF")
	WBtn.TextColor3 = aW and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
	if not aW then
		resetSpd()
	end
end)
RS.Heartbeat:Connect(function()
	if not aW or not LocalPlayer.Character then
		return
	end
	local hum, hrp = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"), LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	if hum and hrp then
		hum.WalkSpeed = walkSpd
		hum:Move(hrp.CFrame.LookVector, false)
	end
end)

local JBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Auto Jump: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, JBtn)
local aJ = false
task.spawn(function()
	while true do
		if aJ and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			local h = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if h.FloorMaterial ~= Enum.Material.Air then
				h:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
		task.wait(0.05)
	end
end)
JBtn.MouseButton1Click:Connect(function()
	aJ = not aJ
	JBtn.Text = "Auto Jump: " .. (aJ and "ON" or "OFF")
	JBtn.TextColor3 = aJ and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

local NcBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "NOCLIP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, NcBtn)
local isNoclip = false
RS.Stepped:Connect(function()
	if isNoclip and LocalPlayer.Character then
		for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)
NcBtn.MouseButton1Click:Connect(function()
	isNoclip = not isNoclip
	NcBtn.Text = "NOCLIP: " .. (isNoclip and "ON 👻" or "OFF")
	NcBtn.TextColor3 = isNoclip and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

local InfJBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "INF JUMP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, InfJBtn)
local isInfJump = false
UIS.JumpRequest:Connect(function()
	if isInfJump and LocalPlayer.Character then
		local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
end)
InfJBtn.MouseButton1Click:Connect(function()
	isInfJump = not isInfJump
	InfJBtn.Text = "INF JUMP: " .. (isInfJump and "ON 🚀" or "OFF")
	InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

local SpinBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "SPINBOT: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, SpinBtn)
local SpeedInput = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "100", PlaceholderText = "Tốc độ (1-10000)", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, SpeedInput)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, SpeedInput)

local spinning = false
local angularVelocity = nil
local attachment = nil

local function getSpeed()
	local num = tonumber(SpeedInput.Text)
	if not num then
		return 100
	end
	return math.clamp(num, 1, 10000)
end

local function stopSpin()
	spinning = false
	SpinBtn.Text = "SPINBOT: OFF"
	SpinBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
	if angularVelocity then
		angularVelocity:Destroy()
		angularVelocity = nil
	end
	if attachment then
		attachment:Destroy()
		attachment = nil
	end
end

local function startSpin()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then
		return
	end
	local hrp = char.HumanoidRootPart

	if angularVelocity then
		angularVelocity:Destroy()
	end
	if attachment then
		attachment:Destroy()
	end

	attachment = Instance.new("Attachment")
	attachment.Parent = hrp

	angularVelocity = Instance.new("AngularVelocity")
	angularVelocity.Attachment0 = attachment
	angularVelocity.MaxTorque = math.huge
	angularVelocity.AngularVelocity = Vector3.new(0, getSpeed(), 0)
	angularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
	angularVelocity.Parent = hrp

	spinning = true
	SpinBtn.Text = "SPINBOT: ON 🌀"
	SpinBtn.TextColor3 = Color3.fromRGB(80, 255, 80)
end

SpeedInput:GetPropertyChangedSignal("Text"):Connect(function()
	if spinning and angularVelocity then
		angularVelocity.AngularVelocity = Vector3.new(0, getSpeed(), 0)
	end
end)

SpinBtn.MouseButton1Click:Connect(function()
	if spinning then
		stopSpin()
	else
		startSpin()
	end
end)

LP.CharacterAdded:Connect(function()
	stopSpin()
end)

-- ==================== TAB 2 (FLY & TP & TROLL) ====================
local FBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Fly: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, FBtn)

local FlyContainer = C("Frame", {Size = UDim2.new(0.98, 0, 0, 45), BackgroundTransparency = 1}, P2)
local SlLbl = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Position = UDim2.new(0, 0, 0, 0), Text = "Fly Speed: 50", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, BackgroundTransparency = 1, TextXAlignment = 0}, FlyContainer)
local SlBg = C("Frame", {Size = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 22), BackgroundColor3 =
