local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = game:GetService("Players").LocalPlayer

-- Xác định Container chứa GUI
local parentGui = LP:WaitForChild("PlayerGui")
pcall(function()
	if game:GetService("CoreGui") then
		parentGui = game:GetService("CoreGui")
	end
end)

-- Xóa GUI cũ nếu đã tồn tại
if parentGui:FindFirstChild("HiepGiaHubGui") then
	parentGui["HiepGiaHubGui"]:Destroy()
end

local SG = Instance.new("ScreenGui")
SG.Name = "HiepGiaHubGui"
SG.ResetOnSpawn = false
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SG.Parent = parentGui

-- Hàm khởi tạo nhanh Instance
local function C(cls, p, parent)
	local o = Instance.new(cls)
	for k, v in pairs(p) do o[k] = v end
	if parent then o.Parent = parent end
	return o
end

-- Hàm kéo thả GUI (Kéo Logo hoặc Main Frame)
local function drag(g)
	local d, dS, sP = false, nil, nil
	g.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			d, dS, sP = true, i.Position, g.Position
		end
	end)
	UIS.InputChanged:Connect(function(i)
		if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local delta = i.Position - dS
			g.Position = UDim2.new(sP.X.Scale, sP.X.Offset + delta.X, sP.Y.Scale, sP.Y.Offset + delta.Y)
		end
	end)
	UIS.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
			d = false
		end
	end)
end

-- ==================== LOGO CHÍNH ====================
local TBtn = C("ImageButton", {
	Image = "rbxassetid://96342427921941",
	Position = UDim2.new(0.03, 0, 0.2, 0),
	Size = UDim2.new(0, 55, 0, 55),
	BackgroundColor3 = Color3.fromRGB(20, 20, 20),
	BackgroundTransparency = 0.2,
	Active = true,
	ZIndex = 100
}, SG)

local TBtnCorner = C("UICorner", {CornerRadius = UDim.new(0, 12)}, TBtn)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, TBtn)
drag(TBtn)

-- ==================== MAIN MENU ====================
local Main = C("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	Size = UDim2.new(0.85, 0, 0.8, 0),
	BackgroundColor3 = Color3.fromRGB(25, 25, 30),
	Visible = false, -- Ẩn mặc định, bấm logo sẽ mở
	ClipsDescendants = true,
	Active = true,
	ZIndex = 50
}, SG)

C("UICorner", {CornerRadius = UDim.new(0, 15)}, Main)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, Main)
drag(Main)

-- Header
local Hd = C("Frame", {Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(15, 15, 20)}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 15)}, Hd)
C("TextLabel", {
	Size = UDim2.new(0.7, 0, 1, 0),
	Position = UDim2.new(0.03, 0, 0, 0),
	Text = "HiepGia—Hub",
	TextColor3 = Color3.fromRGB(0, 210, 255),
	TextSize = 20,
	Font = Enum.Font.SourceSansBold,
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundTransparency = 1
}, Hd)

local CBtn = C("TextButton", {
	Size = UDim2.new(0, 35, 0, 35),
	Position = UDim2.new(1, -42, 0.5, -17),
	Text = "✕",
	TextColor3 = Color3.fromRGB(255, 80, 80),
	TextSize = 18,
	Font = Enum.Font.SourceSansBold,
	BackgroundColor3 = Color3.fromRGB(35, 35, 40),
	Active = true
}, Hd)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, CBtn)

-- Sidebar & Content Frame
local Sb = C("Frame", {
	Size = UDim2.new(0.25, 0, 1, -50),
	Position = UDim2.new(0, 5, 0, 50),
	BackgroundColor3 = Color3.fromRGB(18, 18, 22),
	BackgroundTransparency = 0.5
}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, Sb)

local Pc = C("Frame", {
	Size = UDim2.new(0.73, 0, 1, -50),
	Position = UDim2.new(0.26, 0, 0, 50),
	BackgroundTransparency = 1,
	ClipsDescendants = true
}, Main)

-- TAB BUTTONS
local Tb1 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 10), Text = "Main", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 16, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(0, 170, 255), Active = true}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb1)

local Tb2 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 60), Text = "Fly & TP", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 16, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(30, 30, 35), Active = true}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb2)

local TbSet = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 110), Text = "Settings ⚙️", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 16, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(30, 30, 35), Active = true}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, TbSet)

-- TAB PAGES
local function createTabScroll()
	local P = C("ScrollingFrame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		Visible = false,
		ClipsDescendants = true,
		ScrollBarThickness = 5,
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, Pc)
	C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P)
	C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P)
	return P
end

