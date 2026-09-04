local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = game:GetService("Players")
local LocalPlayer = LP.LocalPlayer or LP:GetPropertyChangedSignal("LocalPlayer"):Wait()

-- BẢO VỆ LOAD PLAYERGUI TRÊN DELTA MOBILE
local TargetParent = LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)
if not TargetParent then 
	TargetParent = LocalPlayer:FindFirstChild("CoreGui") or game:GetService("CoreGui")
end

-- DỌN DẸP GUI CŨ
if TargetParent:FindFirstChild("HiepGiaHubFull") then
	TargetParent.HiepGiaHubFull:Destroy()
end

local SG = Instance.new("ScreenGui")
SG.Name = "HiepGiaHubFull"
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

-- HÀM KÉO NÚT CẢM ỨNG
local function drag(g)
	local dragging, dragStart, startPos
	g.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = g.Position
		end
	end)
	g.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)
	UIS.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			g.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- NÚT TRÒN MỞ MENU
local TBtn = C("ImageButton", {
	Image = "rbxassetid://99351037294920",
	Position = UDim2.new(0.05, 0, 0.2, 0),
	Size = UDim2.new(0, 50, 0, 50),
	BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	BackgroundTransparency = 0.2
}, SG)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, TBtn)

local LogoStroke = C("UIStroke", {
	Thickness = 3,
	ApplyStrokeMode = Enum.ApplyStrokeMode.Border
}, TBtn)

task.spawn(function()
	local hue = 0
	while TBtn and TBtn.Parent do
		hue = (hue + 0.01) % 1
		LogoStroke.Color = Color3.fromHSV(hue, 1, 1)
		task.wait(0.03)
	end
end)

drag(TBtn)

-- MAIN FRAME (TỰ ĐỘNG BẬT HIỆN DIỆN NGAY KHI CHẠY)
local Main = C("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5), 
	Position = UDim2.new(0.5, 0, 0.5, 0), 
	Size = UDim2.new(0.85, 0, 0.8, 0), 
	BackgroundColor3 = Color3.fromRGB(25, 25, 30), 
	Visible = true, -- Hiện luôn menu khi inject
	ClipsDescendants = true
}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 12)}, Main)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, Main)
drag(Main)

local Hd = C("Frame", {Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = Color3.fromRGB(15, 15, 20)}, Main)
C("TextLabel", {Size = UDim2.new(0.7, 0, 1, 0), Position = UDim2.new(0.03, 0, 0, 0), Text = "HiepGia—Hub Full", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 18, Font = Enum.Font.SourceSansBold, TextXAlignment = 0, BackgroundTransparency = 1}, Hd)
local CBtn = C("TextButton", {Size = UDim2.new(0, 30, 0, 30), Position = UDim2.new(1, -35, 0.5, -15), Text = "✕", TextColor3 = Color3.fromRGB(255, 80, 80), TextSize = 16, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 40)}, Hd)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, CBtn)

local Sb = C("Frame", {Size = UDim2.new(0.25, 0, 1, -45), Position = UDim2.new(0, 5, 0, 45), BackgroundColor3 = Color3.fromRGB(18, 18, 22)}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Sb)
local Pc = C("Frame", {Size = UDim2.new(0.73, 0, 1, -45), Position = UDim2.new(0.26, 0, 0, 45), BackgroundTransparency = 1, ClipsDescendants = true}, Main)

-- TAB BUTTONS
local Tb1 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, 10), Text = "Main", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, Tb1)
local Tb2 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, 48), Text = "Fly & TP", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, Tb2)
local Tb3 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 32), Position = UDim2.new(0.05, 0, 0, 86), Text = "Setting", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, Tb3)

-- TAB PAGES
local P1 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = true, ScrollBarThickness = 4, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}, P1)

local P2 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ScrollBarThickness = 4, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}, P2)

local P3 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ScrollBarThickness = 4, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}, P3)

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

