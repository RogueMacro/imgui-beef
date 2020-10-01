using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiTypeDef : IBinding
    {
        public string Name { get; }
        public string Value { get; }

        public ImGuiTypeDef(string name, string value)
        {
            Name = name;
            Value = value;
        }

        public static List<ImGuiTypeDef> From(dynamic typedefs)
        {
            var list = new List<ImGuiTypeDef>();

            foreach (var typedef in typedefs)
            {
                if (typedef.Value.StartsWith("struct ") ||
                    typedef.Key == "const_iterator" ||
                    typedef.Key == "iterator" ||
                    typedef.Key == "value_type")
                    continue;

                list.Add(new ImGuiTypeDef(ImGui.RemovePrefix(typedef.Key), ImGui.FixType(typedef.Value.Replace(";", ""))));
            }

            return list;
        }

        public string Serialize()
        {
            return $"public typealias {Name} = {Value};\n";
        }
    }
}
