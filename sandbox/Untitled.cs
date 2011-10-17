
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
                    var array = output[row].ToCharArray();
                    array[col] = '*';
                    output[row] = new string(array);
                 }
            }
        }
        return output;
    }

    private static bool CalculateCell(string[] input, int row, int col)
    {
        bool isAlive = input[row][col] == '*';
        int neighbors = 0;
        neighbors = CountNeighbors(input, row, col);
        // rule 1:
        if (isAlive && neighbors < 2)
            return false;
        // rule 2:
        if (isAlive && neighbors > 3)
            return false;
        // rule 3:
        if (isAlive && neighbors >= 2 && neighbors <=3)
            return true;
        // rule 4:
        if (!isAlive && neighbors == 3)
            return true;
        return false;
    }

    private static int CountNeighbors(string[] input, int row, int col)
    {
        return ;
    }

    private static string[] CreateEmptyClone(string[] source)
    {
        string[] dest = new string[source.Length];
        for(int i=0; i<source.Length; i++)
            dest[i] = new string('.',source[i].Length);
        return dest;
    }
}
