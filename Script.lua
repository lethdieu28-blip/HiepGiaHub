local TS,UIS,RS,LP=game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("Players")
local LocalPlayer=LP.LocalPlayer
local Workspace=game:GetService("Workspace")
local Camera=Workspace.CurrentCamera

local SG=Instance.new("ScreenGui",game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")) SG.Name="HiepGiaHubGui" SG.ResetOnSpawn=false
local function C(cls,p,parent) local o=Instance.new(cls) for k,v in pairs(p) do o[k]=v end if parent then o.Parent=parent end return o end

local isDraggingMenu=false
local function drag(g) local d,sP,dS g.InputBegan:Connect(function(i) if not isDraggingMenu and (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) then d,dS,sP=true,i.Position,g.Position end end) UIS.InputChanged:Connect(function(i) if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local delta=i.Position-dS g.Position=UDim2.new(sP.X.Scale,sP.X.Offset+delta.X,sP.Y.Scale,sP.Y.Offset+delta.Y) end end) UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=false end end) end

local TBtn=C("ImageButton",{Image="rbxassetid://99351037294920",Position=UDim2.new(0.03,0,0.2,0),Size=UDim2.new(0,55,0,55),BackgroundColor3=Color3.fromRGB(20,20,20),BackgroundTransparency=0.2},SG)
C("UICorner",{CornerRadius=UDim.new(0,12)},TBtn) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},TBtn) drag(TBtn)

local Main=C("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0.85,0,0.8,0),BackgroundColor3=Color3.fromRGB(25,25,30),Visible=false,ClipsDescendants=true},SG)
C("UICorner",{CornerRadius=UDim.new(0,15)},Main) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},Main) drag(Main)

local Hd=C("Frame",{Size=UDim2.new(1,0,0,45),BackgroundColor3=Color3.fromRGB(15,15,20)},Main) C("UICorner",{CornerRadius=UDim.new(0,15)},Hd)
C("TextLabel",{Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0.03,0,0,0),Text="HiepGia—Hub",TextColor3=Color3.fromRGB(0,210,255),TextSize=20,Font=4,TextXAlignment=0,BackgroundTransparency=1},Hd)
local CBtn=C("TextButton",{Size=UDim2.new(0,35,0,35),Position=UDim2.new(1,-42,0.5,-17),Text="✕",TextColor3=Color3.fromRGB(255,80,80),TextSize=18,Font=4,BackgroundColor3=Color3.fromRGB(35,35,40)},Hd) C("UICorner",{CornerRadius=UDim.new(0,8)},CBtn)

local Sb=C("Frame",{Size=UDim2.new(0.25,0,1,-50),Position=UDim2.new(0,5,0,50),BackgroundColor3=Color3.fromRGB(18,18,22),BackgroundTransparency=0.5},Main) C("UICorner",{CornerRadius=UDim.new(0,10)},Sb)
local Pc=C("Frame",{Size=UDim2.new(0.73,0,1,-50),Position=UDim2.new(0.26,0,0,50),BackgroundTransparency=1,ClipsDescendants=true},Main)

local Tb1=C("TextButton",{Size=UDim2.new(0.9,0,0,40),Position=UDim2.new(0.05,0,0,10),Text="Main",TextColor3=Color3.fromRGB(255,255,255),TextSize=16,Font=4,BackgroundColor3=Color3.fromRGB(0,170,255)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb1)
local Tb2=C("TextButton",{Size=UDim2.new(0.9,0,0,40),Position=UDim2.new(0.05,0,0,60),Text="Fly & TP",TextColor3=Color3.fromRGB(200,200,200),TextSize=16,Font=4,BackgroundColor3=Color3.fromRGB(30,30,35)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb2)

-- KHUNG SCROLLING FRAME CHO TAB MAIN (P1)
local P1=C("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=true,ClipsDescendants=true,ScrollBarThickness=5,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y},Pc)
local L1=C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},P1)
C("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,5)},P1)

-- KHUNG SCROLLING FRAME CHO TAB FLY & TP (P2)
local P2=C("ScrollingFrame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false,ClipsDescendants=true,ScrollBarThickness=5,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y},Pc)
local L2=C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},P2)
C("UIPadding",{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,10),PaddingLeft=UDim.new(0,2),PaddingRight=UDim.new(0,5)},P2)

