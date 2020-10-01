using System;

namespace ImGui
{
    public static class ImGuiImplOpenGL2
    {
        private typealias char = char8;
        private typealias DrawData = ImGui.DrawData;
    
    	[LinkName("gladLoadGL")]
        private static extern int GladLoadGL();
    
        [LinkName("ImGui_ImplOpenGL2_CreateDeviceObjects")]
        private static extern bool CreateDeviceObjectsImpl();
        public static bool CreateDeviceObjects() => CreateDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplOpenGL2_CreateFontsTexture")]
        private static extern bool CreateFontsTextureImpl();
        public static bool CreateFontsTexture() => CreateFontsTextureImpl();
        
        [LinkName("ImGui_ImplOpenGL2_DestroyDeviceObjects")]
        private static extern void DestroyDeviceObjectsImpl();
        public static void DestroyDeviceObjects() => DestroyDeviceObjectsImpl();
        
        [LinkName("ImGui_ImplOpenGL2_DestroyFontsTexture")]
        private static extern void DestroyFontsTextureImpl();
        public static void DestroyFontsTexture() => DestroyFontsTextureImpl();
        
        [LinkName("ImGui_ImplOpenGL2_Init")]
        private static extern bool InitImpl();
        public static bool Init() => InitImpl();
        
        [LinkName("ImGui_ImplOpenGL2_NewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("ImGui_ImplOpenGL2_RenderDrawData")]
        private static extern void RenderDrawDataImpl(DrawData* draw_data);
        public static void RenderDrawData(DrawData* draw_data) => RenderDrawDataImpl(draw_data);
        
        [LinkName("ImGui_ImplOpenGL2_Shutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
    }
}