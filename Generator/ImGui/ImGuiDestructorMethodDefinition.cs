using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiDestructorDefinition : ImGuiStructMethodDefinition
    {
        public ImGuiDestructorDefinition(string structType) : base("~this", "~this", new List<object>(), structType, false, null) { }

        public override string Serialize()
        {
            return "";
        }
    }
}
