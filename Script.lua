local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local LP = game:GetService("Players").LocalPlayer
local Camera = workspace.CurrentCamera

local SG = Instance.new("ScreenGui", game:GetService("CoreGui") or LP:WaitForChild("PlayerGui"))
SG.Name = "HiepGiaHubGui"
SG.ResetOnSpawn = false

local function C(cls, p, parent)
	local o = Instance.new(cls)
	for k, v in pairs(p) do o[k] = v end
	if parent then o.Parent = parent end
	return o
end

local isDraggingMenu = false
local function drag(g)
	local d, sP, dS
	g.InputBegan:Connect(function(i)
		if not isDraggingMenu and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
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

-- NÚT NỔI BẬT MENU (IMAGE BUTTON)
local TBtn = C("ImageButton", {Image = "rbxassetid://96342427921941", Position = UDim2.new(0.03, 0, 0.2, 0), Size = UDim2.new(0, 55, 0, 55), BackgroundColor3 = Color3.fromRGB(20, 20, 20), BackgroundTransparency = 0.2}, SG)
local TBtnCorner = C("UICorner", {CornerRadius = UDim.new(0, 12)}, TBtn)
local TBtnStroke = C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, TBtn)
drag(TBtn)

-- KHUNG MENU CHÍNH
local Main = C("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0.85, 0, 0.8, 0), BackgroundColor3 = Color3.fromRGB(25, 25, 30), Visible = false, ClipsDescendants = true}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 15)}, Main)
local MainStroke = C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 2}, Main)
drag(Main)

local Hd = C("Frame", {Size = UDim2.new(1, 0, 0, 45), BackgroundColor3 = Color3.fromRGB(15, 15, 20)}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 15)}, Hd)
local TitleTxt = C("TextLabel", {Size = UDim2.new(0.7, 0, 1, 0), Position = UDim2.new(0.03, 0, 0, 0), Text = "HiepGia—Hub", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 20, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, Hd)
local CBtn = C("TextButton", {Size = UDim2.new(0, 35, 0, 35), Position = UDim2.new(1, -42, 0.5, -17), Text = "✕", TextColor3 = Color3.fromRGB(255, 80, 80), TextSize = 18, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 40)}, Hd)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, CBtn)

local Sb = C("Frame", {Size = UDim2.new(0.25, 0, 1, -50), Position = UDim2.new(0, 5, 0, 50), BackgroundColor3 = Color3.fromRGB(18, 18, 22), BackgroundTransparency = 0.5}, Main)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, Sb)
local Pc = C("Frame", {Size = UDim2.new(0.73, 0, 1, -50), Position = UDim2.new(0.26, 0, 0, 50), BackgroundTransparency = 1, ClipsDescendants = true}, Main)

-- DANH SÁCH TAB SIDEBAR
local Tb1 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 10), Text = "Main", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 16, Font = 4, BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb1)
local Tb2 = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 60), Text = "Fly & TP", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 16, Font = 4, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Tb2)
local TbSet = C("TextButton", {Size = UDim2.new(0.9, 0, 0, 40), Position = UDim2.new(0.05, 0, 0, 110), Text = "Settings ⚙️", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 16, Font = 4, BackgroundColor3 = Color3.fromRGB(30, 30, 35)}, Sb)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, TbSet)

-- KHUNG CÁC TAB CONTENT
local P1 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = true, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P1)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P1)

local P2 = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, P2)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, P2)

local PSet = C("ScrollingFrame", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Visible = false, ClipsDescendants = true, ScrollBarThickness = 5, AutomaticCanvasSize = Enum.AutomaticSize.Y}, Pc)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)}, PSet)
C("UIPadding", {PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 2), PaddingRight = UDim.new(0, 5)}, PSet)

local function switchTab(activeBtn, activePage)
	P1.Visible, P2.Visible, PSet.Visible = false, false, false
	Tb1.BackgroundColor3, Tb2.BackgroundColor3, TbSet.BackgroundColor3 = Color3.fromRGB(30, 30, 35), Color3.fromRGB(30, 30, 35), Color3.fromRGB(30, 30, 35)
	activePage.Visible = true
	activeBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end

