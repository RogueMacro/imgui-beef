using System;
using GLFW;
using ImGui;
using OpenGL;

namespace Example
{
    class Program
    {
        public static int Main(String[] args)
        {
			Glfw.Init();
			let window = Glfw.CreateWindow(800, 600, "ImGui Example", null, null);
			Glfw.MakeContextCurrent(window);
			GL.Init(=> Glfw.GetProcAddress);

			ImGui.CreateContext();
			ImGuiImplGlfw.InitForOpenGL(window, true);
			ImGuiImplOpenGL3.Init();

			while (!Glfw.WindowShouldClose(window))
			{
				ImGuiImplOpenGL3.NewFrame();
				ImGuiImplGlfw.NewFrame();
				ImGui.NewFrame();

				ImGui.ShowDemoWindow();

				GL.glClearColor(0.45f, 0.55f, 0.6f, 1);
				GL.glClear(GL.GL_COLOR_BUFFER_BIT);

				ImGui.Render();
				ImGuiImplOpenGL3.RenderDrawData(ImGui.GetDrawData());

				Glfw.PollEvents();
				Glfw.SwapBuffers(window);
			}

			ImGuiImplOpenGL3.Shutdown();
			ImGuiImplGlfw.Shutdown();
			ImGui.DestroyContext();

			Glfw.DestroyWindow(window);
			Glfw.Terminate();

            return 0;
        }
    }
}
    