Tb1.MouseButton1Click:Connect(function() P1.Visible,P2.Visible=true,false Tb1.BackgroundColor3,Tb2.BackgroundColor3=Color3.fromRGB(0,170,255),Color3.fromRGB(30,30,35) end)
Tb2.MouseButton1Click:Connect(function() P1.Visible,P2.Visible=false,true Tb2.BackgroundColor3,Tb1.BackgroundColor3=Color3.fromRGB(0,170,255),Color3.fromRGB(30,30,35) end)

-- ==================== TAB MAIN ====================
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
	NcBtn.TextColor3 = isNoclip and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70)
end)

-- 4. INFINITE JUMP
local InfJBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="INF JUMP: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},InfJBtn)
local isInfJump=false
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
	InfJBtn.TextColor3 = isInfJump and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70)
end)


-- ==================== TAB FLY & TP ====================
local FBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Fly: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},FBtn)

local FlyContainer=C("Frame",{Size=UDim2.new(0.98,0,0,45),BackgroundTransparency=1},P2)
local SlLbl=C("TextLabel",{Size=UDim2.new(1,0,0,20),Position=UDim2.new(0,0,0,0),Text="Fly Speed: 50",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,BackgroundTransparency=1,TextXAlignment=0},FlyContainer)
local SlBg=C("Frame",{Size=UDim2.new(1,0,0,18),Position=UDim2.new(0,0,0,22),BackgroundColor3=Color3.fromRGB(40,40,50)},FlyContainer) C("UICorner",{CornerRadius=UDim.new(1,0)},SlBg)
local SlFl=C("Frame",{Size=UDim2.new(0.005,0,1,0),BackgroundColor3=Color3.fromRGB(0,170,255)},SlBg) C("UICorner",{CornerRadius=UDim.new(1,0)},SlFl)

local flySpd,isFly,bV,bG,flyC,dSl=50,false
local function upSl(i) local pos=math.clamp((i.Position.X-SlBg.AbsolutePosition.X)/SlBg.AbsoluteSize.X,0,1) SlFl.Size=UDim2.new(math.max(pos,0.01),0,1,0) flySpd=math.floor(10+(pos*9990)) SlLbl.Text="Fly Speed: "..flySpd end
SlBg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=true isDraggingMenu=true upSl(i) end end)
UIS.InputChanged:Connect(function(i) if dSl and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upSl(i) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=false isDraggingMenu=false end end)

FBtn.MouseButton1Click:Connect(function() isFly=not isFly FBtn.Text,FBtn.TextColor3="Fly: "..(isFly and "ON" or "OFF"),isFly and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) local c=LocalPlayer.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end local hrp=c.HumanoidRootPart
if isFly then bV=C("BodyVelocity",{MaxForce=Vector3.new(1e9,1e9,1e9),Velocity=Vector3.zero},hrp) bG=C("BodyGyro",{MaxTorque=Vector3.new(1e9,1e9,1e9),CFrame=hrp.CFrame},hrp) flyC=RS.RenderStepped:Connect(function() if isFly and hrp then local cam=workspace.CurrentCamera local hum=c:FindFirstChildOfClass("Humanoid") local m=hum and hum.MoveDirection or Vector3.zero bG.CFrame=cam.CFrame bV.Velocity=m.Magnitude>0 and cam.CFrame.LookVector*(m.Magnitude*flySpd) or Vector3.zero end end) else if flyC then flyC:Disconnect() end if bV then bV:Destroy() end if bG then bG:Destroy() end end end)

-- TOOL TELEPORT
local TPBtn=C("TextButton",{Size=UDim2.new(0.98,0,0,40),Text="Nhận Tool Teleport",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},TPBtn)
TPBtn.MouseButton1Click:Connect(function() local t=Instance.new("Tool",LocalPlayer.Backpack) t.Name,t.RequiresHandle="TP Tool",false t.Activated:Connect(function() local m,c=LocalPlayer:GetMouse(),LocalPlayer.Character if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then c.HumanoidRootPart.CFrame=CFrame.new(m.Hit.Position+Vector3.new(0,3,0)) end end) TPBtn.Text="Đã thêm TP Tool!" task.wait(1) TPBtn.Text="Nhận Tool Teleport" end)

