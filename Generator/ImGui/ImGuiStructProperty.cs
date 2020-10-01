namespace ImGuiBeefGenerator.ImGui
{
    public class ImGuiStructProperty
    {
        public string Name { get; }
        public string Type { get; }
        public string Value { get; }
        public string AccessModifier { get; }

        public ImGuiStructProperty(string name, string type, string value = "", string accessModifier = "public", int size = -1)
        {
            Name = name;
            Type = ImGui.FixType(type);
            Value = value;
            AccessModifier = accessModifier;

            if (Name.EndsWith("]"))
            {
                var arraySpecifier = Name.Substring(Name.IndexOf('['));
                if (size != -1)
                {
                    Type += $"[{size}]";
                }
                else
                {
                    Type += arraySpecifier;
                }
                
                Name = Name.Replace(arraySpecifier, "");
            }
        }

        public override string ToString()
        {
            return $"{AccessModifier} {Type} {ImGui.MakeSafeName(Name)}{(Value != "" ? $" {Value}" : "")};\n";
        }
    }
}