-- ==================== TAB 1 (MAIN) ====================
local WBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "WALK SPEED: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, WBtn)
local WBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 32), Text = "300", PlaceholderText = "Tốc độ (1-10000)", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, WBox)

local walkSpd, aW = 300, false
local defaultSpeed = 16

local function saveDefaultSpeed()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if not aW then
			defaultSpeed = hum.WalkSpeed > 0 and hum.WalkSpeed or 16
		end
	end
end
saveDefaultSpeed()
LocalPlayer.CharacterAdded:Connect(function()
	task.wait(0.5)
	saveDefaultSpeed()
end)

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
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
			LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = defaultSpeed
		end
	end
end)

RS.Heartbeat:Connect(function()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if aW then
			hum.WalkSpeed = walkSpd
		end
	end
end)

local JBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Auto Jump: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, JBtn)
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

local NcBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "NOCLIP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, NcBtn)
local isNoclip = false
RS.Stepped:Connect(function()
	if isNoclip and LocalPlayer.Character then
		for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide = false end
		end
	end
end)
NcBtn.MouseButton1Click:Connect(function()
	isNoclip = not isNoclip
	NcBtn.Text = "NOCLIP: " .. (isNoclip and "ON 👻" or "OFF")
	NcBtn.TextColor3 = isNoclip and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

local InfJBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "INF JUMP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, InfJBtn)
local isInfJump = false
UIS.JumpRequest:Connect(function()
	if isInfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
InfJBtn.MouseButton1Click:Connect(function()
	isInfJump = not isInfJump
	InfJBtn.Text = "INF JUMP: " .. (isInfJump and "ON 🚀" or "OFF")
	InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

-- SPINBOT
local SpinBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "SPINBOT: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, SpinBtn)
local SpeedInput = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 32), Text = "100", PlaceholderText = "Tốc độ xoay (1-10000)", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, SpeedInput)

local spinning, spinVelocity = false, nil

local function stopSpin()
	spinning = false
	SpinBtn.Text = "SPINBOT: OFF"
	SpinBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
	
	if spinVelocity then
		spinVelocity:Destroy()
		spinVelocity = nil
	end
	
	local char = LocalPlayer.Character
	if char and char:FindFirstChildOfClass("Humanoid") then
		local hum = char:FindFirstChildOfClass("Humanoid")
		hum.AutoRotate = true
		hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
	end
end

SpinBtn.MouseButton1Click:Connect(function()
	spinning = not spinning
	if spinning then
		local char = LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
			if spinVelocity then spinVelocity:Destroy() end
			
			local hum = char:FindFirstChildOfClass("Humanoid")
			hum.AutoRotate = false
			hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
			hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
			
			spinVelocity = Instance.new("BodyAngularVelocity")
			spinVelocity.Name = "SpinBotVelocity"
			spinVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
			
			local rawSpeed = tonumber(SpeedInput.Text) or 100
			local speed = math.clamp(rawSpeed, 1, 10000)
			SpeedInput.Text = tostring(speed)
			
			spinVelocity.AngularVelocity = Vector3.new(0, speed, 0)
			spinVelocity.Parent = char.HumanoidRootPart
			
			SpinBtn.Text = "SPINBOT: ON 🌀"
			SpinBtn.TextColor3 = Color3.fromRGB(80, 255, 80)
		else
			spinning = false
		end
	else
		stopSpin()
	end
end)

SpeedInput.FocusLost:Connect(function()
	local rawSpeed = tonumber(SpeedInput.Text) or 100
	local speed = math.clamp(rawSpeed, 1, 10000)
	SpeedInput.Text = tostring(speed)
	if spinning and spinVelocity then
		spinVelocity.AngularVelocity = Vector3.new(0, speed, 0)
	end
end)

LocalPlayer.CharacterAdded:Connect(function()
	if spinning then
		stopSpin()
	end
end)

-- ==================== TAB 2 (FLY & TP & TROLL) ====================
local FBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Fly: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, FBtn)

