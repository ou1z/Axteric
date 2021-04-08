local Axteric = {}

local function service(name)
	return game:GetService(name)
end
local services = {
	http = service('HttpService'),
	gui = service('GuiService'),
	uis = service('UserInputService'),
	players = service('Players'),
	runservice = service('RunService'),
	ts = service('TweenService')
}
local constants = {
	plr = services.players.LocalPlayer,
	inset = services.gui:GetGuiInset()
}
local mouse = constants.plr:GetMouse()

local minmaxpercent = function(min, max, percent)
	return ((max - min) * percent) + min
end
local percentminmax = function(min, max, percent)
	return (percent / (max - min)) + min
end


function Axteric:Init(name, config)
	local randomstr = function(len)
		local letters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}
		local s = ''
		local random = Random.new()
		for i = 1,len do
			local letter = letters[math.random(1,#letters)]
			if random:NextNumber() > .5 then
				letter = letter:upper()
			end
			s = s .. letter
		end
		return s
	end
	
	local tweencolor = function(obj, time, prop, color)
		local tween = services.ts:Create(obj, TweenInfo.new(time), {[prop] = color})
		tween:Play()
		return tween
	end
	
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = randomstr(25)
	syn.protect_gui(ScreenGui)

	local Frame = Instance.new("Frame")
	local Frames = Instance.new("Frame")
	local Title = Instance.new("Frame")
	local TitleName = Instance.new("TextLabel")
	local Line = Instance.new("Frame")
	local InnerLine = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local UIPadding_2 = Instance.new("UIPadding")
	local UIPadding_3 = Instance.new("UIPadding")
	local UIListLayout_3 = Instance.new("UIListLayout")
	local Tabs = Instance.new("Frame")
	local Logo = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local TabList = Instance.new("Frame")
	local UIListLayout_4 = Instance.new("UIListLayout")

	ScreenGui.Name = "ScreenGui"
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = ScreenGui
	Frame.BackgroundColor3 = Color3.fromRGB(33, 33, 32)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.222713858, 0, 0.239819005, 0)
	Frame.Size = UDim2.new(0, 545, 0, 296)
	Frame.Active = true
	Frame.Draggable = true

	Frames.Name = "Frames"
	Frames.Parent = Frame
	Frames.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	Frames.BorderSizePixel = 0
	Frames.Position = UDim2.new(0, 5, 0, 5)
	Frames.Size = UDim2.new(0, 399, 0, 284)

	Title.Name = "Title"
	Title.Parent = Frames
	Title.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 399, 0, 38)

	TitleName.Name = "TitleName"
	TitleName.Parent = Title
	TitleName.AnchorPoint = Vector2.new(0.5, 0.5)
	TitleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleName.BackgroundTransparency = 1.000
	TitleName.Position = UDim2.new(0.5, 0, 0.5, 0)
	TitleName.Size = UDim2.new(0, 200, 0, 50)
	TitleName.Font = Enum.Font.Ubuntu
	TitleName.Text = ""
	TitleName.TextColor3 = Color3.fromRGB(255, 255, 255)
	TitleName.TextSize = 14.000
	TitleName.TextStrokeTransparency = 0.000

	Line.Name = "Line"
	Line.Parent = Title
	Line.BackgroundColor3 = Color3.fromRGB(55, 88, 111)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0, 0, 0.947368443, 0)
	Line.Size = UDim2.new(0, 399, 0, 8)

	InnerLine.Name = "InnerLine"
	InnerLine.Parent = Line
	InnerLine.AnchorPoint = Vector2.new(0.5, 0.5)
	InnerLine.BackgroundColor3 = Color3.fromRGB(70, 114, 143)
	InnerLine.BorderSizePixel = 0
	InnerLine.Position = UDim2.new(0.5, 0, 0.5, 0)
	InnerLine.Size = UDim2.new(1, 0, 0.5, 0)

	Tabs.Name = "Tabs"
	Tabs.Parent = Frame
	Tabs.BackgroundColor3 = Color3.fromRGB(12, 11, 12)
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0.753201663, 0, -4.57763672e-05, 0)
	Tabs.Size = UDim2.new(0.245426834, 0, 1, 0)

	Logo.Name = "Logo"
	Logo.Parent = Tabs
	Logo.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0.5, 0, 0.194999993, 0)
	Logo.Size = UDim2.new(0, 37, 0, 37)
	Logo.Image = "rbxassetid://6651916712"

	TextLabel.Name = "©"
	TextLabel.Parent = Tabs
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 0, 0.895270109, 0)
	TextLabel.Size = UDim2.new(0, 133, 0, 24)
	TextLabel.Font = Enum.Font.TitilliumWeb
	TextLabel.Text = name
	TextLabel.TextColor3 = Color3.fromRGB(172, 172, 172)
	TextLabel.TextSize = 20.000
	TextLabel.TextStrokeTransparency = 0.000

	TabList.Name = "TabList"
	TabList.Parent = Tabs
	TabList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabList.BackgroundTransparency = 1.000
	TabList.Position = UDim2.new(0.12709555, 0, 0.310810804, 0)
	TabList.Size = UDim2.new(0, 100, 0, 163)

	UIListLayout_4.Parent = TabList
	UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder

	local Master = {
		Connections = {},
		Drawings = {},
		Tabs = {}
	}

	function Master:CreateTab(name)
		local TabButton = Instance.new("TextButton")

		TabButton.Name = "TabButton"
		TabButton.Parent = TabList
		TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.BackgroundTransparency = 1.000
		TabButton.Position = UDim2.new(-0.170000002, 0, 0.0565204918, 0)
		TabButton.Size = UDim2.new(0, 134, 0, 27)
		TabButton.Font = Enum.Font.SourceSans
		TabButton.Text = tostring(name)
		TabButton.TextColor3 = Color3.fromRGB(195, 195, 195)
		TabButton.TextSize = 14.000

		local TabFrame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")

		TabFrame.Name = "TabFrame"
		TabFrame.Parent = Frames
		TabFrame.Active = true
		TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderSizePixel = 0
		TabFrame.Position = UDim2.new(0, 0, 0.154929578, 0)
		TabFrame.Size = UDim2.new(0, 399, 0, 240)
		TabFrame.ScrollBarThickness = 2

		UIListLayout.Parent = TabFrame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		UIPadding.Parent = TabFrame
		UIPadding.PaddingTop = UDim.new(0, 5)
		
		local self = {
			TabButton = TabButton,
			TabFrame = TabFrame,
			Connections = {}
		}
		
		table.insert(Master.Tabs, self)

		function self:Remove()
			self.TabFrame:Destroy()
			self.TabButton:Destroy()
			for i,v in pairs(self.Connections) do
				v:Disconnect()
			end
		end
		
		local function switchtabs()
			for i,v in pairs(Master.Tabs) do
				tweencolor(v.TabButton, 0.1, 'TextColor3', Color3.fromRGB(144, 144, 144))
				v.TabFrame.Visible = false
			end
			tweencolor(self.TabButton, 0.1, 'TextColor3', Color3.fromRGB(255, 255, 255))
			self.TabFrame.Visible = true
			TitleName.Text = tostring(name)
		end
		
		switchtabs()
		
		self.Connections.switchtab = TabButton.MouseButton1Click:Connect(function()
			switchtabs()
		end)

		function self:Slider(name, min, max, default, callback)
			default = math.clamp(default, min, max)
			
			local SliderFrame = Instance.new("Frame")
			local BoxName = Instance.new("TextLabel")
			local Slider = Instance.new("Frame")
			local Number = Instance.new("TextLabel")
			local SliderButton = Instance.new("TextButton")

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = self.TabFrame
			SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderFrame.BackgroundTransparency = 1.000
			SliderFrame.Position = UDim2.new(0, 0, 0.020833334, 0)
			SliderFrame.Size = UDim2.new(0, 389, 0, 38)

			BoxName.Name = "BoxName"
			BoxName.Parent = SliderFrame
			BoxName.AnchorPoint = Vector2.new(0, 0.5)
			BoxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.BackgroundTransparency = 1.000
			BoxName.Position = UDim2.new(0.0231362469, 0, 0.5, 0)
			BoxName.Size = UDim2.new(0, 72, 0, 38)
			BoxName.Font = Enum.Font.SourceSans
			BoxName.Text = tostring(name)
			BoxName.TextColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.TextSize = 14.000
			BoxName.TextStrokeTransparency = 0.000

			Slider.Name = "Slider"
			Slider.Parent = SliderFrame
			Slider.AnchorPoint = Vector2.new(0, 0.5)
			Slider.BackgroundColor3 = Color3.fromRGB(121, 121, 121)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.261999905, 0, 0.5, 0)
			Slider.Size = UDim2.new(0, 240, 0, 3)

			Number.Name = "Number"
			Number.Parent = Slider
			Number.AnchorPoint = Vector2.new(0, 0.5)
			Number.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Number.BackgroundTransparency = 1.000
			Number.Position = UDim2.new(0.991466522, 0, 0.5, 0)
			Number.Size = UDim2.new(0, 52, 0, 38)
			Number.Font = Enum.Font.SourceSans
			Number.Text = tostring(default)
			Number.TextColor3 = Color3.fromRGB(255, 255, 255)
			Number.TextSize = 14.000
			Number.TextStrokeTransparency = 0.000
			Number.TextWrapped = true

			SliderButton.Name = "SliderButton"
			SliderButton.Parent = Slider
			SliderButton.BackgroundColor3 = Color3.fromRGB(131, 131, 131)
			SliderButton.Position = UDim2.new(percentminmax(min, max, default), 0, -2, 0)
			SliderButton.Size = UDim2.new(0.0250000004, 0, 5, 0)
			SliderButton.AutoButtonColor = false
			SliderButton.Font = Enum.Font.SourceSans
			SliderButton.Text = ""
			SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			SliderButton.TextSize = 14.000

			local self = {
				Connections = {},
				Value = default
			}
			local dragging = false

			SliderButton.MouseButton1Down:Connect(function()
				dragging = true
			end)
			Slider.InputBegan:Connect(function(k)
				if k.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
				end
			end)
			self.Connections.uisbegan = services.uis.InputChanged:Connect(function()
				if dragging then
					local pos = Vector2.new(mouse.X, mouse.Y + constants.inset.Y)
					local relpos = pos - Slider.AbsolutePosition
					local percent = math.clamp(relpos.X / Slider.AbsoluteSize.X, 0, 1)
					SliderButton.Position = UDim2.new(percent, 0, -2, 0)
					local value = math.floor(minmaxpercent(min,max,percent))
					Number.Text = tostring(value)
					callback(value)
				end
			end)
			self.Connections.uisended = services.uis.InputEnded:Connect(function(k,g)
				if k.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			function self:SetValue(value)
				if not tonumber(value) then return false end
				self.Value = tonumber(value)
				Number.Text = tostring(value)
				SliderButton:TweenPosition(UDim2.new(percentminmax(min, max, tonumber(value)), 0, -2, 0), 'In', 'Linear', 0.05)
			end

			function self:GetValue()
				return self.Value
			end

			function self:Remove()
				for i,v in pairs(self.Connections) do
					v:Disconnect()
				end
				Slider:Destroy()
			end

			return self
		end

		function self:Button(name, callback)
			local ButtonFrame = Instance.new("Frame")
			local Button = Instance.new("TextButton")

			ButtonFrame.Name = "ButtonFrame"
			ButtonFrame.Parent = TabFrame
			ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonFrame.BackgroundTransparency = 1.000
			ButtonFrame.Position = UDim2.new(0.012531328, 0, 0.183333337, 0)
			ButtonFrame.Size = UDim2.new(0, 389, 0, 26)

			Button.Name = "Button"
			Button.Parent = ButtonFrame
			Button.AnchorPoint = Vector2.new(0.5, 0.5)
			Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			Button.BorderColor3 = Color3.fromRGB(15, 23, 30)
			Button.Position = UDim2.new(0.5, 0, 0.5, 0)
			Button.Size = UDim2.new(0.949999988, 0, 0.800000012, 0)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.SourceSans
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.Text = tostring(name)

			local self = {
				Connections = {}
			}

			self.Connections.Clicked = Button.MouseButton1Click:Connect(callback)

			function self:Remove()
				for i,v in pairs(self.Connections) do
					v:Disconnect()
				end
				ButtonFrame:Destroy()
			end

			function self:Activate()
				callback()
			end

			return self
		end

		function self:Box(name, callback)
			local TextBoxFrame = Instance.new("Frame")
			local BoxName = Instance.new("TextLabel")
			local Box = Instance.new("TextBox")

			TextBoxFrame.Name = "TextBoxFrame"
			TextBoxFrame.Parent = TabFrame
			TextBoxFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextBoxFrame.BackgroundTransparency = 1.000
			TextBoxFrame.Position = UDim2.new(0, 0, 0.020833334, 0)
			TextBoxFrame.Size = UDim2.new(0, 389, 0, 38)

			BoxName.Name = "BoxName"
			BoxName.Parent = TextBoxFrame
			BoxName.AnchorPoint = Vector2.new(0, 0.5)
			BoxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.BackgroundTransparency = 1.000
			BoxName.Position = UDim2.new(0, 0, 0.5, 0)
			BoxName.Size = UDim2.new(0, 72, 0, 38)
			BoxName.Font = Enum.Font.SourceSans
			BoxName.Text = tostring(name)
			BoxName.TextColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.TextSize = 14.000
			BoxName.TextStrokeTransparency = 0.000

			Box.Name = "Box"
			Box.Parent = TextBoxFrame
			Box.AnchorPoint = Vector2.new(0, 0.5)
			Box.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			Box.BorderColor3 = Color3.fromRGB(23, 38, 49)
			Box.Position = UDim2.new(0.185000002, 0, 0.5, 0)
			Box.Size = UDim2.new(0, 298, 0, 21)
			Box.Font = Enum.Font.SourceSans
			Box.Text = ""
			Box.TextColor3 = Color3.fromRGB(255, 255, 255)
			Box.TextSize = 14.000
			Box.TextStrokeTransparency = 0.000

			local self = {
				Connections = {}
			}

			self.Connections.focuslost = Box.FocusLost:Connect(function(enter)
				if enter then
					callback(Box.Text)
				end
			end)

			function self:Activate(value)
				callback(value)
			end

			function self:Remove()
				for i,v in pairs(self.Connections) do
					v:Disconnect()
				end
				TextBoxFrame:Destroy()
			end

		end


		return self
	end

	Master.Connections.input = services.uis.InputBegan:Connect(function(key,gpe)
		if gpe then return end
		if config.ToggleKey and key.KeyCode == Enum.KeyCode.ToggleKey then
			Frame.Visible = not Frame.Visible
		elseif not config.ToggleKey and key.KeyCode == Enum.KeyCode.RightControl then
			Frame.Visible = not Frame.Visible
		end
	end)

	if config.CustomMouse then
		local image = Drawing.new('Image')
		local icon = config.MouseImage or 'https://cdn.discordapp.com/attachments/829200583079886868/829510673783324723/qf8FGesexT1Hit34SHBCf-2JdMIQZTJ9Esy7tdbKAAndWrqE7I5vAUCcKqzsxKeb0tFn97K1U8iTw1mcBRFgsxd42jZH62qIPto.png'
		
        if not isfolder('Axteric') then
            makefolder('Axteric')
        end
        writefile('Axteric/mouseicon.png', syn.request({Url = icon}).Body)

		local mouseicon = Drawing.new("Image")
		mouseicon.Data = readfile('Axteric/mouseicon.png')
		mouseicon.Size = Vector2.new(20,20)
		mouseicon.Transparency = 0.9
		mouseicon.Visible = Frame.Visible

		Master.Drawings.MouseIcon = mouseicon

		Master.Connections.loop = services.runservice.RenderStepped:Connect(function()
			mouseicon.Position = Vector2.new(mouse.X, mouse.Y + constants.inset.Y)
			mouseicon.Visible = Frame.Visible
			services.uis.MouseIconEnabled = not mouseicon.Visible
		end)	
	end

	return Master
end




return Axteric
