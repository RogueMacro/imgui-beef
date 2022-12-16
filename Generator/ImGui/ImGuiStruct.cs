using System.Collections.Generic;
using System.Linq;

namespace ImGuiBeefGenerator.ImGui
{
    class ImGuiStruct : IBinding
    {
        public string Name { get; }
        public List<ImGuiStructProperty> Properties { get; }
        public List<ImGuiStructMethodDefinition> Methods { get; }
        public List<ImGuiStructUnion> Unions { get; }
        public bool IsGeneric { get; }

        public ImGuiStruct(string name, List<ImGuiStructProperty> properties, List<ImGuiStructMethodDefinition> methods, List<ImGuiStructUnion> unions, bool isGeneric = false)
        {
            Name = ImGui.RemovePrefix(name);
            Properties = properties;
            Methods = methods;
            Unions = unions;
            IsGeneric = isGeneric;
        }

        public static List<ImGuiStruct> From(Dictionary<string, object> structs, ref List<ImGuiMethodDefinition> methods)
        {
            var structList = new List<ImGuiStruct>();

            var constructors = methods.Where(m => m is ImGuiConstructorDefinition).ToList().ConvertAll(m => m as ImGuiConstructorDefinition);
            var destructors = methods.Where(m => m is ImGuiDestructorDefinition).ToList().ConvertAll(m => m as ImGuiDestructorDefinition);
            var instanceMethods = methods.Where(m => m is ImGuiInstanceMethodDefinition).ToList().ConvertAll(m => m as ImGuiInstanceMethodDefinition);

            var vectorProps = new List<dynamic>();

            var prop1 = new Dictionary<string, object>();
            prop1["name"] = "Size";
            prop1["type"] = "int";
            vectorProps.Add(prop1);

            var prop2 = new Dictionary<string, object>();
            prop2["name"] = "Capacity";
            prop2["type"] = "int";
            vectorProps.Add(prop2);

            var prop3 = new Dictionary<string, object>();
            prop3["name"] = "Data";
            prop3["type"] = "T*";
            vectorProps.Add(prop3);

            structs["ImVector"] = vectorProps;

            foreach (var name in structs.Keys)
            {
                var fixedName = ImGui.RemovePrefix(name);
                var structMethods = new List<ImGuiStructMethodDefinition>();
                structMethods.AddRange(constructors.Where(m => m.ParentType == fixedName));
                structMethods.AddRange(destructors.Where(m => m.ParentType == fixedName));
                structMethods.AddRange(instanceMethods.Where(m => m.ParentType == fixedName));

                bool isGeneric = false;
                foreach (var structMethod in structMethods)
                {
                    methods.Remove(structMethod);
                    if (structMethod is ImGuiInstanceMethodDefinition i)
                    {
                        instanceMethods.Remove(i);
                        if (i.IsGeneric)
                            isGeneric = true;
                    }
                }

                var properties = new List<ImGuiStructProperty>();
                var unions = new List<ImGuiStructUnion>();

                foreach (var property in (List<dynamic>) structs[name])
                {
                    if (ImGui.IsUnion((string) property["type"]))
                    {
                        var unionName = $"{ImGui.RemovePrefix(name)}Union{unions.Count}";
                        var unionProperties = ImGui.GetUnionProperties((string) property["type"]);

                        var unionPropertyName = $"Union{unions.Count}";
                        var structPropertyForwarders = new List<ImGuiStructProperty>();
                        foreach (var unionProperty in unionProperties)
                        {
                            structPropertyForwarders.Add(new ImGuiStructProperty(
                                  unionProperty.Name,
                                  unionProperty.Type,
                                  $"{{ get {{ return {unionPropertyName}.{unionProperty.Name}; }} set mut {{ {unionPropertyName}.{unionProperty.Name} = value; }} }}"));
                        }

                        properties.Add(new ImGuiStructProperty(unionPropertyName, unionName, "= .()", "private"));
                        properties.AddRange(structPropertyForwarders);
                        unions.Add(new ImGuiStructUnion(unionName, unionProperties, new List<ImGuiStructMethodDefinition>(), new List<ImGuiStructUnion>()));
                    }
                    else
                    {
                        var size = -1;
                        if (property.ContainsKey("size"))
                            size = (int) property["size"];

                        var type = (string) property["type"];
                        if (property.ContainsKey("template_type"))
                        {
                            var templateType = (string) property["template_type"];
                            var underscoreTemplate = templateType.Replace(' ', '_');
                            type = type.Replace(underscoreTemplate, templateType);
                        }

                        properties.Add(new ImGuiStructProperty((string) property["name"], type, size: size));
                    }
                }

                structList.Add(new ImGuiStruct(name, properties, structMethods, unions, isGeneric));
            }

            // Leftover methods without a valid parent
            foreach (var method in instanceMethods)
            {
                ImGuiStruct parent = null;
                if (!structList.Any(s => s.Name == ImGui.RemovePrefix(method.ParentType)))
                {
                    parent = new ImGuiStruct(method.ParentType, new List<ImGuiStructProperty>(), new List<ImGuiStructMethodDefinition>(), new List<ImGuiStructUnion>(), method.IsGeneric);
                    structList.Add(parent);
                }
                else
                {
                    parent = structList.Single(s => s.Name == ImGui.RemovePrefix(method.ParentType));
                }

                parent.Methods.Add(method);

                var originalArgs = method.Args.Where(a => a.Type.Replace("*", "") == parent.Name);
                var newArgs = new Dictionary<int, ImGuiMethodParameter>();

                foreach (var originalArg in originalArgs)
                {
                    var originalArgType = originalArg.Type.Replace("*", "");
                    var newArg = new ImGuiMethodParameter(originalArg.Name, originalArg.Type.Replace(originalArgType, $"{originalArgType}<T>"));
                    var index = method.Args.IndexOf(originalArg);
                    newArgs[index] = newArg;
                }

                foreach (var newArg in newArgs)
                {
                    method.Args.RemoveAt(newArg.Key);
                    method.Args.Insert(newArg.Key, newArg.Value);
                }
            }

            methods.RemoveAll(m => m is ImGuiConstructorDefinition);
            methods.RemoveAll(m => m is ImGuiDestructorDefinition);
            methods.RemoveAll(m => m is ImGuiInstanceMethodDefinition);

            return structList;
        }