local FlyContainer = C("Frame", {Size = UDim2.new(0.98, 0, 0, 40), BackgroundTransparency = 1}, P2)
local SlLbl = C("TextLabel", {Size = UDim2.new(1, 0, 0, 18), Text = "Fly Speed: 50", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, Font = Enum.Font.SourceSans, BackgroundTransparency = 1, TextXAlignment = 0}, FlyContainer)
local SlBg = C("Frame", {Size = UDim2.new(1, 0, 0, 16), Position = UDim2.new(0, 0, 0, 20), BackgroundColor3 = Color3.fromRGB(40, 40, 50)}, FlyContainer)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SlBg)
local SlFl = C("Frame", {Size = UDim2.new(0.01, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, SlBg)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SlFl)

local flySpd, isFly, bV, bG, flyC, dSl = 50, false, nil, nil, nil, false
local function upSl(i)
	local pos = math.clamp((i.Position.X - SlBg.AbsolutePosition.X) / SlBg.AbsoluteSize.X, 0, 1)
	SlFl.Size = UDim2.new(math.max(pos, 0.01), 0, 1, 0)
	flySpd = math.floor(10 + (pos * 990))
	SlLbl.Text = "Fly Speed: " .. flySpd
end
SlBg.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dSl = true upSl(i) end
end)
UIS.InputChanged:Connect(function(i)
	if dSl and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then upSl(i) end
end)
UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dSl = false end
end)

FBtn.MouseButton1Click:Connect(function()
	isFly = not isFly
	FBtn.Text = "Fly: " .. (isFly and "ON 🚀" or "OFF")
	FBtn.TextColor3 = isFly and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
	local c = LocalPlayer.Character
	if not c or not c:FindFirstChild("HumanoidRootPart") then return end
	local hrp = c.HumanoidRootPart
	if isFly then
		bV = Instance.new("BodyVelocity", hrp)
		bV.MaxForce = Vector3.new(1e9, 1e9, 1e9)
		bV.Velocity = Vector3.zero
		bG = Instance.new("BodyGyro", hrp)
		bG.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
		bG.CFrame = hrp.CFrame
		flyC = RS.RenderStepped:Connect(function()
			if isFly and hrp then
				local cam = workspace.CurrentCamera
				local hum = c:FindFirstChildOfClass("Humanoid")
				local m = hum and hum.MoveDirection or Vector3.zero
				bG.CFrame = cam.CFrame
				bV.Velocity = m.Magnitude > 0 and cam.CFrame.LookVector * (m.Magnitude * flySpd) or Vector3.zero
			end
		end)
	else
		if flyC then flyC:Disconnect() end
		if bV then bV:Destroy() end
		if bG then bG:Destroy() end
	end
end)

local TPBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Nhận Tool Teleport", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, TPBtn)
TPBtn.MouseButton1Click:Connect(function()
	local t = Instance.new("Tool", LocalPlayer.Backpack)
	t.Name, t.RequiresHandle = "TP Tool", false
	t.Activated:Connect(function()
		local m, c = LocalPlayer:GetMouse(), LocalPlayer.Character
		if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then
			c.HumanoidRootPart.CFrame = CFrame.new(m.Hit.Position + Vector3.new(0, 3, 0))
		end
	end)
	TPBtn.Text = "Đã thêm TP Tool!"
	task.wait(1)
	TPBtn.Text = "Nhận Tool Teleport"
end)

-- PLAYER TRACKER POPUP & TOGGLE
local TogFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, TogFrame)
C("TextLabel", {Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0.04, 0, 0, 0), Text = "Player Tracker", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.SourceSansBold, TextXAlignment = 0, BackgroundTransparency = 1}, TogFrame)
local SwitchBG = C("Frame", {Size = UDim2.new(0, 45, 0, 20), Position = UDim2.new(1, -50, 0.5, -10), BackgroundColor3 = Color3.fromRGB(60, 60, 65)}, TogFrame)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SwitchBG)
local SwitchCircle = C("Frame", {Size = UDim2.new(0, 16, 0, 16), Position = UDim2.new(0, 2, 0.5, -8), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, SwitchBG)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SwitchCircle)
local SwitchClick = C("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = ""}, SwitchBG)

local mainFrame = C("Frame", {Size = UDim2.new(0, 220, 0, 260), Position = UDim2.new(1, -230, 0.1, 0), BackgroundColor3 = Color3.fromRGB(30, 30, 30), Active = true, Visible = false, ClipsDescendants = true}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, mainFrame)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1.5}, mainFrame)
drag(mainFrame)