Tb1.MouseButton1Click:Connect(function() switchTab(Tb1, P1) end)
Tb2.MouseButton1Click:Connect(function() switchTab(Tb2, P2) end)
TbSet.MouseButton1Click:Connect(function() switchTab(TbSet, PSet) end)

-- ==================== TAB MAIN ====================
local WBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "WALK SPEED: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, WBtn)
local WBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "300", PlaceholderText = "Tốc độ 1 - 10000", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, WBox)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, WBox)

local walkSpd, aW = 300, false
local function resetSpd()
	if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") then LP.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16 end
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
	if not aW then resetSpd() end
end)
RS.Heartbeat:Connect(function()
	if not aW or not LP.Character then return end
	local hum, hrp = LP.Character:FindFirstChildOfClass("Humanoid"), LP.Character:FindFirstChild("HumanoidRootPart")
	if hum and hrp then hum.WalkSpeed = walkSpd hum:Move(hrp.CFrame.LookVector, false) end
end)

local JBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Auto Jump: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
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

local NcBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "NOCLIP: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, NcBtn)
local isNoclip = false
RS.Stepped:Connect(function()
	if isNoclip and LP.Character then
		for _, part in ipairs(LP.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
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
	if isInfJump and LP.Character then
		local humanoid = LP.Character:FindFirstChildOfClass("Humanoid")
		if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
	end
end)
InfJBtn.MouseButton1Click:Connect(function()
	isInfJump = not isInfJump
	InfJBtn.Text = "INF JUMP: " .. (isInfJump and "ON 🚀" or "OFF")
	InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
end)

local SpinBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "BẬT XOAY", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, SpinBtn)
local SpinBox = C("TextBox", {Size = UDim2.new(0.98, 0, 0, 35), Text = "100", PlaceholderText = "Tốc độ xoay (1-10000)", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(20, 20, 28)}, P1)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, SpinBox)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1}, SpinBox)

local spinning, angularVelocity, attachment = false, nil, nil
local function getSpinSpeed() return math.clamp(tonumber(SpinBox.Text) or 100, 1, 10000) end
local function stopSpin()
	spinning = false SpinBtn.Text = "BẬT XOAY" SpinBtn.TextColor3 = Color3.fromRGB(255, 70, 70)
	if angularVelocity then angularVelocity:Destroy() angularVelocity = nil end
	if attachment then attachment:Destroy() attachment = nil end
end
local function startSpin()
	local char = LP.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	if angularVelocity then angularVelocity:Destroy() end
	if attachment then attachment:Destroy() end
	attachment = Instance.new("Attachment", hrp)
	angularVelocity = Instance.new("AngularVelocity")
	angularVelocity.Attachment0 = attachment angularVelocity.MaxTorque = math.huge
	angularVelocity.AngularVelocity = Vector3.new(0, getSpinSpeed(), 0)
	angularVelocity.RelativeTo = Enum.ActuatorRelativeTo.World angularVelocity.Parent = hrp
	spinning = true SpinBtn.Text = "TẮT XOAY" SpinBtn.TextColor3 = Color3.fromRGB(80, 255, 80)
end
SpinBox:GetPropertyChangedSignal("Text"):Connect(function() if spinning and angularVelocity then angularVelocity.AngularVelocity = Vector3.new(0, getSpinSpeed(), 0) end end)
SpinBtn.MouseButton1Click:Connect(function() if spinning then stopSpin() else startSpin() end end)
LP.CharacterAdded:Connect(function() stopSpin() end)

-- ==================== TAB FLY & TP ====================
local FBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Fly: OFF", TextColor3 = Color3.fromRGB(255, 70, 70), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, FBtn)

local FlyContainer = C("Frame", {Size = UDim2.new(0.98, 0, 0, 45), BackgroundTransparency = 1}, P2)
local SlLbl = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = "Fly Speed: 50", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, BackgroundTransparency = 1, TextXAlignment = 0}, FlyContainer)
local SlBg = C("Frame", {Size = UDim2.new(1, 0, 0, 18), Position = UDim2.new(0, 0, 0, 22), BackgroundColor3 = Color3.fromRGB(40, 40, 50)}, FlyContainer)
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
SlBg.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dSl = true isDraggingMenu = true upSl(i) end end)
UIS.InputChanged:Connect(function(i) if dSl and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then upSl(i) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dSl = false isDraggingMenu = false end end)