-- NÚT GẠT BẬT/TẮT PLAYER TRACKER
local TogFrame=C("Frame",{Size=UDim2.new(0.98,0,0,40),BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},TogFrame)
C("TextLabel",{Size=UDim2.new(0.65,0,1,0),Position=UDim2.new(0.04,0,0,0),Text="Player Tracker",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=4,TextXAlignment=0,BackgroundTransparency=1},TogFrame)

local SwitchBG=C("Frame",{Size=UDim2.new(0,50,0,24),Position=UDim2.new(1,-60,0.5,-12),BackgroundColor3=Color3.fromRGB(60,60,65)},TogFrame) C("UICorner",{CornerRadius=UDim.new(1,0)},SwitchBG)
local SwitchCircle=C("Frame",{Size=UDim2.new(0,20,0,20),Position=UDim2.new(0,2,0.5,-10),BackgroundColor3=Color3.fromRGB(200,200,200)},SwitchBG) C("UICorner",{CornerRadius=UDim.new(1,0)},SwitchCircle)
local SwitchClick=C("TextButton",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=""},SwitchBG)

-- KHUNG HỆ THỐNG MENU TRACKER (MẶC ĐỊNH ẨN)
local mainFrame=C("Frame",{Size=UDim2.new(0,240,0,300),Position=UDim2.new(1,-250,0.05,10),BackgroundColor3=Color3.fromRGB(30,30,30),Active=true,Draggable=true,Visible=false,ClipsDescendants=true},SG)
C("UICorner",{CornerRadius=UDim.new(0,10)},mainFrame) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1.5},mainFrame) drag(mainFrame)

local title=C("TextLabel",{Size=UDim2.new(1,0,0,35),BackgroundColor3=Color3.fromRGB(45,45,45),Text="PLAYER TRACKER",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=Enum.Font.SourceSansBold},mainFrame)
C("UICorner",{CornerRadius=UDim.new(0,10)},title)

local scrollingFrame=C("ScrollingFrame",{Size=UDim2.new(1,-12,1,-95),Position=UDim2.new(0,6,0,40),BackgroundTransparency=1,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=6,ClipsDescendants=true},mainFrame)
local UIListLayout=C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,6)},scrollingFrame)

local followBtn=C("TextButton",{Size=UDim2.new(1,-12,0,40),Position=UDim2.new(0,6,1,-48),Text="AUTO FOLLOW: OFF",BackgroundColor3=Color3.fromRGB(180,50,50),TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.SourceSansBold,TextSize=13},mainFrame)
C("UICorner",{CornerRadius=UDim.new(0,8)},followBtn)

local isTrackerEnabled=false
SwitchClick.MouseButton1Click:Connect(function()
	isTrackerEnabled=not isTrackerEnabled
	TS:Create(SwitchCircle,TweenInfo.new(0.2),{Position=isTrackerEnabled and UDim2.new(1,-22,0.5,-10) or UDim2.new(0,2,0.5,-10)}):Play()
	TS:Create(SwitchBG,TweenInfo.new(0.2),{BackgroundColor3=isTrackerEnabled and Color3.fromRGB(0,170,255) or Color3.fromRGB(60,60,65)}):Play()
	
	mainFrame.Visible=isTrackerEnabled
end)

local selectedTarget,spectateTarget,isFollowing,followConnection=nil,nil,false,nil

local function setCameraTarget(player)
	if spectateTarget==player then
		spectateTarget=nil
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Camera.CameraSubject=LocalPlayer.Character.Humanoid end
	else
		spectateTarget=player
		if player and player.Character and player.Character:FindFirstChild("Humanoid") then Camera.CameraSubject=player.Character.Humanoid end
	end
end

RS.RenderStepped:Connect(function()
	if spectateTarget then
		if spectateTarget.Character and spectateTarget.Character:FindFirstChild("Humanoid") then Camera.CameraSubject=spectateTarget.Character.Humanoid end
	else
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and Camera.CameraSubject~=LocalPlayer.Character.Humanoid then Camera.CameraSubject=LocalPlayer.Character.Humanoid end
	end
end)

