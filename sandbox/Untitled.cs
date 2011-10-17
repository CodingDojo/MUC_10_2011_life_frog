
public class LifeCalculator
{
    public static string[] Calc(string[] input)
    {
        return CreateEmptyClone(input);
    }

    private static string[] CreateEmptyClone(string[] source)
    {
        string[] dest = new string[source.Length];
        for(int i=0; i<source.Length; i++)
            dest[i] = new string('.',source[i].Length);
        return dest;
    }
}
