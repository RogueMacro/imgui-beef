using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiGlobalMethodDefinition : ImGuiMethodDefinition
    {
        public string ReturnType { get; }

        public ImGuiGlobalMethodDefinition(string name, string linkName, List<object> argsT, string returnType, Dictionary<string, object> defaults) : base(name, linkName, argsT, defaults)
        {
            if (name.Contains("BitArray"))
            {
                var i = 1;
            }
            ReturnType = ImGui.FixType(returnType);

            var pOuts = Args.Where(a => a.Name == "pOut");
            if (pOuts.Count() == 1)
                ReturnType = pOuts.Single().Type.Trim('*');
        }

        public override string Serialize()
        {
            var outParams = Args.Where(a => a.IsOutParam).ToList();
            var fixedType = ReturnType;
            if (fixedType.EndsWith("*"))
                fixedType = $"ref {fixedType.Remove(fixedType.Length - 1, 1)}";

            bool isPOut = false;
            var pOuts = Args.Where(a => a.Name == "pOut");
            if (pOuts.Count() == 1)
            {
                isPOut = true;
                outParams.Add(pOuts.Single());
            }

            var serialized =
$@"
[LinkName(""{LinkName}"")]
private static extern {ReturnType} {Name}Impl({Args.ToLinkableDefinitionArg()});";

            if (fixedType.StartsWith("ref"))
            {
                serialized += 
$@"
#if IMGUI_USE_REF
public static {fixedType} {Name}({Args.ToDefinitionArgs()})";

                if (outParams.Count() > 0)
                {
                    serialized += "\n{\n";

                    foreach (var arg in outParams)
                    {
                        if (arg.Name == "pOut")
                            serialized += $"    {ReturnType} pOut = default;\n";
                        else
                            serialized += $"    {arg.Name} = ?;\n";
                    }

                    if (isPOut)
                        serialized += $"    {Name}Impl({Args.ToCallArgs()});\n    return pOut;\n";
                    else if (ReturnType != "void")
                        serialized += $"    return {Name}Impl({Args.ToCallArgs()});\n";
                    else
                        serialized += $"   return ref *{Name}Impl({Args.ToCallArgs()});";

                    serialized += "}\n";
                }
                else
                {
                    serialized += $" {{ return ref *{Name}Impl({Args.ToCallArgs()}); }}\n";
                }

                serialized += "#else";
            }

            var notRefType = fixedType;
            if (notRefType.StartsWith("ref"))
            {
                notRefType = notRefType.Replace("ref ", "") + "*";
            }

            serialized += 
$@"
public static {notRefType} {Name}({Args.ToDefinitionArgs()})";

            if (outParams.Count() > 0)
            {
                serialized += "\n{\n";

                foreach (var arg in outParams)
                {
                    if (arg.Name == "pOut")
                        serialized += $"    {ReturnType} pOut = default;\n";
                    else
                        serialized += $"    {arg.Name} = ?;\n";
                }

                if (isPOut)
                    serialized += $"    {Name}Impl({Args.ToCallArgs()});\n    return pOut;\n";
                else if (ReturnType != "void")
                    serialized += $"    return {Name}Impl({Args.ToCallArgs()});\n";

                serialized += "}\n";
            }
            else
            {
                serialized += $" => {Name}Impl({Args.ToCallArgs()});\n";
            }

            if (fixedType.StartsWith("ref"))
                serialized += "#endif\n";

            return serialized;
        }
    }
}