FBtn.MouseButton1Click:Connect(function()
	isFly = not isFly
	FBtn.Text, FBtn.TextColor3 = "Fly: " .. (isFly and "ON" or "OFF"), isFly and Color3.fromRGB(80, 255, 80) or Color3.fromRGB(255, 70, 70)
	local c = LP.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end
	local hrp = c.HumanoidRootPart
	if isFly then
		bV = C("BodyVelocity", {MaxForce = Vector3.new(1e9, 1e9, 1e9), Velocity = Vector3.zero}, hrp)
		bG = C("BodyGyro", {MaxTorque = Vector3.new(1e9, 1e9, 1e9), CFrame = hrp.CFrame}, hrp)
		flyC = RS.RenderStepped:Connect(function()
			if isFly and hrp then
				local cam = workspace.CurrentCamera local hum = c:FindFirstChildOfClass("Humanoid")
				local m = hum and hum.MoveDirection or Vector3.zero
				bG.CFrame = cam.CFrame
				bV.Velocity = m.Magnitude > 0 and cam.CFrame.LookVector * (m.Magnitude * flySpd) or Vector3.zero
			end
		end)
	else
		if flyC then flyC:Disconnect() end if bV then bV:Destroy() end if bG then bG:Destroy() end
	end
end)

local TPBtn = C("TextButton", {Size = UDim2.new(0.98, 0, 0, 40), Text = "Nhận Tool Teleport", TextColor3 = Color3.fromRGB(0, 210, 255), TextSize = 15, Font = 4, BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, TPBtn)
TPBtn.MouseButton1Click:Connect(function()
	local t = Instance.new("Tool", LP.Backpack)
	t.Name, t.RequiresHandle = "TP Tool", false
	t.Activated:Connect(function()
		local m, c = LP:GetMouse(), LP.Character
		if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then c.HumanoidRootPart.CFrame = CFrame.new(m.Hit.Position + Vector3.new(0, 3, 0)) end
	end)
	TPBtn.Text = "Đã thêm TP Tool!" task.wait(1) TPBtn.Text = "Nhận Tool Teleport"
end)

-- PLAYER TRACKER & TROLL MENUS
local TogFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 40), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, TogFrame)
C("TextLabel", {Size = UDim2.new(0.65, 0, 1, 0), Position = UDim2.new(0.04, 0, 0, 0), Text = "Player Tracker", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, TogFrame)

local SwitchBG = C("Frame", {Size = UDim2.new(0, 50, 0, 24), Position = UDim2.new(1, -60, 0.5, -12), BackgroundColor3 = Color3.fromRGB(60, 60, 65)}, TogFrame)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SwitchBG)
local SwitchCircle = C("Frame", {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(0, 2, 0.5, -10), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, SwitchBG)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, SwitchCircle)
local SwitchClick = C("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = ""}, SwitchBG)

local mainFrame = C("Frame", {Size = UDim2.new(0, 240, 0, 300), Position = UDim2.new(1, -250, 0.05, 10), BackgroundColor3 = Color3.fromRGB(30, 30, 30), Active = true, Visible = false, ClipsDescendants = true}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, mainFrame)
C("UIStroke", {Color = Color3.fromRGB(0, 170, 255), Thickness = 1.5}, mainFrame)
drag(mainFrame)

local title = C("TextLabel", {Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(45, 45, 45), Text = "PLAYER TRACKER", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.SourceSansBold}, mainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, title)

local scrollingFrame = C("ScrollingFrame", {Size = UDim2.new(1, -12, 1, -95), Position = UDim2.new(0, 6, 0, 40), BackgroundTransparency = 1, CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 6, ClipsDescendants = true}, mainFrame)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)}, scrollingFrame)

local followBtn = C("TextButton", {Size = UDim2.new(1, -12, 0, 40), Position = UDim2.new(0, 6, 1, -48), Text = "AUTO FOLLOW: OFF", BackgroundColor3 = Color3.fromRGB(180, 50, 50), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 13}, mainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, followBtn)

