
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("BRUH Script", "Serpent")
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
    dababy:NewToggle("No Clip","Allows you to walk through walls", function(s)
        local noclip = true;
        if s then
            char = game.Players.LocalPlayer.Character -- Gets your player
            while true do -- Make sure someone is in game
            if noclip == true then
            for _,v in pairs(char:children()) do
            pcall(function()
            if v.className == "Part" then
            v.CanCollide = false
            end
            end)
            end
            end
            game:service("RunService").Stepped:wait()
            end
        end
    end)
    dababy:NewToggle("No Fall Damage", "BRUH ITS IN THE NAME!!!!", function(s)
        if s then
            game.Players.LocalPlayer.Character.Humanoid.NoDamage = true
        else
            game.Players.LocalPlayer.Character.Humanoid.NoDamage = false
        end
    end)
    dababy:NewDropdown("Player List","a list of players", playerlist, function(currentOption)
        getfenv().target = currentOption
        print(currentOption)
    end)
    dababy:NewTextBox("Enter chat message", "says the message in the chat", function(s)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(s, "All")
        getfenv().message = s
    end)
    local BypassedAudio = Anim:NewSection("Bypassed Audio")
    --enter sound id here
    BypassedAudio:NewTextBox("Play Sound ID", "Enter the sound ID", function(so)
        local SoundId = so
        local s = Instance.new("Sound")
        s.Name = "RapGod"
        s.SoundId = "http://www.roblox.com/asset/?id=" .. SoundId
        s.Volume = 55
        s.Looped = false
        s.archivable = false
        s.Parent = game.Workspace
        if s.TimeLength > 0 then
            s:Play()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Sound Bypassed";
                Text = "Sound ID: " .. SoundId .. " has been played!",
                Duration = 3,
                })
        end
        if s.TimeLength == 0 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Sound Not Bypassed";
                Text = "Sound ID: " .. SoundId .. " is invalid!",
                Duration = 3,
                })
        end
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
end
