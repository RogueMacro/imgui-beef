using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiStructUnion : ImGuiStruct
    {
        public ImGuiStructUnion(string name, List<ImGuiStructProperty> properties, List<ImGuiStructMethodDefinition> methods, List<ImGuiStructUnion> unions) : base(name, properties, methods, unions)
        {
        }

        public override string Serialize()
        {
            var serialized = base.Serialize();
            return serialized.Replace("CRepr", "CRepr, Union").Trim('\n');
        }
    }
}