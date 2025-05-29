local tweenService = game:GetService("TweenService")

return {
    -- Background colors
    bg = {
        ["blue-350"] = Color3.fromRGB(0, 0, 255),
        ["blue-400"] = Color3.fromRGB(0, 0, 200),
        ["blue-450"] = Color3.fromRGB(0, 0, 150),
        ["blue-500"] = Color3.fromRGB(0, 0, 100),
        ["red-500"] = Color3.fromRGB(255, 0, 0),
        ["green-500"] = Color3.fromRGB(0, 255, 0),
        ["white"] = Color3.fromRGB(255, 255, 255),
        ["black"] = Color3.fromRGB(0, 0, 0),
    },

    -- Text colors
    textColor = {
        ["blue-350"] = Color3.fromRGB(0, 0, 255),
        ["blue-400"] = Color3.fromRGB(0, 0, 200),
        ["blue-450"] = Color3.fromRGB(0, 0, 150),
        ["blue-500"] = Color3.fromRGB(0, 0, 100),
        ["white"] = Color3.fromRGB(255, 255, 255),
        ["black"] = Color3.fromRGB(0, 0, 0),
    },

    opacity = {
        ["25"] = 0.25,
        ["50"] = 0.50,
        ["75"] = 0.75,
        ["100"] = 1,
    },

    -- Sizes
    s = {
        ["sm"] = UDim2.new(0.1, 0, 0.1, 0),
        ["md"] = UDim2.new(0.2, 0, 0.2, 0),
        ["lg"] = UDim2.new(0.3, 0, 0.3, 0),
        ["xl"] = UDim2.new(0.4, 0, 0.4, 0),
        ["xxl"] = UDim2.new(0.5, 0, 0.5, 0),
        ["full"] = UDim2.new(1, 0, 1, 0),
    },

    sx = {
        ["sm"] = UDim2.new(0.1, 0, 0, 0),
        ["md"] = UDim2.new(0.2, 0, 0, 0),
        ["lg"] = UDim2.new(0.3, 0, 0, 0),
        ["xl"] = UDim2.new(0.4, 0, 0, 0),
        ["xxl"] = UDim2.new(0.5, 0, 0, 0),
        ["full"] = UDim2.new(1, 0, 0, 0),
    },

    sy = {
        ["sm"] = UDim2.new(0, 0, 0.1, 0),
        ["md"] = UDim2.new(0, 0, 0.2, 0),
        ["lg"] = UDim2.new(0, 0, 0.3, 0),
        ["xl"] = UDim2.new(0, 0, 0.4, 0),
        ["xxl"] = UDim2.new(0, 0, 0.5, 0),
        ["full"] = UDim2.new(0, 0, 1, 0),
    },

    -- change z
    z = {
        ["low"] = 1,
        ["medium"] = 3,
        ["high"] = 5,
        ["max"] = 99,
    },

    -- Text sizes
    textSize = {
        ["sm"] = 14,
        ["md"] = 18,
        ["lg"] = 24,
        ["xl"] = 32,
    },

    -- Corner radius (rounding)
    round = {
        ["sm"] = UDim.new(0, 5),
        ["md"] = UDim.new(0, 10),
        ["lg"] = UDim.new(0, 15),
        ["xl"] = UDim.new(0, 20),
    },

    -- Position shortcuts
    ps = {
        ["center"] = UDim2.new(0.5, 0, 0.5, 0),
        ["top"] = UDim2.new(0.5, 0, 0, 0),
        ["bottom"] = UDim2.new(0.5, 0, 1, 0),
        ["left"] = UDim2.new(0, 0, 0.5, 0),
        ["right"] = UDim2.new(1, 0, 0.5, 0),
    },

    psx = {
        ["sm"] = UDim2.new(0.1, 0, 0, 0),
        ["md"] = UDim2.new(0.2, 0, 0, 0),
        ["lg"] = UDim2.new(0.3, 0, 0, 0),
        ["xl"] = UDim2.new(0.4, 0, 0, 0),
        ["xxl"] = UDim2.new(0.5, 0, 0, 0),
        ["full"] = UDim2.new(1, 0, 0, 0),
    },

    psy = {
        ["sm"] = UDim2.new(0, 0, 0.1, 0),
        ["md"] = UDim2.new(0, 0, 0.2, 0),
        ["lg"] = UDim2.new(0, 0, 0.3, 0),
        ["xl"] = UDim2.new(0, 0, 0.4, 0),
        ["xxl"] = UDim2.new(0, 0, 0.5, 0),
        ["full"] = UDim2.new(0, 0, 1, 0),
    },

    -- Horizontal alignment
    ha = {
        ["left"] = Enum.HorizontalAlignment.Left,
        ["center"] = Enum.HorizontalAlignment.Center,
        ["right"] = Enum.HorizontalAlignment.Right,
    },

    -- Vertical alignment
    va = {
        ["top"] = Enum.VerticalAlignment.Top,
        ["center"] = Enum.VerticalAlignment.Center,
        ["bottom"] = Enum.VerticalAlignment.Bottom,
    },

    textX = {
        ["left"] = Enum.TextXAlignment.Left,
        ["center"] = Enum.TextXAlignment.Center,
        ["right"] = Enum.TextXAlignment.Right,
    },

    -- Vertical alignment
    textY = {
        ["top"] = Enum.TextYAlignment.Top,
        ["center"] = Enum.TextYAlignment.Center,
        ["bottom"] = Enum.TextYAlignment.Bottom,
    },

    -- Animation presets
    animate = {
        ["fadeIn"] = {
            duration = 0.5,
            easingStyle = Enum.EasingStyle.Quad,
            easingDirection = Enum.EasingDirection.In,
        },
        ["fadeOut"] = {
            duration = 0.5,
            easingStyle = Enum.EasingStyle.Quad,
            easingDirection = Enum.EasingDirection.Out,
        },
        ["bounce"] = {
            duration = 1,
            easingStyle = Enum.EasingStyle.Bounce,
            easingDirection = Enum.EasingDirection.Out,
        },
    },

    -- Presets for UI components
    presets = {
        primary = {
            bg = "blue-500",
            textColor = "white",
            s = "md",
            textSize = "md",
            round = "md",
            align = "center",

            hover = {
                animate = {
                    bg = "red-500",
                    textSize = 50,
                    opacity = "75"
                },
            },
        },

        secondary = {
            bg = "blue-400",
            textColor = "black",
            sz = "sm",
            textSize = "sm",
            round = "sm",
            ps = "top",
        },

        danger = {
            bg = "red-500",
            textColor = "white",
            sz = "lg",
            textSize = "lg",
            round = "lg",
            ps = "bottom",
        },
    },
}