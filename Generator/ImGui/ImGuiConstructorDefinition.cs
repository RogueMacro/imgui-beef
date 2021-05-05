using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiConstructorDefinition : ImGuiStructMethodDefinition
    {
        public ImGuiConstructorDefinition(string linkName, List<object> argsT, string structType, bool isGeneric, Dictionary<string, object> defaults) : base("this", linkName, argsT, structType, isGeneric, defaults) 
        {
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
            if (LinkName == "ImVec2_ImVec2_Nil" && Args.Count == 0)
            {
                return
@"
public this()
{
    x = 0;
    y = 0;
}
";
            }
            else if (LinkName == "ImVec2_ImVec2_Float")
            {
                return
@"
public this(float x, float y)
{
    this.x = x;
    this.y = y;
}
";
            }
            else if (LinkName == "ImVec4_ImVec4_Nil" && Args.Count == 0)
            {
                return
@"
public this()
{
	x = 0;
	y = 0;
	z = 0;
	w = 0;
}
";
            }
            else if (LinkName == "ImVec4_ImVec4_Float")
            {
                return
@"
public this(float x, float y, float z, float w)
{
	this.x = x;
	this.y = y;
	this.z = z;
	this.w = w;
}
";
            }

            return
$@"
[LinkName(""{LinkName}"")]
private static extern {ParentType}{(IsGeneric ? "<T>" : "")}* CtorImpl({Args.ToLinkableDefinitionArg()});
public this({Args.ToDefinitionArgs()})
{{
    this = *CtorImpl({Args.ToCallArgs()});
}}
";
        }
    }
}
