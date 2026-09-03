local TS,UIS,RS,LP=game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("Players")
local LocalPlayer=LP.LocalPlayer
local Workspace=game:GetService("Workspace")
local Camera=Workspace.CurrentCamera

local SG=Instance.new("ScreenGui",game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")) SG.Name="HiepGiaHubGui" SG.ResetOnSpawn=false
local function C(cls,p,parent) local o=Instance.new(cls) for k,v in pairs(p) do o[k]=v end if parent then o.Parent=parent end return o end

-- HÀM DRAG ĐỘC LẬP SCOPE (KHÔNG BỊ KẸT CLICK)
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

local TBtn=C("ImageButton",{Image="rbxassetid://99351037294920",Position=UDim2.new(0.03,0,0.2,0),Size=UDim2.new(0,55,0,55),BackgroundColor3=Color3.fromRGB(20,20,20),BackgroundTransparency=0.2},SG)
C("UICorner",{CornerRadius=UDim.new(0,12)},TBtn) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},TBtn) drag(TBtn)

local Main=C("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0.85,0,0.8,0),BackgroundColor3=Color3.fromRGB(25,25,30),Visible=false,ClipsDescendants=true},SG)
C("UICorner",{CornerRadius=UDim.new(0,15)},Main) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},Main) drag(Main)

local Hd=C("Frame",{Size=UDim2.new(1,0,0,45),BackgroundColor3=Color3.fromRGB(15,15,20)},Main) C("UICorner",{CornerRadius=UDim.new(0,15)},Hd)
C("TextLabel",{Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0.03,0,0,0),Text="HiepGia—Hub",TextColor3=Color3.fromRGB(0,210,255),TextSize=20,Font=4,TextXAlignment=0,BackgroundTransparency=1},Hd)
local CBtn=C("TextButton",{Size=UDim2.new(0,35,0,35),Position=UDim2.new(1,-42,0.5,-17),Text="✕",TextColor3=Color3.fromRGB(255,80,80),TextSize=18,Font=4,BackgroundColor3=Color3.fromRGB(35,35,40)},Hd) C("UICorner",{CornerRadius=UDim.new(0,8)},CBtn)

local Sb=C("Frame",{Size=UDim2.new(0.25,0,1,-50),Position=UDim2.new(0,5,0,50),BackgroundColor3=Color3.fromRGB(18,18,22),BackgroundTransparency=0.5},Main) C("UICorner",{CornerRadius=UDim.new(0,10)},Sb)
local Pc=C("Frame",{Size=UDim2.new(0.73,0,1,-50),Position=UDim2.new(0.26,0,0,50),BackgroundTransparency=1,ClipsDescendants=true},Main)

