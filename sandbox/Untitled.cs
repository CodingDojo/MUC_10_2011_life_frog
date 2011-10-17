
public class LifeCalculator
{
    public static string[] Calc(string[] input)
    {
        var output = CreateEmptyClone(input);
        for (int row = 0; row < input.Length; row++)
        {
            for (int col = 0; col < input[row].Length; col++)
            {
                 bool life = CalculateCell(input, row, col);
                 if (life)
                 {
                    var array = input[row].ToCharArray();
                    array[col] = '*';
                    input[row] = new string(array);
                 }
            }
        }
    }

    private static bool CalculateCell(string[] input, int row, int col)
    {
        return true;
    }

    private static string[] CreateEmptyClone(string[] source)
    {
        string[] dest = new string[source.Length];
        for(int i=0; i<source.Length; i++)
            dest[i] = new string('.',source[i].Length);
        return dest;
    }
}
