{:visible_files=>{"cyberdojo.sh"=>{:scroll_left=>"0", :content=>"gmcs -t:library Untitled.cs\nif [ $? -eq 0 ]; then\n  gmcs -t:library -r:Untitled.dll -r:nunit.framework.dll UntitledTest.cs\n  if [ $? -eq 0 ]; then\n    nunit-console -nologo UntitledTest.dll\n  fi\nfi\n\n", :caret_pos=>"0", :scroll_top=>"0"}, "output"=>{:scroll_left=>"0", :content=>".........\nTests run: 9, Failures: 0, Not run: 0, Time: 0.030 seconds\r\n\r\n\r\n", :caret_pos=>"495", :scroll_top=>"0"}, "Untitled.cs"=>{:scroll_left=>"0", :content=>"\npublic class LifeCalculator\n{\n    public static string[] Calc(string[] input)\n    {\n        var output = CreateEmptyClone(input);\n        for (int row = 0; row < input.Length; row++)\n        {\n            for (int col = 0; col < input[row].Length; col++)\n            {\n                 bool life = CalculateCell(input, row, col);\n                 if (life)\n                 {\n                    var array = output[row].ToCharArray();\n                    array[col] = '*';\n                    output[row] = new string(array);\n                 }\n            }\n        }\n        return output;\n    }\n\n    private static bool CalculateCell(string[] input, int row, int col)\n    {\n        bool isAlive = input[row][col] == '*';\n        int neighbors = 0;\n        neighbors = CountNeighbors(input, row, col);\n        // rule 1:\n        if (isAlive && neighbors < 2)\n            return false;\n        // rule 2:\n        if (isAlive && neighbors > 3)\n            return false;\n        // rule 3:\n        if (isAlive && neighbors >= 2 && neighbors <=3)\n            return true;\n        // rule 4:\n        if (!isAlive && neighbors == 3)\n            return true;\n        return false;\n    }\n\n    private static int CountNeighbors(string[] input, int row, int col)\n    {\n        int neighbors = 0;\n\n        //    Look Left\n        if(col > 0 && input[row][col - 1] == '*')\n            neighbors++;\n        //    Look Right\n        if(col < input[row].Length - 1 && input[row][col + 1] == '*')\n              neighbors++;\n        //    Look Up\n        if(row > 0 && input[row-1][col] == '*')\n              neighbors++;\n        //    Look Down\n        if(row < input.Length - 1 && input[row+1][col] == '*')\n              neighbors++;\n        //    Look Down and Right\n        if(row < input.Length - 1 && col < input[row].Length - 1 &&\n            input[row + 1][col + 1] == '*')\n              neighbors++;\n        //    Look Down and Left\n        if(row < input.Length - 1 && col > 0\n            && input[row+1][col-1] == '*')\n              neighbors++;\n        //    Look Up and Right\n        if(row > 0 && col < input[row].Length - 1 &&\n            input[row - 1][col+1] == '*')\n              neighbors++;\n        //    Look Up and Left\n        if(row > 0 && col > 0 &&\n            input[row - 1][col-1] == '*')\n              neighbors++;\n        return neighbors;\n    }\n\n    private static string[] CreateEmptyClone(string[] source)\n    {\n        string[] dest = new string[source.Length];\n        for(int i=0; i<source.Length; i++)\n            dest[i] = new string('.',source[i].Length);\n        return dest;\n    }\n}\n", :caret_pos=>"2400", :scroll_top=>"1100"}, "UntitledTest.cs"=>{:scroll_left=>"0", :content=>"\nusing NUnit.Framework;\n\n[TestFixture]\npublic class UntitledTest\n{\n    [Test]\n    public void Simple()\n    {\n        var result = LifeCalculator.Calc(new string[]{\".\"});\n        Assert.AreEqual(1, result.Length);\n        Assert.AreEqual(\".\",result[0]);\n    }\n\n    [Test]\n    public void Simple3x1ToLife()\n    {\n        var result = LifeCalculator.Calc(new string[]{\"***\"});\n        Assert.AreEqual(1, result.Length);\n        Assert.AreEqual(\".*.\",result[0]);\n    }\n\n    [Test]\n    public void Simple3x1ToDead()\n    {\n        var result = LifeCalculator.Calc(new string[]{\".*.\"});\n        Assert.AreEqual(1, result.Length);\n        Assert.AreEqual(\"...\",result[0]);\n    }\n\n    [Test]\n    public void Complex1x3ToLife()\n    {\n        var result = LifeCalculator.Calc(new string[]{  \"*\",\n                                                        \"*\",\n                                                        \"*\"});\n        Assert.AreEqual(3, result.Length);\n        Assert.AreEqual(\".\",result[0]);\n        Assert.AreEqual(\"*\",result[1]);\n        Assert.AreEqual(\".\",result[2]);\n    }\n\n    [Test]\n    public void Complex2x2ToLife()\n    {\n        var result = LifeCalculator.Calc(new string[]{ \".*\",\n                                                       \"**\"});\n        Assert.AreEqual(2, result.Length);\n        Assert.AreEqual(\"**\",result[0], \"First Row failed.\");\n        Assert.AreEqual(\"**\",result[1], \"Second Row failed.\");\n    }\n\n    [Test]\n    public void Complex2x2ToLife2()\n    {\n        var result = LifeCalculator.Calc(new string[]{ \"**\",\n                                                       \"*.\"});\n        Assert.AreEqual(2, result.Length);\n        Assert.AreEqual(\"**\",result[0], \"First Row failed.\");\n        Assert.AreEqual(\"**\",result[1], \"Second Row failed.\");\n    }\n\n    [Test]\n    public void Complex3x3ToDead()\n    {\n        var result = LifeCalculator.Calc(new string[]{ \"***\",\n                                                       \"***\",\n                                                       \"***\"});\n        Assert.AreEqual(3, result.Length);\n        Assert.AreEqual(\"*.*\",result[0], \"First Row failed.\");\n        Assert.AreEqual(\"...\",result[1], \"Second Row failed.\");\n        Assert.AreEqual(\"*.*\",result[2], \"Third Row failed.\");\n    }\n\n    [Test]\n    public void Empty()\n    {\n        var result = LifeCalculator.Calc(new string[]{ });\n        Assert.AreEqual(0, result.Length);\n    }\n    [Test]\n    public void EmptyRow()\n    {\n        var result = LifeCalculator.Calc(new string[]{\"\",\"\"});\n        Assert.AreEqual(2, result.Length);\n        Assert.AreEqual(\"\", result[0]);\n        Assert.AreEqual(\"\", result[1]);\n    }\n\n}\n\n", :caret_pos=>"2543", :scroll_top=>"118"}, "instructions"=>{:scroll_left=>"0", :content=>"Your task is to write a program to calculate the next\ngeneration of Conway's game of life, given any starting\nposition. You start with a two dimensional grid of cells, \nwhere each cell is either alive or dead. The grid is finite, \nand no life can exist off the edges. When calculating the \nnext generation of the grid, follow these four rules:\n\n1. Any live cell with fewer than two live neighbours dies, \n   as if caused by underpopulation.\n2. Any live cell with more than three live neighbours dies, \n   as if by overcrowding.\n3. Any live cell with two or three live neighbours lives \n   on to the next generation.\n4. Any dead cell with exactly three live neighbours becomes \n   a live cell.\n\nExamples: * indicates live cell, . indicates dead cell\n\nExample input: (4 x 8 grid)\n4 8\n........\n....*...\n...**...\n........\n\nExample output:\n4 8\n........\n...**...\n...**...\n........\n\n", :caret_pos=>"669", :scroll_top=>"0"}}, :output=>".........\nTests run: 9, Failures: 0, Not run: 0, Time: 0.030 seconds\r\n\r\n\r\n", :current_filename=>"output"}
