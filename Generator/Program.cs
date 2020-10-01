using System;
using System.IO;

namespace ImGuiBeefGenerator
{
    class Program
    {
        static void Main()
        {
            var generator = new BindingGenerator();
            generator.Initialize();

            var outputFiles = generator.Generate(true);

            Console.WriteLine("Writing output files");

            if (!Directory.Exists("output"))
                Directory.CreateDirectory("output");

            foreach (var file in outputFiles)
                File.WriteAllText($"output/{file.Key}", file.Value);
        }
    }
}
