using System;
using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    public abstract class ImGuiMethodDefinition : IBinding
    {
        public string Name { get; }
        public string LinkName { get; }
        public List<ImGuiMethodParameter> Args { get; set; }

        public ImGuiMethodDefinition(string name, string linkName, List<object> argsT, Dictionary<string, object> defaults)
        {
            Name = name.ToPascalCase();
            LinkName = linkName;
            Args = ImGuiMethodParameter.From(argsT.ConvertAll(a => (Dictionary<string, object>) a), defaults);
        }

        public static List<ImGuiMethodDefinition> From(dynamic definitionList)
        {
            var methodList = new List<ImGuiMethodDefinition>();

            foreach (var definition in definitionList)
            {
                var variations = (IEnumerable<dynamic>) definition.Value;

                foreach (var variation in variations)
                {
                    var method = FromVariation(variation);
                    if (method != null)
                        methodList.Add(method);
                }
            }

            return methodList;
        }

        public static ImGuiMethodDefinition FromVariation(Dictionary<string, object> variation)
        {
            if (((string) variation["args"]).Contains("va_list") || ((string) variation["ov_cimguiname"]).EndsWith("_const"))
                return null;

            if (variation.ContainsKey("destructor"))
            {
               return new ImGuiDestructorDefinition(
                    (string) variation["stname"]
                );
            }

            Dictionary<string, object> defaults = null;
            if (variation["defaults"] is Dictionary<string, object> d)
                defaults = d;

            var argsT = (IEnumerable<dynamic>) variation["argsT"];
            if ("ImBitArray" == (string) variation["stname"])
                Console.WriteLine("");
            if ((argsT.Count() > 0 && argsT.Any(arg => arg["name"] == "self" && arg["type"] == $"{variation["stname"]}*")) || ((string) variation["ov_cimguiname"]).StartsWith("ImGui_Impl"))
            {
                return new ImGuiInstanceMethodDefinition(
                    (string) variation["funcname"],
                    (string) variation["ov_cimguiname"],
                    (List<object>) variation["argsT"],
                    (string) variation["stname"],
                    (string) variation["ret"],
                    variation.ContainsKey("templated"),
                    defaults
                );
            }
            else if (variation.ContainsKey("constructor"))
            {
                return new ImGuiConstructorDefinition(
                    (string) variation["ov_cimguiname"],
                    (List<object>) variation["argsT"],
                    (string) variation["stname"],
                    variation.ContainsKey("templated"),
                    defaults
                );
            }
            else if ((string) variation["stname"] == "" && variation["ov_cimguiname"].ToString().StartsWith("ig"))
            {
                return new ImGuiGlobalMethodDefinition(
                    (string) variation["funcname"],
                    (string) variation["ov_cimguiname"],
                    (List<object>) variation["argsT"],
                    (string) variation["ret"],
                    defaults
                );
            }

            return null;
        }

        public abstract string Serialize();
    }
}
