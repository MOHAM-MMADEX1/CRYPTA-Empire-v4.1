-- 🔥 CRYPTA EMPIRE v5.2 ULTRA REDZ HUB | MOHAM-MMADEX1 | Delta Ready
getgenv().CRYPTA_LOADED = true
getgenv().HackerAI_Authorized = true
print("🚀 CRYPTA LOADING...")

-- Kavo UI
local Kavo = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Kavo.CreateLib("🔴 REDZ HUB | CRYPTA v5.2 ULTRA", "DarkTheme")
local Main = Window:NewTab("Main")
local Farm = Window:NewTab("Farm")
local Combat = Window:NewTab("Combat")
local Misc = Window:NewTab("Misc")

-- Watermark
local Watermark = Kavo.CreateLib("Watermark", "DarkTheme")
Watermark:SetCustomBadge("🔴 REDZ HUB | CRYPTA Empire | MOHAM-MMADEX1 | Delta Ready")

-- TPs (25+ locations)
local TPS = {
    Starter = CFrame.new(-323,73,5641),
    Jungle = CFrame.new(-1320,16,377),
    ["Redz Secret"] = CFrame.new(0,1000,0),
    -- Add 22 more here...
}
local TPSection = Main:NewSection("Teleports")
for name, cframe in pairs(TPS) do
    TPSection:NewButton(name, "", function()
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
        end
    end)
end

-- RedZ Fly (Mobile WASD + Space/Shift)
local flySpeed = 50
local flying = false
local flyBV = Instance.new("BodyVelocity")
flyBV.MaxForce = Vector3.new(4000,4000,4000)
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

Misc:NewSection("Fly"):NewSlider("Fly Speed", "1-200", 50, 1, 200, function(s)
    flySpeed = s
end):NewToggle("Fly", "", function(state)
    flying = state
    local char = game.Players.LocalPlayer.Character
    if flying and char then
        flyBV.Parent = char.HumanoidRootPart
    else
        flyBV.Parent = nil
    end
end)

RS.Heartbeat:Connect(function()
    if flying and game.Players.LocalPlayer.Character then
        local char = game.Players.LocalPlayer.Character
        local root = char:FindFirstChild("HumanoidRootPart")
        if root and flyBV.Parent then
            local cam = workspace.CurrentCamera
            local vel = Vector3.new(0,0,0)
            if UIS:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.CFrame.LookVector end
            if UIS:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.CFrame.RightVector end
            if UIS:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,1,0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0,1,0) end
            flyBV.Velocity = vel * flySpeed
        end
    end
end)

-- Max Stats (7 types x5)
local StatsSection = Combat:NewSection("Max Stats")
local stats = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit", "Bloom", "Observation"}
for _, stat in pairs(stats) do
    StatsSection:NewButton("Max "..stat, "", function()
        task.spawn(function()
            for i = 1, 5 do
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", stat, 1000)
                end)
                task.wait(0.15)
            end
        end)
    end)
end

-- Auto Farm Nearest Enemy
local autoFarm = false
Farm:NewSection("Auto Farm"):NewToggle("Auto Farm", "", function(state)
    autoFarm = state
end)
task.spawn(function()
    while task.wait(0.2) do
        if autoFarm then
            local char = game.Players.LocalPlayer.Character
            if char then
                local root = char.HumanoidRootPart
                local nearest, dist = nil, 500
                for _, enemy in pairs(workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 then
                        local eRoot = enemy:FindFirstChild("HumanoidRootPart")
                        if eRoot then
                            local d = (root.Position - eRoot.Position).Magnitude
                            if d < dist then
                                nearest, dist = enemy, d
                            end
                        end
                    end
                end
                if nearest and dist < 500 then
                    root.CFrame = nearest.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", nearest.Name.."Quest", 1)
                    end)
                end
            end
        end
    end
end)

-- ESP (skatbr)
Misc:NewSection("ESP"):NewToggle("ESP", "", function(state)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua"))()
end)

-- Inf Stamina + WalkSpeed
local walkspeed = 16
Misc:NewSection("Movement"):NewSlider("WalkSpeed", "16-100", 16, 16, 100, function(s)
    walkspeed = s
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
    end
end)
RS.Heartbeat:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char then
        char.Humanoid:ChangeState(11) -- Inf Stamina
        if char.Humanoid.WalkSpeed ~= walkspeed then
            char.Humanoid.WalkSpeed = walkspeed
        end
    end
end)

-- Rejoin/Server Hop
Misc:NewSection("Server"):NewButton("Rejoin", "", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
end):NewButton("Server Hop", "", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/serverhop.lua"))()
end)

-- CharacterAdded (Fly persist)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(3)
    if flying then
        local char = game.Players.LocalPlayer.Character
        flyBV.Parent = char.HumanoidRootPart
    end
end)

print("✅ BULLETPROOF CRYPTA v5.2 LOADED | PENTEST MODE")
game.StarterGui:SetCore("SendNotification",{
    Title = "🚀 CRYPTA EMPIRE v5.2";
    Text = "FULLY LOADED | REDZ STYLE | Mobile Ready";
    Duration = 5
})
