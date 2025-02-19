local player = game:GetService("Players").LocalPlayer

if player.PlayerGui:FindFirstChild("ASS") then player.PlayerGui:FindFirstChild'ASS'.Parent = nil end

local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = 'ASS'

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 620, 0, 520)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true

local function createScrollFrame(parent, position, title)
    local titleLabel = Instance.new("TextLabel", parent)
    titleLabel.Size = UDim2.new(0, 300, 0, 30)
    titleLabel.Position = position
    titleLabel.Text = title
    titleLabel.BackgroundTransparency = 0.5
    titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    local frame = Instance.new("ScrollingFrame", parent)
    frame.Size = UDim2.new(0, 300, 0, 480)
    frame.Position = position + UDim2.new(0, 0, 0, 30)
    frame.CanvasSize = UDim2.new(0, 0, 0, 1000)
    frame.ScrollBarThickness = 8
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    return frame
end

local workspaceToolsFrame = createScrollFrame(mainFrame, UDim2.new(0, 10, 0, 10), "Workspace Tools")
local playerToolsFrame = createScrollFrame(mainFrame, UDim2.new(0, 310, 0, 10), "Player Tools (Equipped)")

local function updateToolLists()
    for _, frame in pairs({workspaceToolsFrame, playerToolsFrame}) do
        for _, child in pairs(frame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
    end

    for _, tool in pairs(workspace:GetChildren()) do
        if tool:IsA("Tool") then
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 280, 0, 50)
            button.Position = UDim2.new(0, 10, 0, 10 + #workspaceToolsFrame:GetChildren() * 60)
            button.Text = tool.Name
            button.Parent = workspaceToolsFrame
            button.MouseButton1Click:Connect(function()
                if tool:FindFirstChild("Handle") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    tool.Handle.CFrame = player.Character.HumanoidRootPart.CFrame
                end
            end)
        end
    end

    for _, p in pairs(game:GetService("Players"):GetPlayers()) do
        if p.Character then
            for _, item in pairs(p.Character:GetChildren()) do
                if item:IsA("Tool") then
                    local button = Instance.new("TextButton")
                    button.Size = UDim2.new(0, 280, 0, 50)
                    button.Position = UDim2.new(0, 10, 0, 10 + #playerToolsFrame:GetChildren() * 60)
                    button.Text = "[" .. p.Name .. "] " .. item.Name
                    button.Parent = playerToolsFrame
                    button.MouseButton1Click:Connect(function()
                        if item:FindFirstChild("Handle") and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            item.Handle.CFrame = player.Character.HumanoidRootPart.CFrame
                        end
                    end)
                end
            end
        end
    end
end

local dragging, dragInput, dragStart, startPos
local userInputService = game:GetService("UserInputService")

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

userInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        mainFrame:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
    end
end)

while true do  
    updateToolLists()  
    wait(1)  
end

-- btw this is absolute caca i took it from chatgpt yes i am a skid
