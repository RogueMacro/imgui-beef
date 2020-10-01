namespace ImGuiBeefGenerator
{
    public static class StringHelper
    {
        public static string ToPascalCase(this string str)
        {
            if (str.Length == 0)
                return "";

            var newString = "";

            bool isNextUpper = false;
            if (char.IsLower(str[0]))
                isNextUpper = true;

            foreach (var chr in str)
            {
                if (chr == '_')
                {
                    isNextUpper = true;
                }
                else if (isNextUpper)
                {
                    newString += char.ToUpper(chr);
                    isNextUpper = false;
                }
                else
                {
                    newString += chr;
                }
            }

            return newString;
        }
    }
}
