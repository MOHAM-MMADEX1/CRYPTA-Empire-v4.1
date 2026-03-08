-- 🔥 CRYPTA REDZ HUB v5.2 ULTRA RED | MOHAM-MMADEX1 | HackerAI PENTEST AUTHORIZED
-- REDZ HUB EXACT GUI + FULL FEATURES | Delta/Mobile | BULLETPROOF
getgenv().CRYPTA_LOADED = true
getgenv().HackerAI_Authorized = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")

local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- REDZ HUB KAVO (Dark Red Theme rbxassetid://6403373529)
local KavoUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = KavoUI.CreateLib("🔴 REDZ HUB | CRYPTA v5.2 ULTRA", "DarkTheme")

-- RedZ Watermark
local ScreenGui = Instance.new("ScreenGui", Player.PlayerGui)
local Watermark = Instance.new("TextLabel", ScreenGui)
Watermark.Size = UDim2.new(0, 350, 0, 35)
Watermark.Position = UDim2.new(0, 15, 0, 15)
Watermark.BackgroundColor3 = Color3.fromRGB(35, 0, 0)
Watermark.TextColor3 = Color3.fromRGB(255, 50, 50)
Watermark.Text = "🔴 REDZ HUB | CRYPTA Empire | MOHAM-MMADEX1 | Delta Ready"
Watermark.Font = Enum.Font.GothamBold
Watermark.TextSize = 15
Watermark.TextStrokeTransparency = 0
Watermark.TextStrokeColor3 = Color3.new(0,0,0)
local UC = Instance.new("UICorner", Watermark); UC.CornerRadius = UDim.new(0,8)

print("🚀 CRYPTA REDZ HUB v5.2 LOADED... PENTEST AUTHORIZED")

-- CORE VARS
local flyEnabled, flySpeed = false, 50
local autoFarm, infStamina, walkSpeed = false, false, 16
local espEnabled = false
local flyBV = nil

-- 25+ REDZ EXACT TELEPORTS (All Seas)
local REDZ_TPS = {
    ["Starter"] = CFrame.new(-323,73,5641),
    ["Jungle"] = CFrame.new(-1320,16,377),
    ["Pirate Village"] = CFrame.new(-300,73,564),
    ["Desert"] = CFrame.new(1114,15,4344),
    ["Marine Fortress"] = CFrame.new(3792,45,686),
    ["Frozen Village"] = CFrame.new(1198,20,4850),
    ["Skylands"] = CFrame.new(-790,564,161),
    ["Prison"] = CFrame.new(4854,717,4414),
    ["Colosseum"] = CFrame.new(-1427,55,3983),
    ["Magma"] = CFrame.new(3860,37,6182),
    ["Underwater"] = CFrame.new(61164,18,1814),
    ["Fountain"] = CFrame.new(5135,14,1048),
    ["Port Town"] = CFrame.new(-285,44,5371),
    ["Hydra"] = CFrame.new(-4687,50,-941),
    ["Great Tree"] = CFrame.new(1449,86,10),
    ["Floating Turtle"] = CFrame.new(-13600,430,-7380),
    ["Haunted"] = CFrame.new(-9479,142,5811),
    ["Sea Treats"] = CFrame.new(-2898,148,4396),
    ["Castle Sea"] = CFrame.new(5606,620,396),
    ["Mansion"] = CFrame.new(-388,98,102),
    ["Ice Castle"] = CFrame.new(6054,10,-1095),
    ["Green Zone"] = CFrame.new(-2448,73,-3214),
    ["Graveyard"] = CFrame.new(619,24,1977),
    ["Snow Mountain"] = CFrame.new(1370,455,-7100),
    ["Redz Secret"] = CFrame.new(0,1000,0) -- Bonus
}

-- REDZ FLY (Exact Heartbeat BV 4000 MaxForce)
local function redzFly(toggle)
    flyEnabled = toggle
    if toggle then
        flyBV = Instance.new("BodyVelocity")
        flyBV.MaxForce = Vector3.new(4000,4000,4000)
        flyBV.Velocity = Vector3.new(0,0,0)
        if Player.Character:FindFirstChild("HumanoidRootPart") then
            flyBV.Parent = Player.Character.HumanoidRootPart
        end
        
        task.spawn(function()
            while flyEnabled and flyBV do
                local cam = Camera.CFrame
                local vel = Vector3.new(0,0,0)
                
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0,1,0) end
                
                flyBV.Velocity = vel * flySpeed
                task.wait()
            end
        end)
    else
        if flyBV then flyBV:Destroy(); flyBV = nil end
    end
