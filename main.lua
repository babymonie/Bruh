
if game.PlaceId == 4924922222 then 
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("BRUH Script - Brookhaven", "Serpent")
local Main = Window:NewTab("Main")
local dababy = Main:NewSection("Local Player")
local Anim = Window:NewTab("Misc")
local Spy = Window:NewTab("Spy")
local teleports = Window:NewTab("Teleports")
dababy:NewSlider("Walk Speed", "BRUH ITS IN THE NAME!!!!", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
dababy:NewSlider("Jump Power", "Make's Jump Height/Power Higher!", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
dababy:NewToggle("No Fall Damage", "BRUH ITS IN THE NAME!!!!", function(s)
    if s then
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
    else
        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    end
end)
local BypassedAudio = Anim:NewSection("Bypassed Audio")
--enter sound id here
BypassedAudio:NewTextBox("Play Sound ID", "Enter the sound ID", function(s)
    local SoundId = s
    local s = Instance.new("Sound")
    s.Name = "RapGod"
    s.SoundId = "http://www.roblox.com/asset/?id=" .. SoundId
    s.Volume = 50
    s.Looped = false
    s.archivable = false
    s.Parent = game.Workspace
    wait(1)
    s:Play()
end)    
--Stop all sounds
BypassedAudio:NewButton('Stop All Music','Stops all Music', function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Sound") then
            v:Stop()
        end
    end
end)
--pause all sounds
BypassedAudio:NewButton('Pause All Music','Pauses all Music', function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Sound") then
            v:Pause()
        end
    end
end)
--unpause all sounds
BypassedAudio:NewButton('Unpause All Music','Unpauses all Music', function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Sound") then
            v:Play()
        end
    end
end)
local Teleport = teleports:NewSection("Teleports")
Teleport:NewTextBox("Teleport To", "Teleports you to a player", function(s)
    local Player = game.Players:FindFirstChild(s)
    if Player then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error";
            Text = "Player not found";
            Duration = 3;
        })
    end
end)