-- CÁC NÚT TAB (MAIN, FLY & TP, SETTING)
local Tb1=C("TextButton",{Size=UDim2.new(0.9,0,0,35),Position=UDim2.new(0.05,0,0,10),Text="Main",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=4,BackgroundColor3=Color3.fromRGB(0,170,255)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb1)
local Tb2=C("TextButton",{Size=UDim2.new(0.9,0,0,35),Position=UDim2.new(0.05,0,0,50),Text="Fly & TP",TextColor3=Color3.fromRGB(200,200,200),TextSize=14,Font=4,BackgroundColor3=Color3.fromRGB(30,30,35)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb2)
local Tb3=C("TextButton",{Size=UDim2.new(0.9,0,0,35),Position=UDim2.new(0.05,0,0,90),Text="Setting",TextColor3=Color3.fromRGB(200,200,200),TextSize=14,Font=4,BackgroundColor3=Color3.fromRGB(30,30,35)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb3)

-- KHUNG NỘI DUNG TỪNG TAB
local P1=C("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=true,ClipsDescendants=true,ScrollBarThickness=5,AutomaticCanvasSize=Enum.AutomaticSize.Y},Pc)
C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},P1) C("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,5)},P1)

local P2=C("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false,ClipsDescendants=true,ScrollBarThickness=5,AutomaticCanvasSize=Enum.AutomaticSize.Y},Pc)
C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},P2) C("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,5)},P2)

local P3=C("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false,ClipsDescendants=true,ScrollBarThickness=5,AutomaticCanvasSize=Enum.AutomaticSize.Y},Pc)
C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},P3) C("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,5)},P3)

local tabs = {[Tb1]=P1, [Tb2]=P2, [Tb3]=P3}
for btn, page in pairs(tabs) do
	btn.MouseButton1Click:Connect(function()
		for b, p in pairs(tabs) do
			p.Visible = (p == page)
			b.BackgroundColor3 = (b == btn) and Color3.fromRGB(0,170,255) or Color3.fromRGB(30,30,35)
			b.TextColor3 = (b == btn) and Color3.fromRGB(255,255,255) or Color3.fromRGB(200,200,200)
		end
	end)
end

-- ==================== TAB 1: MAIN ====================
-- 1. WALK SPEED
local WBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="WALK SPEED: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},WBtn)
local WBox=C("TextBox",{Size=UDim2.new(0.98,0,0,35),Text="300",PlaceholderText="Tốc độ 1 - 10000",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(20,20,28)},P1) C("UICorner",{CornerRadius=UDim.new(0,8)},WBox) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1},WBox)

local walkSpd,aW=300,false
local function resetSpd() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=16 end end
WBox.FocusLost:Connect(function() local n=tonumber(WBox.Text) walkSpd=n and math.clamp(n,1,10000) or 300 WBox.Text=tostring(walkSpd) end)
WBtn.MouseButton1Click:Connect(function() aW=not aW WBtn.Text="WALK SPEED: "..(aW and "ON" or "OFF") WBtn.TextColor3=aW and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) if not aW then resetSpd() end end)
RS.Heartbeat:Connect(function() if not aW or not LocalPlayer.Character then return end local hum,hrp=LocalPlayer.Character:FindFirstChildOfClass("Humanoid"),LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if hum and hrp then hum.WalkSpeed=walkSpd hum:Move(hrp.CFrame.LookVector,false) end end)

-- 2. AUTO JUMP
local JBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Auto Jump: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},JBtn)
local aJ=false task.spawn(function() while true do if aJ and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h.FloorMaterial~=Enum.Material.Air then h:ChangeState(Enum.HumanoidStateType.Jumping) end end task.wait(0.05) end end)
JBtn.MouseButton1Click:Connect(function() aJ=not aJ JBtn.Text="Auto Jump: "..(aJ and "ON" or "OFF") JBtn.TextColor3=aJ and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) end)

-- 3. NOCLIP
local NcBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="NOCLIP: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},NcBtn)
local isNoclip=false
RS.Stepped:Connect(function() if isNoclip and LocalPlayer.Character then for _, part in ipairs(LocalPlayer.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end end)
NcBtn.MouseButton1Click:Connect(function() isNoclip = not isNoclip NcBtn.Text = "NOCLIP: " .. (isNoclip and "ON 👻" or "OFF") NcBtn.TextColor3 = isNoclip and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) end)

-- 4. INFINITE JUMP
local InfJBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="INF JUMP: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},InfJBtn)
local isInfJump=false
UIS.JumpRequest:Connect(function() if isInfJump and LocalPlayer.Character then local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end end end)
InfJBtn.MouseButton1Click:Connect(function() isInfJump = not isInfJump InfJBtn.Text = "INF JUMP: " .. (isInfJump and "ON 🚀" or "OFF") InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) end)

-- 5. SPINBOT
local SpinBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="SPINBOT: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},SpinBtn)
local SpeedInput=C("TextBox",{Size=UDim2.new(0.98,0,0,35),Text="100",PlaceholderText="Tốc độ (1-10000)",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(20,20,28)},P1) C("UICorner",{CornerRadius=UDim.new(0,8)},SpeedInput) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1},SpeedInput)

