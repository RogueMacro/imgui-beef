using System;

namespace ImGui
{
    public static class ImGuiImplOpenGL3
    {
        private typealias char = char8;
        private typealias DrawData = ImGui.DrawData;
    
    	[LinkName("gladLoadGL")]
        private static extern int GladLoadGL();
    
        [LinkName("ImGui_ImplOpenGL3_CreateDeviceObjects")]
        private static extern bool CreateDeviceObjectsImpl();
        public static bool CreateDeviceObjects() => CreateDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplOpenGL3_CreateFontsTexture")]
        private static extern bool CreateFontsTextureImpl();
        public static bool CreateFontsTexture() => CreateFontsTextureImpl();
        
        [LinkName("ImGui_ImplOpenGL3_DestroyDeviceObjects")]
        private static extern void DestroyDeviceObjectsImpl();
        public static void DestroyDeviceObjects() => DestroyDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplOpenGL3_DestroyFontsTexture")]
        private static extern void DestroyFontsTextureImpl();
        public static void DestroyFontsTexture() => DestroyFontsTextureImpl();
        
        [LinkName("ImGui_ImplOpenGL3_Init")]
        private static extern bool InitImpl(char* glsl_version);
        public static bool Init(char* glsl_version = default)
        {
            GladLoadGL();
            return InitImpl(glsl_version);
        }
        
        [LinkName("ImGui_ImplOpenGL3_NewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("ImGui_ImplOpenGL3_RenderDrawData")]
        private static extern void RenderDrawDataImpl(DrawData* draw_data);
        public static void RenderDrawData(DrawData* draw_data) => RenderDrawDataImpl(draw_data);
        
        [LinkName("ImGui_ImplOpenGL3_Shutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
    }
}