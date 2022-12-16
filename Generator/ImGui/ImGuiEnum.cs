using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiEnum : IBinding
    {
        public string Name { get; }
        public Dictionary<string, string> Values { get; }
        public string Type { get; }

        public ImGuiEnum(string name, Dictionary<string, string> values, string type)
        {
            Name = name;
            Values = values;
            Type = type;
        }

        public static List<ImGuiEnum> From(dynamic enumDict, ref List<ImGuiTypeDef> typeDefs)
        {
            var list = new List<ImGuiEnum>();

            foreach (string key in enumDict.Keys)
            {
                var name = ImGui.RemovePrefix(key);

                if (name.EndsWith("_"))
                    name = name.Remove(name.Length - 1);

                var values = new Dictionary<string, string>();
                foreach (var value in enumDict[key])
                {
                    var valueName = ImGui.RemovePrefix(value["name"].Replace(key, ""));
                    if (valueName.StartsWith("_"))
                        valueName = valueName.Remove(0, 1);
                    else if (char.IsDigit(valueName[0]))
                        valueName = "Number" + valueName;

                    var actualValue = value["calc_value"].ToString();
                    values[valueName] = actualValue;
                }

                var matchingTypeDefs = typeDefs.Where(typedef => typedef.Name == name);
                if (matchingTypeDefs.Count() == 0)
                {
                    list.Add(new ImGuiEnum(name, values, ""));
                }
                else
                {
                    var typedef = matchingTypeDefs.Single();
                    list.Add(new ImGuiEnum(name, values, typedef.Value));
                    typeDefs.Remove(typedef);
                }
            }

            return list;
        }

        public string Serialize()
        {
            var serialized =
$@"
[AllowDuplicates]
public enum {Name} : int32
{{
";

            foreach (var enumValue in Values)
            {
                serialized += 
                    $"    {(char.IsDigit(enumValue.Key[0]) ? "N" : "")}{enumValue.Key} = {enumValue.Value},\n";
            }

            serialized += "\n}\n";
            return serialized;
        }
    }
}