local P1, P2, PSet = createTabScroll(), createTabScroll(), createTabScroll()
P1.Visible = true

local function switchTab(activeBtn, activePage)
	P1.Visible, P2.Visible, PSet.Visible = false, false, false
	Tb1.BackgroundColor3, Tb2.BackgroundColor3, TbSet.BackgroundColor3 = Color3.fromRGB(30, 30, 35), Color3.fromRGB(30, 30, 35), Color3.fromRGB(30, 30, 35)
	activePage.Visible = true
	activeBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end

Tb1.MouseButton1Click:Connect(function() switchTab(Tb1, P1) end)
Tb2.MouseButton1Click:Connect(function() switchTab(Tb2, P2) end)
TbSet.MouseButton1Click:Connect(function() switchTab(TbSet, PSet) end)

-- ==================== TAB 1: MAIN ====================
-- Walk Speed
local WBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "WALK SPEED: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, WBtn)
local WBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "300", PlaceholderText = "Tốc độ 1 - 10000", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, WBox)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, WBox)

local walkSpd, aW = 300, false
WBox.FocusLost:Connect(function()
	local n = tonumber(WBox.Text)
	walkSpd = n and math.clamp(n, 1, 10000) or 300
	WBox.Text = tostring(walkSpd)
end)
WBtn.MouseButton1Click:Connect(function()
	aW = not aW
	WBtn.Text = "WALK SPEED: " .. (aW and "ON" or "OFF")
	WBtn.TextColor3 = aW and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
	if not aW and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
		LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
	end
end)
RS.Heartbeat:Connect(function()
	if aW and LP.Character then
		local hum, hrp = LP.Character:FindFirstChildOfClass("Humanoid"), LP.Character:FindFirstChild("HumanoidRootPart")
		if hum and hrp then
			hum.WalkSpeed = walkSpd
			hum:Move(hrp.CFrame.LookVector, false)
		end
	end
end)

-- Auto Jump
local JBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Auto Jump: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, JBtn)
local aJ = false
task.spawn(function()
	while true do
		if aJ and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
			local h = LP.Character:FindFirstChildOfClass("Humanoid")
			if h.FloorMaterial ~= Enum.Material.Air then h:ChangeState(Enum.HumanoidStateType.Jumping) end
		end
		task.wait(0.05)
	end
end)
JBtn.MouseButton1Click:Connect(function()
	aJ = not aJ
	JBtn.Text = "Auto Jump: " .. (aJ and "ON" or "OFF")
	JBtn.TextColor3 = aJ and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

-- Noclip
local NcBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "NOCLIP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, NcBtn)
local isNoclip = false
RS.Stepped:Connect(function()
	if isNoclip and LP.Character then
		for _, part in ipairs(LP.Character:GetDescendants()) do
			if part:IsA("BasePart") then part.CanCollide = false end
		end
	end
end)
NcBtn.MouseButton1Click:Connect(function()
	isNoclip = not isNoclip
	NcBtn.Text = "NOCLIP: " .. (isNoclip and "ON 👻" or "OFF")
	NcBtn.TextColor3 = isNoclip and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

-- Inf Jump
local InfJBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "INF JUMP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, InfJBtn)
local isInfJump = false
UIS.JumpRequest:Connect(function()
	if isInfJump and LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then
		LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
InfJBtn.MouseButton1Click:Connect(function()
	isInfJump = not isInfJump
	InfJBtn.Text = "INF JUMP: " .. (isInfJump and "ON 🚀" or "OFF")
	InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

-- Spin Bot
local SpinBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "BẬT XOAY", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, SpinBtn)
local SpinBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "100", PlaceholderText = "Tốc độ xoay (1-10000)", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, SpinBox)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, SpinBox)

local spinning, angularVelocity, attachment = false, nil, nil
SpinBtn.MouseButton1Click:Connect(function()
	if spinning then
		spinning = false
		SpinBtn.Text = "BẬT XOAY"
		SpinBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
		if angularVelocity then angularVelocity:Destroy() end
		if attachment then attachment:Destroy() end
	else
		local char = LP.Character
		if not char or not char:FindFirstChild("HumanoidRootPart") then return end
		attachment = Instance.new("Attachment", char.HumanoidRootPart)
		angularVelocity = Instance.new("AngularVelocity")
		angularVelocity.Attachment0 = attachment
		angularVelocity.MaxTorque = math.huge
		angularVelocity.AngularVelocity = Vector3.new(0, math.clamp(tonumber(SpinBox.Text) or 100, 1, 10000), 0)
		angularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
		angularVelocity.Parent = char.HumanoidRootPart
		spinning = true
		SpinBtn.Text = "TẮT XOAY"
		SpinBtn.TextColor3 = Color3.fromRGB(80, 255, 80)
	end
end)

-- ==================== TAB 2: FLY & TP ====================
local FBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Fly: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, FBtn)

