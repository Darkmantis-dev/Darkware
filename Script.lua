if game.PlaceId == 155615604 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Darkware | Prison Life", "Synapse")
    
    -- Prison Life script
    local Main = Window:NewTab("Main Scripts")
    local MainSection = Main:NewSection("Default Scripts")
    local TeleportsTab = Window:NewTab("Teleports")
    local Teleports = TeleportsTab:NewSection("Teleports")
    local TeamsTab = Window:NewTab("Teams")
    local Teams = TeamsTab:NewSection("Teams")

    
    MainSection:NewButton("Get Admin", "Gives you every gun in the game", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife'),true))()
    end)
    MainSection:NewButton("Auto Aim at head", "Where ever you shoot it shoots at someones head", function()
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
        local lastPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").position
        LCS = game.Workspace["Criminals Spawn"].SpawnLocation
        LCS.CanCollide = false
        LCS.Size = Vector3.new(51.05, 24.12, 54.76)
        LCS.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        LCS.Transparency = 1
        wait(0.5)
        LCS.CFrame = CFrame.new(-920.510803, 92.2271957, 2138.27002, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        LCS.Size = Vector3.new(6, 0.2, 6)
        LCS.Transparency = 0
        wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(lastPos)
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
end