local function teleportTo(targetPlayer)
	if targetPlayer and targetPlayer.Character then
		local targetHRP=targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		local myChar=LocalPlayer.Character
		local myHRP=myChar and myChar:FindFirstChild("HumanoidRootPart")
		if targetHRP and myHRP then myHRP.CFrame=targetHRP.CFrame*CFrame.new(0,0,3) end
	end
end

local function startFollowing()
	if followConnection then followConnection:Disconnect() end
	followConnection=RS.RenderStepped:Connect(function()
		if isFollowing and selectedTarget and selectedTarget.Character then
			local targetHRP=selectedTarget.Character:FindFirstChild("HumanoidRootPart")
			local myChar=LocalPlayer.Character
			local myHRP=myChar and myChar:FindFirstChild("HumanoidRootPart")
			if targetHRP and myHRP then myHRP.CFrame=targetHRP.CFrame*CFrame.new(0,0,3) end
		end
	end)
end

local function refreshPlayerList()
	for _,child in pairs(scrollingFrame:GetChildren()) do if child:IsA("Frame") then child:Destroy() end end
	for _,player in pairs(LP:GetPlayers()) do
		if player~=LocalPlayer then
			local itemFrame=C("Frame",{Size=UDim2.new(1,-6,0,35),BackgroundColor3=Color3.fromRGB(45,45,45)},scrollingFrame)
			C("UICorner",{CornerRadius=UDim.new(0,6)},itemFrame)

			local nameBtn=C("TextButton",{Size=UDim2.new(0.65,0,1,0),Text=" "..player.DisplayName,TextXAlignment=0,BackgroundColor3=(selectedTarget==player) and Color3.fromRGB(0,150,200) or Color3.fromRGB(55,55,55),TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.SourceSans,TextSize=13},itemFrame)
			C("UICorner",{CornerRadius=UDim.new(0,6)},nameBtn)

			local isViewing=(spectateTarget==player)
			local visBtn=C("TextButton",{Size=UDim2.new(0.32,0,0.8,0),Position=UDim2.new(0.66,2,0.1,0),Text=isViewing and "CAM: ON" or "CAM: OFF",BackgroundColor3=isViewing and Color3.fromRGB(50,180,50) or Color3.fromRGB(150,50,50),TextColor3=Color3.fromRGB(255,255,255),Font=Enum.Font.SourceSansBold,TextSize=11},itemFrame)
			C("UICorner",{CornerRadius=UDim.new(0,4)},visBtn)

			nameBtn.MouseButton1Click:Connect(function() selectedTarget=player teleportTo(player) refreshPlayerList() end)
			visBtn.MouseButton1Click:Connect(function() setCameraTarget(player) refreshPlayerList() end)
		end
	end
end

followBtn.MouseButton1Click:Connect(function()
	if not selectedTarget then return end
	isFollowing=not isFollowing
	if isFollowing then
		followBtn.Text="FOLLOWING: "..string.upper(selectedTarget.DisplayName)
		followBtn.BackgroundColor3=Color3.fromRGB(50,180,50)
		startFollowing()
	else
		followBtn.Text="AUTO FOLLOW: OFF"
		followBtn.BackgroundColor3=Color3.fromRGB(180,50,50)
		if followConnection then followConnection:Disconnect() end
	end
end)

LP.PlayerAdded:Connect(refreshPlayerList)
LP.PlayerRemoving:Connect(function(player)
	if player==spectateTarget then
		spectateTarget=nil
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then Camera.CameraSubject=LocalPlayer.Character.Humanoid end
	end
	if player==selectedTarget then
		isFollowing=false
		selectedTarget=nil
		followBtn.Text="AUTO FOLLOW: OFF"
		followBtn.BackgroundColor3=Color3.fromRGB(180,50,50)
		if followConnection then followConnection:Disconnect() end
	end
	refreshPlayerList()
end)

refreshPlayerList()

local isOpen,nS,zS=false,UDim2.new(0.85,0,0.8,0),UDim2.new(0,0,0,0)
local function tog() isOpen=not isOpen if isOpen then Main.Size,Main.Visible=zS,true TS:Create(Main,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=nS}):Play() else local tw=TS:Create(Main,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=zS}) tw:Play() tw.Completed:Connect(function() if not isOpen then Main.Visible=false end end) end end
TBtn.MouseButton1Click:Connect(tog) CBtn.MouseButton1Click:Connect(tog)
