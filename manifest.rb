{:visible_files=>{"cyberdojo.sh"=>{:scroll_left=>"0", :content=>"gmcs -t:library Untitled.cs\nif [ $? -eq 0 ]; then\n  gmcs -t:library -r:Untitled.dll -r:nunit.framework.dll UntitledTest.cs\n  if [ $? -eq 0 ]; then\n    nunit-console -nologo UntitledTest.dll\n  fi\nfi\n\n", :caret_pos=>"0", :scroll_top=>"0"}, "output"=>{:scroll_left=>"0", :content=>"UntitledTest.cs(10,22): error CS0103: The name `Calc' does not exist in the current context\nUntitledTest.cs(11,35): error CS1061: Type `object' does not contain a definition for `Length' and no extension method `Length' of type `object' could be found (are you missing a using directive or an assembly reference?)\nUntitledTest.cs(12,29): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nUntitledTest.cs(18,22): error CS0103: The name `Calc' does not exist in the current context\nUntitledTest.cs(20,35): error CS1061: Type `object' does not contain a definition for `Length' and no extension method `Length' of type `object' could be found (are you missing a using directive or an assembly reference?)\nUntitledTest.cs(21,30): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nUntitledTest.cs(22,30): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nCompilation failed: 7 error(s), 0 warnings\n", :caret_pos=>"107", :scroll_top=>"0"}, "Untitled.cs"=>{:scroll_left=>"0", :content=>"\npublic class Untitled\n{\n    public static string[] Calc(string[] input)\n    {\n        return CreateEmptyClone(input);\n    }\n\n    private static string[] CreateEmptyClone(string[] source)\n    {\n        string[] dest = new string[source.Length];\n        for(int i=0; i<source.Length; i++)\n            dest[i] = new string('.',source[i].Length);\n        return dest;\n    }\n}\n", :caret_pos=>"364", :scroll_top=>"0"}, "UntitledTest.cs"=>{:scroll_left=>"0", :content=>"\nusing NUnit.Framework;\n\n[TestFixture]\npublic class UntitledTest\n{\n    [Test]\n    public void Simple()\n    {\n        var result = Calc(new string[]{\".\"});\n        Assert.AreEqual(1, result.Length);\n        Assert.AreEqual(\".\",result[0]);\n    }\n\n    [Test]\n    public void Complex2x2ToLife()\n    {\n        var result = Calc(new string[]{\".*\",\n                                       \"**\"});\n        Assert.AreEqual(1, result.Length);\n        Assert.AreEqual(\"**\",result[0]);\n        Assert.AreEqual(\"**\",result[0]);\n    }\n\n}\n\n", :caret_pos=>"302", :scroll_top=>"0"}, "instructions"=>{:scroll_left=>"0", :content=>"Your task is to write a program to calculate the next\ngeneration of Conway's game of life, given any starting\nposition. You start with a two dimensional grid of cells, \nwhere each cell is either alive or dead. The grid is finite, \nand no life can exist off the edges. When calculating the \nnext generation of the grid, follow these four rules:\n\n1. Any live cell with fewer than two live neighbours dies, \n   as if caused by underpopulation.\n2. Any live cell with more than three live neighbours dies, \n   as if by overcrowding.\n3. Any live cell with two or three live neighbours lives \n   on to the next generation.\n4. Any dead cell with exactly three live neighbours becomes \n   a live cell.\n\nExamples: * indicates live cell, . indicates dead cell\n\nExample input: (4 x 8 grid)\n4 8\n........\n....*...\n...**...\n........\n\nExample output:\n4 8\n........\n...**...\n...**...\n........\n\n", :caret_pos=>"798", :scroll_top=>"0"}}, :output=>"UntitledTest.cs(10,22): error CS0103: The name `Calc' does not exist in the current context\nUntitledTest.cs(11,35): error CS1061: Type `object' does not contain a definition for `Length' and no extension method `Length' of type `object' could be found (are you missing a using directive or an assembly reference?)\nUntitledTest.cs(12,29): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nUntitledTest.cs(18,22): error CS0103: The name `Calc' does not exist in the current context\nUntitledTest.cs(20,35): error CS1061: Type `object' does not contain a definition for `Length' and no extension method `Length' of type `object' could be found (are you missing a using directive or an assembly reference?)\nUntitledTest.cs(21,30): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nUntitledTest.cs(22,30): error CS0021: Cannot apply indexing with [] to an expression of type `object'\nCompilation failed: 7 error(s), 0 warnings\n", :current_filename=>"output"}