        public virtual string Serialize()
        {
            string definition;
            if (Name == "BitArray")
                definition = "BitArray<BitCount, Offset> where BitCount : const int where Offset : const int";
            else if (Name == "SpanAllocator")
            {
                definition = "SpanAllocator<T> where T : const int";
            }
            else
                definition = $"{Name}{(IsGeneric ? "<T>" : "")}";

            var serialized =
$@"
[CRepr]
public struct {definition}
{{";
            if (Name == "BitArray")
            {
                serialized += 
@"
    public U32[(BitCount + 32) >> 5] Storage;
";
            }
            else if (Name == "Span")
            {
                serialized +=
@"
    public T* Data;
    public T* DataEnd;
";
            }
            else if (Name == "SpanAllocator")
            {
                serialized +=
@"
    public charPtr BasePtr;
    int32 CurrOff;
    int32 CurrIdx;
    int32[T] Offsets;
    int32[T] Sizes;
";
            }
            else if (Name == "Pool")
            {
                serialized +=
@"
    public Vector<T> Buf;
    public Storage Map;
    public PoolIdx FreeIdx;
    public PoolIdx AliveCount;
";
            }
            else if (Name == "ChunkStream")
            {
                serialized += 
@"
    public Vector<char> Buf;
";
            }
            else
            {
                serialized += '\n';
            }

            foreach (var property in Properties)
                serialized += $"    {property}";

            foreach (var method in Methods)
                serialized += method.Serialize().Replace("\n", "\n    ");

            foreach (var union in Unions)
                serialized += union.Serialize().Replace("\n", "\n    ");

            serialized += "\n}\n";
            return serialized;
        }
    }
}
