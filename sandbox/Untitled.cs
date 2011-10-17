
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
        int neighbors = 0;

        //    Look Left
        if(col > 0 && input[row][col - 1] == '*')
            neighbors++;
        //    Look Right
        if(col < input[row].Length - 1 && input[row][col + 1] == '*')
              neighbors++;
        //    Look Up
        if(row > 0 && input[row-1][col] == '*')
              neighbors++;
        //    Look Down
        if(row < input.Length - 1 && input[row+1][col] == '*')
              neighbors++;
        //    Look Down and Right
        if(row < input.Length - 1 && col < input[row].Length - 1 &&
            input[row + 1][col + 1] == '*')
              neighbors++;
        //    Look Down and Left
        if(row < input.Length - 1 && col > 0
            && input[row+1][col-1] == '*')
              neighbors++;
        //    Look Up and Right
        if(row > 0 && col < input[row].Length - 1 &&
            input[row - 1][col+1] == '*')
              neighbors++;
        //    Look Up and Left
        if(row > 0 && col > 0 &&
            input[row - 1][col-1] == '*')
              neighbors++;
        return neighbors;
    }

    private static string[] CreateEmptyClone(string[] source)
    {
        string[] dest = new string[source.Length];
        for(int i=0; i<source.Length; i++)
            dest[i] = new string('.',source[i].Length);
        return dest;
    }
}
