return {
	version = "1.0.0xlr",
	classes = {
		bg = {
			["red-350"] = Color3.fromRGB(250, 0, 0),
			["red-400"] = Color3.fromRGB(200, 0, 0),
			["red-450"] = Color3.fromRGB(150, 0, 0),
			["red-500"] = Color3.fromRGB(100, 0, 0),
		},
		textColor = {
			["red-350"] = Color3.fromRGB(250, 0, 0),
			["red-400"] = Color3.fromRGB(200, 0, 0),
			["red-450"] = Color3.fromRGB(150, 0, 0),
			["red-500"] = Color3.fromRGB(100, 0, 0),
		},
		animate = {
			["primary"] = {
				bg = "red-500",
				round = "md",
				s = "lg",
				duration = 0.5,
				easingStyle = Enum.EasingStyle.Linear,
				easingDirection = Enum.EasingDirection.InOut,
				repeatCount = 0,
				reverse = false,
				delayTime = 0,
			},
			["secondary"] = {
				duration = 0.3,
				easingStyle = Enum.EasingStyle.Sine,
				easingDirection = Enum.EasingDirection.InOut,
				repeatCount = 0,
				reverse = false,
				delayTime = 0.1,
			}
		}
	},
}