local isTrackerEnabled = false
SwitchClick.MouseButton1Click:Connect(function()
	isTrackerEnabled = not isTrackerEnabled
	TS:Create(SwitchCircle, TweenInfo.new(0.2), {Position = isTrackerEnabled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)}):Play()
	TS:Create(SwitchBG, TweenInfo.new(0.2), {BackgroundColor3 = isTrackerEnabled and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 65)}):Play()
	mainFrame.Visible = isTrackerEnabled
end)

local selectedTarget, spectateTarget, isFollowing, followConnection = nil, nil, false, nil

local function setCameraTarget(player)
	if spectateTarget == player then
		spectateTarget = nil
		if LP.Character and LP.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LP.Character.Humanoid end
	else
		spectateTarget = player
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = player.Character.Humanoid end
	end
end

RS.RenderStepped:Connect(function()
	if spectateTarget and spectateTarget.Character and spectateTarget.Character:FindFirstChild("Humanoid") then
		Camera.CameraSubject = spectateTarget.Character.Humanoid
	end
end)

local function teleportTo(targetPlayer)
	if targetPlayer and targetPlayer.Character then
		local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		local myChar = LP.Character local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if targetHRP and myHRP then myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 1.8) end
	end
end

local function startFollowing()
	if followConnection then followConnection:Disconnect() end
	followConnection = RS.RenderStepped:Connect(function()
		if isFollowing and selectedTarget and selectedTarget.Character then
			local targetHRP = selectedTarget.Character:FindFirstChild("HumanoidRootPart")
			local myChar = LP.Character local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
			if targetHRP and myHRP then myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 1.8) end
		end
	end)
end

local function refreshPlayerList()
	for _, child in pairs(scrollingFrame:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
	for _, player in pairs(LP:GetPlayers()) do
		if player ~= LP then
			local itemFrame = C("Frame", {Size = UDim2.new(1, -6, 0, 35), BackgroundColor3 = Color3.fromRGB(45, 45, 45)}, scrollingFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 6)}, itemFrame)
			local nameBtn = C("TextButton", {Size = UDim2.new(0.65, 0, 1, 0), Text = " " .. player.DisplayName, TextXAlignment = 0, BackgroundColor3 = (selectedTarget == player) and Color3.fromRGB(0, 150, 200) or Color3.fromRGB(55, 55, 55), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSans, TextSize = 13}, itemFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 6)}, nameBtn)
			local isViewing = (spectateTarget == player)
			local visBtn = C("TextButton", {Size = UDim2.new(0.32, 0, 0.8, 0), Position = UDim2.new(0.66, 2, 0.1, 0), Text = isViewing and "CAM: ON" or "CAM: OFF", BackgroundColor3 = isViewing and Color3.fromRGB(50, 180, 50) or Color3.fromRGB(150, 50, 50), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 11}, itemFrame)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, visBtn)
			nameBtn.MouseButton1Click:Connect(function() selectedTarget = player teleportTo(player) refreshPlayerList() end)
			visBtn.MouseButton1Click:Connect(function() setCameraTarget(player) refreshPlayerList() end)
		end
	end
end

followBtn.MouseButton1Click:Connect(function()
	if not selectedTarget then return end
	isFollowing = not isFollowing
	if isFollowing then
		followBtn.Text = "FOLLOWING: " .. string.upper(selectedTarget.DisplayName) followBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 50) startFollowing()
	else
		followBtn.Text = "AUTO FOLLOW: OFF" followBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50) if followConnection then followConnection:Disconnect() end
	end
end)

-- TROLL PLAYER MENU
local TrollTogFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 40), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, P2)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, TrollTogFrame)
C("TextLabel", {Size = UDim2.new(0.65, 0, 1, 0), Position = UDim2.new(0.04, 0, 0, 0), Text = "Troll Player 🤫", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, TrollTogFrame)

local TrollSwBG = C("Frame", {Size = UDim2.new(0, 50, 0, 24), Position = UDim2.new(1, -60, 0.5, -12), BackgroundColor3 = Color3.fromRGB(60, 60, 65)}, TrollTogFrame)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, TrollSwBG)
local TrollSwCircle = C("Frame", {Size = UDim2.new(0, 20, 0, 20), Position = UDim2.new(0, 2, 0.5, -10), BackgroundColor3 = Color3.fromRGB(200, 200, 200)}, TrollSwBG)
C("UICorner", {CornerRadius = UDim.new(1, 0)}, TrollSwCircle)
local TrollSwClick = C("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = ""}, TrollSwBG)

local trollMainFrame = C("Frame", {Size = UDim2.new(0, 240, 0, 280), Position = UDim2.new(1, -250, 0.05, 10), BackgroundColor3 = Color3.fromRGB(25, 25, 25), Active = true, Visible = false, ClipsDescendants = true}, SG)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, trollMainFrame)
C("UIStroke", {Color = Color3.fromRGB(255, 80, 80), Thickness = 1.5}, trollMainFrame)
drag(trollMainFrame)

