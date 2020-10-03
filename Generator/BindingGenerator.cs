using ImGuiBeefGenerator.ImGui;
using System.Collections.Generic;
using System.IO;
using System;
using Utf8Json;
using System.Linq;

namespace ImGuiBeefGenerator
{
    public class BindingGenerator
    {
        private readonly List<IBinding> Bindings = new List<IBinding>();

        public void Initialize()
        {
            Console.WriteLine("Initializing");

            var structs_and_enums = ReadBindingData("structs_and_enums.json");

            List<ImGuiTypeDef> typedefs = ImGuiTypeDef.From(ReadBindingData("typedefs_dict.json"));
            List<ImGuiEnum> enums = ImGuiEnum.From(structs_and_enums["enums"], ref typedefs);
            Bindings.AddRange(typedefs);
            Bindings.AddRange(enums);

            List<ImGuiMethodDefinition> methods = ImGuiMethodDefinition.From(ReadBindingData("definitions.json"));
			Bindings.AddRange(ImGuiStruct.From(structs_and_enums["structs"], ref methods));
			Bindings.AddRange(methods);
            Bindings.AddRange(ImGuiImplStruct.From(ReadBindingData("impl_definitions.json")));
        }

        public Dictionary<string, string> Generate(bool includeGenerationInfo = false)
        {
            Console.WriteLine("Generating");

			var files = new Dictionary<string, string>();

            var imguiFile = "";
            if (includeGenerationInfo)
            {
				imguiFile +=
$@"// -- GENERATION INFORMATION --
// Constructors: {Bindings.Count(b => b is ImGuiConstructorDefinition)}
// Destructors: {Bindings.Count(b => b is ImGuiDestructorDefinition)}
// Enums: {Bindings.Count(b => b is ImGuiEnum)}
// Global methods: {Bindings.Count(b => b is ImGuiGlobalMethodDefinition)}
// Instance methods: {Bindings.Count(b => b is ImGuiInstanceMethodDefinition)}
// Structs: {Bindings.Count(b => b is ImGuiStruct)}
// Typedefs: {Bindings.Count(b => b is ImGuiTypeDef)}

";
            }

            imguiFile +=
@"using System;

namespace ImGui
{
    public static class ImGui
    {
        // Default (hardcoded) typealiases and structs defined in generator

		public static char8* VERSION = ""1.78"";
		public static int VERSION_NUM = 17800;
		public static bool CHECKVERSION()
		{
			bool result = DebugCheckVersionAndDataLayout(VERSION, sizeof(IO), sizeof(Style), sizeof(Vec2), sizeof(Vec4), sizeof(DrawVert), sizeof(DrawIdx));
			Runtime.Assert(result);
			return result;
		}

		public static mixin ASSERT(bool condition) { Runtime.Assert(condition); }
		public static mixin ASSERT(bool condition, String errorMsg) { Runtime.Assert(condition, errorMsg); }

		public static DrawCallback* DrawCallback_ResetRenderState = (.)(void*)-1;

        typealias char = char8;
        typealias uchar = uint8;
        typealias ushort = uint16;
        typealias short = int16;
        typealias size = uint64;
        typealias charPtr = char8*;

        [CRepr]
        public struct FILE
        {
            void* _Placeholder;
        }

        [CRepr]
		public enum DockRequestType
		{
		    None,
		    Dock,
		    Undock,
		    Split
		}

		[CRepr]
		public struct DockRequest
		{
		    DockRequestType Type;
		    Window* DockTargetWindow;
		    DockNode* DockTargetNode;
		    Window* DockPayload;
		    Dir DockSplitDir;
		    float DockSplitRatio;
		    bool DockSplitOuter;
		    Window* UndockTargetWindow;
		    DockNode* UndockTargetNode;
		}

		[CRepr]
		public struct DockNodeSettings
		{
		    ID             ID;
		    ID             ParentNodeId;
		    ID             ParentWindowId;
		    ID             SelectedWindowId;
		    char         SplitAxis;
		    char                Depth;
		    DockNodeFlags  Flags;
		    Vec2ih            Pos;
		    Vec2ih            Size;
		    Vec2ih            SizeRef;
		}

		[CRepr]
		public struct DockPreviewData
		{
		    DockNode FutureNode;
		    bool IsDropAllowed;
		    bool IsCenterAvailable;
		    bool IsSidesAvailable;
		    bool IsSplitDirExplicit;
		    DockNode* SplitNode;
		    Dir SplitDir;
		    float SplitRatio;
		    Rect[(.) Dir.COUNT] DropRectsDraw;
		}

        // -- Auto-Generated --

        ";

            foreach (var binding in Bindings.Where(b => !(b is ImGuiImplStruct)))
				imguiFile += binding.Serialize().Replace("\n", "\n        ");

			imguiFile = imguiFile.Remove(imguiFile.Length - 4);
			imguiFile += "}\n}";

			files.Add("ImGui.bf", imguiFile);


			files["ImGuiImplGlfw.bf"] = GenerateImplFile("ImGuiImplGlfw", Bindings);
			files["ImGuiImplOpenGL2.bf"] = GenerateImplFile("ImGuiImplOpenGL2", Bindings);
			files["ImGuiImplOpenGL3.bf"] = GenerateImplFile("ImGuiImplOpenGL3", Bindings);
			files["ImGuiImplSDL.bf"] = GenerateImplFile("ImGuiImplSDL2", Bindings);

			return files;
        }

        private dynamic ReadBindingData(string file)
        {
            var stream = new FileStream($"../cimgui/generator/output/{file}", FileMode.Open);
            return JsonSerializer.Deserialize<dynamic>(stream);
        }

		private static string GenerateImplFile(string implName, List<IBinding> bindings)
        {
			var implFile =
$@"using System;

namespace ImGui
{{";

			implFile += bindings.Single(b => b is ImGuiImplStruct s && s.Name == implName).Serialize().Replace("\n", "\n    ");
			implFile = implFile.Remove(implFile.Length - 4);
			implFile += "}";
			return implFile;
		}
    }
}