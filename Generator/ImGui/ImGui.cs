using System.Collections.Generic;

namespace ImGuiBeefGenerator.ImGui
{
    public static class ImGui
    {
        public static readonly string[] ReservedKeywords = { "in", "repeat", "ref", "out", "where", "base" };

        public static readonly Dictionary<string, string> WellKnownDefaultValues = new Dictionary<string, string>()
        {
            { "ImVec2(0,0)", "Vec2.Zero" },
            { "ImVec2(1,1)", "Vec2.Ones" },
            { "ImVec2(1,0)", "Vec2.OneZero" },
            { "ImVec2(0,1)", "Vec2.ZeroOne" },
            { "ImVec2(-1,0)", "Vec2.NOneZero" },
            { "ImVec4(0,0,0,0)", "Vec4.Zero" },
            { "ImVec4(1,1,1,1)", "Vec4.Ones" },
        };

        public static string FixDefaultValue(string value)
        {
            if (WellKnownDefaultValues.TryGetValue(value, out string beefValue))
            {
                return beefValue;
            }

            return $".{value.Substring(value.IndexOf("("))}";
        }

        public static string FixType(string type)
        {
            if (type.Contains("_") && !IsFunctionPointer(type) && !type.EndsWith("_t") && !type.EndsWith("_t*"))
                return FixTemplate(type);

            var fixedType = type;
            fixedType = fixedType.Replace("const ", "");
            fixedType = fixedType.Replace(" const", "");
            fixedType = fixedType.Replace("unsigned ", "u");
            fixedType = fixedType.Replace("signed ", "");
            fixedType = fixedType.Replace("_t", "");
            fixedType = fixedType.Replace("long long", "int64");
            fixedType = fixedType.Replace("ulong long", "uint64");
            fixedType = RemovePrefix(fixedType);

            if (fixedType.EndsWith("int"))
                fixedType += "32";
            else if (fixedType.EndsWith("int*"))
                fixedType = $"{fixedType.Remove(fixedType.Length - 4, 4)}int32*";

            fixedType = fixedType.Replace("int[", "int32[");

            if (IsFunctionPointer(fixedType))
            {
                var returnType = fixedType.Substring(0, fixedType.IndexOf('('));
                var args = ImGuiMethodParameter.From(fixedType.Substring(fixedType.IndexOf(')') + 1));
                fixedType = $"function {returnType}({args.ToLinkableDefinitionArg()})";
            }

            return fixedType;
        }

        public static string FixTemplate(string template)
        {
            var fixedTemplate = template.Replace("const ", "");

            if (fixedTemplate == "STB_TexteditState" || fixedTemplate.StartsWith("SDL_"))
                return fixedTemplate;

            fixedTemplate = fixedTemplate.Replace("const_", "");

            bool isPointer = false;
            if (fixedTemplate.EndsWith(" *"))
            {
                fixedTemplate = fixedTemplate.Substring(0, fixedTemplate.Length - 2);
                isPointer = true;
            }

            if (fixedTemplate.Contains("_"))
            {
                var newTemplate = FixType(fixedTemplate.Substring(0, fixedTemplate.IndexOf('_')));
                newTemplate += "<";
                fixedTemplate = newTemplate + FixType(fixedTemplate.Substring(fixedTemplate.IndexOf('_') + 1));
            }
            
            if (fixedTemplate.EndsWith("Ptr"))
            {
                fixedTemplate = fixedTemplate.Remove(fixedTemplate.Length - 3, 3);
                fixedTemplate += "*";
            }
            else if (fixedTemplate.Trim('*').EndsWith("Ptr"))
            {
                fixedTemplate = fixedTemplate.Remove(fixedTemplate.Length - 4, 3);
                fixedTemplate += "*";
            }

            fixedTemplate += ">";
            if (isPointer) fixedTemplate += "*";
            return fixedTemplate;
        }

        public static string MakeSafeName(string name)
        {
            foreach (var keyword in ReservedKeywords)
                if (keyword == name)
                    return $"{name}_";
            return name;
        }

        public static ImGuiMethodParameter GetParameterFromFunctionPointer(string functionPointer)
        {
            var name = functionPointer.Substring(functionPointer.IndexOf('(') + 1, functionPointer.IndexOf(')') - functionPointer.IndexOf('(') - 1);
            var type = FixType(functionPointer);
            return new ImGuiMethodParameter(name, type);
        }

        public static bool IsUnion(string type)
        {
            return type.StartsWith("union");
        }

        public static List<ImGuiStructProperty> GetUnionProperties(string union)
        {
            var propList = new List<ImGuiStructProperty>();
            var propsStr = union.Substring(union.IndexOf('{')).Trim('{', '}');

            foreach (var _propStr in propsStr.Split(';'))
            {
                if (_propStr == "")
                    continue;

                var propStr = _propStr.Trim();
                var type = propStr.Split()[0];
                var name = propStr.Split()[1];
                propList.Add(new ImGuiStructProperty(name, type));
            }

            return propList;
        }

        public static string RemovePrefix(string type)
        {
            var fixedType = type;

            if (fixedType.StartsWith("ImGui"))
                fixedType = type.Remove(0, 5);
            else if (fixedType.StartsWith("Im"))
                fixedType = type.Remove(0, 2);

            return fixedType;
        }

        public static bool IsFunctionPointer(string str)
        {
            return str.Length > 0 && str[^1] == ')';
        }
    }
}
