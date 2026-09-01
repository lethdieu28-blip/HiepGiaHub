local TS,UIS,RS,LP=game:GetService("TweenService"),game:GetService("UserInputService"),game:GetService("RunService"),game:GetService("Players")
local LocalPlayer=LP.LocalPlayer
local Workspace=game:GetService("Workspace")

local SG=Instance.new("ScreenGui",game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")) SG.Name="HiepGiaHubGui" SG.ResetOnSpawn=false
local function C(cls,p,parent) local o=Instance.new(cls) for k,v in pairs(p) do o[k]=v end if parent then o.Parent=parent end return o end

local isDraggingMenu=false
local function drag(g) local d,sP,dS g.InputBegan:Connect(function(i) if not isDraggingMenu and (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) then d,dS,sP=true,i.Position,g.Position end end) UIS.InputChanged:Connect(function(i) if d and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local delta=i.Position-dS g.Position=UDim2.new(sP.X.Scale,sP.X.Offset+delta.X,sP.Y.Scale,sP.Y.Offset+delta.Y) end end) UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then d=false end end) end

local TBtn=C("ImageButton",{Image="rbxassetid://99351037294920",Position=UDim2.new(0.03,0,0.2,0),Size=UDim2.new(0,55,0,55),BackgroundColor3=Color3.fromRGB(20,20,20),BackgroundTransparency=0.2},SG)
C("UICorner",{CornerRadius=UDim.new(0,12)},TBtn) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},TBtn) drag(TBtn)

local Main=C("Frame",{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0.85,0,0.8,0),BackgroundColor3=Color3.fromRGB(25,25,30),Visible=false,ClipsDescendants=false},SG)
C("UICorner",{CornerRadius=UDim.new(0,15)},Main) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=2},Main) drag(Main)

local Hd=C("Frame",{Size=UDim2.new(1,0,0,45),BackgroundColor3=Color3.fromRGB(15,15,20)},Main) C("UICorner",{CornerRadius=UDim.new(0,15)},Hd)
C("TextLabel",{Size=UDim2.new(0.7,0,1,0),Position=UDim2.new(0.03,0,0,0),Text="HiepGia—Hub",TextColor3=Color3.fromRGB(0,210,255),TextSize=20,Font=4,TextXAlignment=0,BackgroundTransparency=1},Hd)
local CBtn=C("TextButton",{Size=UDim2.new(0,35,0,35),Position=UDim2.new(1,-42,0.5,-17),Text="✕",TextColor3=Color3.fromRGB(255,80,80),TextSize=18,Font=4,BackgroundColor3=Color3.fromRGB(35,35,40)},Hd) C("UICorner",{CornerRadius=UDim.new(0,8)},CBtn)

