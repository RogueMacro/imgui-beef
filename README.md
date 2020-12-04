# Dear ImGui wrapper for the Beef Programming Language 

![Generation](https://github.com/RogueMacro/imgui-beef/workflows/Generation/badge.svg)

Note: SDL binaries are not automatically generated yet, but it is coming soon.

## Generation

Generation happens at 06:00 UTC every day

The generator uses the docking_inter branch of https://github.com/cimgui/cimgui. I have not made any other branches, so docking and viewports can be enabled on demand. It is however, not by default.

## Usage

Add the ImGui project along with the implementation you use, i.e. ImGuiImplGlfw if you're using GLFW.

**Make sure to change the *C Library* in your project's properties to dynamic or else it won't work**
