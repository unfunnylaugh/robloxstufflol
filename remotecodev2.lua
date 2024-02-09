_G.say = function(str) 
  game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(str, "All") 
end

_G.followme = function()
  game.Players.LocalPlayer.Character.Humanoid:MoveTo(workspace.FilteringDisabledEz.Torso.Position)
end