local Sb=C("Frame",{Size=UDim2.new(0.25,0,1,-50),Position=UDim2.new(0,5,0,50),BackgroundColor3=Color3.fromRGB(18,18,22),BackgroundTransparency=0.5},Main) C("UICorner",{CornerRadius=UDim.new(0,10)},Sb)
local Pc=C("Frame",{Size=UDim2.new(0.73,0,1,-50),Position=UDim2.new(0.26,0,0,50),BackgroundTransparency=1},Main)
local Tb1=C("TextButton",{Size=UDim2.new(0.9,0,0,40),Position=UDim2.new(0.05,0,0,10),Text="Main",TextColor3=Color3.fromRGB(255,255,255),TextSize=16,Font=4,BackgroundColor3=Color3.fromRGB(0,170,255)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb1)
local Tb2=C("TextButton",{Size=UDim2.new(0.9,0,0,40),Position=UDim2.new(0.05,0,0,60),Text="Fly & TP",TextColor3=Color3.fromRGB(200,200,200),TextSize=16,Font=4,BackgroundColor3=Color3.fromRGB(30,30,35)},Sb) C("UICorner",{CornerRadius=UDim.new(0,8)},Tb2)

local P1=C("Frame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=true},Pc)
local P2=C("Frame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Visible=false},Pc)
Tb1.MouseButton1Click:Connect(function() P1.Visible,P2.Visible=true,false Tb1.BackgroundColor3,Tb2.BackgroundColor3=Color3.fromRGB(0,170,255),Color3.fromRGB(30,30,35) end)
Tb2.MouseButton1Click:Connect(function() P1.Visible,P2.Visible=false,true Tb2.BackgroundColor3,Tb1.BackgroundColor3=Color3.fromRGB(0,170,255),Color3.fromRGB(30,30,35) end)

-- TAB MAIN: Walk Speed & Auto Jump
local WBtn=C("TextButton",{Size=UDim2.new(0.95,0,0,40),Position=UDim2.new(0,0,0,10),Text="WALK SPEED: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},WBtn)
local WBox=C("TextBox",{Size=UDim2.new(0.95,0,0,35),Position=UDim2.new(0,0,0,58),Text="300",PlaceholderText="Tốc độ 1 - 10000",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(20,20,28)},P1) C("UICorner",{CornerRadius=UDim.new(0,8)},WBox) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1},WBox)

local walkSpd,aW=300,false
local function resetSpd() if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed=16 end end
WBox.FocusLost:Connect(function() local n=tonumber(WBox.Text) walkSpd=n and math.clamp(n,1,10000) or 300 WBox.Text=tostring(walkSpd) end)
WBtn.MouseButton1Click:Connect(function() aW=not aW WBtn.Text="WALK SPEED: "..(aW and "ON" or "OFF") WBtn.TextColor3=aW and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) if not aW then resetSpd() end end)
RS.Heartbeat:Connect(function() if not aW or not LocalPlayer.Character then return end local hum,hrp=LocalPlayer.Character:FindFirstChildOfClass("Humanoid"),LocalPlayer.Character:FindFirstChild("HumanoidRootPart") if hum and hrp then hum.WalkSpeed=walkSpd hum:Move(hrp.CFrame.LookVector,false) end end)

local JBtn=C("TextButton",{Size=UDim2.new(0.95,0,0,40),Position=UDim2.new(0,0,0,105),Text="Auto Jump: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P1) C("UICorner",{CornerRadius=UDim.new(0,10)},JBtn)
local aJ=false task.spawn(function() while true do if aJ and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then local h=LocalPlayer.Character:FindFirstChildOfClass("Humanoid") if h.FloorMaterial~=Enum.Material.Air then h:ChangeState(Enum.HumanoidStateType.Jumping) end end task.wait(0.05) end end)
JBtn.MouseButton1Click:Connect(function() aJ=not aJ JBtn.Text="Auto Jump: "..(aJ and "ON" or "OFF") JBtn.TextColor3=aJ and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) end)

-- TAB FLY & TP
local FBtn=C("TextButton",{Size=UDim2.new(0.95,0,0,40),Position=UDim2.new(0,0,0,10),Text="Fly: OFF",TextColor3=Color3.fromRGB(255,70,70),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},FBtn)
local SlLbl=C("TextLabel",{Size=UDim2.new(0.95,0,0,20),Position=UDim2.new(0,0,0,58),Text="Fly Speed: 50",TextColor3=Color3.fromRGB(255,255,255),TextSize=13,BackgroundTransparency=1,TextXAlignment=0},P2)
local SlBg=C("Frame",{Size=UDim2.new(0.95,0,0,18),Position=UDim2.new(0,0,0,80),BackgroundColor3=Color3.fromRGB(40,40,50)},P2) C("UICorner",{CornerRadius=UDim.new(1,0)},SlBg)
local SlFl=C("Frame",{Size=UDim2.new(0.005,0,1,0),BackgroundColor3=Color3.fromRGB(0,170,255)},SlBg) C("UICorner",{CornerRadius=UDim.new(1,0)},SlFl)

local flySpd,isFly,bV,bG,flyC,dSl=50,false
local function upSl(i) local pos=math.clamp((i.Position.X-SlBg.AbsolutePosition.X)/SlBg.AbsoluteSize.X,0,1) SlFl.Size=UDim2.new(math.max(pos,0.01),0,1,0) flySpd=math.floor(10+(pos*9990)) SlLbl.Text="Fly Speed: "..flySpd end
SlBg.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=true isDraggingMenu=true upSl(i) end end)
UIS.InputChanged:Connect(function(i) if dSl and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then upSl(i) end end)
UIS.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dSl=false isDraggingMenu=false end end)

FBtn.MouseButton1Click:Connect(function() isFly=not isFly FBtn.Text,FBtn.TextColor3="Fly: "..(isFly and "ON" or "OFF"),isFly and Color3.fromRGB(80,255,80) or Color3.fromRGB(255,70,70) local c=LocalPlayer.Character if not c or not c:FindFirstChild("HumanoidRootPart") then return end local hrp=c.HumanoidRootPart
if isFly then bV=C("BodyVelocity",{MaxForce=Vector3.new(1e9,1e9,1e9),Velocity=Vector3.zero},hrp) bG=C("BodyGyro",{MaxTorque=Vector3.new(1e9,1e9,1e9),CFrame=hrp.CFrame},hrp) flyC=RS.RenderStepped:Connect(function() if isFly and hrp then local cam=workspace.CurrentCamera local hum=c:FindFirstChildOfClass("Humanoid") local m=hum and hum.MoveDirection or Vector3.zero bG.CFrame=cam.CFrame bV.Velocity=m.Magnitude>0 and cam.CFrame.LookVector*(m.Magnitude*flySpd) or Vector3.zero end end) else if flyC then flyC:Disconnect() end if bV then bV:Destroy() end if bG then bG:Destroy() end end end)

-- NÚT 1: NHẬN TOOL TELEPORT (TRONG TAB FLY & TP)
local TPBtn=C("TextButton",{Size=UDim2.new(0.95,0,0,40),Position=UDim2.new(0,0,0,110),Text="Nhận Tool Teleport",TextColor3=Color3.fromRGB(0,210,255),TextSize=15,Font=4,BackgroundColor3=Color3.fromRGB(35,35,42)},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},TPBtn)
TPBtn.MouseButton1Click:Connect(function() local t=Instance.new("Tool",LocalPlayer.Backpack) t.Name,t.RequiresHandle="TP Tool",false t.Activated:Connect(function() local m,c=LocalPlayer:GetMouse(),LocalPlayer.Character if c and c:FindFirstChild("HumanoidRootPart") and m.Hit then c.HumanoidRootPart.CFrame=CFrame.new(m.Hit.Position+Vector3.new(0,3,0)) end end) TPBtn.Text="Đã thêm TP Tool!" task.wait(1) TPBtn.Text="Nhận Tool Teleport" end)

