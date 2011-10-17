{:visible_files=>{"cyberdojo.sh"=>{:scroll_left=>0, :content=>"gmcs -t:library Untitled.cs\nif [ $? -eq 0 ]; then\n  gmcs -t:library -r:Untitled.dll -r:nunit.framework.dll UntitledTest.cs\n  if [ $? -eq 0 ]; then\n    nunit-console -nologo UntitledTest.dll\n  fi\nfi\n\n", :caret_pos=>0, :scroll_top=>0}, "output"=>{:scroll_left=>0, :content=>"\n  Click the Run Tests button (above). The output will appear here.\n  A traffic-light will also appear:\n     (o) red   - the tests ran but one or more failed\n     (o) amber - the tests could not be run\n     (o) green - the tests ran and all passed\n  Click any traffic light to view its diff.\n\n  Click a filename (left) to edit it here.\n\n  Click the Post button (left) to send a message to everyone.", :caret_pos=>0, :scroll_top=>0}, "Untitled.cs"=>{:scroll_left=>0, :content=>"\npublic class Untitled\n{\n    public static int Answer\n    {\n        get { return 42; }\n    }\n}\n", :caret_pos=>0, :scroll_top=>0}, "UntitledTest.cs"=>{:scroll_left=>0, :content=>"\nusing NUnit.Framework;\n\n[TestFixture]\npublic class UntitledTest\n{\n    [Test]\n    public void HitchHiker()\n    {\n        int expected = 6 * 9;\n        int actual = Untitled.Answer;\n        Assert.AreEqual(expected, actual);\n    }\n}\n\n", :caret_pos=>0, :scroll_top=>0}, "instructions"=>{:scroll_left=>0, :content=>"Your task is to write a program to calculate the next\ngeneration of Conway's game of life, given any starting\nposition. You start with a two dimensional grid of cells, \nwhere each cell is either alive or dead. The grid is finite, \nand no life can exist off the edges. When calculating the \nnext generation of the grid, follow these four rules:\n\n1. Any live cell with fewer than two live neighbours dies, \n   as if caused by underpopulation.\n2. Any live cell with more than three live neighbours dies, \n   as if by overcrowding.\n3. Any live cell with two or three live neighbours lives \n   on to the next generation.\n4. Any dead cell with exactly three live neighbours becomes \n   a live cell.\n\nExamples: * indicates live cell, . indicates dead cell\n\nExample input: (4 x 8 grid)\n4 8\n........\n....*...\n...**...\n........\n\nExample output:\n4 8\n........\n...**...\n...**...\n........\n\n", :caret_pos=>0, :scroll_top=>0}}, :stars=>3, :unit_test_framework=>"nunit", :current_filename=>"output"}