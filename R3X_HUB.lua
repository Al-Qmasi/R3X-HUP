-- 🌟 R3X HUB 🌟
-- الحقوق: R3X HUB | صنع خصيصاً
-- يعمل على جميع المابات

local User = game.Players.LocalPlayer

-- واجهة
local Screen = Instance.new("ScreenGui", User:WaitForChild("PlayerGui"))
Screen.Name = "R3X_HUB"

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 350)
Main.Position = UDim2.new(0.5, -150, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.Visible = false
Main.Parent = Screen

local Title = Instance.new("TextLabel", Main)
Title.Text = "R3X HUB"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

local Buttons = {"ESP", "Speed", "Fly", "Hitbox"}
local States = {false, false, false, false}
local ButtonsUI = {}

for i, name in ipairs(Buttons) do
    local btn = Instance.new("TextButton", Main)
    btn.Text = name .. " OFF"
    btn.Size = UDim2.new(0.8, 0, 0, 40)
    btn.Position = UDim2.new(0.1, 0, 0, (i * 50))
    btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    ButtonsUI[i] = btn

    btn.MouseButton1Click:Connect(function()
        States[i] = not States[i]
        btn.BackgroundColor3 = States[i] and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(150, 0, 0)
        btn.Text = name .. (States[i] and " ON" or " OFF")
    end)
end

local Info = Instance.new("TextLabel", Main)
Info.Text = "© R3X HUB"
Info.Size = UDim2.new(1, 0, 0, 30)
Info.Position = UDim2.new(0, 0, 1, -30)
Info.BackgroundTransparency = 1
Info.TextColor3 = Color3.fromRGB(200, 200, 200)
Info.Font = Enum.Font.GothamItalic
Info.TextScaled = true

local ToggleBtn = Instance.new("TextButton", Screen)
ToggleBtn.Text = "☰ R3X"
ToggleBtn.Size = UDim2.new(0, 100, 0, 40)
ToggleBtn.Position = UDim2.new(0, 10, 0, 10)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.Gotham
ToggleBtn.TextScaled = true

ToggleBtn.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

-- الخصائص
spawn(function()
    while wait(0.1) do
        -- ESP
        if States[1] then
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= User and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    if not plr.Character:FindFirstChild("ESP_Billboard") then
                        local bb = Instance.new("BillboardGui", plr.Character.HumanoidRootPart)
                        bb.Name = "ESP_Billboard"
                        bb.Size = UDim2.new(0, 100, 0, 50)
                        bb.AlwaysOnTop = true
                        local lbl = Instance.new("TextLabel", bb)
                        lbl.Size = UDim2.new(1, 0, 1, 0)
                        lbl.BackgroundTransparency = 1
                        lbl.Text = plr.Name
                        lbl.TextColor3 = Color3.new(1, 0, 0)
                        lbl.Font = Enum.Font.GothamBold
                        lbl.TextScaled = true
                    end
                end
            end
        else
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local esp = plr.Character.HumanoidRootPart:FindFirstChild("ESP_Billboard")
                    if esp then esp:Destroy() end
                end
            end
        end

        -- Speed
        if States[2] and User.Character and User.Character:FindFirstChild("Humanoid") then
            User.Character.Humanoid.WalkSpeed = 100
        elseif User.Character and User.Character:FindFirstChild("Humanoid") then
            User.Character.Humanoid.WalkSpeed = 16
        end

        -- Fly (بسيط)
        if States[3] and User.Character and User.Character:FindFirstChild("HumanoidRootPart") then
            User.Character.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
        end

        -- Hitbox
        if States[4] then
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= User and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    plr.Character.HumanoidRootPart.Size = Vector3.new(8, 8, 8)
                end
            end
        else
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= User and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    plr.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                end
            end
        end
    end
end)
