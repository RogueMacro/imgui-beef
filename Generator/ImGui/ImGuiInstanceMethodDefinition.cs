using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiInstanceMethodDefinition : ImGuiStructMethodDefinition
    {
        public string ReturnType { get; }

        public ImGuiInstanceMethodDefinition(string name, string linkName, List<object> argsT, string parentType, string returnType, bool isGeneric, Dictionary<string, object> defaults) : base(name, linkName, argsT, parentType, isGeneric, defaults)
        {
            ReturnType = ImGui.FixType(returnType);

            var pOuts = Args.Where(a => a.Name == "pOut");
            if (pOuts.Count() == 1)
                ReturnType = pOuts.Single().Type.Trim('*');

            if (IsGeneric)
            {
                var originalArgs = Args.Where(a => a.Type.Replace("*", "") == ParentType);
                var newArgs = new Dictionary<int, ImGuiMethodParameter>();

                foreach (var originalArg in originalArgs)
                {
                    var originalArgType = originalArg.Type.Replace("*", "");
                    var newArg = new ImGuiMethodParameter(originalArg.Name, originalArg.Type.Replace(originalArgType, $"{originalArgType}<T>"));
                    var index = Args.IndexOf(originalArg);
                    newArgs[index] = newArg;
                }

                foreach (var newArg in newArgs)
                {
                    Args.RemoveAt(newArg.Key);
                    Args.Insert(newArg.Key, newArg.Value);
                }
            }
        }

        public override string Serialize()
        {
            var implArgs = Args.ToLinkableDefinitionArg();
            var newArgs = Args.ToDefinitionArgs();

            var outParams = Args.Where(a => a.IsOutParam).ToList();
            var isStatic = LinkName.StartsWith("ImGui_Impl");

            bool isPOut = false;
            var pOuts = Args.Where(a => a.Name == "pOut");
            if (pOuts.Count() == 1)
            {
                isPOut = true;
                outParams.Add(pOuts.Single());
            }

            if (LinkName == "ImGui_ImplOpenGL3_Init")
            {
                return
@"
[LinkName(""ImGui_ImplOpenGL3_Init"")]
private static extern bool InitImpl(char* glsl_version);
public static bool Init(char* glsl_version = default)
{
    GladLoadGL();
    return InitImpl(glsl_version);
}
";
            }

            var serialized = 
$@"
[LinkName(""{LinkName}"")]
private static extern {ReturnType} {Name}Impl({implArgs});
public {(isStatic ? "static " : "")}{ReturnType} {Name}({newArgs}) {(isStatic ? "" : "mut")}";

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
                {
                    serialized += $"\t{Name}Impl({Args.ToCallArgs()});\n";
                }

                serialized += "}\n";
            }
            else
            {
                serialized += $"=> {Name}Impl({Args.ToCallArgs()});\n";
            }

            return serialized;
        }
    }
}
