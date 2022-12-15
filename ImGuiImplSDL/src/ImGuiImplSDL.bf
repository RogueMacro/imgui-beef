using System;

namespace ImGui
{
    public static class ImGuiImplSDL2
    {
        private typealias SDL_Window = SDL2.SDL.Window;
        private typealias SDL_Event = SDL2.SDL.Event;
        private typealias SDL_Renderer = SDL2.SDL.Renderer;
    
        [LinkName("ImGui_ImplSDL2_InitForD3D")]
        private static extern bool InitForD3DImpl(SDL_Window* window);
        public static bool InitForD3D(SDL_Window* window) => InitForD3DImpl(window);
        
        [LinkName("ImGui_ImplSDL2_InitForMetal")]
        private static extern bool InitForMetalImpl(SDL_Window* window);
        public static bool InitForMetal(SDL_Window* window) => InitForMetalImpl(window);
        
        [LinkName("ImGui_ImplSDL2_InitForOpenGL")]
        private static extern bool InitForOpenGLImpl(SDL_Window* window, void* sdl_gl_context);
        public static bool InitForOpenGL(SDL_Window* window, void* sdl_gl_context) => InitForOpenGLImpl(window, sdl_gl_context);
        
        [LinkName("ImGui_ImplSDL2_InitForSDLRenderer")]
        private static extern bool InitForSDLRendererImpl(SDL_Window* window, SDL_Renderer* renderer);
        public static bool InitForSDLRenderer(SDL_Window* window, SDL_Renderer* renderer) => InitForSDLRendererImpl(window, renderer);
        
        [LinkName("ImGui_ImplSDL2_InitForVulkan")]
        private static extern bool InitForVulkanImpl(SDL_Window* window);
        public static bool InitForVulkan(SDL_Window* window) => InitForVulkanImpl(window);
        
        [LinkName("ImGui_ImplSDL2_NewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("ImGui_ImplSDL2_ProcessEvent")]
        private static extern bool ProcessEventImpl(SDL_Event* event);
        public static bool ProcessEvent(SDL_Event* event) => ProcessEventImpl(event);
        
        [LinkName("ImGui_ImplSDL2_Shutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
    }
}