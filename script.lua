local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

if not _G.__STEAL_SCRIPT_SPLASH_SHOWN then
    print("Splash Start")
    _G.__STEAL_SCRIPT_SPLASH_SHOWN = true
    local oldWalk, oldJump = humanoid.WalkSpeed, humanoid.JumpPower
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "IntroSplash"
    introGui.Parent = CoreGui
    introGui.IgnoreGuiInset = true
    local overlay = Instance.new("Frame")
    overlay.Size = UDim2.new(1,0,1,0)
    overlay.Position = UDim2.new(0,0,0,0)
    overlay.BackgroundColor3 = Color3.new(0,0,0)
    overlay.BackgroundTransparency = 1
    overlay.Parent = introGui
    overlay.ZIndex = 1000
    for t=1,0,-0.1 do
        overlay.BackgroundTransparency = t
        wait(0.03)
    end
    overlay.BackgroundTransparency = 0
    local mainText = Instance.new("TextLabel")
    mainText.Size = UDim2.new(0, 600, 0, 80)
    mainText.Position = UDim2.new(0.5, -300, 0.45, -40)
    mainText.BackgroundTransparency = 1
    mainText.Text = ""
    mainText.Font = Enum.Font.GothamBlack
    mainText.TextSize = 54
    mainText.TextColor3 = Color3.fromRGB(80,180,255)
    mainText.TextStrokeTransparency = 0.1
    mainText.TextStrokeColor3 = Color3.fromRGB(255,255,255)
    mainText.Parent = overlay
    mainText.ZIndex = 1002
    local grad = Instance.new("UIGradient", mainText)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80,180,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
    }
    grad.Rotation = 0
    local fullText = "Welcome To Steal Script"
    for i=1,#fullText do
        mainText.Text = string.sub(fullText,1,i)
        mainText.TextSize = 54 + i*0.7
        wait(0.04)
    end
    mainText.TextSize = 64
    local devText = Instance.new("TextLabel")
    devText.Size = UDim2.new(0, 260, 0, 32)
    devText.Position = UDim2.new(1, -270, 1, -40)
    devText.AnchorPoint = Vector2.new(0,0)
    devText.BackgroundTransparency = 1
    devText.Text = "Developer : Bouadaine"
    devText.Font = Enum.Font.GothamBold
    devText.TextSize = 22
    devText.TextColor3 = Color3.fromRGB(255,255,255)
    devText.TextStrokeTransparency = 0.2
    devText.TextStrokeColor3 = Color3.fromRGB(0,0,0)
    devText.TextXAlignment = Enum.TextXAlignment.Right
    devText.Parent = overlay
    devText.ZIndex = 1003
    devText.TextTransparency = 1
    for t=1,0,-0.1 do
        devText.TextTransparency = t
        wait(0.04)
    end
    devText.TextTransparency = 0
    local barBG = Instance.new("Frame")
    barBG.Size = UDim2.new(0, 320, 0, 14)
    barBG.Position = UDim2.new(0.5, -160, 0.62, 0)
    barBG.BackgroundColor3 = Color3.fromRGB(30,40,60)
    barBG.BorderSizePixel = 0
    barBG.Parent = overlay
    barBG.ZIndex = 1002
    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.Position = UDim2.new(0, 0, 0, 0)
    bar.BackgroundColor3 = Color3.fromRGB(80,180,255)
    bar.BorderSizePixel = 0
    bar.Parent = barBG
    bar.ZIndex = 1003
    local barGrad = Instance.new("UIGradient", bar)
    barGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(80,180,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,255,255))
    }
    barGrad.Rotation = 0
    local flash = Instance.new("Frame", bar)
    flash.Size = UDim2.new(0, 40, 1, 0)
    flash.Position = UDim2.new(0, -40, 0, 0)
    flash.BackgroundColor3 = Color3.fromRGB(255,255,255)
    flash.BackgroundTransparency = 0.7
    flash.BorderSizePixel = 0
    flash.ZIndex = 1004
    local flashGrad = Instance.new("UIGradient", flash)
    flashGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(180,220,255))
    }
    flashGrad.Rotation = 0
    for i=1,32 do
        bar.Size = UDim2.new(0, i*10, 1, 0)
        barGrad.Rotation = barGrad.Rotation + 8
        flash.Position = UDim2.new(0, i*10-40, 0, 0)
        wait(0.045)
    end
    wait(3)
    for t=0,1,0.08 do
        overlay.BackgroundTransparency = t
        mainText.TextTransparency = t
        mainText.TextStrokeTransparency = 0.1 + t*0.8
        devText.TextTransparency = t
        devText.TextStrokeTransparency = 0.2 + t*0.7
        bar.BackgroundTransparency = t
        barBG.BackgroundTransparency = t
        flash.BackgroundTransparency = 0.7 + t*0.3
        wait(0.03)
    end
    introGui:Destroy()
    humanoid.WalkSpeed = oldWalk
    humanoid.JumpPower = oldJump
    print("Splash End")