-- NÚT 2: TP PLAYER HIỆP BÉO (NẰM TRONG TAB FLY & TP)
local toggleBtn=C("TextButton",{Size=UDim2.new(0.95,0,0,40),Position=UDim2.new(0,0,0,160),BackgroundColor3=Color3.fromRGB(0,120,215),TextColor3=Color3.fromRGB(255,255,255),Text="Tp player Hiệp béo",TextSize=15,Font=Enum.Font.SourceSansBold},P2) C("UICorner",{CornerRadius=UDim.new(0,10)},toggleBtn)

-- KHUNG DANH SÁCH PLAYER (BẬT RA KHI BẤM NÚT)
local mainFrame=C("Frame",{Size=UDim2.new(0,230,0,310),Position=UDim2.new(0.5,-115,0.5,-155),BackgroundColor3=Color3.fromRGB(25,25,25),BorderSizePixel=0,Visible=false,Active=true,Draggable=true},SG)
C("UICorner",{CornerRadius=UDim.new(0,10)},mainFrame) C("UIStroke",{Color=Color3.fromRGB(0,170,255),Thickness=1.5},mainFrame)

local title=C("TextLabel",{Size=UDim2.new(1,0,0,40),BackgroundColor3=Color3.fromRGB(40,40,40),Text="DANH SÁCH TELEPORT",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=Enum.Font.SourceSansBold},mainFrame)
C("UICorner",{CornerRadius=UDim.new(0,10)},title)

local scrollFrame=C("ScrollingFrame",{Size=UDim2.new(1,-16,1,-50),Position=UDim2.new(0,8,0,45),BackgroundTransparency=1,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=8},mainFrame)
local uiListLayout=C("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,8)},scrollFrame)
uiListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() scrollFrame.CanvasSize=UDim2.new(0,0,0,uiListLayout.AbsoluteContentSize.Y) end)

toggleBtn.MouseButton1Click:Connect(function() mainFrame.Visible=not mainFrame.Visible end)

local function teleportToPlayer(targetPlayer)
    if not targetPlayer then return end
    local myCharacter=LocalPlayer.Character
    if not myCharacter then return end
    local targetChar=targetPlayer.Character
    if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
        local targetHRP=targetChar.HumanoidRootPart
        pcall(function() Workspace:RequestStreamAroundAsync(targetHRP.Position) end)
        local count=0
        local connection
        connection=RS.RenderStepped:Connect(function()
            if targetChar and targetChar:FindFirstChild("HumanoidRootPart") and myCharacter then
                myCharacter:PivotTo(targetHRP.CFrame*CFrame.new(0,3,0))
            end
            count=count+1
            if count>=5 then connection:Disconnect() end
        end)
    end
end

local function updatePlayerList()
    for _,child in pairs(scrollFrame:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    for _,player in pairs(LP:GetPlayers()) do
        if player~=LocalPlayer then
            local btn=C("TextButton",{Size=UDim2.new(1,-10,0,42),BackgroundColor3=Color3.fromRGB(50,50,50),TextColor3=Color3.fromRGB(255,255,255),Text=player.DisplayName.."\n(@"..player.Name..")",TextSize=13,Font=Enum.Font.SourceSans},scrollFrame)
            C("UICorner",{CornerRadius=UDim.new(0,6)},btn)
            btn.MouseButton1Click:Connect(function() teleportToPlayer(player) end)
        end
    end
end

updatePlayerList()
LP.PlayerAdded:Connect(updatePlayerList)
LP.PlayerRemoving:Connect(updatePlayerList)

local isOpen,nS,zS=false,UDim2.new(0.85,0,0.8,0),UDim2.new(0,0,0,0)
local function tog() isOpen=not isOpen if isOpen then Main.Size,Main.Visible=zS,true TS:Create(Main,TweenInfo.new(0.3,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=nS}):Play() else local tw=TS:Create(Main,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=zS}) tw:Play() tw.Completed:Connect(function() if not isOpen then Main.Visible=false end end) end end
TBtn.MouseButton1Click:Connect(tog) CBtn.MouseButton1Click:Connect(tog)