local spinning = false
local angularVelocity = nil
local attachment = nil

local function getSpeed()
	local num = tonumber(SpeedInput.Text)
	if not num then return 100 end
	return math.clamp(num, 1, 10000)
end

local function stopSpin()
	spinning = false
	SpinBtn.Text = "SPINBOT: OFF"
	SpinBtn.TextColor3 = Color3.fromRGB(255,70,70)
	if angularVelocity then angularVelocity:Destroy() angularVelocity = nil end
	if attachment then attachment:Destroy() attachment = nil end
end

local function startSpin()
	local char = LocalPlayer.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	
	if angularVelocity then angularVelocity:Destroy() end
	if attachment then attachment:Destroy() end

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
	SpinBtn.TextColor3 = Color3.fromRGB(80,255,80)
end

SpeedInput:GetPropertyChangedSignal("Text"):Connect(function()
	if spinning and angularVelocity then
		angularVelocity.AngularVelocity = Vector3.new(0, getSpeed(), 0)
	end
end)

SpinBtn.MouseButton1Click:Connect(function()
	if spinning then stopSpin() else startSpin() end
end)

LP.CharacterAdded:Connect(function()
	stopSpin()
end)


-- ==================== TAB 2: FLY & TP + TROLL ====================
-- FLY
local FBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Fly: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},FBtn)

local FlyContainer=C("Frame",{Size=UDim2.new(0.98,0,0,45),BackgroundTransparency=1},P2)
local SlLbl=C("TextLabel",{Size=UDim2.new(1,0,0,20),Position=UDim2.new(0,0,0,0),Text="Fly Speed: 50",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,BackgroundTransparency=1,TextXAlignment=0},FlyContainer)
local SlBg=C("Frame",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,22),BackgroundColor3=Color3.fromRGB(40,40,50)},FlyContainer) C("UICorner",{CornerRadius=UDim.new(1,0)},SlBg)
local SlFl=C("Frame",{Size=UDim2.new(0.005,0,1,0),BackgroundColor3=Color3.fromRGB(0,170,255)},SlBg) C("UICorner",{CornerRadius=UDim.new(1,0)},SlFl)

local flySpd,isFly,bV,bG,flyC,dSl=50,false
local function upSl(i) local pos=math.clamp((i.Position.X-SlBg.AbsolutePosition.X)/SlBg.AbsoluteSize.X,0,1) SlFl.Size=UDim2.new(math.max(pos,0.01),0,1,0) flySpd=math.floor(10+(pos*9990)) SlLbl.Text="Fly Speed: "..flySpd end
SlBg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=true upSl(i) end end)
UIS.InputChanged:Connect(function(i) if dSl and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upSl(i) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=false end end)

FBtn.MouseButton1Click:Connect(function() isFly=not isFly FBtn.Text,FBtn.TextColor3="Fly: "..(isFly and "ON" or "OFF"),isFly and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) local c=LocalPlayer.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end local hrp=c.HumanoidRootPart
if isFly then bV=C("BodyVelocity",{MaxForce=Vector3.new(1e9,1e9,1e9),Velocity=Vector3.zero},hrp) bG=C("BodyGyro",{MaxTorque=Vector3.new(1e9,1e9,1e9),CFrame=hrp.CFrame},hrp) flyC=RS.RenderStepped:Connect(function() if isFly and hrp then local cam=workspace.CurrentCamera local hum=c:FindFirstChildOfClass("Humanoid") local m=hum and hum.MoveDirection or Vector3.zero bG.CFrame=cam.CFrame bV.Velocity=m.Magnitude>0 and cam.CFrame.LookVector*(m.Magnitude*flySpd) or Vector3.zero end end) else if flyC then flyC:Disconnect() end if bV then bV:Destroy() end if bG then bG:Destroy() end end end)

