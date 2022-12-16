using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;

namespace ImGuiBeefGenerator.ImGui
{
    public class ImGuiMethodParameter
    {
        public string Name { get; }
        public string Type { get; }
        public bool IsVaList { get; }
        public string DefaultValue { get; }
        public bool IsOutParam { get; }
        public bool IsRefParam { get; }
        public bool IsArrayParam { get; }

        public ImGuiMethodParameter(string name, string type, string defaultValue = "", bool isRefToPtr = false)
        {
            DefaultValue = "";

            if (type == "...")
            {
                Name = "args";
                Type = "params Object[]";
                IsVaList = true;
            }
            else
            {
                Name = name;
                Type = ImGui.FixType(type);
                IsVaList = false;

                if (defaultValue == "NULL")
                {
                    DefaultValue = "null";
                }
                else if (defaultValue != "")
                {
                    if (defaultValue.StartsWith("sizeof("))
                    {
                        int start = defaultValue.IndexOf("(", StringComparison.Ordinal) + 1;
                        int end = defaultValue.IndexOf(")", start, StringComparison.Ordinal);

                        DefaultValue = $"sizeof({ImGui.FixType(defaultValue[start .. end])})";
                    }
                    else if (defaultValue.EndsWith(")"))
                        DefaultValue = ImGui.FixDefaultValue(defaultValue);
                    else
                        DefaultValue = ImGui.RemovePrefix(defaultValue);

                    DefaultValue = DefaultValue
                                        .Replace("FLT_MAX", "float.MaxValue")
                                        .Replace("FLT_MIN", "float.MinValue");

                    if (DefaultValue.Contains("_"))
                        DefaultValue = DefaultValue.Remove(0, DefaultValue.IndexOf('_') + 1).Insert(0, ".");

                    if (char.IsDigit(DefaultValue[0]))
                        DefaultValue = $"({Type}) {DefaultValue}";
                }
            }

            Regex arrayRegex = new Regex(@"\w+\[\d+\]", RegexOptions.Compiled);
            IsArrayParam = arrayRegex.IsMatch(Type);
            IsOutParam = name.StartsWith("out_") && !type.Contains("_") && type.EndsWith("*") && DefaultValue == "";
            IsRefParam = (!IsOutParam && isRefToPtr) || IsArrayParam;

            if (Name.EndsWith("]"))
            {
                var arraySpecifier = Name.Substring(Name.IndexOf('['));
                Name = Name.Replace(arraySpecifier, "");
                Type += arraySpecifier;
            }

            Type = Type.Replace("char*[]", "char**");

            Name = ImGui.MakeSafeName(Name);
        }

        public static List<ImGuiMethodParameter> From(string args)
        {
            var paramList = new List<ImGuiMethodParameter>();

            foreach (var argStr in SplitArgs(args))
            {
                if (argStr.Length == 0)
                    continue;

                if (ImGui.IsFunctionPointer(argStr))
                {
                    paramList.Add(ImGui.GetParameterFromFunctionPointer(argStr));
                }
                else if (argStr.Contains("*"))
                {
                    var name = argStr.Substring(argStr.LastIndexOf('*') + 1).Trim();
                    var type = argStr.Substring(0, argStr.LastIndexOf('*') + 1);
                    paramList.Add(new ImGuiMethodParameter(name, type));
                }
                else if (argStr == "...")
                {
                    paramList.Add(new ImGuiMethodParameter("...", ""));
                }
                else
                {
                    var argStrSplit = argStr.Split(' ');
                    var type = argStrSplit[0];
                    var name = argStrSplit[1];
                    paramList.Add(new ImGuiMethodParameter(name, type));
                }
            }

            return paramList;
        }

        public static List<ImGuiMethodParameter> From(List<Dictionary<string, object>> argsT, Dictionary<string, object> defaults)
        {
            var paramList = new List<ImGuiMethodParameter>();

            foreach (var arg in argsT)
            {
                var argName = (string) arg["name"];
                var defaultValue = "";
                if (defaults != null && defaults.ContainsKey(argName))
                    defaultValue = (string) defaults[argName];

                paramList.Add(new ImGuiMethodParameter(argName, (string) arg["type"], defaultValue, arg.ContainsKey("reftoptr")));
            }

            return paramList;
        }

        public static List<string> SplitArgs(string args)
        {
            var list = new List<string>();

            int parenthesisCount = 0;
            string tmp = "";
            foreach (char chr in args.Trim('(', ')'))
            {
                if (chr == ',' && parenthesisCount == 0)
                {
                    list.Add(tmp);
                    tmp = "";
                    continue;
                }

                tmp += chr;

                if (chr == '(')
                    parenthesisCount++;
                else if (chr == ')')
                    parenthesisCount--;
            }

            if (tmp != "")
                list.Add(tmp);

            return list;
        }

        public string ToCallArg()
        {
            if (Name == "self")
                return "&this";
            else if (Name == "pOut")
                return "&pOut";
            if (IsVaList)
                return "scope String()..AppendF(StringView(fmt), params args)";
            else
                return $"{((IsOutParam || IsRefParam) && !IsArrayParam ? "&" : "")}{Name}";
        }

        public string ToLinkableDefinitionArg()
        {
            if (IsVaList)
                return "...";
            else if (Name == "self")
                return "Self* self";
            else
                return $"{Type} {Name}";
        }

        public string ToDefinitionArg()
        {
            return $"{(IsOutParam ? "out " : "")}{(IsRefParam ? "ref " : "")}{((IsOutParam || IsRefParam) && !Type.EndsWith("]") ? Type.Remove(Type.Length - 1, 1) : Type)} {Name}{(DefaultValue != "" ? $" = {DefaultValue}" : "")}";
        }
    }

    public static class ImGuiMethodParameterExtension
    {
        public static string ToCallArgs(this List<ImGuiMethodParameter> list)
        {
            bool hasVaList = false;
            if (list.Any(p => p.IsVaList))
                hasVaList = true;

            var callArgs = new List<string>();
            foreach (var param in list/*.Where(p => p.Name != "self")*/)
            {
                if (!(hasVaList && param.Name == "fmt"))
                    callArgs.Add(param.ToCallArg());
            }

            return string.Join(", ", callArgs);
        }

        public static string ToDefinitionArgs(this List<ImGuiMethodParameter> list)
        {
            var sortedArgs = list.Where(a => true).ToList();
            sortedArgs.Sort(DefaultValueComparison);

            var callArgs = new List<string>();
            foreach (var param in sortedArgs.Where(p => p.Name != "self"))
                if (param.Name != "pOut")
                    callArgs.Add(param.ToDefinitionArg());
            return string.Join(", ", callArgs);
        }

        public static string ToLinkableDefinitionArg(this List<ImGuiMethodParameter> list)
        {
            var callArgs = new List<string>();
            foreach (var param in list)
                callArgs.Add(param.ToLinkableDefinitionArg());
            return string.Join(", ", callArgs);
        }

        private static int DefaultValueComparison(ImGuiMethodParameter left, ImGuiMethodParameter right)
        {
            if (left.DefaultValue == "" && right.DefaultValue == "" ||
                left.DefaultValue != "" && right.DefaultValue != "")
                return 0;

            if (left.DefaultValue != "")
                return 1;

            if (right.DefaultValue != "")
                return -1;

            return 0;
        }
    }
}