local trollTitle = C("TextLabel", {Size = UDim2.new(1, 0, 0, 35), BackgroundColor3 = Color3.fromRGB(40, 40, 40), Text = "TROLL PLAYER 🤫", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Font = Enum.Font.SourceSansBold}, trollMainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 10)}, trollTitle)

local trollScrollList = C("ScrollingFrame", {Size = UDim2.new(1, -12, 1, -115), Position = UDim2.new(0, 6, 0, 40), BackgroundColor3 = Color3.fromRGB(35, 35, 35), CanvasSize = UDim2.new(0, 0, 0, 0), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollBarThickness = 6, ClipsDescendants = true}, trollMainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, trollScrollList)
C("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4)}, trollScrollList)

local toggleTrollBtn = C("TextButton", {Size = UDim2.new(1, -12, 0, 32), Position = UDim2.new(0, 6, 1, -70), Text = "CHỌN NGƯỜI ĐỂ TROLL", BackgroundColor3 = Color3.fromRGB(100, 100, 100), TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.SourceSansBold, TextSize = 12}, trollMainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, toggleTrollBtn)

local refreshTrollBtn = C("TextButton", {Size = UDim2.new(1, -12, 0, 26), Position = UDim2.new(0, 6, 1, -32), Text = "Làm mới danh sách", BackgroundColor3 = Color3.fromRGB(60, 60, 60), TextColor3 = Color3.fromRGB(200, 200, 200), Font = Enum.Font.SourceSans, TextSize = 11}, trollMainFrame)
C("UICorner", {CornerRadius = UDim.new(0, 6)}, refreshTrollBtn)

local isTrollMenuEnabled = false
TrollSwClick.MouseButton1Click:Connect(function()
	isTrollMenuEnabled = not isTrollMenuEnabled
	TS:Create(TrollSwCircle, TweenInfo.new(0.2), {Position = isTrollMenuEnabled and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)}):Play()
	TS:Create(TrollSwBG, TweenInfo.new(0.2), {BackgroundColor3 = isTrollMenuEnabled and Color3.fromRGB(255, 80, 80) or Color3.fromRGB(60, 60, 65)}):Play()
	trollMainFrame.Visible = isTrollMenuEnabled
end)

local trollTargetPlayer, isTrolling, trollConnection = nil, false, nil

local function stopTroll()
	isTrolling = false trollTargetPlayer = nil
	toggleTrollBtn.Text = "CHỌN NGƯỜI ĐỂ TROLL" toggleTrollBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	if LP.Character and LP.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LP.Character.Humanoid end
	if trollConnection then trollConnection:Disconnect() trollConnection = nil end
end

local function startTroll(plr)
	if plr == LP then return end
	trollTargetPlayer, isTrolling = plr, true
	toggleTrollBtn.Text = "TẮT TROLL: " .. plr.DisplayName toggleTrollBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
	if trollConnection then trollConnection:Disconnect() end
	local cycleTime = 0
	trollConnection = RS.RenderStepped:Connect(function(dt)
		if not isTrolling or not trollTargetPlayer or not trollTargetPlayer.Character then stopTroll() return end
		local myChar, targetChar = LP.Character, trollTargetPlayer.Character
		local myHrp, targetHrp = myChar and myChar:FindFirstChild("HumanoidRootPart"), targetChar and targetChar:FindFirstChild("HumanoidRootPart")
		local targetHumanoid = targetChar and targetChar:FindFirstChild("Humanoid")
		if myHrp and targetHrp and targetHumanoid then
			Camera.CameraSubject = targetHumanoid
			cycleTime = cycleTime + dt * 10
			myHrp.CFrame = targetHrp.CFrame * CFrame.new(0, 0, 1.55 + math.sin(cycleTime) * 0.45)
		end
	end)
