done = false
local gui = Instance.new("ScreenGui", game.StarterGui)
local frame = Instance.new("Frame", gui)
local IL = Instance.new("ImageLabel", frame)
local TL = Instance.new("TextLabel", frame)
local Inst = Instance.new("TextLabel", frame)

frame.BackgroundColor3 = Color3.new(1,1,1)
frame.BorderSizePixel = 0
frame.Size = UDim2.new(1,0,1,0)

IL.BackgroundTransparency = 1
IL.BorderSizePixel = 0
IL.Position = UDim2.new(.47,0,.8,0)
IL.Size = UDim2.new(.06,0,.1,0)
IL.Image = 'rbxassetid://553735799'

TL.BackgroundTransparency = 1
TL.BorderSizePixel = 0
TL.Position = UDim2.new(0,0,.3,0)
TL.Size = UDim2.new(1,0,.3,0)
TL.Text = 'Installing Custom Require'
TL.FontSize = 'Size60'
TL.Font = 'Code'
TL.TextColor3 = Color3.new(0,0,0)
TL.ZIndex = 2

Inst.BackgroundTransparency = 1
Inst.BorderSizePixel = 0
Inst.Position = UDim2.new(0,0,.6,0)
Inst.Size = UDim2.new(1,0,.1,0)
Inst.ZIndex = 3
Inst.Font = 'Code'
Inst.FontSize = 'Size32'
Inst.Text = 'Please Wait'

spawn(function()
	while not done do
		IL.Rotation = IL.Rotation + 5
		game["Run Service"].RenderStepped:wait()
	end
end)

local NRequire = Instance.new("ModuleScript", game.ServerScriptService)
NRequire.Name = 'MainModule'
NRequire.Source = game:service'HttpService':GetAsync'https://raw.githubusercontent.com/Trompeur/Require/master/Source'
wait(3)
IL.ImageTransparency = 1
	Inst.Text = 'Installation Complete | Check ServerScriptService'
done = true
	wait(2)
	for i=1,100 do
		game["Run Service"].Heartbeat:wait()
		frame.BackgroundTransparency = i/100
		TL.TextTransparency = i/100
		Inst.TextTransparency = i/100
	end
	gui:Destroy()