end

local SPEED_MULT = 2
local FLY_SPEED = 60
local SKY_HEIGHT = 10
local THEME_COLOR = Color3.fromRGB(220, 220, 240)
local DARK_BG = Color3.fromRGB(200, 200, 210)
local BUTTON_ON = Color3.fromRGB(230, 230, 240)
local BUTTON_OFF = Color3.fromRGB(180, 180, 190)
local BUTTON_ON_TXT = Color3.fromRGB(255, 255, 255)
local BUTTON_OFF_TXT = Color3.fromRGB(220, 220, 240)

local BUTTON_GRADIENT = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(220,220,240))
}
local BUTTON_SHADOW = Color3.fromRGB(210,210,220)

local function randomName(len)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local s = ""
    for i = 1, len do
        s = s .. chars:sub(math.random(1, #chars), math.random(1, #chars))
    end
    return s
end

local guiName = randomName(12)
local frameName = randomName(10)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = guiName
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = frameName
MainFrame.Size = UDim2.new(0, 700, 0, 520)
MainFrame.Position = UDim2.new(0.5, -350, 0.5, -260)
MainFrame.BackgroundColor3 = Color3.fromRGB(220, 220, 240)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.06
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 28)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Transparency = 0.12

local UIGradient = Instance.new("UIGradient", MainFrame)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(230, 230, 240)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 210))
}
UIGradient.Rotation = 45

if MainFrame:FindFirstChildOfClass("Frame") then
    MainFrame:FindFirstChildOfClass("Frame"):Destroy()
end

local tabs = {"Modes", "Movement", "Teleport", "Settings"}
local tabFrames = {}
local currentTab = 1
local tabBtns = {}
local tabWidth = 130
local tabHeight = 40
local tabMargin = 14
local totalTabsWidth = #tabs * tabWidth + (#tabs-1)*tabMargin
local startX = (MainFrame.Size.X.Offset - totalTabsWidth) // 2
for i,tab in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, tabWidth, 0, tabHeight)
    btn.Position = UDim2.new(0, startX + (i-1)*(tabWidth+tabMargin), 0, 12)
    btn.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
    btn.Text = tab
    btn.Font = Enum.Font.GothamBlack
    btn.TextSize = 22
    btn.TextColor3 = Color3.fromRGB(230, 240, 255)
    btn.Parent = MainFrame
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 16)
    local grad = Instance.new("UIGradient", btn)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(220,220,240))
    }
    grad.Rotation = 45
    local shadow = Instance.new("ImageLabel", btn)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.Size = UDim2.new(1,0,1,8)
    shadow.Position = UDim2.new(0,0,0,6)
    shadow.ImageTransparency = 0.8
    shadow.ZIndex = 0
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(230, 230, 240)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(210, 210, 220)
    end)
    tabBtns[i] = btn
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -40, 1, -80)
    frame.Position = UDim2.new(0, 20, 0, 60)
    frame.BackgroundTransparency = 1
    frame.Parent = MainFrame
    frame.Visible = i==1
    tabFrames[i] = frame
    btn.MouseButton1Click:Connect(function()
        for j=1,#tabs do
            tabFrames[j].Visible = false
            tabBtns[j].BackgroundColor3 = Color3.fromRGB(40, 60, 120)
            tabBtns[j].TextColor3 = Color3.fromRGB(230, 240, 255)
        end
        frame.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(230, 230, 240)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        currentTab = i
    end)
end

local function makeScroll(frame)
    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, 0, 1, 0)
    scroll.CanvasSize = UDim2.new(0,0,0,0)
    scroll.BackgroundTransparency = 0.1
    scroll.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 8
    scroll.ScrollBarImageColor3 = Color3.fromRGB(120,200,255)
    scroll.Parent = frame
    local layout = Instance.new("UIListLayout", scroll)
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scroll.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+12)
    end)
    return scroll, layout
end
local modeScroll, modeLayout = makeScroll(tabFrames[1])
local tpScroll, tpLayout = makeScroll(tabFrames[2])
local setScroll, setLayout = makeScroll(tabFrames[3])

