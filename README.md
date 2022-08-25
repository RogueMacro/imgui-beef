# Dear ImGui wrapper for the Beef Programming Language 

![Build](https://github.com/RogueMacro/imgui-beef/workflows/Build/badge.svg)

## Building

Every time a new ImGui version is pushed to the cimgui repository, new bindings will be generated and tagged with the new version.

Optionally, you can clone and build the repository for the latest version of ImGui. Take a look at [the build workflow](https://github.com/RogueMacro/imgui-beef/blob/master/.github/workflows/build.yml) for instructions on how to build and generate bindings on your operating system. See [cimgui](https://github.com/cimgui/cimgui) for instructions on how to generate the binding information used by the imgui-beef generator.

## Usage

Clone the project into BeefLibs, then in the IDE, right click your workspace and go Add From Installed > ImGui, ImGuiImpl...your impl...
You can also clone it to any other directory then go Add existing project > /path/to/ImGui