C("TextLabel", {Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(45, 45, 45), Text = "TRACKER", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.SourceSansBold}, mainFrame)
local scrollingFrame = C("ScrollingFrame", {Size = UDim2.new(1, -10, 1, -80), Position = UDim2.new(0, 5, 0, 35), BackgroundTransparency = 1, AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 4}, mainFrame)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}, scrollingFrame)
local followBtn = C("TextButton", {Size = UDim2.new(1, -10, 0, 35), Position = UDim2.new(0, 5, 1, -40), Text = "AUTO FOLLOW: OFF", BackgroundColor3 = Color3.fromRGB(180, 50, 50), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 12}, mainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, followBtn)

local isTrackerEnabled = false
SwitchClick.MouseButton1Click:Connect(function()
	isTrackerEnabled = not isTrackerEnabled
	TS:Create(SwitchCircle, TweenInfo.new(0.2), {Position = isTrackerEnabled and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}):Play()
	TS:Create(SwitchBG, TweenInfo.new(0.2), {BackgroundColor3 = isTrackerEnabled and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 65)}):Play()
	mainFrame.Visible = isTrackerEnabled
end)

local selectedTarget, spectateTarget, isFollowing, followConnection = nil, nil, false, nil
local Camera = workspace.CurrentCamera

RS.RenderStepped:Connect(function()
	if spectateTarget and spectateTarget.Character and spectateTarget.Character:FindFirstChild("Humanoid") then
		Camera.CameraSubject = spectateTarget.Character.Humanoid
	end
end)

local function refreshTrackerList()
	for _, child in pairs(scrollingFrame:GetChildren()) do
		if child:IsA("Frame") then child:Destroy() end
	end
	for _, player in pairs(LP:GetPlayers()) do
		if player ~= LocalPlayer then
			local itemFrame = C("Frame", {Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, scrollingFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, itemFrame)
			local nameBtn = C("TextButton", {Size = UDim2.new(0.65, 0, 1, 0), Text = " " .. player.DisplayName, TextXAlignment = 0, BackgroundColor3 = (selectedTarget == player) and Color3.fromRGB(0, 150, 200) or Color3.fromRGB(55, 55, 55), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSans, TextSize = 11}, itemFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, nameBtn)
			local visBtn = C("TextButton", {Size = UDim2.new(0.32, 0, 0.8, 0), Position = UDim2.new(0.66, 2, 0.1, 0), Text = (spectateTarget == player) and "CAM: ON" or "CAM: OFF", BackgroundColor3 = (spectateTarget == player) and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(150, 50, 50), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 10}, itemFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, visBtn)
			
			nameBtn.MouseButton1Click:Connect(function()
				selectedTarget = player
				if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
				end
				refreshTrackerList()
			end)
			visBtn.MouseButton1Click:Connect(function()
				if spectateTarget == player then
					spectateTarget = nil
					if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LocalPlayer.Character.Humanoid end
				else
					spectateTarget = player
				end
				refreshTrackerList()
			end)
		end
	end
end

followBtn.MouseButton1Click:Connect(function()
	if not selectedTarget then return end
	isFollowing = not isFollowing
	followBtn.Text = isFollowing and ("FOLLOW: " .. string.upper(selectedTarget.DisplayName)) or "AUTO FOLLOW: OFF"
	followBtn.BackgroundColor3 = isFollowing and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(180, 50, 50)
	if isFollowing then
		followConnection = RS.RenderStepped:Connect(function()
			if isFollowing and selectedTarget and selectedTarget.Character and selectedTarget.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				LocalPlayer.Character.HumanoidRootPart.CFrame = selectedTarget.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
			end
		end)
	else
		if followConnection then followConnection:Disconnect() end
	end
end)
LP.PlayerAdded:Connect(refreshTrackerList)
LP.PlayerRemoving:Connect(refreshTrackerList)
refreshTrackerList()

-- TROLL PLAYER
C("TextLabel", {Size = UDim2.new(0.98, 0, 0, 20), Text = "--- TROLL PLAYER 🤫 ---", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 12, Font = Enum.Font.SourceSansBold, BackgroundTransparency = 1}, P2)
local ToggleTrollBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "CHỌN NGƯỜI ĐỂ TROLL", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(100, 100, 100)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, ToggleTrollBtn)

