
# Tariq's Roblox UI Framework

Tariq's Framework is a **utility-first** framework designed to simplify and accelerate the process of building UI elements in Roblox. Inspired by utility-first CSS frameworks like Tailwind CSS, this framework provides a set of predefined utility classes to style your Roblox GUIs efficiently.

⚠️ **Note:** This framework is in its prototype phase, with limited features. Stay tuned for more updates!

## Features

- **Utility-First Approach**: Apply pre-defined utilities directly to your UI elements for quick design iterations.
- **Lightweight**: Minimal features for fast prototyping.
- **Roblox-Centric**: Designed specifically for Roblox UI design, ensuring it works seamlessly with Roblox's GUI system.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Available Utilities](#available-utilities)
- [Contribution](#contribution)
- [License](#license)

## Installation

1. Clone the repository to your Roblox project.

   ```bash
   git clone https://github.com/your-username/tariq-framework.git
   ```

2. Import the framework into your Roblox Studio project by placing the necessary files into the `ReplicatedStorage` or `StarterGui` (depending on your project setup).

## Usage

To start using the framework, follow these steps:

1. Add the framework to your desired GUI element. For instance, if you want to apply background color and size utilities to a `Frame`, use the provided utility functions.

2. **Example**:

   ```lua
   local ui = require(game.ReplicatedStorage.TariqFramework)

   local myFrame = Instance.new("Frame")
   myFrame.Parent = script.Parent -- Replace with your UI element's parent
   
   -- Apply utilities
   ui.apply(myFrame, {
       "bg-color-white", -- Background color utility
       "size-md",        -- Size utility
   })
   ```

3. This will style your `Frame` with the specified utilities. The list of available utilities will expand as the framework evolves.

## Available Utilities

Since this is an early prototype, the framework only supports a limited number of utilities. Some of the basic ones include:

- **Background Colors**: `bg-color-white`, `bg-color-black`, etc.
- **Size Utilities**: `size-sm`, `size-md`, `size-lg` for common UI sizes.
- **Position Utilities**: `pos-center`, `pos-left`, etc.

More utilities will be added over time. Feel free to suggest new utilities by opening an issue or contributing!

## Contribution

Want to help build and expand this framework? Check out our [CONTRIBUTING.md](CONTRIBUTING.md) to learn how you can get involved.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