-- TOOL TELEPORT
local TPBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Nhận Tool Teleport",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},TPBtn)
TPBtn.MouseButton1Click:Connect(function() local t=Instance.new("Tool",LocalPlayer.Backpack) t.Name,t.RequiresHandle="TP Tool",false t.Activated:Connect(function() local m,c=LocalPlayer:GetMouse(),LocalPlayer.Character if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then c.HumanoidRootPart.CFrame=CFrame.new(m.Hit.Position+Vector3.new(0,3,0)) end end) TPBtn.Text="Đã thêm TP Tool!" task.wait(1) TPBtn.Text="Nhận Tool Teleport" end)

-- PLAYER TRACKER TOGGLE
local TogFrame=C("Frame",{Size=UDim2.new(0.98,0,0,40),BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},TogFrame)
C("TextLabel",{Size=UDim2.new(0.65,0,1,0),Position=UDim2.new(0.04,0,0,0),Text="Player Tracker",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=4,TextXAlignment=0,BackgroundTransparency=1},TogFrame)
local SwitchBG=C("Frame",{Size=UDim2.new(0,50,0,24),Position=UDim2.new(1,-60,0.5,-12),BackgroundColor3=Color3.fromRGB(60,60,65)},TogFrame) C("UICorner",{CornerRadius=UDim.new(1,0)},SwitchBG)
local SwitchCircle=C("Frame",{Size=UDim2.new(0,20,0,20),Position=UDim2.new(0,2,0.5,-10),BackgroundColor3=Color3.fromRGB(200,200,200)},SwitchBG) C("UICorner",{CornerRadius=UDim.new(1,0)},SwitchCircle)
local SwitchClick=C("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""},SwitchBG)

-- TROLL PLAYER (TÍCH HỢP TỪ CODE CỦA BẠN VÀO TAB 2)
local TrollHeader=C("TextLabel",{Size=UDim2.new(0.98,0,0,25),Text="--- TROLL PLAYER 🤫 ---",TextColor3=Color3.fromRGB(0,210,255),TextSize=14,Font=Enum.Font.SourceSansBold,BackgroundTransparency=1},P2)

local ToggleTrollBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="CHỌN NGƯỜI ĐỂ TROLL",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,Font=Enum.Font.SourceSansBold,BackgroundColor3=Color3.fromRGB(100,100,100)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},ToggleTrollBtn)

local RefreshBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,30),Text="Làm mới danh sách Troll",TextColor3=Color3.fromRGB(200,200,200),TextSize=12,Font=Enum.Font.SourceSans,BackgroundColor3=Color3.fromRGB(50,50,60)},P2) C("UICorner",{CornerRadius=UDim.new(0,8)},RefreshBtn)

local TrollScrollList=C("Frame",{Size=UDim2.new(0.98,0,0,130),BackgroundColor3=Color3.fromRGB(20,20,28)},P2) C("UICorner",{CornerRadius=UDim.new(0,8)},TrollScrollList) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1},TrollScrollList)
local ScrollList=C("ScrollingFrame",{Size=UDim2.new(1,-8,1,-8),Position=UDim2.new(0,4,0,4),BackgroundTransparency=1,ScrollBarThickness=5,AutomaticCanvasSize=Enum.AutomaticSize.Y},TrollScrollList)
C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4)},ScrollList)

local targetPlayer = nil
local isTrolling = false
local trollConnection = nil

local function stopTroll()
    isTrolling = false
    targetPlayer = nil
    ToggleTrollBtn.Text = "CHỌN NGƯỜI ĐỂ TROLL"
    ToggleTrollBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        Camera.CameraSubject = LocalPlayer.Character.Humanoid
    end
    
    if trollConnection then
        trollConnection:Disconnect()
        trollConnection = nil
    end
end