end

local function updateTrollPlayerList()
	for _, child in pairs(trollScrollList:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
	for _, plr in pairs(LP:GetPlayers()) do
		if plr ~= LP then
			local pBtn = C("TextButton", {Size = UDim2.new(1, -4, 0, 28), Text = " " .. plr.DisplayName .. " (@" .. plr.Name .. ")", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(50, 50, 50), Font = Enum.Font.SourceSans, TextSize = 12, TextXAlignment = 0}, trollScrollList)
			C("UICorner", {CornerRadius = UDim.new(0, 4)}, pBtn)
			pBtn.MouseButton1Click:Connect(function() startTroll(plr) end)
		end
	end
end

toggleTrollBtn.MouseButton1Click:Connect(stopTroll)
refreshTrollBtn.MouseButton1Click:Connect(updateTrollPlayerList)

LP.PlayerAdded:Connect(function() refreshPlayerList() updateTrollPlayerList() end)
LP.PlayerRemoving:Connect(function(player)
	if player == spectateTarget then spectateTarget = nil if LP.Character and LP.Character:FindFirstChild("Humanoid") then Camera.CameraSubject = LP.Character.Humanoid end end
	if player == selectedTarget then isFollowing = false selectedTarget = nil followBtn.Text = "AUTO FOLLOW: OFF" followBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50) if followConnection then followConnection:Disconnect() end end
	if player == trollTargetPlayer then stopTroll() end
	refreshPlayerList() updateTrollPlayerList()
end)

refreshPlayerList() updateTrollPlayerList()

-- ==================== TAB SETTINGS ====================
-- 1. HÌNH DẠNG LOGO
local LblShape = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = "Hình dạng Logo:", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, PSet)
local ShapeFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundTransparency = 1}, PSet)
local S1 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), Text = "Tròn", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, ShapeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, S1)
local S2 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.35, 0, 0, 0), Text = "Vuông", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, ShapeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, S2)
local S3 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.7, 0, 0, 0), Text = "Tam Giác", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, ShapeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, S3)

local function resetShapeBtns()
	S1.BackgroundColor3, S2.BackgroundColor3, S3.BackgroundColor3 = Color3.fromRGB(35, 35, 42), Color3.fromRGB(35, 35, 42), Color3.fromRGB(35, 35, 42)
	S1.TextColor3, S2.TextColor3, S3.TextColor3 = Color3.fromRGB(200, 200, 200), Color3.fromRGB(200, 200, 200), Color3.fromRGB(200, 200, 200)
end

S1.MouseButton1Click:Connect(function()
	resetShapeBtns() S1.BackgroundColor3 = Color3.fromRGB(0, 170, 255) S1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtnCorner.CornerRadius = UDim.new(0.5, 0)
end)
S2.MouseButton1Click:Connect(function()
	resetShapeBtns() S2.BackgroundColor3 = Color3.fromRGB(0, 170, 255) S2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtnCorner.CornerRadius = UDim.new(0, 4)
end)
S3.MouseButton1Click:Connect(function()
	resetShapeBtns() S3.BackgroundColor3 = Color3.fromRGB(0, 170, 255) S3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtnCorner.CornerRadius = UDim.new(0, 18)
end)

-- 2. KÍCH THƯỚC LOGO
local LblSize = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = "Kích thước Logo:", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, PSet)
local SizeFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundTransparency = 1}, PSet)
local Z1 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), Text = "Nhỏ", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, SizeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Z1)
local Z2 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.35, 0, 0, 0), Text = "Vừa", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, SizeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Z2)
local Z3 = C("TextButton", {Size = UDim2.new(0.3, 0, 1, 0), Position = UDim2.new(0.7, 0, 0, 0), Text = "To", TextColor3 = Color3.fromRGB(200, 200, 200), BackgroundColor3 = Color3.fromRGB(35, 35, 42)}, SizeFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, Z3)

