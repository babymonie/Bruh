
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
            game.Players.LocalPlayer.Character.Humanoid.NoDamage = true
        else
            game.Players.LocalPlayer.Character.Humanoid.NoDamage = false
        end
    end)
    local playerlist = {} --array of players
    for i, v in pairs(plrs:GetPlayers()) do
        table.insert(playerlist, v)
    end
    dababy:NewDropdown("Player List","a list of players", playerlist, function(currentOption)
        getfenv().target = currentOption
        print(currentOption)
    end)
    dababy:NewTextBox("Enter chat message", "says the message in the chat", function(s)
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(s, "All")
        getfenv().message = s
    end)
    dababy:NewButton("Spam Chat", "Spams the chat with the message", function()
        local message = getfenv().message
        if message > "" then
            local time = 0
            getfenv().time = time
            --while loop
            if getfenv().time < 0
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
                getfenv().time = getfenv().time + 1
                time = getfenv().time
            end
            else
                game:StarterGui():SetCore("SendNotification", {
                    Title = "Done";
                    Text = "Done Spamming";
                    Duration = 5;
                })
            end
        end
        else
            print("Please enter a message")
        end
    end)
    dababy:NewButton("Stop Spamming", "Stops spamming the chat", function()
        getfenv().time = 0
    end)
    --Fling
    dababy:NewButton("Fling", "Fling the player", function()
        local target = getfenv().target
        if target ~= nil then
        
        else
            print("Please select a player")
        end
    end)
    local BypassedAudio = Anim:NewSection("Bypassed Audio")
    --enter sound id here
    BypassedAudio:NewTextBox("Play Sound ID", "Enter the sound ID", function(s)
        local SoundId = s
        local s = Instance.new("Sound")
        s.Name = "RapGod"
        s.SoundId = "http://www.roblox.com/asset/?id=" .. SoundId
        s.Volume = 55
        s.Looped = false
        s.archivable = false
        s.Parent = game.Workspace
        s:Play()
        --if no sound is playing in the next 1 second, say that the sound is not valid
        wait(1)
        if s.IsPlaying == false then
            game.StarterGui:SetCore("SendNotification", {
                Title = "The given sound id is not valid";
                Text = "Please enter a valid sound id";,
                Duration = 3,
                })
        end
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Started Sound";
                Text = "Sound ID: " .. SoundId;
                Duration = 5;
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