local function startTroll(plr)
    if plr == LocalPlayer then return end
    targetPlayer = plr
    isTrolling = true
    
    ToggleTrollBtn.Text = "TẮT TROLL: " .. plr.DisplayName
    ToggleTrollBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)

    if trollConnection then trollConnection:Disconnect() end

    local cycleTime = 0
    trollConnection = RS.RenderStepped:Connect(function(dt)
        if not isTrolling or not targetPlayer or not targetPlayer.Character then
            stopTroll()
            return
        end

        local myChar = LocalPlayer.Character
        local targetChar = targetPlayer.Character
        
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
        local targetHumanoid = targetChar and targetChar:FindFirstChild("Humanoid")

        if myHrp and targetHrp and targetHumanoid then
            Camera.CameraSubject = targetHumanoid
            cycleTime = cycleTime + dt * 10 
            local distanceOffset = 1.55 + math.sin(cycleTime) * 0.45
            local targetCFrame = targetHrp.CFrame
            myHrp.CFrame = targetCFrame * CFrame.new(0, 0, distanceOffset)
        end
    end)
end

local function updatePlayerList()
    for _, child in pairs(ScrollList:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local players = LP:GetPlayers()
    for _, plr in pairs(players) do
        if plr ~= LocalPlayer then
            local pBtn = C("TextButton",{Size=UDim2.new(1,-4,0,28),Text=plr.DisplayName .. " (@" .. plr.Name .. ")",TextColor3=Color3.fromRGB(255,255,255),BackgroundColor3=Color3.fromRGB(45,45,55),Font=Enum.Font.SourceSans,TextSize=12},ScrollList)
            C("UICorner",{CornerRadius=UDim.new(0,4)},pBtn)

            pBtn.MouseButton1Click:Connect(function()
                startTroll(plr)
            end)
        end
    end
end

ToggleTrollBtn.MouseButton1Click:Connect(stopTroll)
RefreshBtn.MouseButton1Click:Connect(updatePlayerList)

LP.PlayerAdded:Connect(updatePlayerList)
LP.PlayerRemoving:Connect(function(plr)
    if plr == targetPlayer then stopTroll() end
    updatePlayerList()
end)

updatePlayerList()


-- ==================== TAB 3: SETTING ====================
local ResetBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Reset Character",TextColor3=Color3.fromRGB(255,255,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(180,50,50)},P3) C("UICorner",{CornerRadius=UDim.new(0,10)},ResetBtn)
ResetBtn.MouseButton1Click:Connect(function()
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
	end
end)

local RejoinBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Rejoin Server",TextColor3=Color3.fromRGB(255,255,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(50,150,50)},P3) C("UICorner",{CornerRadius=UDim.new(0,10)},RejoinBtn)
RejoinBtn.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)


-- ==================== CỬA SỔ PLAYER TRACKER ====================
local mainFrame=C("Frame",{Size=UDim2.new(0,240,0,300),Position=UDim2.new(1,-250,0.05,10),BackgroundColor3=Color3.fromRGB(30,30,30),Active=true,Visible=false,ClipsDescendants=true},SG)
C("UICorner",{CornerRadius=UDim.new(0,10)},mainFrame) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1.5},mainFrame) drag(mainFrame)

local title=C("TextLabel",{Size=UDim2.new(1,0,0,35),BackgroundColor3=Color3.fromRGB(45,45,45),Text="PLAYER TRACKER",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=Enum.Font.SourceSansBold},mainFrame) C("UICorner",{CornerRadius=UDim.new(0,10)},title)
local scrollingFrame=C("ScrollingFrame",{Size=UDim2.new(1,-12,1,-95),Position=UDim2.new(0,6,0,40),BackgroundTransparency=1,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=6,ClipsDescendants=true},mainFrame)
C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,6)},scrollingFrame)
local followBtn=C("TextButton",{Size=UDim2.new(1,-12,0,40),Position=UDim2.new(0,6,1,-48),Text="AUTO FOLLOW: OFF",BackgroundColor3=Color