local function resetSizeBtns()
	Z1.BackgroundColor3, Z2.BackgroundColor3, Z3.BackgroundColor3 = Color3.fromRGB(35, 35, 42), Color3.fromRGB(35, 35, 42), Color3.fromRGB(35, 35, 42)
	Z1.TextColor3, Z2.TextColor3, Z3.TextColor3 = Color3.fromRGB(200, 200, 200), Color3.fromRGB(200, 200, 200), Color3.fromRGB(200, 200, 200)
end

Z1.MouseButton1Click:Connect(function()
	resetSizeBtns() Z1.BackgroundColor3 = Color3.fromRGB(0, 170, 255) Z1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtn.Size = UDim2.new(0, 40, 0, 40)
end)
Z2.MouseButton1Click:Connect(function()
	resetSizeBtns() Z2.BackgroundColor3 = Color3.fromRGB(0, 170, 255) Z2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtn.Size = UDim2.new(0, 55, 0, 55)
end)
Z3.MouseButton1Click:Connect(function()
	resetSizeBtns() Z3.BackgroundColor3 = Color3.fromRGB(0, 170, 255) Z3.TextColor3 = Color3.fromRGB(255, 255, 255)
	TBtn.Size = UDim2.new(0, 70, 0, 70)
end)

-- 3. MÀU CHỦ ĐẠO MENU
local LblColor = C("TextLabel", {Size = UDim2.new(1, 0, 0, 20), Text = "Màu chủ đạo Menu:", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = 4, TextXAlignment = 0, BackgroundTransparency = 1}, PSet)
local ColorFrame = C("Frame", {Size = UDim2.new(0.98, 0, 0, 35), BackgroundTransparency = 1}, PSet)
local C1 = C("TextButton", {Size = UDim2.new(0.22, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), Text = "Xanh", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 170, 255)}, ColorFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, C1)
local C2 = C("TextButton", {Size = UDim2.new(0.22, 0, 1, 0), Position = UDim2.new(0.26, 0, 0, 0), Text = "Đỏ", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(255, 60, 60)}, ColorFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, C2)
local C3 = C("TextButton", {Size = UDim2.new(0.22, 0, 1, 0), Position = UDim2.new(0.52, 0, 0, 0), Text = "Tím", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(170, 0, 255)}, ColorFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, C3)
local C4 = C("TextButton", {Size = UDim2.new(0.22, 0, 1, 0), Position = UDim2.new(0.78, 0, 0, 0), Text = "Lá", TextColor3 = Color3.fromRGB(255, 255, 255), BackgroundColor3 = Color3.fromRGB(0, 220, 100)}, ColorFrame)
C("UICorner", {CornerRadius = UDim.new(0, 8)}, C4)

local function setThemeColor(color)
	TBtnStroke.Color = color
	MainStroke.Color = color
	TitleTxt.TextColor3 = color
	WBox:FindFirstChildOfClass("UIStroke").Color = color
	SpinBox:FindFirstChildOfClass("UIStroke").Color = color
	SlFl.BackgroundColor3 = color
	TPBtn.TextColor3 = color
	mainFrame:FindFirstChildOfClass("UIStroke").Color = color
	if Tb1.BackgroundColor3 == Color3.fromRGB(0, 170, 255) then Tb1.BackgroundColor3 = color end
	if Tb2.BackgroundColor3 == Color3.fromRGB(0, 170, 255) then Tb2.BackgroundColor3 = color end
	if TbSet.BackgroundColor3 == Color3.fromRGB(0, 170, 255) then TbSet.BackgroundColor3 = color end
end

C1.MouseButton1Click:Connect(function() setThemeColor(Color3.fromRGB(0, 170, 255)) end)
C2.MouseButton1Click:Connect(function() setThemeColor(Color3.fromRGB(255, 60, 60)) end)
C3.MouseButton1Click:Connect(function() setThemeColor(Color3.fromRGB(170, 0, 255)) end)
C4.MouseButton1Click:Connect(function() setThemeColor(Color3.fromRGB(0, 220, 100)) end)

-- LOGIC MỜ/MỞ MENU CHÍNH
TBtn.MouseButton1Click:Connect(function()
	Main.Visible = not Main.Visible
end)
CBtn.MouseButton1Click:Connect(function()
	Main.Visible = false
end)