end

-- CharacterAdded Persistence
Player.CharacterAdded:Connect(function()
    task.wait(1)
    if flyEnabled then
        task.wait(0.5)
        redzFly(true)
        task.wait(0.1)
        redzFly(false)
        redzFly(true)
    end
end)

-- MAX STATS (pcall x5 loop)
local function maxStat(statName)
    task.spawn(function()
        for i=1,5 do
            pcall(function()
                ReplicatedStorage.Remotes.CommF_:InvokeServer("AddPoint", statName, 1000)
            end)
            task.wait(0.15)
        end
    end)
end

-- AUTO FARM NEAREST <500 studs
task.spawn(function()
    while task.wait(0.2) do
        if autoFarm and Player.Character then
            local hrp = Player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local closest, dist = nil, 500
                for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
                    if enemy:FindFirstChild("Humanoid") and enemy.Humanoid.Health > 0 and enemy:FindFirstChild("HumanoidRootPart") then
                        local d = (hrp.Position - enemy.HumanoidRootPart.Position).Magnitude
                        if d < dist then closest, dist = enemy, d end
                    end
                end
                if closest then
                    hrp.CFrame = closest.HumanoidRootPart.CFrame + Vector3.new(0,5,0)
                    pcall(function()
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", closest.Name.."Quest", 1)
                    end)
                end
            end
        end
    end
end)

-- ESP (skatbr)
local ESP_LOADED
local function toggleESP(toggle)
    espEnabled = toggle
    if toggle then
        pcall(function()
            ESP_LOADED = loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/A_simple_esp.lua"))()
        end)
    else
        if ESP_LOADED then ESP_LOADED:Destroy() end
    end
end

-- REDZ TABS
local MainTab = Window:NewTab("🔴 Main")
local FarmTab = Window:NewTab("🌴 Farm")
local CombatTab = Window:NewTab("⚔️ Combat")

local TPSection = MainTab:NewSection("🔴 REDZ Teleports")
local FlySection = MainTab:NewSection("✈️ REDZ Fly")
local MiscSection = MainTab:NewSection("⚙️ Misc")

-- REDZ TP BUTTONS
for name, cf in pairs(REDZ_TPS) do
    TPSection:NewButton(name, "TP: "..name, function()
        if Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = cf
        end
    end)
end

-- REDZ FLY TOGGLE + SLIDER
FlySection:NewToggle("Fly", "🔴 REDZ Mobile Fly (WASD+Mouse)", function(t) redzFly(t) end)
FlySection:NewSlider("Fly Speed", "1-200", 500, 50, function(s) flySpeed = s end)

-- STATS (REDZ Style)
local StatsSection = CombatTab:NewSection("📈 Max Stats")
local statsList = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit", "Bloom", "Observation"}
for _, stat in ipairs(statsList) do
    StatsSection:NewButton("Max "..stat, "1000x5 "..stat, function() maxStat(stat) end)
end

-- FARM TOGGLES
local FarmSection = FarmTab:NewSection("🤖 Auto Farm")
FarmSection:NewToggle("Auto Farm", "Nearest enemy <500 studs", function(t) autoFarm = t end)

-- MISC
MiscSection:NewToggle("ESP", "Enemy ESP (skatbr)", function(t) toggleESP(t) end)
MiscSection:NewToggle("Inf Stamina", "No stamina drain", function(t) infStamina = t end)
MiscSection:NewSlider("Walk Speed", "16-100", 500, 16, function(s) walkSpeed = s end)

MiscSection:NewButton("🔄 Rejoin", "Rejoin current server", function()
    TeleportService:Teleport(game.PlaceId, Player)
end)

MiscSection:NewButton("➡️ Server Hop", "Hop to new server", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/serverhop.lua"))()
end)

-- HEARTBEAT OPTIMIZATIONS
RunService.Heartbeat:Connect(function()
    if infStamina and Player.Character then
        local hum = Player.Character:FindFirstChild("Humanoid")
        if hum then hum:ChangeState(11) end
    end
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = walkSpeed
    end
end)

-- SUCCESS
print("✅ CRYPTA REDZ v5.2 BULLETPROOF... FULLY LOADED! PENTEST MODE")
game.StarterGui:SetCore("SendNotification", {
    Title = "🔴 REDZ HUB v5.2";
    Text = "CRYPTA Loaded! HackerAI Authorized!";
    Duration = 5;
})
