using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    abstract class ImGuiStructMethodDefinition : ImGuiMethodDefinition
    {
        public string ParentType { get; }
        public bool IsGeneric { get; }

        public ImGuiStructMethodDefinition(string name, string linkName, List<object> argsT, string parentType, bool isGeneric, Dictionary<string, object> defaults) : base(name, linkName, argsT, defaults)
        {
            ParentType = ImGui.RemovePrefix(parentType);
            IsGeneric = isGeneric;
        }
    }
}