local function createToggle(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(40, 60, 120)
    btn.Text = text .. " OFF"
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 20
    btn.TextColor3 = BUTTON_OFF_TXT
    btn.AutoButtonColor = true
    btn.Parent = parent
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 14)
    local grad = Instance.new("UIGradient", btn)
    grad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(220,220,240))
    }
    grad.Rotation = 45
    local shadow = Instance.new("ImageLabel", btn)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://1316045217"
    shadow.Size = UDim2.new(1,0,1,8)
    shadow.Position = UDim2.new(0,0,0,6)
    shadow.ImageTransparency = 0.85
    shadow.ZIndex = 0
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(230, 230, 240)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(210, 210, 220)
    end)
    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        btn.Text = text .. (on and " ON" or " OFF")
        btn.BackgroundColor3 = on and BUTTON_ON or BUTTON_OFF
        btn.TextColor3 = on and BUTTON_ON_TXT or BUTTON_OFF_TXT
        callback(on)
    end)
    return btn, function() return on end, function(v)
        on = v
        btn.Text = text .. (on and " ON" or " OFF")
        btn.BackgroundColor3 = on and BUTTON_ON or BUTTON_OFF
        btn.TextColor3 = on and BUTTON_ON_TXT or BUTTON_OFF_TXT
        callback(on)
    end
end

local toggles = {}
local origWalkSpeed = humanoid.WalkSpeed
local origJumpPower = humanoid.JumpPower
local origFOV = workspace.CurrentCamera.FieldOfView
local origGravity = Workspace.Gravity

local function addModeToggle(name, func)
    local btn, isOn, setOn = createToggle(modeScroll, name, func)
    toggles[name] = {isOn=isOn, setOn=setOn, btn=btn}
end

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -38, 0, 6)
closeBtn.BackgroundColor3 = Color3.fromRGB(210, 210, 220)
closeBtn.Text = "x"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 22
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Parent = MainFrame
local closeCorner = Instance.new("UICorner", closeBtn)
closeCorner.CornerRadius = UDim.new(0, 10)
closeBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)

local noclipConn = nil
local fakeWalkConn = nil
addModeToggle("Noclip", function(on)
    if noclipConn then noclipConn:Disconnect() end
    if fakeWalkConn then fakeWalkConn:Disconnect() end
    if on then
        local origSpeed = humanoid.WalkSpeed
        humanoid.WalkSpeed = origSpeed * 0.7
        noclipConn = RunService.Stepped:Connect(function(_, step)
            for _, v in ipairs(character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
            if humanoid.MoveDirection.Magnitude > 0 then
                wait(0.08 + math.random()*0.04)
            end
        end)
        local lastServerPos = root.Position
        fakeWalkConn = RunService.Heartbeat:Connect(function()
            if humanoid.MoveDirection.Magnitude > 0 then
                local moveDir = humanoid.MoveDirection.Unit
                local fakeStep = moveDir * (origSpeed * 0.7) * (0.13 + math.random()*0.03)
                lastServerPos = lastServerPos + fakeStep
                pcall(function()
                    root.CFrame = CFrame.new(root.Position, root.Position + moveDir)
                    if root:FindFirstChild("RootRigAttachment") then
                        root.RootRigAttachment.WorldPosition = lastServerPos
                    end
                end)
            end
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end)
    else
        if noclipConn then noclipConn:Disconnect() end
        if fakeWalkConn then fakeWalkConn:Disconnect() end
        for _, v in ipairs(character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = true end
        end
        humanoid.WalkSpeed = origWalkSpeed
    end
end)

local flyConn, flyVel
addModeToggle("Fly", function(on)
    if flyConn then flyConn:Disconnect() end
    if flyVel then flyVel:Destroy() end
    if on then
        flyVel = Instance.new("BodyVelocity")
        flyVel.MaxForce = Vector3.new(1e5,1e5,1e5)
        flyVel.Velocity = Vector3.new(0,0,0)
        flyVel.Parent = root
        flyConn = RunService.RenderStepped:Connect(function()
            local move = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + (workspace.CurrentCamera.CFrame.LookVector) end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - (workspace.CurrentCamera.CFrame.LookVector) end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - (workspace.CurrentCamera.CFrame.RightVector) end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + (workspace.CurrentCamera.CFrame.RightVector) end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0,1,0) end
            flyVel.Velocity = move.Magnitude > 0 and move.Unit * FLY_SPEED or Vector3.new(0,0,0)
        end)
    end
end)

local phaseDashConn
addModeToggle("Phase Dash (Q)", function(on)
    if phaseDashConn then phaseDashConn:Disconnect() end
    if on then
        phaseDashConn = UserInputService.InputBegan:Connect(function(input, gpe)
            if not gpe and input.KeyCode == Enum.KeyCode.Q then
                local dashVec = workspace.CurrentCamera.CFrame.LookVector * 10
                root.CFrame = root.CFrame + dashVec
            end
        end)
    end
end)

addModeToggle("Ghost Body", function(on)
    for _,v in ipairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.LocalTransparencyModifier = on and 0.8 or 0
        end
    end
end)

local wallStickConn, stuck = nil, false
addModeToggle("Wall Stick (G)", function(on)
    if wallStickConn then wallStickConn:Disconnect() end
    stuck = false
    if on then
        wallStickConn = RunService.RenderStepped:Connect(function()
            if not stuck then
                for _,v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Position - root.Position).Magnitude < 4 and not v:IsDescendantOf(character) then
                        root.Velocity = Vector3.new(0,0,0)
                        stuck = true
                        break
                    end
                end
            end
        end)
        UserInputService.InputBegan:Connect(function(input, gpe)
            if not gpe and input.KeyCode == Enum.KeyCode.G and stuck then
                stuck = false
            end
        end)
    end
end)

