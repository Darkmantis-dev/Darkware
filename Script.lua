--Start Of Prison Life
if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Darkware | Prison Life", "Synapse")
    
    -- Prison Life script
    local Main = Window:NewTab("Main Scripts")
    local MainSection = Main:NewSection("Default Scripts")
    local Tab = Window:NewTab("Local Player")
    local Section = Tab:NewSection("Player Scripts")
    local TeleportsTab = Window:NewTab("Teleports")
    local Teleports = TeleportsTab:NewSection("Teleports")
    local TeamsTab = Window:NewTab("Teams")
    local Teams = TeamsTab:NewSection("Teams")
    local OthersTab = Window:NewTab("Other")
    local Others = OthersTab:NewSection("Others")

  --Main Section  
    MainSection:NewButton("Get Admin | Septex", "Created By Septex", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
    end)
    MainSection:NewButton("Aimbot At Head", "Where ever you shoot it shoots at someones head", function()
        local Players = game.Players
        local LocalPlayer = Players.LocalPlayer
        local GetPlayers = Players.GetPlayers
        local Camera = workspace.CurrentCamera
        local WTSP = Camera.WorldToScreenPoint
        local FindFirstChild = game.FindFirstChild
        local Vector2_new = Vector2.new
        local Mouse = LocalPlayer.GetMouse(LocalPlayer)
        function ClosestChar()
            local Max, Close = math.huge
            for I,V in pairs(GetPlayers(Players)) do
                if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
                    local Head = FindFirstChild(V.Character, "Head")
                    if Head then
                        local Pos, OnScreen = WTSP(Camera, Head.Position)
                        if OnScreen then
                            local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                            if Dist < Max then
                                Max = Dist
                                Close = V.Character
                            end
                        end
                    end
                end
            end
            return Close
        end
         
        local MT = getrawmetatable(game)
        local __namecall = MT.__namecall
        setreadonly(MT, false)
        MT.__namecall = newcclosure(function(self, ...)
            local Method = getnamecallmethod()
            if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
                local Character = ClosestChar()
                if Character then
                    return Character.Head, Character.Head.Position
                end
            end
         
            return __namecall(self, ...)
        end)
        setreadonly(MT, true)
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        wait(1)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Aimbot Head Script";
            Text = "Enjoy"; -- what the text says (ofc)
            Duration = 20;
        })
    end)
    MainSection:NewButton("One Punch Kill", "Go Up to someone and press F", function()
        mainRemotes = game.ReplicatedStorage
        meleeRemote = mainRemotes['meleeEvent']
        mouse = game.Players.LocalPlayer:GetMouse()
        punching = false
        cooldown = false
        
        function punch()
        cooldown = true
        local part = Instance.new("Part", game.Players.LocalPlayer.Character)
        part.Transparency = 1
        part.Size = Vector3.new(5, 2, 3)
        part.CanCollide = false
        local w1 = Instance.new("Weld", part)
        w1.Part0 = game.Players.LocalPlayer.Character.Torso
        w1.Part1 = part
        w1.C1 = CFrame.new(0,0,2)
        part.Touched:connect(function(hit)
        if game.Players:FindFirstChild(hit.Parent.Name) then
        local plr = game.Players:FindFirstChild(hit.Parent.Name)
        if plr.Name ~= game.Players.LocalPlayer.Name then
        part:Destroy()
        
        for i = 1,100 do
        meleeRemote:FireServer(plr)
        end
        end
        end
        end)
        
        wait(1)
        cooldown = false
        part:Destroy()
        end
        
        
        mouse.KeyDown:connect(function(key)
        if cooldown == false then
        if key:lower() == "f" then
        
        punch()
        
        end
        end
        end)
    end)
    MainSection:NewButton("Anti Tazer", "Might Not work if killed", function()
        game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
        game.Players.LocalPlayer.CharacterAdded:connect(function()
        game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)
        game.Players.LocalPlayer.Character.ClientInputHandler.Disabled = true
        end)
    end)
    MainSection:NewButton("ESP", "See People Through Walls", function()
        local Settings = {
            ['Material'] = Enum.Material.Neon, -- Material
            ['Color'] = Color3.fromRGB(255,0,0), -- Color
            ['Transparency'] = 0.7 -- 0 to 1 Transparency
        }
        
        local ScreenGui = Instance.new('ScreenGui', game.CoreGui) -- Create screengui
        ScreenGui.IgnoreGuiInset = true
        
        local ViewportFrame = Instance.new('ViewportFrame', ScreenGui) -- Create viewport and define properties
        ViewportFrame.CurrentCamera = workspace.CurrentCamera
        ViewportFrame.Size = UDim2.new(1,0,1,0)
        ViewportFrame.BackgroundTransparency = 1
        ViewportFrame.ImageTransparency = Settings.Transparency
        
        local Chasms = {} -- Array for storing parts
        
        function generateChasm(player) -- functions that generates chasms for the player specififed
            local Character = workspace:FindFirstChild(player.Name)
            
            if Character then
                for _,Part in pairs(Character:GetChildren()) do
                    if Part:IsA('Part') or Part:IsA('MeshPart') then
                        local Chasm = Part:Clone()
                        
                        for _,Child in pairs(Chasm:GetChildren()) do
                            if Child:IsA('Decal') then
                                Child:Destroy()
                            end
                        end
                        
                        Chasm.Parent = ViewportFrame
                        Chasm.Material = Settings.Material
                        Chasm.Color = Settings.Color
                        Chasm.Anchored = true
                        
                        table.insert(Chasms, Chasm)
                    end
                end
            end
        end
        
        function clearChasms() -- remove all chasms
            for _,Chasm in pairs(Chasms) do
                Chasm:Destroy()
            end
            
            Chasms = {}
        end
        
        while game:GetService('RunService').RenderStepped:Wait() do -- loop this process
            clearChasms()
            
            for _,Player in pairs(game:GetService('Players'):GetPlayers()) do
                if Player ~= game:GetService('Players').LocalPlayer then
                    generateChasm(Player)
                end
            end
        end
    end)
    MainSection:NewButton("Remove All Doors", "Removes all doors in the game", function()
        Workspace.Prison_Cellblock.doors:Destroy()
			
        for i,v in pairs(workspace:GetChildren())do
                if v.Name == "Doors" then
            v:Destroy()
        end
     end
    end)
    MainSection:NewButton("Arrest All", "Arrest every criminal", function()
        wait(0.1)
        Player = game.Players.LocalPlayer
        Pcf = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
        local i = 10
        repeat
        wait()
        i = i-1
        game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
        Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
        until i == 0
        end
      end
    end)

    --Local Player
    Section:NewButton("Ctrl + Click To TP", "Ctrl + Click To TP", function()
        local Imput = game:GetService("UserInputService")
        local Plr = game.Players.LocalPlayer
        local Mouse = Plr:GetMouse()
        
        function To(position)
           local Chr = Plr.Character
           if Chr ~= nil then
               Chr:MoveTo(position)
           end
        end
        
        Imput.InputBegan:Connect(function(input)
           if input.UserInputType == Enum.UserInputType.MouseButton1 and Imput:IsKeyDown(Enum.KeyCode.LeftControl) then
               To(Mouse.Hit.p)
           end
        end)
    end)
    Section:NewSlider("Set Walkspeed", "Sets walkspeed min 0 max 500", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    Section:NewSlider("Set JumpPower", "Sets Jumpower min 0 max 1000", 1000, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    --Teams
    Teams:NewButton("Switch to Cop", "Changes your team to police", function()
        local lastPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
        workspace.Remote.loadchar:InvokeServer("", "Bright blue")
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(lastPos)
    end)
    Teams:NewButton("Switch To Inmate", "Changes your team to Inmate", function()
        Workspace.Remote.TeamEvent:FireServer("Bright orange")
    end)
    Teams:NewButton("Switch To Neutral", "Changes your team to Neutral", function()
        Workspace.Remote.TeamEvent:FireServer("Medium stone grey")
    end)
    Teams:NewButton("Switch To Criminal", "Changes your team To Criminal", function()
        LCS = game.Workspace["Criminals Spawn"].SpawnLocation

        LCS.CanCollide = false
        LCS.Size = Vector3.new(51.05, 24.12, 54.76)
        LCS.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        LCS.Transparency = 1
        wait(0.5)
        LCS.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        LCS.Size = Vector3.new(6, 0.2, 6)
        LCS.Transparency = 0
    end)
    --Teleports
    Teleports:NewButton("Teleport to Cafe", "Teleports you to the Cafe", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(879,99,2247)
    end)
    Teleports:NewButton("Teleport to Cells", "Teleports you to the Cells", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(910,99,2477)
    end)
    Teleports:NewButton("Teleport to the Yard", "Teleports you to the Yard", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(779,99,2477)
    end)
    Teleports:NewButton("Teleport to the Armory", "Teleports you to the Armory", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(798,99,2260)
    end)
    --Others
    Others:NewButton("Server Hop", "Teleports you to a new server", function()
        game:GetService("TeleportService"):Teleport(155615604, game:GetService("Players").LocalPlayer)
    end)
    Others:NewButton("Infinite Yeild", "Executes IY", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
end
--end of prison life