local FlyContainer = C("Frame", {Size = UDim2.new(0.98, 0, 0, 45), BackgroundTransparency = 1}, P2)
local SlLbl = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = "Fly Speed: 50", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, BackgroundTransparency = 1, TextXAlignment = Enum.TextXAlignment.Left}, FlyContainer)
local SlBg = C("Frame", {Size = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 22), BackgroundColor3 = Color3.fromRGB(40, 40, 50), Active = true}, FlyContainer)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SlBg)
local SlFl = C("Frame", {Size = UDim2.new(0.005, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, SlBg)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SlFl)

local flySpd, isFly, bV, bG, flyC, dSl = 50, false
local function upSl(i)
	local pos = math.clamp((i.Position.X - SlBg.AbsolutePosition.X) / SlBg.AbsoluteSize.X, 0, 1)
	SlFl.Size = UDim2.new(math.max(pos, 0.01), 0, 1, 0)
	flySpd = math.floor(10 + (pos * 9990))
	SlLbl.Text = "Fly Speed: " .. flySpd
end
SlBg.InputBegan:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dSl = true
		upSl(i)
	end
end)
UIS.InputChanged:Connect(function(i)
	if dSl and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
		upSl(i)
	end
end)
UIS.InputEnded:Connect(function(i)
	if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
		dSl = false
	end
end)

FBtn.MouseButton1Click:Connect(function()
	isFly = not isFly
	FBtn.Text = "Fly: " .. (isFly and "ON" or "OFF")
	FBtn.TextColor3 = isFly and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
	local c = LP.Character
	if not c or not c:FindFirstChild("HumanoidRootPart") then return end
	local hrp = c.HumanoidRootPart
	if isFly then
		bV = C("BodyVelocity", {MaxForce = Vector3.new(1e9, 1e9, 1e9), Velocity = Vector3.zero}, hrp)
		bG = C("BodyGyro", {MaxTorque = Vector3.new(1e9, 1e9, 1e9), CFrame = hrp.CFrame}, hrp)
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

-- TP Tool
local TPBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Nhận Tool Teleport", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = Enum.Font.SourceSansBold, BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, TPBtn)
TPBtn.MouseButton1Click:Connect(function()
	local t = Instance.new("Tool")
	t.Name = "TP Tool"
	t.RequiresHandle = false
	t.Parent = LP.Backpack
	t.Activated:Connect(function()
		local m = LP:GetMouse()
		local c = LP.Character
		if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then
			c.HumanoidRootPart.CFrame = CFrame.new(m.Hit.Position + Vector3.new(0, 3, 0))
		end
	end)
	TPBtn.Text = "Đã thêm TP Tool!"
	task.wait(1)
	TPBtn.Text = "Nhận Tool Teleport"
end)

-- ==================== TAB 3: SETTINGS ====================
local function makeSettingLabel(txt)
	return C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = txt, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = Enum.Font.SourceSansBold, TextXAlignment = Enum.TextXAlignment.Left, BackgroundTransparency = 1}, PSet)
end

makeSettingLabel("Hình dạng Logo:")
local ShapeFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundTransparency = 1}, PSet)
local S1 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Text = "Tròn", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 170, 255), Active = true}, ShapeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, S1)
local S2 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.35, 0, 0, 0), Text = "Vuông", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, ShapeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, S2)

S1.MouseButton1Click:Connect(function() TBtnCorner.CornerRadius = UDim.new(0.5, 0) end)
S2.MouseButton1Click:Connect(function() TBtnCorner.CornerRadius = UDim.new(0, 0) end)

makeSettingLabel("Kích thước Logo:")
local SizeFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundTransparency = 1}, PSet)
local Z1 = C("TextButton", {Size = UDim2.new(0.45, 0, 1, 0), Text = "Nhỏ", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42), Active = true}, SizeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Z1)
local Z2 = C("TextButton", {Size = UDim2.new(0.45, 0, 1, 0), Position = UDim2.new(0.5, 0, 0, 0), Text = "Vừa", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 170, 255), Active = true}, SizeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Z2)

Z1.MouseButton1Click:Connect(function() TBtn.Size = UDim2.new(0, 40, 0, 40) end)
Z2.MouseButton1Click:Connect(function() TBtn.Size = UDim2.new(0, 55, 0, 55) end)

-- ==================== SỰ KIỆN ĐÓNG / MỞ MENU ====================
TBtn.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)

CBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
end)