addModeToggle("Speed x1.5", function(on)
    humanoid.WalkSpeed = on and origWalkSpeed * SPEED_MULT or origWalkSpeed
end)

local skyConn
addModeToggle("Sky", function(on)
    if skyConn then skyConn:Disconnect() end
    if on then
        local skyY = root.Position.Y + (humanoid.HipHeight + (humanoid:FindFirstChild("BodyHeightScale") and humanoid.BodyHeightScale.Value or 2)) * SKY_HEIGHT
        root.CFrame = CFrame.new(root.Position.X, skyY, root.Position.Z)
        Workspace.Gravity = 0.1
        skyConn = RunService.Stepped:Connect(function()
            root.Velocity = Vector3.new(0,0,0)
            root.CFrame = CFrame.new(root.Position.X, skyY, root.Position.Z)
        end)
    else
        Workspace.Gravity = origGravity
        if skyConn then skyConn:Disconnect() end
        local ray = Ray.new(root.Position, Vector3.new(0, -1000, 0))
        local hit, pos = Workspace:FindPartOnRay(ray, character)
        if pos then
            root.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
        end
    end
end)

addModeToggle("Super Jump", function(on)
    humanoid.JumpPower = on and 200 or origJumpPower
end)

local infJumpConn
addModeToggle("Infinite Jump", function(on)
    if infJumpConn then infJumpConn:Disconnect() end
    if on then
        infJumpConn = UserInputService.JumpRequest:Connect(function()
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end)

addModeToggle("ESP", function(on)
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            for _,v in ipairs(plr.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    if on then
                        if not v:FindFirstChild("espBox") then
                            local box = Instance.new("BoxHandleAdornment")
                            box.Name = "espBox"
                            box.Adornee = v
                            box.AlwaysOnTop = true
                            box.ZIndex = 10
                            box.Size = v.Size + Vector3.new(0.1,0.1,0.1)
                            box.Color3 = THEME_COLOR
                            box.Transparency = 0.5
                            box.Parent = v
                        end
                    else
                        if v:FindFirstChild("espBox") then v.espBox:Destroy() end
                    end
                end
            end
            if on then
                if not plr.Character:FindFirstChild("espName") then
                    local b = Instance.new("BillboardGui")
                    b.Name = "espName"
                    b.Adornee = plr.Character.HumanoidRootPart
                    b.Size = UDim2.new(0,100,0,30)
                    b.AlwaysOnTop = true
                    b.StudsOffset = Vector3.new(0,3,0)
                    local t = Instance.new("TextLabel", b)
                    t.Size = UDim2.new(1,0,1,0)
                    t.BackgroundTransparency = 1
                    t.Text = plr.Name
                    t.TextColor3 = THEME_COLOR
                    t.TextStrokeTransparency = 0.3
                    t.Font = Enum.Font.GothamBold
                    t.TextScaled = true
                    b.Parent = plr.Character
                end
            else
                if plr.Character:FindFirstChild("espName") then plr.Character.espName:Destroy() end
            end
            if on then
                if not plr.Character:FindFirstChild("espLine") then
                    local a = Instance.new("Attachment", workspace.CurrentCamera)
                    a.Name = "espLine"
                    local b = Instance.new("Attachment", plr.Character.HumanoidRootPart)
                    local beam = Instance.new("Beam")
                    beam.Attachment0 = a
                    beam.Attachment1 = b
                    beam.Color = ColorSequence.new(THEME_COLOR)
                    beam.Width0 = 0.1
                    beam.Width1 = 0.1
                    beam.Transparency = NumberSequence.new(0.2)
                    beam.FaceCamera = true
                    beam.Parent = a
                end
            else
                for _,obj in ipairs(workspace.CurrentCamera:GetChildren()) do
                    if obj.Name == "espLine" then obj:Destroy() end
                end
                if plr.Character:FindFirstChild("espLine") then plr.Character.espLine:Destroy() end
            end
        end
    end
end)

addModeToggle("X-Ray", function(on)
    for _,v in ipairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency < 0.5 and not v:IsDescendantOf(character) then
            v.LocalTransparencyModifier = on and 0.7 or 0
        end
    end
end)

addModeToggle("Night Vision", function(on)
    if on then
        Lighting.Brightness = 4
        Lighting.Ambient = Color3.new(1,1,1)
    else
        Lighting.Brightness = 1
        Lighting.Ambient = Color3.new(0.5,0.5,0.5)
    end
end)

addModeToggle("FOV x1.5", function(on)
    workspace.CurrentCamera.FieldOfView = on and origFOV * 1.5 or origFOV
end)

addModeToggle("Low Gravity", function(on)
    Workspace.Gravity = on and 30 or origGravity
end)

local noFallConn
addModeToggle("No Fall Damage", function(on)
    if noFallConn then noFallConn:Disconnect() end
    if on then
        noFallConn = humanoid.StateChanged:Connect(function(_,new)
            if new == Enum.HumanoidStateType.Freefall then
                humanoid:ChangeState(Enum.HumanoidStateType.Seated)
            end
        end)
    end
end)

local function addTpButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = BUTTON_OFF
    btn.Text = text
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = tpScroll
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(callback)
    return btn
end
addTpButton("Teleport to Random Player", function()
    local plrs = {}
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(plrs, plr)
        end
    end
    if #plrs > 0 then
        local tPlr = plrs[math.random(1,#plrs)]
        root.CFrame = tPlr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
    end
end)
addTpButton("Set Waypoint", function()
    player:SetAttribute("Waypoint", root.Position)
end)
addTpButton("Teleport to Waypoint", function()
    local wp = player:GetAttribute("Waypoint")
    if wp then root.CFrame = CFrame.new(wp) end
end)
addTpButton("Teleport to Player (Choose)", function()
    local plrs = {}
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(plrs, plr)
        end
    end
    if #plrs > 0 then
        local tPlr = plrs[1]
        root.CFrame = tPlr.Character.HumanoidRootPart.CFrame + Vector3.new(0,3,0)
    end
end)

local function addSetButton(text, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 32)
    btn.BackgroundColor3 = BUTTON_OFF
    btn.Text = text
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 18
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = setScroll
    local corner = Instance.new("UICorner", btn)
    corner.CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

local guiHotkey = Enum.KeyCode.LeftControl
local hotkeyBtn = addSetButton("Set GUI Hotkey (Default: Ctrl)", function()
    hotkeyBtn.Text = "Press any key..."
    local conn; conn = UserInputService.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode ~= Enum.KeyCode.Unknown then
            guiHotkey = input.KeyCode
            hotkeyBtn.Text = "Set GUI Hotkey ("..guiHotkey.Name..")"
            conn:Disconnect()
        end
    end)
end)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == guiHotkey then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

local origSky = nil
addSetButton("Night Vision+", function()
    Lighting.Brightness = 6
    Lighting.Ambient = Color3.new(1,1,1)
    Lighting.OutdoorAmbient = Color3.new(1,1,1)
    if Lighting:FindFirstChild("Sky") then
        origSky = Lighting.Sky:Clone()
        Lighting.Sky:Destroy()
    end
end)
addSetButton("Restore Sky", function()
    if origSky and not Lighting:FindFirstChild("Sky") then
        origSky.Parent = Lighting
    end
    Lighting.Brightness = 1
    Lighting.Ambient = Color3.new(0.5,0.5,0.5)
    Lighting.OutdoorAmbient = Color3.new(0.5,0.5,0.5)
end)

addModeToggle("Silent Walk", function(on)
    if on then
        humanoid.WalkSpeed = origWalkSpeed * 0.7
        for _,v in ipairs(character:GetDescendants()) do
            if v:IsA("Sound") and v.Name:lower():find("step") then v.Volume = 0 end
        end
    else
        humanoid.WalkSpeed = origWalkSpeed
        for _,v in ipairs(character:GetDescendants()) do
            if v:IsA("Sound") and v.Name:lower():find("step") then v.Volume = 1 end
        end
    end
end)

local lootConn
addModeToggle("Auto Loot", function(on)
    if lootConn then lootConn:Disconnect() end
    if on then
        lootConn = RunService.RenderStepped:Connect(function()
            for _,obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("Tool") or obj:IsA("Part") and obj.Name:lower():find("loot") then
                    if (obj.Position - root.Position).Magnitude < 8 then
                        firetouchinterest(root, obj, 0)
                        firetouchinterest(root, obj, 1)
                    end
                end
            end
        end)
    end
end)

local peekConn
addModeToggle("Wall Peek", function(on)
    if peekConn then peekConn:Disconnect() end
    if on then
        peekConn = UserInputService.InputBegan:Connect(function(input, gpe)
            if not gpe and input.KeyCode == Enum.KeyCode.E then
                for _,v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Position - root.Position).Magnitude < 12 and not v:IsDescendantOf(character) then
                        v.LocalTransparencyModifier = 0.8
                    end
                end
            end
        end)
        UserInputService.InputEnded:Connect(function(input, gpe)
            if not gpe and input.KeyCode == Enum.KeyCode.E then
                for _,v in ipairs(Workspace:GetDescendants()) do
                    if v:IsA("BasePart") then v.LocalTransparencyModifier = 0 end
                end
            end
        end)
    end
end)

modeScroll.ScrollBarImageColor3 = Color3.fromRGB(120,200,255)
modeScroll.ScrollBarThickness = 4
modeScroll.BackgroundTransparency = 0.1
modeScroll.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
tpScroll.ScrollBarImageColor3 = Color3.fromRGB(120,200,255)
tpScroll.ScrollBarThickness = 4
tpScroll.BackgroundTransparency = 0.1
tpScroll.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
setScroll.ScrollBarImageColor3 = Color3.fromRGB(120,200,255)
setScroll.ScrollBarThickness = 4
setScroll.BackgroundTransparency = 0.1
setScroll.BackgroundColor3 = Color3.fromRGB(25, 30, 40)

local function styleToggle(btn, on)
    btn.BackgroundColor3 = on and Color3.fromRGB(230, 230, 240) or Color3.fromRGB(180, 180, 190)
    btn.TextColor3 = on and Color3.fromRGB(255,255,255) or Color3.fromRGB(220,220,240)
    btn.Font = Enum.Font.GothamBold
end
for _,t in pairs(toggles) do
    styleToggle(t.btn, t.isOn())
    t.btn.MouseButton1Click:Connect(function()
        styleToggle(t.btn, t.isOn())
    end)
end

local function notify(msg, color)
    local n = Instance.new("TextLabel")
    n.Parent = MainFrame
    n.Size = UDim2.new(1, 0, 0, 30)
    n.Position = UDim2.new(0, 0, 1, -35)
    n.BackgroundTransparency = 0.3
    n.BackgroundColor3 = color or THEME_COLOR
    n.Text = msg
    n.Font = Enum.Font.GothamSemibold
    n.TextSize = 18
    n.TextColor3 = Color3.fromRGB(255,255,255)
    n.TextStrokeTransparency = 0.7
    n.ZIndex = 10
    local c = Instance.new("UICorner", n)
    c.CornerRadius = UDim.new(0, 10)
    TweenService:Create(n, TweenInfo.new(0.3), {BackgroundTransparency=0.1}):Play()
    task.spawn(function()
        wait(1.5)
        TweenService:Create(n, TweenInfo.new(0.5), {BackgroundTransparency=1, TextTransparency=1}):Play()
        wait(0.5)
        n:Destroy()
    end)
end

player.CharacterAdded:Connect(function(char)
    character = char
    humanoid = character:WaitForChild("Humanoid")
    root = character:WaitForChild("HumanoidRootPart")
    origWalkSpeed = humanoid.WalkSpeed
    origJumpPower = humanoid.JumpPower
    origFOV = workspace.CurrentCamera.FieldOfView
    origGravity = Workspace.Gravity
    for _,t in pairs(toggles) do t.setOn(false) end
end)