local ScrollList = C("ScrollingFrame", {Size = UDim2.new(0.98, 0, 0, 100), BackgroundColor3 = Color3.fromRGB(20, 20, 28), ScrollBarThickness = 4, AutomaticCanvasSize = Enum.AutomaticSize.Y}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, ScrollList)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}, ScrollList)

local targetPlayer, isTrolling, trollConn = nil, false, nil
local function stopTroll()
	isTrolling = false
	targetPlayer = nil
	ToggleTrollBtn.Text = "CHỌN NGƯỜI ĐỂ TROLL"
	ToggleTrollBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LocalPlayer.Character.Humanoid end
	if trollConn then trollConn:Disconnect() end
end

local function updatePlayerList()
	for _, child in pairs(ScrollList:GetChildren()) do
		if child:IsA("TextButton") then child:Destroy() end
	end
	for _, plr in pairs(LP:GetPlayers()) do
		if plr ~= LocalPlayer then
			local pBtn = C("TextButton", {Size = UDim2.new(1, -4, 0, 25), Text = plr.DisplayName, TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(45, 45, 55), Font = Enum.Font.SourceSans, TextSize = 12}, ScrollList)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, pBtn)
			pBtn.MouseButton1Click:Connect(function()
				targetPlayer = plr
				isTrolling = true
				ToggleTrollBtn.Text = "TẮT TROLL: " .. plr.DisplayName
				ToggleTrollBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
				if trollConn then trollConn:Disconnect() end
				local cT = 0
				trollConn = RS.RenderStepped:Connect(function(dt)
					if not isTrolling or not targetPlayer or not targetPlayer.Character then stopTroll() return end
					local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					local targetHrp = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
					if myHrp and targetHrp then
						Camera.CameraSubject = targetPlayer.Character:FindFirstChild("Humanoid")
						cT = cT + dt * 10
						myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 1.5 + math.sin(cT) * 0.5)
					end
				end)
			end)
		end
	end
end

ToggleTrollBtn.MouseButton1Click:Connect(stopTroll)

LP.PlayerAdded:Connect(updatePlayerList)
LP.PlayerRemoving:Connect(function(plr)
	if targetPlayer == plr then
		stopTroll()
	end
	updatePlayerList()
end)

updatePlayerList()

-- ==================== TAB 3 (SETTINGS) ====================
local ResetBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Reset Character", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(180, 50, 50)}, P3)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, ResetBtn)
ResetBtn.MouseButton1Click:Connect(function()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
	end
end)

local RejoinBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Rejoin Server", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(50, 150, 50)}, P3)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, RejoinBtn)
RejoinBtn.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local DestroyBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 35), Text = "Xóa GUI (Unload Script)", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(120, 40, 40)}, P3)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, DestroyBtn)
DestroyBtn.MouseButton1Click:Connect(function()
	if spinning then stopSpin() end
	SG:Destroy()
end)

-- BẬT / TẮT MAIN MENU VIA LOGO BUTTON
local isOpen = true
local function tog()
	isOpen = not isOpen
	Main.Visible = isOpen
end
TBtn.MouseButton1Click:Connect(tog)
CBtn.MouseButton1Click:Connect(tog)
