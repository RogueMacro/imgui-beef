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

                string name = ImGui.RemovePrefix(typedef.Key);
                string value;

                if (name == "BitArrayForNamedKeys") value = "BitArray<const Key.NamedKey_COUNT, const -Key.NamedKey_BEGIN>";
                else value = ImGui.FixType(typedef.Value.Replace(";", ""));

                list.Add(new ImGuiTypeDef(name, value));
            }

            return list;
        }

        public string Serialize()
        {
            return $"public typealias {Name} = {Value};\n";
        }
    }
}
