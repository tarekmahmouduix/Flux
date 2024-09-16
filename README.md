
# Flux

Flux is a **utility-first** framework designed to simplify and accelerate the process of building UI elements in Roblox. Inspired by utility-first CSS frameworks like Tailwind CSS, this framework provides a set of predefined utility classes to style your Roblox GUIs efficiently.

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
### Flux has no dependencies, meaning that you can install it in several ways. You can add it as a submodule, clone the repository, or download the latest ``.rbxm`` file to use in your project.

## Option 1: Clone the Repository
Clone the repository to your Roblox project.

   ```bash
   git clone https://github.com/tarekmahmouduix/Flux
   ```

## Option 2: Donwloading the `.rbxm` file
you can find the rbxm file in github downloads

let me know if you'd like any further installation methods

## Usage

to Start using flux, you can use the template down here or by requiring and using the built in function `applyStyles`

**Template**:

   ```lua
   -- simple app example

   local flux = require(game.ReplicatedStorage.flux.core.main)
   local ScreenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)

   local newElement = Instance.new("TextLabel", ScreenGui)
   newElement.Text = "Hello, Flux!"

   flux.applyStyles(newElement, "bg-gray-50 hover:bg-[30,30,30]-transition hover:text-[255,255,255]-transition sx-[30%] sy-[30%] align-center text-2xl font-arial font-bold round-md")
   ```

3. This will style your `Frame` with the specified utilities. The list of available utilities will expand as the framework evolves.

## Available Utilities

Since this is an early prototype, the framework only supports a limited number of utilities. Some of the basic ones include:

- **Background Colors**: `bg-red-500`, `bg-gray-50`, etc.
- **Size Utilities**: `s-sm`, `s-md`, `s-lg`, `sx-[(number-here)]`, `sy-[(number-here)]`, `text-sm`, `text-xl` for common UI sizes.
- **Special Classes(Pseudo)**: `hover:`, `focus:`
- **Align**: `align-center`, `align-left`, `align-right`, etc.
- **Font**: `font-(font-here)`, `font-bold`, `font-light`, `font-base`, currently supporting about 20 fonts
- **Round**: `round-xs`, `round-sm`, `round-lg`, `round-xl`, `round-2xl`
- **aspectRatio**: `aspect-16-9`, `aspect-4-3`, `aspect-1-1`
- **hidden**: `hidden`, (to hide objects)
- **SpecialKeywords**: to animate a State of a object e.g(``hover:``) you can put (``-transition`` at the end of the state) e.g(``hover:bg-[255,255,255]-transition``)

When using the class (Align) the gui becomes responsive

//Special Class (focus:) might not work properly

More utilities will be added over time. Feel free to suggest new utilities by opening an issue or contributing!

## Contribution

Want to help build and expand this framework? Check out our [CONTRIBUTING.md](CONTRIBUTING.md) to learn how you can get involved.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
